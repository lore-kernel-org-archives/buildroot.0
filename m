Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 666A2C433EF
	for <buildroot@archiver.kernel.org>; Wed,  9 Feb 2022 00:23:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D07B5401E5;
	Wed,  9 Feb 2022 00:23:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gx7e86qJ7LRP; Wed,  9 Feb 2022 00:23:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BECFF401C1;
	Wed,  9 Feb 2022 00:23:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E6B141BF9AD
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 00:23:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D518460BF4
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 00:23:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MyCoaGHKGu3Q for <buildroot@lists.busybox.net>;
 Wed,  9 Feb 2022 00:23:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3002960B2D
 for <buildroot@buildroot.org>; Wed,  9 Feb 2022 00:23:14 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 q198-20020a1ca7cf000000b0037bb52545c6so2216739wme.1
 for <buildroot@buildroot.org>; Tue, 08 Feb 2022 16:23:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uXaK34ve9TYLMgBbQKnLs0kj03WIr1EuD85jFvgxndo=;
 b=oe6Jl3t+iL1wAyJVjfkSZ7R0/I6/emGWCSc+clb7ITdcRJluZ/K2p3/tPJyyCY7L9f
 yBhB4G7kO9y+Z4lyEg1FIFTnRcmjGmyAxYWAGMHb4iGgbx6W/AYXuKEhbY6l8vRzD3uJ
 4DGt4s0oASJSOv0TzcbgSvePQYSzKx7I7NS2licoXMimT9mAdOAg1Ilrb9g+G4THVz6W
 78zkM92/Ko+rOJ4j1qNb1SN7fmzkrEQZ3wIQ1pmmumrBZ2+XwaVHfpbdETI5nA53ns/y
 l71PeFgKlUo53fxMWRHLIiWuMoFvYGtH436HnR59oP72EEnOVvdgUEc0FJ7KcMr6wDIj
 LcGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uXaK34ve9TYLMgBbQKnLs0kj03WIr1EuD85jFvgxndo=;
 b=tG7GN1DSaMUoBwxXbaYDWlS/+pyF5IzpQhI1kXqSkxHLn/T12u0mYkS67jbzENkEs0
 Dl0jCzI7U3ldouV1s9cNa6EAVWYbZKwMQ2hXh+B8+aNh0HcVwYyXBWVB1hZkY8+75H4S
 UkKWJQbNR64sqAlzWCdRCiGzoiitDSSVAedQuSZIOGYvEgZEM+cKrSOUtYappaP/Gz0o
 kyRrmx+LauACSk/nSPfRW0WcoCkfhDh5l7SJ8ruGMzb4SJ6Y+XsdTg2vDRlbMoywmqc1
 fogsjDpJfCekscGXhSSrMX/vUOHKrEGMpVpcwHZgJFNLVYqaldM3Ys1a2ZxFQxYD+Y47
 7PHg==
X-Gm-Message-State: AOAM532RShSo1bt0Y9DTVyfEgwCtHEtSsFwpTMcoV+5uve6y14W+5qPL
 UZz0XLJTpOV7MumFLHINJzCL6b281rI=
X-Google-Smtp-Source: ABdhPJxFZ/BSSA9BbYiTsAVbcc3ekB1481Qg+lHTXCdVXSDRg31EhKNYbldlynUkCpFcwxzfTmsODA==
X-Received: by 2002:a05:600c:3b25:: with SMTP id
 m37mr379124wms.40.1644366192354; 
 Tue, 08 Feb 2022 16:23:12 -0800 (PST)
Received: from atlas.home
 (2a01cb058f8a18003dbee9eed79eb521.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521])
 by smtp.gmail.com with ESMTPSA id f14sm3764568wmq.40.2022.02.08.16.23.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Feb 2022 16:23:11 -0800 (PST)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  9 Feb 2022 01:23:08 +0100
Message-Id: <20220209002308.137832-1-romain.naour@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCHv2] package/poke: bump to version 2.1
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
Cc: Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Tested locally with poke testsuite on aarch64 with Qemu:

         === poke Summary ===
 # of expected passes		6320
 # of unsupported tests		7

Build tested with test-pkg:
https://gitlab.com/kubu93/buildroot/-/pipelines/466516470

See:
http://www.jemarch.net/poke-2.0-relnotes.html
http://www.jemarch.net/poke-2.1-relnotes.html

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
test-pkg config:
BR2_PACKAGE_POKE=y
BR2_PACKAGE_JSON_C=y

v2: poke 2.0 had a issue with minimal-threading on
several architectures (not only ARM thumb2), this feature
is now disabled by default with poke 2.1.
---
 ...P2MAN-replace-by-true-when-cross-com.patch |  6 ++--
 ...andom.c-fix-build-with-uclibc-1.0.35.patch | 28 +++++++++----------
 package/poke/poke.hash                        |  2 +-
 package/poke/poke.mk                          |  2 +-
 4 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/package/poke/0001-configure.ac-HELP2MAN-replace-by-true-when-cross-com.patch b/package/poke/0001-configure.ac-HELP2MAN-replace-by-true-when-cross-com.patch
index c169516153..85a76e068e 100644
--- a/package/poke/0001-configure.ac-HELP2MAN-replace-by-true-when-cross-com.patch
+++ b/package/poke/0001-configure.ac-HELP2MAN-replace-by-true-when-cross-com.patch
@@ -1,4 +1,4 @@
-From b35dadae6371c3727cac46ae5bd348b66aa411fc Mon Sep 17 00:00:00 2001
+From 51fb81264323f01a86dd0bdeaf1c7a044a9cb6dc Mon Sep 17 00:00:00 2001
 From: Romain Naour <romain.naour@gmail.com>
 Date: Fri, 30 Apr 2021 15:43:59 +0200
 Subject: [PATCH] configure.ac: HELP2MAN replace ':' by 'true' when
