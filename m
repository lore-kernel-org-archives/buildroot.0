Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3E87C433F5
	for <buildroot@archiver.kernel.org>; Mon, 21 Feb 2022 19:21:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8C31460BE2;
	Mon, 21 Feb 2022 19:21:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uRWvB8vQmaBL; Mon, 21 Feb 2022 19:21:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7873760B79;
	Mon, 21 Feb 2022 19:21:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3B2081BF319
 for <buildroot@lists.busybox.net>; Mon, 21 Feb 2022 19:21:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1D33640570
 for <buildroot@lists.busybox.net>; Mon, 21 Feb 2022 19:21:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1GefsOegOj2n for <buildroot@lists.busybox.net>;
 Mon, 21 Feb 2022 19:21:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6678F400A8
 for <buildroot@buildroot.org>; Mon, 21 Feb 2022 19:21:36 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id d27so28817215wrb.5
 for <buildroot@buildroot.org>; Mon, 21 Feb 2022 11:21:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BurrJlv81Szg2O6nBsUZxOUfXx21Z+4x2IXP6ch9VAc=;
 b=BjjqEw/BweqUflK40BW0HygHvzezXFMYX6uJ9upcbP5cty+kJloZsZpIEXuHpmIweN
 9Mz6OnvZ7rIzr2P/7RHFSkD50eGnTvEm8Sj6sMorFYtv4YmxSmgtNrzrqDX3DCGPgZQZ
 IOGr1LKYQoCOF/5ZufRTt5/NpSphC/vlkZztZqEhBSIBoUzhG5+SsCD2nlRFqGU0qUSD
 N7a4pCIVisC881heMTCvpDQOvIJjkLXpJJysorCuLkRTUgKNmlAxPgXY2mgjQKU/82Tg
 PJFDvxxe3DhIL9bIjGHqqlt0xZFgb3PHJhkNjn1d3P1aNpMDHS3F3zPRRv3hz+NgDJAb
 1zAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BurrJlv81Szg2O6nBsUZxOUfXx21Z+4x2IXP6ch9VAc=;
 b=QDTBWzeRWHgA4C5mIUUCtBtuCoLseE8lcvCxJ9MA2wvIovuq2q56XuCCZYliMbtbjT
 w6uasKzqHnYFqBi3mrWnFU/TgZkdb7EVsBQT5Kvv34dFFbpRoQmuYK/XQH4haeTAI+bz
 FOdYEKdBC9L47d6oihTnpas8SNipUbldu1XHDoXRrUWbHz3fDkMMnCnIinI9Kl/taMDZ
 nliaFcLjVywxlBadTite4MAeGmDWIS5pmejR7Xc5LFLXkkpYRddCnGB5QOYm8ELXs92Z
 TJQCmpb5qbcXV6TFfxMlWKFO494omBZz5VdxoONO9g9wPB65s/wl9bUeoWOMC0w382G6
 eQig==
X-Gm-Message-State: AOAM531KNc9bxZwzAPk6oHww4UaiPcph2MzjKmSFZbUI/r/8502qepvM
 TwlE7UXFdaHtQQmYIa/XorufwUgRAAUoeQ==
X-Google-Smtp-Source: ABdhPJx416Vq15qDnZbcbHATy1T6tMHY5tPOZHCdxKkUXkb6ncZPVwJzhHEBN12ytgpWdD9+57A8Tg==
X-Received: by 2002:adf:eac8:0:b0:1e4:a017:3d63 with SMTP id
 o8-20020adfeac8000000b001e4a0173d63mr16520105wrn.616.1645471294521; 
 Mon, 21 Feb 2022 11:21:34 -0800 (PST)
Received: from dell5510.arch.suse.de (gw1.ms-free.net. [185.243.124.10])
 by smtp.gmail.com with ESMTPSA id b2sm31461058wri.35.2022.02.21.11.21.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Feb 2022 11:21:33 -0800 (PST)
From: Petr Vorel <petr.vorel@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 21 Feb 2022 20:21:26 +0100
Message-Id: <20220221192126.30231-1-petr.vorel@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/libqmi: bump version to 1.30.4
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
Cc: Matt Weber <matthew.weber@collins.com>,
 Aleksander Morgado <aleksander@aleksander.es>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Remove 0001-build-add-an-option-to-not-build-man-pages.patch
