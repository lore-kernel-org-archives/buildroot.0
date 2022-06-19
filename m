Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BA0AC433EF
	for <buildroot@archiver.kernel.org>; Sun, 19 Jun 2022 11:10:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7D54D415D7;
	Sun, 19 Jun 2022 11:10:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7D54D415D7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hM9HhNFDZglK; Sun, 19 Jun 2022 11:10:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4B57F415C2;
	Sun, 19 Jun 2022 11:10:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4B57F415C2
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 185B91BF9A4
 for <buildroot@lists.busybox.net>; Sun, 19 Jun 2022 11:10:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E672D415C2
 for <buildroot@lists.busybox.net>; Sun, 19 Jun 2022 11:10:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E672D415C2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dGwzdW97W6ee for <buildroot@lists.busybox.net>;
 Sun, 19 Jun 2022 11:10:18 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id DD1A6410B6
 for <buildroot@buildroot.org>; Sun, 19 Jun 2022 11:10:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DD1A6410B6
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 1AF7086F3E; Sun, 19 Jun 2022 10:57:59 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 19 Jun 2022 12:53:35 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9c0e8ace80cfb07e5181e3deeee277949bd64b30
X-Git-Newrev: 4a3ea45da294896d812547be1339c18e1f37475e
X-Patchwork-Hint: ignore
Message-Id: <20220619105759.1AF7086F3E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Update for 2022.02.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=4a3ea45da294896d812547be1339c18e1f37475e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit fb3c633cf24188b2300426201d1fe5578ebbf972)
[Peter: skip Makefile, Vagrantfile bump]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/CHANGES b/CHANGES
index 801af5b950..38e83171f2 100644
--- a/CHANGES
+++ b/CHANGES
@@ -89,6 +89,38 @@
 	#14731: BR2_PACKAGE_IOSTAT
 	#14751: LVM2 Outdated Link
 
+2022.02.3, released June 19th, 2022
+
+	Important / security related fixes.
+
+	Infrastructure: Fix building under paths containing regex
+	characters (E.G. '+')
+
+	Toolchain: Only allow ppc64le variants for which a
+	glibc/musl/uclibc toolchain is supported.
+	Mark codescape mti/img mips toolchains as shared library only
+	(glibc).
+
+	Updated/fixed packages: arm-trusted-firmware,
+	at91dataflashboot, boinc, dhcp, diffutils, edk2, fbv, gensio,
+	glibc, go, gtest, iucode-tool, janet, libcec, libcurl,
+	libfreeimage, libnftnl, libodb-boost, linux, linux-tools,
+	lttng-modules, mariadb, memcached, mono, mutt,
+	network-manager, nginx, ntfs-3g, ogre, openjpeg, openvpn,
+	qemu, qpid-proton, qt5webengine, rauc, rockchip-mali, rsyslog,
+	ruby, runc, rustc, samba4, strace, tiff, uclibc, unrar, vim,
+	webkitgtk, wpewebkit, xdriver_xf86-video-amdgpu,
+	xdriver_xf86-video-ati, zlib-ng
+
+	New packages: qt5webengine-chromium,
+	qt5webengine-chromium-catapult
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#14766: package dhcp on buildroot 2022.02.1 failed
+	#14821: Samba server is failing to compile
+	#14826: make qemu_x86_64_defconfig stopped working
+
 2022.02.2, released May 29th, 2022
 
 	Important / security related fixes.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
