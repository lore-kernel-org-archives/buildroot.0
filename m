Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D63DC433F5
	for <buildroot@archiver.kernel.org>; Sat,  4 Dec 2021 20:21:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 23E5883F12;
	Sat,  4 Dec 2021 20:21:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7fbnAbmtvLKq; Sat,  4 Dec 2021 20:21:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8510E82B24;
	Sat,  4 Dec 2021 20:21:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DDDB91BF861
 for <buildroot@lists.busybox.net>; Sat,  4 Dec 2021 20:21:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DB03560A75
 for <buildroot@lists.busybox.net>; Sat,  4 Dec 2021 20:21:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UdrYAPgVsldX for <buildroot@lists.busybox.net>;
 Sat,  4 Dec 2021 20:21:16 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 463BF60A6B
 for <buildroot@buildroot.org>; Sat,  4 Dec 2021 20:21:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 3D65E922AA; Sat,  4 Dec 2021 20:16:23 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sat, 4 Dec 2021 21:21:03 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 7b5271ecfd64e6cc2562c5911266f107236cef22
X-Git-Newrev: 5ca414c07dc83862eca679767cb72e0233a2de24
X-Patchwork-Hint: ignore
Message-Id: <20211204201623.3D65E922AA@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/postgis: adjust
 libgeos dependency coments
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

commit: https://git.buildroot.net/buildroot/commit/?id=5ca414c07dc83862eca679767cb72e0233a2de24
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Since 3.10.0 libgeos needs toolchain with threads support.
So add it to BR2_TOOLCHAIN_HAS_THREADS comment list.

libgeos depends on BR2_INSTALL_LIBSTDCPP, so add it to
BR2_INSTALL_LIBSTDCPP comment list.

Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/postgis/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/postgis/Config.in b/package/postgis/Config.in
index 04705f7e16..2642115026 100644
--- a/package/postgis/Config.in
+++ b/package/postgis/Config.in
@@ -2,9 +2,9 @@ config BR2_PACKAGE_POSTGIS
 	bool "postgis"
 	depends on BR2_PACKAGE_POSTGRESQL_FULL
 	depends on !BR2_microblazeel && !BR2_microblazebe # ICE
-	depends on BR2_INSTALL_LIBSTDCPP # proj
+	depends on BR2_INSTALL_LIBSTDCPP # libgeos, proj
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 # C++11, proj
-	depends on BR2_TOOLCHAIN_HAS_THREADS # proj
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libgeos, proj
 	depends on BR2_USE_WCHAR # libgeos, proj
 	depends on !BR2_TOOLCHAIN_HAS_BINUTILS_BUG_21464 # libgeos
 	depends on !BR2_TOOLCHAIN_HAS_BINUTILS_BUG_27597 # libgeos
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