@@ -17,10 +17,10 @@ Signed-off-by: Romain Naour <romain.naour@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index 2c6f1aef..9c4c9be2 100644
+index a1943b57..c633f719 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -74,7 +74,7 @@ gl_LIBTEXTSTYLE_OPTIONAL([0.20.5])
+@@ -90,7 +90,7 @@ gl_LIBTEXTSTYLE_OPTIONAL([0.20.5])
  if test $cross_compiling = no; then
    AM_MISSING_PROG(HELP2MAN, help2man)
  else
diff --git a/package/poke/0002-lib-getrandom.c-fix-build-with-uclibc-1.0.35.patch b/package/poke/0002-lib-getrandom.c-fix-build-with-uclibc-1.0.35.patch
index 757dc3f760..bd20b5d2c6 100644
--- a/package/poke/0002-lib-getrandom.c-fix-build-with-uclibc-1.0.35.patch
+++ b/package/poke/0002-lib-getrandom.c-fix-build-with-uclibc-1.0.35.patch
@@ -1,4 +1,4 @@
-From a0594387565e1e6b4a8a8ba04ad13b135cc1f0b5 Mon Sep 17 00:00:00 2001
+From 236b019b83228d2e37fa07635fb6864ed7dc5fad Mon Sep 17 00:00:00 2001
 From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 Date: Thu, 1 Apr 2021 07:49:46 +0200
 Subject: [PATCH] lib/getrandom.c: fix build with uclibc < 1.0.35
@@ -15,7 +15,7 @@ In file included from ./sys/random.h:40,
 /tmp/instance-0/output-1/host/x86_64-buildroot-linux-uclibc/sysroot/usr/include/sys/random.h:8:1: note: 'size_t' is defined in header '<stddef.h>'; did you forget to '#include <stddef.h>'?
     7 | #include <features.h>
   +++ |+#include <stddef.h>
-    8 | 
+    8 |
 
 This patch is not upstreamable as it is only a workaround for
 uclibc < 1.0.35, upstream uclibc has been patched with
@@ -26,15 +26,15 @@ Fixes:
 
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 ---
- jitter/gnulib-local/getrandom.c | 1 +
- gl/getrandom.c                  | 1 +
  gl-libpoke/getrandom.c          | 1 +
+ gl/getrandom.c                  | 1 +
+ jitter/gnulib-local/getrandom.c | 1 +
  3 files changed, 3 insertions(+)
 
-diff --git a/jitter/gnulib-local/getrandom.c b/jitter/gnulib-local/getrandom.c
-index 41212fb32..0ad3f9648 100644
---- a/jitter/gnulib-local/getrandom.c
-+++ b/jitter/gnulib-local/getrandom.c
+diff --git a/gl-libpoke/getrandom.c b/gl-libpoke/getrandom.c
+index e146873..3948d8d 100644
+--- a/gl-libpoke/getrandom.c
++++ b/gl-libpoke/getrandom.c
 @@ -19,6 +19,7 @@
  
  #include <config.h>
@@ -44,7 +44,7 @@ index 41212fb32..0ad3f9648 100644
  
  #include <errno.h>
 diff --git a/gl/getrandom.c b/gl/getrandom.c
-index 41212fb32..0ad3f9648 100644
+index e146873..3948d8d 100644
 --- a/gl/getrandom.c
 +++ b/gl/getrandom.c
 @@ -19,6 +19,7 @@
@@ -55,10 +55,10 @@ index 41212fb32..0ad3f9648 100644
  #include <sys/random.h>
  
  #include <errno.h>
-diff --git a/gl-libpoke/getrandom.c b/gl-libpoke/getrandom.c
-index 41212fb32..0ad3f9648 100644
---- a/gl-libpoke/getrandom.c
-+++ b/gl-libpoke/getrandom.c
+diff --git a/jitter/gnulib-local/getrandom.c b/jitter/gnulib-local/getrandom.c
+index e146873..3948d8d 100644
+--- a/jitter/gnulib-local/getrandom.c
++++ b/jitter/gnulib-local/getrandom.c
 @@ -19,6 +19,7 @@
  
  #include <config.h>
@@ -68,5 +68,5 @@ index 41212fb32..0ad3f9648 100644
  
  #include <errno.h>
 -- 
-2.30.2
+2.31.1
 
diff --git a/package/poke/poke.hash b/package/poke/poke.hash
index 1367262f54..c30713b91c 100644
--- a/package/poke/poke.hash
+++ b/package/poke/poke.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  ce054df29560c921230132703ee449fe130b6e25ab03aa6cc796bb401506aa24  poke-1.4.tar.gz
+sha256  cd528e6c1bbc540c3b629c2b4f36b784b30a026b005a38b99283422599442670  poke-2.1.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  jitter/COPYING
diff --git a/package/poke/poke.mk b/package/poke/poke.mk
index ddd03ae3b0..2852673548 100644
--- a/package/poke/poke.mk
+++ b/package/poke/poke.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-POKE_VERSION = 1.4
+POKE_VERSION = 2.1
 POKE_SITE = $(BR2_GNU_MIRROR)/poke
 # gnulib license is a mix/mess of public-domain and various GPL and LGPL versions.
 POKE_LICENSE = GPL-3.0+, GPL-3.0+ (jitter), gnulib license (gnulib)
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
