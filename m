Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FFE4C7EE23
	for <buildroot@archiver.kernel.org>; Wed,  1 Mar 2023 21:44:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5D536401E3;
	Wed,  1 Mar 2023 21:44:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5D536401E3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AiY-YaM44sIZ; Wed,  1 Mar 2023 21:44:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1A7C3401F1;
	Wed,  1 Mar 2023 21:44:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1A7C3401F1
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 51F9B1BF964
 for <buildroot@lists.busybox.net>; Wed,  1 Mar 2023 21:44:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3905760E6A
 for <buildroot@lists.busybox.net>; Wed,  1 Mar 2023 21:44:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3905760E6A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Al0mB78pRuwS for <buildroot@lists.busybox.net>;
 Wed,  1 Mar 2023 21:44:29 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 444B460BEA
 for <buildroot@buildroot.org>; Wed,  1 Mar 2023 21:44:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 444B460BEA
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3033786E64; Wed,  1 Mar 2023 21:44:29 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 1 Mar 2023 22:41:48 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8b5253b1c0db4414dddbe0bc5ce583f5f19717f7
X-Git-Newrev: e5f9cbd91a4fc4491587bfc097c6d89f1782c1d5
X-Patchwork-Hint: ignore
Message-Id: <20230301214429.3033786E64@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Update for 2022.02.10
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

commit: https://git.buildroot.net/buildroot/commit/?id=e5f9cbd91a4fc4491587bfc097c6d89f1782c1d5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 6fbe4b39017b0f05b70d6541ea7df4cd8cf59d0a)
[Peter: drop Makefile change]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/CHANGES b/CHANGES
index 6647c0c8e6..a3de4ba1d7 100644
--- a/CHANGES
+++ b/CHANGES
@@ -721,6 +721,38 @@
 	#14731: BR2_PACKAGE_IOSTAT
 	#14751: LVM2 Outdated Link
 
+2022.02.10, released March 1st, 2023
+
+	Important / security related fixes.
+
+	Fix make O=..._defconfig builds (regression in 2022.02.9).
+
+	A number of additional/stricter checks have been added to
+	./utils/check-package.
+
+	Build host dependencies check extended to check for a number
+	of specific perl modules to better handle distributions (like
+	Fedora) with very fine grained perl packages. Also ensure
+	build host has git >= 2.0.0 when using packages written in
+	go/rust because the vendoring may need it.
+
+	Defconfigs: ASUS tinker rk3288: Fix boot issue related to TPL
+
+	Updated/fixed packages: afboot-stm32, apache, barebox, c-ares,
+	elf2flt, freeswitch, fwts, gcc, git, kodi, libgit2, libks,
+	libopenssl, live555, lua, lxc, mesa3d-headers, modsecurity2,
+	netopeer2, openjdk, openpowerlink, openvpn, opusfile,
+	postgresql, pugixml, python-future, qt5, sdl2, sofia-sip,
+	ssdp-responder, sudo, sunxi-mali-utgard, ti-sgx-km, tmux,
+	uboot, upx, vim, webkitgtk, wolfssl, wpewebkit, xlib_libXpm,
+	xserver_xorg-server, xxhash, xz, yajl, zabbix
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#15271: no start-qemu.sh
+	#15291: BR2_PACKAGE_GNU_EFI_ARCH_SUPPORTS without location
+	#15301: Selecting NAND Flash boot media (NAND_BOOT) breaks the uboot..
+
 2022.02.9, released January 18th, 2023
 
 	Important / security related fixes.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