as release contains very similar commit which does autodetection:
1a474db ("build: add an option to not build man pages")

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
Tested:


                    bootlin-armv5-uclibc [1/6]: OK
                     bootlin-armv7-glibc [2/6]: OK
                   bootlin-armv7m-uclibc [3/6]: SKIPPED
                     bootlin-x86-64-musl [4/6]: OK
                      br-arm-full-static [5/6]: OK
                            sourcery-arm [6/6]: OK

                             andes-nds32 [ 1/45]: FAILED (not related to this change)
                             arm-aarch64 [ 2/45]: OK
                   bootlin-aarch64-glibc [ 3/45]: OK
               bootlin-arcle-hs38-uclibc [ 4/45]: OK
                    bootlin-armv5-uclibc [ 5/45]: OK
                     bootlin-armv7-glibc [ 6/45]: OK
                   bootlin-armv7m-uclibc [ 7/45]: SKIPPED
                      bootlin-armv7-musl [ 8/45]: OK
             bootlin-microblazeel-uclibc [ 9/45]: OK
                   bootlin-mipsel-uclibc [10/45]: OK
                bootlin-mipsel32r6-glibc [11/45]: OK
                bootlin-m68k-5208-uclibc [12/45]: SKIPPED
               bootlin-m68k-68040-uclibc [13/45]: OK
                     bootlin-nios2-glibc [14/45]: OK
                 bootlin-openrisc-uclibc [15/45]: OK
           bootlin-powerpc-e500mc-uclibc [16/45]: OK
        bootlin-powerpc64le-power8-glibc [17/45]: OK
                   bootlin-riscv32-glibc [18/45]: OK
                   bootlin-riscv64-glibc [19/45]: OK
                    bootlin-riscv64-musl [20/45]: OK
                      bootlin-sh4-uclibc [21/45]: OK
                    bootlin-sparc-uclibc [22/45]: OK
                   bootlin-sparc64-glibc [23/45]: OK
                   bootlin-xtensa-uclibc [24/45]: OK
                    bootlin-x86-64-glibc [25/45]: OK
                     bootlin-x86-64-musl [26/45]: OK
                   bootlin-x86-64-uclibc [27/45]: OK
                            br-arm-basic [28/45]: SKIPPED
                    br-arm-full-nothread [29/45]: SKIPPED
                      br-arm-full-static [30/45]: OK
                br-i386-pentium-mmx-musl [31/45]: OK
                   br-i386-pentium4-full [32/45]: OK
                      br-mips64-n64-full [33/45]: OK
                 br-mips64r6-el-hf-glibc [34/45]: OK
               br-powerpc-603e-basic-cpp [35/45]: SKIPPED
               br-powerpc64-power7-glibc [36/45]: OK
                       linaro-aarch64-be [37/45]: OK
                          linaro-aarch64 [38/45]: OK
                              linaro-arm [39/45]: OK
                     sourcery-arm-armv4t [40/45]: OK
                            sourcery-arm [41/45]: OK
                     sourcery-arm-thumb2 [42/45]: OK
                           sourcery-mips [43/45]: OK
                         sourcery-mips64 [44/45]: OK
                          sourcery-nios2 [45/45]: OK

 ...add-an-option-to-not-build-man-pages.patch | 65 -------------------
 package/libqmi/libqmi.hash                    |  2 +-
 package/libqmi/libqmi.mk                      |  2 +-
 3 files changed, 2 insertions(+), 67 deletions(-)
 delete mode 100644 package/libqmi/0001-build-add-an-option-to-not-build-man-pages.patch

