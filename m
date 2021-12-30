Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 284A9C433F5
	for <buildroot@archiver.kernel.org>; Thu, 30 Dec 2021 22:37:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A3DE7409BB;
	Thu, 30 Dec 2021 22:37:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Rj16f_JjkWT0; Thu, 30 Dec 2021 22:37:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D707F40219;
	Thu, 30 Dec 2021 22:37:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 06D0D1BF3C2
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 22:37:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E932F60C0F
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 22:37:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0c1n0tLjtvIr for <buildroot@lists.busybox.net>;
 Thu, 30 Dec 2021 22:37:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C576260BDE
 for <buildroot@buildroot.org>; Thu, 30 Dec 2021 22:37:19 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id t26so52904249wrb.4
 for <buildroot@buildroot.org>; Thu, 30 Dec 2021 14:37:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CydW0lU/6pwsmTzjJbyXZ4nAl5orn0pBWnA9fwXmwxI=;
 b=QiLjbxexxGWmMZx6Crs53aI75usC3KJwL4q2E1aSkM6O5pbBVQAcQAuaAWg+RKb9iF
 qs2egMU4p41jDNu45fPTmtwqn71WuWOSbXqVok98QWfsveMdxk6XbYazRyIELPPKC9N+
 gCbUHd0NO5VJSAakZ6vfeyOsd9ExZR60C4fv7m3QU0VhQvREGtdfIIuMcYcNJIyaLtH5
 pp/QU6bemN23f6CaUkfO3WMgy1GlvSDZbcqJVz19CqFYi2wICywJOmhgrWVYcxrY6blG
 OiiX4puZk/g7cTH5kwxFKLTAiPzOZzMtZHCM+3AZFUuOKYTjtkRi5xtMT1LXOSUPb3FM
 3ylA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CydW0lU/6pwsmTzjJbyXZ4nAl5orn0pBWnA9fwXmwxI=;
 b=BCFS+ubyEnlcf9p1b5cI6cgqMj57f72UvTHINL0/Vnu2fVeAT0reZW0aoxegqJjMXc
 TfVVVcEjktPJmo+L42BG+vaeCrgSjfoI/RdkXURIiFkthslBIxinAV/8GIffSptcZAYd
 WpWG9gwlyJkmkmvGb3AqZThUbmopu4PaC5HRXl4qYHh06ineJynkNPPr7uBlRQ8pO4+k
 sEJhWw7NvFMhvWZT1108w2OuJoa92k7w0BpkIDSXvCTmszn+GJIHMuchHAjOF3tAREvX
 AKSEOzod6iqhOVGD/dvBxKwMJrdczWy1TVJWW6jhcnBGUtOj0jQNagq87bL/k0I6UdA1
 G5xg==
X-Gm-Message-State: AOAM533NxWEwspObm78SAQJcjtOBbS12Sk+g91Y3cxUMqQwBzfCS/+m7
 LY7yX+AZru9NxBeD7a3pXE5fA8qQSi0=
X-Google-Smtp-Source: ABdhPJwMhh5pduBJ4WvM8jKuhDAnyu2TI6TgAepz3ZS/sUm27t1OVldDT2aDWSsSViZDqbAwIFL20g==
X-Received: by 2002:a05:6000:156b:: with SMTP id
 11mr27227698wrz.261.1640903837861; 
 Thu, 30 Dec 2021 14:37:17 -0800 (PST)
Received: from kali.home (2a01cb08896fec001e062303fcff6330.ipv6.abo.wanadoo.fr.
 [2a01:cb08:896f:ec00:1e06:2303:fcff:6330])
 by smtp.gmail.com with ESMTPSA id y12sm26798191wry.24.2021.12.30.14.37.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Dec 2021 14:37:17 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 30 Dec 2021 23:36:06 +0100
Message-Id: <20211230223606.3076350-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/tcpreplay: security bump to version
 4.3.4
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

