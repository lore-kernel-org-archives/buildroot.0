Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AA68C433EF
	for <buildroot@archiver.kernel.org>; Wed, 11 May 2022 17:03:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A7BC940B8D;
	Wed, 11 May 2022 17:03:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id R8FZBdeZ4xRT; Wed, 11 May 2022 17:03:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9603840291;
	Wed, 11 May 2022 17:03:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AD9001BF580
 for <buildroot@lists.busybox.net>; Wed, 11 May 2022 17:03:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9B8A260BEA
 for <buildroot@lists.busybox.net>; Wed, 11 May 2022 17:03:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ETmCd5rf86m9 for <buildroot@lists.busybox.net>;
 Wed, 11 May 2022 17:03:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 623E360BD6
 for <buildroot@buildroot.org>; Wed, 11 May 2022 17:03:36 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id j25so2858702wrc.9
 for <buildroot@buildroot.org>; Wed, 11 May 2022 10:03:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2SKtc/nIXovX9xWEUQbODOagET1D9kdJ5MnDvbvwGhg=;
 b=F1j+Yq9P5Ket4w1Vq8SMwRNqSI8f10xlmHWVqbHDP1aFZBCx7feY3d5iHhCXir7uDY
 OE54dtQ3Ga0nyPvvZne0RSDvM1FG3fKTs7C1lIwNWAA4TyCbV5EMbMu0juW6U8hSF9fl
 mGIujIaMmg6zpS8HX9xVBQRWFRHv0Xqpib5lPmpM9whC8zHXDNubRi6gMUsFg+0ISIsb
 3p4tZMZqUjxg74gP5N5Xks2soHSPtCXZIxjP5CpEtY/nnHUiOCrtIWUXTj6SGZ/OQI4B
 Ki/beJqzvxSW1RnMFj0Z+ufqoFX6PEAO3LOn6Cqkh4VbhAZrc0bMkHb6ZLd5UoNfmZCc
 dxHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2SKtc/nIXovX9xWEUQbODOagET1D9kdJ5MnDvbvwGhg=;
 b=vRSwVHIWz0GETykEQnxkAW2aDGOefPdn9hJfjUR0togpLRRmC/Acf+wrkg4s571C2n
 461XhV1Y8LXqZ4d8T/Oj4lJ8TWcmsld+pl0W8Iz6h4bUdfWKTEh+RVSx3DfdY/yZ/ML/
 V4DX4ChJqFbh8jwZOvrEHQMufZNNV3FzaGr62NNM560tGip8ZezIaG7hdWtmrzy5dTAS
 EG2JbbLZZgIUnLQ/+VRHHGmxBO5CZ5jx+Zn1VSyPc3z2huF22N6i2EBppvbPlnRoqxhh
 TmY9cjfCaGRhp573TP4MQmLDWUcFcTBE8Q4WPgNDMtCJfK4n92UKorv4zobC1r0ZyNUY
 I0Vw==
X-Gm-Message-State: AOAM530CZB3zHBAlp9HgV+OxYkIl8XFJ67AHYxZ7P5hy5W2o+RBcI5r8
 I/Z4vhUwcNXYXlcJqEHCJRx6Zs85YsQ=
X-Google-Smtp-Source: ABdhPJybkNEjkVhdpmXlFO6Xe9xnqhpXhXhkhGKN0VE1nWLCGWL4ByKXgcZR8fGV/mG+tshweIdHUw==
X-Received: by 2002:a5d:5251:0:b0:20c:d4d4:42ee with SMTP id
 k17-20020a5d5251000000b0020cd4d442eemr9185987wrc.382.1652288614315; 
 Wed, 11 May 2022 10:03:34 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 k7-20020a5d6e87000000b0020c5253d904sm2093066wrz.80.2022.05.11.10.03.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 May 2022 10:03:33 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 11 May 2022 19:01:26 +0200
Message-Id: <20220511170126.2925680-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/pcsc-lite: bump to version 1.9.6
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

- host-flex is mandatory since
  https://github.com/LudovicRousseau/PCSC/commit/3f89340785934785cf1490d3e788eefb25c50a69
- Set --disable-strict to remove -Werror which was added with
  https://github.com/LudovicRousseau/PCSC/commit/9124a59d8f1a8536f0b46f5ef2a1b4a1711f96b2
- Drop patch (already in version)

https://github.com/LudovicRousseau/PCSC/releases/tag/1.9.6

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...ric.c-fix-build-without-lib-udev-usb.patch | 35 -------------------
 package/pcsc-lite/pcsc-lite.hash              |  2 +-
 package/pcsc-lite/pcsc-lite.mk                |  5 +--
 3 files changed, 4 insertions(+), 38 deletions(-)
 delete mode 100644 package/pcsc-lite/0001-src-hotplug_generic.c-fix-build-without-lib-udev-usb.patch

