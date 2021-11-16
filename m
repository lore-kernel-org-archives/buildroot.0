Return-Path: <SRS0=m+kO=QD=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1DBDC4321E
	for <buildroot@archiver.kernel.org>; Tue, 16 Nov 2021 01:06:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3CC386325C
	for <buildroot@archiver.kernel.org>; Tue, 16 Nov 2021 01:06:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3CC386325C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=busybox.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DA59680DA2;
	Tue, 16 Nov 2021 01:06:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QKeYea_858MX; Tue, 16 Nov 2021 01:06:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5501A80CF6;
	Tue, 16 Nov 2021 01:06:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AC2491BF2A2
 for <buildroot@lists.busybox.net>; Tue, 16 Nov 2021 01:06:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A11B740244
 for <buildroot@lists.busybox.net>; Tue, 16 Nov 2021 01:06:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dD5e-6gp_-tW for <buildroot@lists.busybox.net>;
 Tue, 16 Nov 2021 01:06:45 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 014E04024E
 for <buildroot@uclibc.org>; Tue, 16 Nov 2021 01:06:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 81)
 id 344B787ED9; Tue, 16 Nov 2021 01:02:35 +0000 (UTC)
From: bugzilla@busybox.net
To: buildroot@uclibc.org
Date: Tue, 16 Nov 2021 01:06:44 +0000
X-Bugzilla-Reason: CC
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: buildroot
X-Bugzilla-Component: Other
X-Bugzilla-Version: 2021.02.7
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: minor
X-Bugzilla-Who: mateusz.dukat1@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P5
X-Bugzilla-Assigned-To: unassigned@buildroot.uclibc.org
X-Bugzilla-Target-Milestone: ---
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter cc
 target_milestone
Message-ID: <bug-14346-163@https.bugs.busybox.net/>
X-Bugzilla-URL: https://bugs.busybox.net/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Buildroot] [Bug 14346] New: BR2_PACKAGE_NFS_UTILS_RPC_NFSD does
 not patch CONFIG_NFSD in kernel configuration
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

https://bugs.busybox.net/show_bug.cgi?id=14346

            Bug ID: 14346
           Summary: BR2_PACKAGE_NFS_UTILS_RPC_NFSD does not patch
                    CONFIG_NFSD in kernel configuration
           Product: buildroot
           Version: 2021.02.7
          Hardware: PC
                OS: Linux
            Status: NEW
          Severity: minor
          Priority: P5
         Component: Other
          Assignee: unassigned@buildroot.uclibc.org
          Reporter: mateusz.dukat1@gmail.com
                CC: buildroot@uclibc.org
  Target Milestone: ---

Overview:

Setting BR2_PACKAGE_NFS_UTILS_RPC_NFSD to 'y' does not patch CONFIG_NFSD in
Linux kernel configuration.

Steps to reproduce:

1) Build buildroot for i386, with kernel defconfig, and buildroot config
values:
BR2_PACKAGE_NFS_UTILS_RPC_NFSD=y
2) Run image on any machine/vm

Actual results:

When booting buildroot built like that, it immediately throws:

> Starting NFS daemon: rpc.nfsd: Unable to access /proc/fs/nfsd errno 2 (No such file or directory).
> Please try, as root, 'mount -t nfsd nfsd /proc/fs/nfsd' and then restart rpc.nfsd to correct the problem
> FAIL

Expected results:

NFS server starts correctly.

Build date and hardware:

Buildroot tag 2021.02.7 built on 16.11.2021 on Thinkpad X131e (intel) \w Ubuntu
server 20.04 LTS

Additional information:

To manually fix this problem, create text file in buildroot root directory
named "kernel_patch.txt" with value:

> CONFIG_NFSD=y

Then, in buildroot config, modify BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES to:

> BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="kernel_patch.txt"

And finally build new image.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
