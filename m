Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80662C52D7B
	for <buildroot@archiver.kernel.org>; Wed, 14 Aug 2024 10:08:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3C21F40186;
	Wed, 14 Aug 2024 10:08:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ogxMgYbCX6mG; Wed, 14 Aug 2024 10:08:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E65CE40550
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E65CE40550;
	Wed, 14 Aug 2024 10:08:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EBE461BF352
 for <buildroot@lists.busybox.net>; Wed, 14 Aug 2024 10:08:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DAC46812F5
 for <buildroot@lists.busybox.net>; Wed, 14 Aug 2024 10:08:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IOZ-aqgCsQ06 for <buildroot@lists.busybox.net>;
 Wed, 14 Aug 2024 10:08:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 023DA80594
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 023DA80594
 for <buildroot@buildroot.org>; Wed, 14 Aug 2024 10:08:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EC76385B4F; Wed, 14 Aug 2024 10:08:32 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 14 Aug 2024 12:05:48 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 81e6541efe054df635947d0c143818f8cf7cb048
X-Git-Newrev: 18368f6608538e2c6ea00a6c7556802be72e614e
X-Patchwork-Hint: ignore
Message-Id: <20240814100832.EC76385B4F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Update for 2024.05.2
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=18368f6608538e2c6ea00a6c7556802be72e614e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 078f99a31528e27b97cc49d51bca9da95a6a036c)
[Peter: drop Makefile change]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                  | 23 +++++++++++++++++++++++
 support/misc/Vagrantfile |  2 +-
 2 files changed, 24 insertions(+), 1 deletion(-)

diff --git a/CHANGES b/CHANGES
index eef042823a..67844910ee 100644
--- a/CHANGES
+++ b/CHANGES
@@ -77,6 +77,29 @@
 	- Can't subscribe buildroot mailing list
 	  https://gitlab.com/buildroot.org/buildroot/-/issues/25
 
+2024.05.2, released August 14th, 2024
+
+	Important / security related fixes.
+
+	Various minor improvements to utils/check-package
+
+	Defconfigs: Add download hashes for chromebook-elm,
+	chromebook-snow and stm32mp157a_dk1
+
+	Updated/fixed packages: android-tools, bcc, bitcoin, boost,
+	btrfs-progs, c-ares, cdrkit, check, containerd, directfb,
+	dump1090, ed, exim, fail2ban, frotz, fwts, gcc, gdb, go, gpm,
+	kexec, libarchive, libgeos, libressl, llvm, mupdf, ncftp,
+	nodejs, ntpsec, octave, openssh, pppd, python-mupdf,
+	python-ruamel-yaml, qt5webkit, rawk-hawkbit-updater,
+	rtl8188eu, snappy, squid, sunxi-tools, syslinux, systemd,
+	tcf-agent, tftpd, ubus, util-linux, uvw, webkitgtk, wolfssl,
+	wpewebkit, x265, xlib_libxshmfence, xvisor
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#15231: gcc --help -v doesn't work correctly with gcc>=10 and..
+
 2024.05.1, released July 13th, 2024
 
 	Important / security related fixes.
diff --git a/support/misc/Vagrantfile b/support/misc/Vagrantfile
index b49ea47425..1f4c1b85e2 100644
--- a/support/misc/Vagrantfile
+++ b/support/misc/Vagrantfile
@@ -5,7 +5,7 @@
 ################################################################################
 
 # Buildroot version to use
-RELEASE='2024.05.1'
+RELEASE='2024.05.2'
 
 ### Change here for more memory/cores ###
 VM_MEMORY=2048
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