diff --git a/package/pcsc-lite/0001-src-hotplug_generic.c-fix-build-without-lib-udev-usb.patch b/package/pcsc-lite/0001-src-hotplug_generic.c-fix-build-without-lib-udev-usb.patch
deleted file mode 100644
index 7e93bf5fce..0000000000
--- a/package/pcsc-lite/0001-src-hotplug_generic.c-fix-build-without-lib-udev-usb.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 2153e165c48e541bb5a8b23f81e87db87a9394fd Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Tue, 14 Dec 2021 08:20:59 +0100
-Subject: [PATCH] src/hotplug_generic.c: fix build without lib{udev,usb}
-
-Fix the following build failure without lib{udev,usb} raised since
-version 1.9.5 and
-https://github.com/LudovicRousseau/PCSC/commit/6f8f170db3c88c59a5ddb5ae5319b921a901a6aa:
-
-/home/giuliobenetti/autobuild/run/instance-2/output-1/host/lib/gcc/arm-buildroot-linux-gnueabihf/11.2.0/../../../../arm-buildroot-linux-gnueabihf/bin/ld: pcscd-pcscdaemon.o: in function `signal_thread':
-pcscdaemon.c:(.text+0x444): undefined reference to `HPReCheckSerialReaders'
-
-Fixes:
- - http://autobuild.buildroot.org/results/6cf323229f32967aa554418410dc94b7094d09af
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Retrieved from:
-https://github.com/LudovicRousseau/PCSC/commit/2153e165c48e541bb5a8b23f81e87db87a9394fd]
----
- src/hotplug_generic.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/hotplug_generic.c b/src/hotplug_generic.c
-index a0f34646..e4f19935 100644
---- a/src/hotplug_generic.c
-+++ b/src/hotplug_generic.c
-@@ -48,7 +48,7 @@ THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
- #define FALSE 0
- #endif
- 
--#if !defined(__APPLE__) && !defined(HAVE_LIBUSB) && !defined(__linux__) && !defined(HAVE_LIBUDEV)
-+#if !defined(__APPLE__) && !defined(HAVE_LIBUSB) && !defined(HAVE_LIBUDEV)
- 
- LONG HPSearchHotPluggables(void)
- {
diff --git a/package/pcsc-lite/pcsc-lite.hash b/package/pcsc-lite/pcsc-lite.hash
index 4844606c59..10a8d92fa7 100644
--- a/package/pcsc-lite/pcsc-lite.hash
+++ b/package/pcsc-lite/pcsc-lite.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  9ee3f9b333537562177893559ad4f7b8d5c23ebe828eef53056c02db14049d08  pcsc-lite-1.9.5.tar.bz2
+sha256  fdb3fe8f68049019523801909b2a336d0d4ee315edafe363c30d375e3706537a  pcsc-lite-1.9.6.tar.bz2
 sha256  40d4358bb8dc8d30f5365ae6d999b6f820bbc051b292912482f2e4d0ebd837e1  COPYING
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  GPL-3.0.txt
diff --git a/package/pcsc-lite/pcsc-lite.mk b/package/pcsc-lite/pcsc-lite.mk
index a7db105987..a5ff074b2c 100644
--- a/package/pcsc-lite/pcsc-lite.mk
+++ b/package/pcsc-lite/pcsc-lite.mk
@@ -4,14 +4,15 @@
 #
 ################################################################################
 
-PCSC_LITE_VERSION = 1.9.5
+PCSC_LITE_VERSION = 1.9.6
 PCSC_LITE_SOURCE = pcsc-lite-$(PCSC_LITE_VERSION).tar.bz2
 PCSC_LITE_SITE = https://pcsclite.apdu.fr/files
 PCSC_LITE_INSTALL_STAGING = YES
-PCSC_LITE_DEPENDENCIES = host-pkgconf
+PCSC_LITE_DEPENDENCIES = host-pkgconf host-flex
 PCSC_LITE_LICENSE = BSD-2-Clause (auth), BSD-3-Clause, GPL-3.0+ (demo, spy, tests), ISC (simclist)
 PCSC_LITE_LICENSE_FILES = COPYING GPL-3.0.txt
 PCSC_LITE_SELINUX_MODULES = pcscd
+PCSC_LITE_CONF_OPTS = --disable-strict
 
 # - libudev and libusb are optional
 # - libudev and libusb can't be used together
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
