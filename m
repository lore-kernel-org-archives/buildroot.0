Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2675C433F5
	for <buildroot@archiver.kernel.org>; Mon, 20 Dec 2021 12:42:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3627460C2F;
	Mon, 20 Dec 2021 12:42:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hX5phKxB0Spb; Mon, 20 Dec 2021 12:41:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7BA8460C29;
	Mon, 20 Dec 2021 12:41:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1DC6B1BF3CC
 for <buildroot@lists.busybox.net>; Mon, 20 Dec 2021 12:41:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1AB9883E1B
 for <buildroot@lists.busybox.net>; Mon, 20 Dec 2021 12:41:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VvDRa-spcYnl for <buildroot@lists.busybox.net>;
 Mon, 20 Dec 2021 12:41:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2197383E19
 for <buildroot@buildroot.org>; Mon, 20 Dec 2021 12:41:55 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id e5so19808372wrc.5
 for <buildroot@buildroot.org>; Mon, 20 Dec 2021 04:41:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NZ097ilXTEG0H5H7TOvAj0gDi39B5Dfzak2pzrntHa8=;
 b=naMFJagsMYGGYfh0kncVDeUjBAypFRpJK34K0Kq1SKzWlfgHoByXOvFp3oktIaibZ7
 C3cVV5dCKvCHIPpVPArRxjgUZDyfOTrT5t6YwuxVodwcPgm4O63Lj/jeaQc7iDPVC1n4
 zPRlvguUiRuw1UGVer/AZ29ALIQx4ZbKprGf9cZHazbc8eg3KRp6HgwPRRDgM3RyEN4S
 1SH2x41bQ29hSXjySthJ53eASES4MnXrB5Eaqyx14OyfJtIXfTJgaPsHKRd7/IvLiDlD
 UTcrUI6RgoWnYvqhGveWoVi6RdNyVz2elWeTZzbfoNVif1LUaeJT9EkkI/LVKa3b+Kqs
 xhBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NZ097ilXTEG0H5H7TOvAj0gDi39B5Dfzak2pzrntHa8=;
 b=A28NS1CcdUDEIHLWyq7oxUw7bz/wIfdqUP7vyYchTszawykdW1ihK9fftwjchfCzK6
 8sGwxB2G9+CqlkI+iFZJVJSTRvx7Lqvqx1kKlV9CY3L3CzyqHTo3hCIbHGWQJg48iXbg
 Y9blbTqhZwJR/4VL0Ok9zpvReIsR20PzXKJDlgDbEoZImoZ96KbXX4NAN9cdTgwP+7SZ
 LK8RxWsBJLuXxeGQC/g3oORQRfPYd9zZ2wKV6koOF4YUQpz7hrhfRbYZ8OVXgJcvXomy
 Af2Lu0uX2M/IxBzBN8pHDcG/QiSYRvxDRQ2y0llMCrP19c0qgGBW6ahHa7XnIdwvxqVb
 i7Kg==
X-Gm-Message-State: AOAM5318dVfSqCc5ZerWufhUDpwc+nxzP77DEnqd5sTxaqUT/lJOe64Y
 XIJVHw36C5XK1IqTImxq+rBE2FSF5pg9gQ==
X-Google-Smtp-Source: ABdhPJwquXQUBMYNU5HGW6TidO6fF6FqAzi6coAwuk9USUcguqMYO3zigGQ1NHWmMvRwGYXV2oi7pw==
X-Received: by 2002:a5d:5384:: with SMTP id d4mr12933139wrv.121.1640004114059; 
 Mon, 20 Dec 2021 04:41:54 -0800 (PST)
Received: from kali.home (2a01cb08896fec001e062303fcff6330.ipv6.abo.wanadoo.fr.
 [2a01:cb08:896f:ec00:1e06:2303:fcff:6330])
 by smtp.gmail.com with ESMTPSA id p13sm3776211wmq.19.2021.12.20.04.41.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Dec 2021 04:41:53 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 20 Dec 2021 13:41:16 +0100
Message-Id: <20211220124116.2177752-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/ncmpc: bump to version 0.46
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- boost is not needed since
  https://github.com/MusicPlayerDaemon/ncmpc/commit/6eb958602091752c20e8dbb32041bedc637d24ee
- pcre has been replaced by pcre2 since
  https://github.com/MusicPlayerDaemon/ncmpc/commit/f2ea0d39a3d0ed20a958f7e7dd902de7ea2875b7

