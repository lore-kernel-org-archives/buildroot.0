Return-Path: <SRS0=K+5a=O6=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7860EC433EF
	for <buildroot@archiver.kernel.org>; Sun, 10 Oct 2021 19:57:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E0C0860F38
	for <buildroot@archiver.kernel.org>; Sun, 10 Oct 2021 19:57:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E0C0860F38
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=busybox.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AB09240101;
	Sun, 10 Oct 2021 19:57:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ff2zP93xSUEE; Sun, 10 Oct 2021 19:57:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A44834019A;
	Sun, 10 Oct 2021 19:57:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5C5DA1BF3BE
 for <buildroot@lists.busybox.net>; Sun, 10 Oct 2021 19:57:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 58FFC81DE0
 for <buildroot@lists.busybox.net>; Sun, 10 Oct 2021 19:57:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IWunJKhWZXpk for <buildroot@lists.busybox.net>;
 Sun, 10 Oct 2021 19:57:46 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5019E81D72
 for <buildroot@uclibc.org>; Sun, 10 Oct 2021 19:57:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 81)
 id 75C04951A0; Sun, 10 Oct 2021 19:55:00 +0000 (UTC)
From: bugzilla@busybox.net
To: buildroot@uclibc.org
Date: Sun, 10 Oct 2021 19:57:45 +0000
X-Bugzilla-Reason: CC
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: buildroot
X-Bugzilla-Component: Other
X-Bugzilla-Version: 2021.08
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: minor
X-Bugzilla-Who: kouamdoux@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P5
X-Bugzilla-Assigned-To: unassigned@buildroot.uclibc.org
X-Bugzilla-Target-Milestone: ---
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter cc
 target_milestone
Message-ID: <bug-14271-163@https.bugs.busybox.net/>
X-Bugzilla-URL: https://bugs.busybox.net/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Buildroot] [Bug 14271] New: compilation error with rsync command
 for permission
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

https://bugs.busybox.net/show_bug.cgi?id=14271

            Bug ID: 14271
           Summary: compilation error with rsync command for permission
           Product: buildroot
           Version: 2021.08
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: minor
          Priority: P5
         Component: Other
          Assignee: unassigned@buildroot.uclibc.org
          Reporter: kouamdoux@gmail.com
                CC: buildroot@uclibc.org
  Target Milestone: ---

>>> skeleton-init-common  Installing to staging directory
rsync -a --ignore-times --exclude .svn --exclude .git --exclude .hg --exclude
.bzr --exclude CVS --chmod=u=rwX,go=rX --exclude .empty --exclude '*~'
system/skeleton/
/home/ledoux/Documents/buildroot/output/host/x86_64-buildroot-linux-uclibc/sysroot/


So this command generate a lot of errors : 

rsync: [generator] failed to set permissions on
"/root/buildroot/output/host/x86_64-buildroot-linux-uclibc/sysroot/dev":
Function not implemented (38)
rsync: [generator] failed to set permissions on
"/root/buildroot/output/host/x86_64-buildroot-linux-uclibc/sysroot/etc":
Function not implemented (38)
rsync: [generator] failed to set permissions on
"/root/buildroot/output/host/x86_64-buildroot-linux-uclibc/sysroot/etc/profile.d":
Function not implemented (38)
rsync: [generator] failed to set permissions on
"/root/buildroot/output/host/x86_64-buildroot-linux-uclibc/sysroot/media":
Function not implemented (38)
rsync: [generator] failed to set permissions on
"/root/buildroot/output/host/x86_64-buildroot-linux-uclibc/sysroot/mnt":
Function not implemented (38)
rsync: [generator] failed to set permissions on
"/root/buildroot/output/host/x86_64-buildroot-linux-uclibc/sysroot/opt":
Function not implemented (38)
rsync: [generator] failed to set permissions on
"/root/buildroot/output/host/x86_64-buildroot-linux-uclibc/sysroot/proc":
Function not implemented (38)
rsync: [generator] failed to set permissions on
"/root/buildroot/output/host/x86_64-buildroot-linux-uclibc/sysroot/root":
Function not implemented (38)
rsync: [generator] failed to set permissions on
"/root/buildroot/output/host/x86_64-buildroot-linux-uclibc/sysroot/run":
Function not implemented (38)
rsync: [generator] failed to set permissions on
"/root/buildroot/output/host/x86_64-buildroot-linux-uclibc/sysroot/sys":
Function not implemented (38)
rsync: [generator] failed to set permissions on
"/root/buildroot/output/host/x86_64-buildroot-linux-uclibc/sysroot/tmp":
Function not implemented (38)
rsync: [generator] failed to set permissions on
"/root/buildroot/output/host/x86_64-buildroot-linux-uclibc/sysroot/usr/bin":
Function not implemented (38)
rsync: [generator] failed to set permissions on
"/root/buildroot/output/host/x86_64-buildroot-linux-uclibc/sysroot/usr/lib":
Function not implemented (38)
rsync: [generator] failed to set permissions on
"/root/buildroot/output/host/x86_64-buildroot-linux-uclibc/sysroot/usr/sbin":
Function not implemented (38)
rsync: [receiver] failed to set permissions on
"/root/buildroot/output/host/x86_64-buildroot-linux-uclibc/sysroot/etc/.group.nsk97w":
Function not implemented (38)
rsync: [receiver] failed to set permissions on
"/root/buildroot/output/host/x86_64-buildroot-linux-uclibc/sysroot/etc/.hosts.yBRyXu":
Function not implemented (38)
rsync: [receiver] failed to set permissions on
"/root/buildroot/output/host/x86_64-buildroot-linux-uclibc/sysroot/etc/.passwd.0Uncqt":
Function not implemented (38)
rsync: [receiver] failed to set permissions on
"/root/buildroot/output/host/x86_64-buildroot-linux-uclibc/sysroot/etc/.profile.0E8enu":
Function not implemented (38)
rsync: [receiver] failed to set permissions on
"/root/buildroot/output/host/x86_64-buildroot-linux-uclibc/sysroot/etc/.protocols.DJb4ew":
Function not implemented (38)
rsync: [receiver] failed to set permissions on
"/root/buildroot/output/host/x86_64-buildroot-linux-uclibc/sysroot/etc/.services.AO2ruv":
Function not implemented (38)
rsync: [receiver] failed to set permissions on
"/root/buildroot/output/host/x86_64-buildroot-linux-uclibc/sysroot/etc/.shadow.QE0FTt":
Function not implemented (38)
rsync: [receiver] failed to set permissions on
"/root/buildroot/output/host/x86_64-buildroot-linux-uclibc/sysroot/etc/profile.d/.umask.sh.IN0rhw":
Function not implemented (38)
rsync error: some files/attrs were not transferred (see previous errors) (code
23) at main.c(1333) [sender=3.2.3]
make: *** [package/pkg-generic.mk:333 :
/root/buildroot/output/build/skeleton-init-common/.stamp_staging_installed]
Erreur 23

-- 
You are receiving this mail because:
You are on the CC list for the bug.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
