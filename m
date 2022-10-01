Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A78DC433FE
	for <buildroot@archiver.kernel.org>; Sat,  1 Oct 2022 16:15:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 158A560F58;
	Sat,  1 Oct 2022 16:15:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 158A560F58
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SfpYXXGmelXO; Sat,  1 Oct 2022 16:15:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4363160EA0;
	Sat,  1 Oct 2022 16:15:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4363160EA0
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0E2B31BF59C
 for <buildroot@lists.busybox.net>; Sat,  1 Oct 2022 16:15:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DBB6940120
 for <buildroot@lists.busybox.net>; Sat,  1 Oct 2022 16:15:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DBB6940120
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SzTYuM-rOUYD for <buildroot@lists.busybox.net>;
 Sat,  1 Oct 2022 16:15:23 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1DD2040017
 for <buildroot@buildroot.org>; Sat,  1 Oct 2022 16:15:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1DD2040017
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0A1C6863EC; Sat,  1 Oct 2022 16:15:23 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 1 Oct 2022 18:13:57 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 40c160f5300642379c1c25945301b0eb99237532
X-Git-Newrev: 6229a31f8d7e5e38a98055f2a99b4f74683b394c
X-Patchwork-Hint: ignore
Message-Id: <20221001161523.0A1C6863EC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/fwts: enable for arm
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
Content-Type: multipart/mixed; boundary="===============3648784505068929397=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3648784505068929397==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=6229a31f8d7e5e38a98055f2a99b4f74683b394c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The FWTS application and its associated kernel modules do build on arm;
enable it.

Signed-off-by: Vincent Stehlé <vincent.stehle@arm.com>
Cc: Erico Nunes <nunes.erico@gmail.com>
[yann.morin.1998@free.fr: introduce _ARCH_SUPPORTS, sort alphabetically]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/fwts/Config.in | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/package/fwts/Config.in b/package/fwts/Config.in
index ac9a2e3909..08608d1dd7 100644
--- a/package/fwts/Config.in
+++ b/package/fwts/Config.in
@@ -1,6 +1,13 @@
+config BR2_PACKAGE_FWTS_ARCH_SUPPORTS
+	bool
+	default y if BR2_aarch64
+	default y if BR2_arm
+	default y if BR2_i386
+	default y if BR2_x86_64
+
 config BR2_PACKAGE_FWTS
 	bool "fwts"
-	depends on BR2_i386 || BR2_x86_64 || BR2_aarch64
+	depends on BR2_PACKAGE_FWTS_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_LIBBSD_ARCH_SUPPORTS # libbsd
 	depends on BR2_USE_MMU # libglib2
 	depends on BR2_USE_WCHAR # libglib2, libbsd
@@ -33,7 +40,7 @@ comment "efi_runtime module needs a Linux kernel to be built"
 endif
 
 comment "fwts needs a glibc toolchain w/ wchar, threads, dynamic library"
-	depends on BR2_i386 || BR2_x86_64 || BR2_aarch64
+	depends on BR2_PACKAGE_FWTS_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_LIBBSD_ARCH_SUPPORTS # libbsd
 	depends on BR2_USE_MMU
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \

--===============3648784505068929397==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3648784505068929397==--