https://raw.githubusercontent.com/MusicPlayerDaemon/ncmpc/v0.46/NEWS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/ncmpc/Config.in  |  9 +++------
 package/ncmpc/ncmpc.hash |  2 +-
 package/ncmpc/ncmpc.mk   | 10 +++++-----
 3 files changed, 9 insertions(+), 12 deletions(-)

diff --git a/package/ncmpc/Config.in b/package/ncmpc/Config.in
index 0e062460a7..4155404fcf 100644
--- a/package/ncmpc/Config.in
+++ b/package/ncmpc/Config.in
@@ -2,11 +2,8 @@ config BR2_PACKAGE_NCMPC
 	bool "ncmpc"
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_USE_WCHAR # boost
-	depends on BR2_TOOLCHAIN_HAS_THREADS # boost
+	depends on BR2_USE_WCHAR
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # C++17
-	select BR2_PACKAGE_BOOST
-	select BR2_PACKAGE_BOOST_SYSTEM
 	select BR2_PACKAGE_LIBMPDCLIENT
 	select BR2_PACKAGE_NCURSES
 	help
@@ -16,7 +13,7 @@ config BR2_PACKAGE_NCMPC
 
 	  http://www.musicpd.org/clients/ncmpc/
 
-comment "ncmpc needs a toolchain w/ C++, wchar, threads, gcc >= 7"
+comment "ncmpc needs a toolchain w/ C++, wchar, gcc >= 7"
 	depends on BR2_USE_MMU
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
-		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_TOOLCHAIN_GCC_AT_LEAST_7
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_7
diff --git a/package/ncmpc/ncmpc.hash b/package/ncmpc/ncmpc.hash
index b8f79a70b5..a5d6698a61 100644
--- a/package/ncmpc/ncmpc.hash
+++ b/package/ncmpc/ncmpc.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-sha256  17ff446447e002f2ed4342b7324263a830df7d76bcf177dce928f7d3a6f1f785  ncmpc-0.45.tar.xz
+sha256  177f77cf09dd4ab914e8438be399cdd5d83c9aa992abc8d9abac006bb092934e  ncmpc-0.46.tar.xz
 
 # Hash for license file:
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/ncmpc/ncmpc.mk b/package/ncmpc/ncmpc.mk
index 9a394ba356..91859cbc24 100644
--- a/package/ncmpc/ncmpc.mk
+++ b/package/ncmpc/ncmpc.mk
@@ -5,11 +5,10 @@
 ################################################################################
 
 NCMPC_VERSION_MAJOR = 0
-NCMPC_VERSION = $(NCMPC_VERSION_MAJOR).45
+NCMPC_VERSION = $(NCMPC_VERSION_MAJOR).46
 NCMPC_SOURCE = ncmpc-$(NCMPC_VERSION).tar.xz
 NCMPC_SITE = http://www.musicpd.org/download/ncmpc/$(NCMPC_VERSION_MAJOR)
 NCMPC_DEPENDENCIES = \
-	boost \
 	host-pkgconf \
 	libmpdclient \
 	ncurses \
@@ -21,7 +20,8 @@ NCMPC_CPE_ID_VENDOR = ncmpc_project
 NCMPC_CONF_OPTS = \
 	-Dcurses=ncurses \
 	-Ddocumentation=disabled \
-	$(if $(BR2_SYSTEM_ENABLE_NLS),-Dnls=enabled,-Dnls=disabled)
+	$(if $(BR2_SYSTEM_ENABLE_NLS),-Dnls=enabled,-Dnls=disabled) \
+	$(if $(BR2_TOOLCHAIN_HAS_THREADS),-Dsignalfd=true,-Dsignalfd=false)
 
 ifeq ($(BR2_PACKAGE_LIRC_TOOLS),y)
 NCMPC_DEPENDENCIES += lirc-tools
@@ -30,8 +30,8 @@ else
 NCMPC_CONF_OPTS += -Dlirc=disabled
 endif
 
-ifeq ($(BR2_PACKAGE_PCRE),y)
-NCMPC_DEPENDENCIES += pcre
+ifeq ($(BR2_PACKAGE_PCRE2),y)
+NCMPC_DEPENDENCIES += pcre2
 NCMPC_CONF_OPTS += -Dregex=enabled
 else
 NCMPC_CONF_OPTS += -Dregex=disabled
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
