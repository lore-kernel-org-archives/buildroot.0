Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C071BECAAA2
	for <buildroot@archiver.kernel.org>; Mon, 29 Aug 2022 04:53:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C5179404B4;
	Mon, 29 Aug 2022 04:53:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C5179404B4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FN6DwYXBBiUs; Mon, 29 Aug 2022 04:53:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C9A61402F2;
	Mon, 29 Aug 2022 04:53:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C9A61402F2
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 64A361BF59D
 for <buildroot@lists.busybox.net>; Mon, 29 Aug 2022 04:53:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 38A55819D6
 for <buildroot@lists.busybox.net>; Mon, 29 Aug 2022 04:53:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 38A55819D6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HGkfSBTFXj5s for <buildroot@lists.busybox.net>;
 Mon, 29 Aug 2022 04:53:19 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6E0AF819CC
 for <buildroot@uclibc.org>; Mon, 29 Aug 2022 04:53:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6E0AF819CC
Received: by busybox.osuosl.org (Postfix, from userid 81)
 id 06BEE87E6E; Mon, 29 Aug 2022 04:38:19 +0000 (UTC)
From: bugzilla@busybox.net
To: buildroot@uclibc.org
Date: Mon, 29 Aug 2022 04:53:18 +0000
X-Bugzilla-Reason: CC
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: buildroot
X-Bugzilla-Component: Other
X-Bugzilla-Version: 2022.02
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: lars.george@biotronik.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P5
X-Bugzilla-Assigned-To: unassigned@buildroot.uclibc.org
X-Bugzilla-Target-Milestone: ---
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter cc
 target_milestone
Message-ID: <bug-14976-163@https.bugs.busybox.net/>
X-Bugzilla-URL: https://bugs.busybox.net/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Buildroot] [Bug 14976] New: Ghostscript package can not process
 pdf files anymore
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://bugs.busybox.net/show_bug.cgi?id=14976

            Bug ID: 14976
           Summary: Ghostscript package can not process pdf files anymore
           Product: buildroot
           Version: 2022.02
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned@buildroot.uclibc.org
          Reporter: lars.george@biotronik.com
                CC: buildroot@uclibc.org
  Target Milestone: ---

Dear Buildroot Dev Team,

thanks for the great work in the first place!

I am facing an issue with the Ghostscript package that is available in
buildroot. Starting with Version 2022.02 I am not able to process PDF files
anymore. I was already in contact with the Ghostscript developers, and we found
out that this has to do with the added compile option "--without-pdf" as the
version was updated to 9.55.0
(https://github.com/buildroot/buildroot/commit/7a4944569ce83b0b7b0cabd6e8aa184b8cb72a22).
They changed how PDF files are processed and did a greater rework, but adding
this above mentioned option totally disables the PDF feature (which is crucial
for example when driverless printing via Ghostscript is used). I think this is
not a generally wanted option. They also offered help when further need is
required to work out the proper compile options for the make settings within
buildroot.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
