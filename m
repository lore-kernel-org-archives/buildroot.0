Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 141E2C71153
	for <buildroot@archiver.kernel.org>; Mon,  4 Sep 2023 13:36:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4D55740198;
	Mon,  4 Sep 2023 13:36:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4D55740198
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UpnegQubH1kQ; Mon,  4 Sep 2023 13:36:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9C51D40126;
	Mon,  4 Sep 2023 13:36:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9C51D40126
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BA1791BF378
 for <buildroot@lists.busybox.net>; Mon,  4 Sep 2023 13:36:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 91F36408B3
 for <buildroot@lists.busybox.net>; Mon,  4 Sep 2023 13:36:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 91F36408B3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zrZUne85iXhA for <buildroot@lists.busybox.net>;
 Mon,  4 Sep 2023 13:36:19 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9FDD54089E
 for <buildroot@uclibc.org>; Mon,  4 Sep 2023 13:36:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9FDD54089E
Received: by busybox.osuosl.org (Postfix, from userid 81)
 id 8566A866E0; Mon,  4 Sep 2023 13:36:19 +0000 (UTC)
From: bugzilla@busybox.net
To: buildroot@uclibc.org
Date: Mon, 04 Sep 2023 13:36:19 +0000
X-Bugzilla-Reason: CC
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: buildroot
X-Bugzilla-Component: Other
X-Bugzilla-Version: 2023.02.4
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: critical
X-Bugzilla-Who: dominique.tronche@eviden.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P5
X-Bugzilla-Assigned-To: unassigned@buildroot.uclibc.org
X-Bugzilla-Target-Milestone: ---
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter cc
 target_milestone
Message-ID: <bug-15754-163@https.bugs.busybox.net/>
X-Bugzilla-URL: https://bugs.busybox.net/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Buildroot] [Bug 15754] New: The docker-engine and docker-cli
 versions are not compatible with go 1.19.12 version
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

https://bugs.busybox.net/show_bug.cgi?id=15754

            Bug ID: 15754
           Summary: The docker-engine and docker-cli versions are not
                    compatible with go 1.19.12 version
           Product: buildroot
           Version: 2023.02.4
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: critical
          Priority: P5
         Component: Other
          Assignee: unassigned@buildroot.uclibc.org
          Reporter: dominique.tronche@eviden.com
                CC: buildroot@uclibc.org
  Target Milestone: ---

In 2023.02.4, go package has been upgraded to v1.19.12, however docker packages
version is still an unpatched 23.0.5
Hence docker containers face the bug corrected in 24.0.5 in master branch (see
commit a9cd24738a7) which produces "invalid Host header" error message

Either docker version should be upgraded to a version compatible with go
1.19.12 in LTS 2023.02 or the patches from christian@aperture.us should be
introduced (the patch for docker-cli does not work as the versions in
vendor.mod are not correct)

-- 
You are receiving this mail because:
You are on the CC list for the bug.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