diff --git a/package/libqmi/0001-build-add-an-option-to-not-build-man-pages.patch b/package/libqmi/0001-build-add-an-option-to-not-build-man-pages.patch
deleted file mode 100644
index d9053de537..0000000000
--- a/package/libqmi/0001-build-add-an-option-to-not-build-man-pages.patch
+++ /dev/null
@@ -1,65 +0,0 @@
-From 295b75e9c8dc895e281e36b1e8121d09fd556af0 Mon Sep 17 00:00:00 2001
-From: Aleksander Morgado <aleksander@aleksander.es>
-Date: Wed, 3 Nov 2021 10:57:51 +0100
-Subject: [PATCH] build: add an option to not build man pages
-
-When cross-compiling, the compiled binaries cannot be run on the build
-machine, unless one defines a helper (e.g. qemu) in the meson
-configuration, which is most of the time undesirable.
-
-If help2man is installed on the build machine, then the build would fail
-because of this, so add an option to disable generating the man pages.
-
-With later versions of meson, it will be possible to automatically
-detect this condition.
-
-Based on the same fix done in libmbim by Nicolas Cavallari, see
-https://gitlab.freedesktop.org/mobile-broadband/libmbim/-/commit/792af73ea90e9689703ab526dd444fdb1c2f8e40
-
-Fixes https://gitlab.freedesktop.org/mobile-broadband/libqmi/-/issues/75
-
-[Retrieved (and backported) from:
-https://gitlab.freedesktop.org/mobile-broadband/libqmi/-/commit/295b75e9c8dc895e281e36b1e8121d09fd556af0]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- meson.build       | 8 +++++++-
- meson_options.txt | 1 +
- 2 files changed, 8 insertions(+), 1 deletion(-)
-
-diff --git a/meson.build b/meson.build
-index e88b43a1..c7312146 100644
---- a/meson.build
-+++ b/meson.build
-@@ -223,8 +223,8 @@ if enable_gtk_doc
-   subdir('docs/reference/libqmi-glib')
- endif
- 
--help2man = find_program('help2man', required: false)
--if help2man.found()
-+enable_man = get_option('man')
-+if enable_man
-   subdir('docs/man')
- endif
- 
-@@ -237,6 +242,7 @@ summary({
- output += '    Documentation:         ' + enable_gtk_doc.to_string() + '\n'
- output += '    bash completion:       ' + enable_bash_completion.to_string() + '\n'
- output += '    gobject introspection: ' + enable_gir.to_string() + '\n\n'
-+output += '    man pages:             ' + enable_man.to_string() + '\n\n'
- output += '  System paths\n'
- output += '    prefix:                ' + qmi_prefix + '\n'
- output += '    udev base directory:   ' + qmi_username + '\n\n'
-diff --git a/meson_options.txt b/meson_options.txt
-index 4d4f913d..bee5daac 100644
---- a/meson_options.txt
-+++ b/meson_options.txt
-@@ -16,5 +16,6 @@ option('udevdir', type: 'string', value: '', description: 'where udev base direc
- 
- option('introspection', type: 'boolean', value: 'auto', description: 'build introspection support')
- option('gtk_doc', type: 'boolean', value: false, description: 'use gtk-doc to build documentation')
-+option('man', type: 'boolean', value: 'true', description: 'build man pages using help2man')
- 
- option('bash_completion', type: 'boolean', value: true, description: 'install bash completion files')
--- 
-GitLab
-
diff --git a/package/libqmi/libqmi.hash b/package/libqmi/libqmi.hash
index 1f2da45ac0..ef2da77a2a 100644
--- a/package/libqmi/libqmi.hash
+++ b/package/libqmi/libqmi.hash
@@ -1,4 +1,4 @@
 # Locally computed:
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
-sha256  2eb7c7971b91a64ad830643b0170cff692a69bf0f093ca61d72d3f466a0272d4  libqmi-1.30.2.tar.gz
+sha256  82ddd3f77c602b1e0c11d3e41d0563ede11f95036ebfcf929bc89157b13928e6  libqmi-1.30.4.tar.gz
diff --git a/package/libqmi/libqmi.mk b/package/libqmi/libqmi.mk
index a4839f1efb..b33e2fdc47 100644
--- a/package/libqmi/libqmi.mk
+++ b/package/libqmi/libqmi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBQMI_VERSION = 1.30.2
+LIBQMI_VERSION = 1.30.4
 LIBQMI_SITE = https://gitlab.freedesktop.org/mobile-broadband/libqmi/-/archive/$(LIBQMI_VERSION)
 LIBQMI_LICENSE = LGPL-2.0+ (library), GPL-2.0+ (programs)
 LIBQMI_LICENSE_FILES = COPYING COPYING.LIB
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