- heap buffer overflow in tcpreplay fast_edit_packet
- heap buffer overflow in tcpreplay get_next_packet
- CVE-2020-24266 heap buffer overflow in tcpprep get_l2len
- CVE-2020-24265 heap buffer overflow in tcpprep
- Drop patch (already in version) and so autoreconf
- Update hash of license file (http -> https with
  https://github.com/appneta/tcpreplay/commit/ad8a18005347b3cef84a9b478d56de96d1ad254f)

https://github.com/appneta/tcpreplay/releases/tag/v4.3.4

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...001-configure-ac-fix-without-libdnet.patch | 76 -------------------
 package/tcpreplay/tcpreplay.hash              |  6 +-
 package/tcpreplay/tcpreplay.mk                |  4 +-
 3 files changed, 4 insertions(+), 82 deletions(-)
 delete mode 100644 package/tcpreplay/0001-configure-ac-fix-without-libdnet.patch

diff --git a/package/tcpreplay/0001-configure-ac-fix-without-libdnet.patch b/package/tcpreplay/0001-configure-ac-fix-without-libdnet.patch
deleted file mode 100644
index 75ed4f94de..0000000000
--- a/package/tcpreplay/0001-configure-ac-fix-without-libdnet.patch
+++ /dev/null
@@ -1,76 +0,0 @@
-From acee9c0c46f71f1f4c33c2dadf69d19e24b90f27 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Tue, 13 Aug 2019 20:19:23 +0200
-Subject: [PATCH] configure.ac: fix --without-libdnet
-
-Allow the user to disable libdnet check through --without-libdnet.
-This option is useful to cross-compile tcpreplay to avoid build failures
-if libdnet is installed on host but not on target, see
-https://bugs.buildroot.org/show_bug.cgi?id=12096
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/appneta/tcpreplay/pull/567]
----
- configure.ac | 48 +++++++++++++++++++++++++-----------------------
- 1 file changed, 25 insertions(+), 23 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 39ba58b7..5de3dcb5 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -1464,30 +1464,32 @@ if test $have_cygwin = no ; then
-         AC_HELP_STRING([--with-libdnet=DIR], [Use libdnet in DIR]),
-         [trydnetdir=$withval])
- 
--    case "$build_os" in
--    linux*)
--        dnl # Debian/Ubuntu already have a package called libdnet
--        dnl # so you the package you want to install libdumbnet-dev
--        for testdir in $trydnetdir /usr/local /opt/local /usr ; do
--            if test -x ${testdir}/bin/dumbnet-config -a $founddnet = no ; then
--                LDNETINC="$($testdir/bin/dumbnet-config --cflags)"
--                LDNETLIB="$($testdir/bin/dumbnet-config --libs)"
--                libdnet_version="$($testdir/bin/dumbnet-config --version) (libdumbnet)"
--                founddnet=$testdir
--            fi
--        done
--        ;;
--    esac
-+    if test $trydnetdir != no; then
-+        case "$build_os" in
-+        linux*)
-+            dnl # Debian/Ubuntu already have a package called libdnet
-+            dnl # so you the package you want to install libdumbnet-dev
-+            for testdir in $trydnetdir /usr/local /opt/local /usr ; do
-+                if test -x ${testdir}/bin/dumbnet-config -a $founddnet = no ; then
-+                    LDNETINC="$($testdir/bin/dumbnet-config --cflags)"
-+                    LDNETLIB="$($testdir/bin/dumbnet-config --libs)"
-+                    libdnet_version="$($testdir/bin/dumbnet-config --version) (libdumbnet)"
-+                    founddnet=$testdir
-+                fi
-+            done
-+            ;;
-+        esac
- 
--    if test $founddnet = no ; then
--        for testdir in $trydnetdir /usr/local /opt/local $MACOSX_SDK_PATH/usr /usr ; do
--            if test -x ${testdir}/bin/dnet-config -a $founddnet = no ; then
--                LDNETINC="$($testdir/bin/dnet-config --cflags)"
--                LDNETLIB="$($testdir/bin/dnet-config --libs)"
--                libdnet_version="$($testdir/bin/dnet-config --version)"
--                founddnet=$testdir
--            fi
--        done
-+        if test $founddnet = no ; then
-+            for testdir in $trydnetdir /usr/local /opt/local $MACOSX_SDK_PATH/usr /usr ; do
-+                if test -x ${testdir}/bin/dnet-config -a $founddnet = no ; then
-+                    LDNETINC="$($testdir/bin/dnet-config --cflags)"
-+                    LDNETLIB="$($testdir/bin/dnet-config --libs)"
-+                    libdnet_version="$($testdir/bin/dnet-config --version)"
-+                    founddnet=$testdir
-+                fi
-+            done
-+        fi
-     fi
- 
-     if test $founddnet = no ; then
diff --git a/package/tcpreplay/tcpreplay.hash b/package/tcpreplay/tcpreplay.hash
index e83efd78b1..8bcdae958c 100644
--- a/package/tcpreplay/tcpreplay.hash
+++ b/package/tcpreplay/tcpreplay.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-# https://github.com/appneta/tcpreplay/releases/download/v4.3.3/tcpreplay-4.3.3.tar.xz.asc
+# https://github.com/appneta/tcpreplay/releases/download/v4.3.4/tcpreplay-4.3.4.tar.xz.asc
 # using key 84E4FA215C934A7D97DC76D5E9E2149793BDE17E
-sha256  5e960e2a4432f583adbd11fa0855d17b73d9e0f2d6453b749f27aacaee53bab5  tcpreplay-4.3.3.tar.xz
-sha256  5971b0c544622f4b210a9cc56436a970685d3b0666e373c09e3cf9304db15d05  docs/LICENSE
+sha256  42c055106e55852c29d94bb6e1b9e001a0723349f2985eb893a47d384c85002b  tcpreplay-4.3.4.tar.xz
+sha256  07cf5e92d475287a7d1663b33097f40cae5adf03ed8920fcd4374e3dfb48c8ad  docs/LICENSE
diff --git a/package/tcpreplay/tcpreplay.mk b/package/tcpreplay/tcpreplay.mk
index 9208cb8176..ef65403974 100644
--- a/package/tcpreplay/tcpreplay.mk
+++ b/package/tcpreplay/tcpreplay.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TCPREPLAY_VERSION = 4.3.3
+TCPREPLAY_VERSION = 4.3.4
 TCPREPLAY_SITE = https://github.com/appneta/tcpreplay/releases/download/v$(TCPREPLAY_VERSION)
 TCPREPLAY_SOURCE = tcpreplay-$(TCPREPLAY_VERSION).tar.xz
 TCPREPLAY_LICENSE = GPL-3.0
@@ -15,8 +15,6 @@ TCPREPLAY_CONF_ENV = \
 TCPREPLAY_CONF_OPTS = --with-libpcap=$(STAGING_DIR)/usr \
 	--enable-pcapconfig
 TCPREPLAY_DEPENDENCIES = libpcap
-# We're patching configure.ac
-TCPREPLAY_AUTORECONF = YES
 
 ifeq ($(BR2_STATIC_LIBS),y)
 TCPREPLAY_CONF_OPTS += --enable-dynamic-link=no
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
