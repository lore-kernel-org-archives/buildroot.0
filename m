Return-Path: <SRS0=drHZ=PV=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 185C7C433F5
	for <buildroot@archiver.kernel.org>; Tue,  2 Nov 2021 20:24:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D42AF60462
	for <buildroot@archiver.kernel.org>; Tue,  2 Nov 2021 20:24:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D42AF60462
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=busybox.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AA8604034F;
	Tue,  2 Nov 2021 20:24:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8Hz8KlVCOhja; Tue,  2 Nov 2021 20:24:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2D09940340;
	Tue,  2 Nov 2021 20:24:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7BD9F1BF40F
 for <buildroot@lists.busybox.net>; Tue,  2 Nov 2021 20:24:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6C3E180C15
 for <buildroot@lists.busybox.net>; Tue,  2 Nov 2021 20:24:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fDC2WBpQgv7O for <buildroot@lists.busybox.net>;
 Tue,  2 Nov 2021 20:24:16 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C93FC80C09
 for <buildroot@uclibc.org>; Tue,  2 Nov 2021 20:24:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 81)
 id 9294389182; Tue,  2 Nov 2021 20:20:37 +0000 (UTC)
From: bugzilla@busybox.net
To: buildroot@uclibc.org
Date: Tue, 02 Nov 2021 20:24:16 +0000
X-Bugzilla-Reason: CC
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: buildroot
X-Bugzilla-Component: Other
X-Bugzilla-Version: 2021.05
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: major
X-Bugzilla-Who: thomas.petazzoni@bootlin.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: DUPLICATE
X-Bugzilla-Priority: P5
X-Bugzilla-Assigned-To: unassigned@buildroot.uclibc.org
X-Bugzilla-Target-Milestone: ---
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter cc
 target_milestone resolution
Message-ID: <bug-14121-163@https.bugs.busybox.net/>
X-Bugzilla-URL: https://bugs.busybox.net/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Buildroot] [Bug 14121] New: Issue generating filesystem image
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

https://bugs.busybox.net/show_bug.cgi?id=14121

            Bug ID: 14121
           Summary: Issue generating filesystem image
           Product: buildroot
           Version: 2021.05
          Hardware: PC
                OS: Linux
            Status: RESOLVED
          Severity: major
          Priority: P5
         Component: Other
          Assignee: unassigned@buildroot.uclibc.org
          Reporter: scalex-bzh.givri-y@orange.fr
                CC: buildroot@uclibc.org
  Target Milestone: ---
        Resolution: DUPLICATE
            Status: RESOLVED

Hello

I'm compiling a Linux OS via 2021.05 Buildroot and using 5.10.57 version Linux
Kernel.
When it's executing post-image script board/raspberrypi4-64/post-image.sh, i
have an error : 
Disk full
INFO: vfat(boot.vfat): cmd: "rm -f
"/home/heol/stage_heol/br-lab/64bit/systemctl/build-pi4-64/images/boot.vfat""
(stderr):
ERROR: vfat(boot.vfat): failed to generate boot.vfat
make[1]: *** [Makefile:838 : target-post-image] Erreur 1
make: *** [Makefile:23 : _all] Erreur 2

Does anybody know how to solve the problem ?

Thanks for help, have a nice day !!!

Alexandre

--- Comment #1 from Thomas Petazzoni <thomas.petazzoni@bootlin.com> ---


*** This bug has been marked as a duplicate of bug 14126 ***

-- 
You are receiving this mail because:
You are on the CC list for the bug.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
