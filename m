Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41687C6FD1F
	for <buildroot@archiver.kernel.org>; Sat, 30 Mar 2024 18:00:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D7BD7405D5;
	Sat, 30 Mar 2024 18:00:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tLqycpsi0gQs; Sat, 30 Mar 2024 18:00:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 92016405E1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 92016405E1;
	Sat, 30 Mar 2024 18:00:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AF8DF1BF27E
 for <buildroot@lists.busybox.net>; Sat, 30 Mar 2024 18:00:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9D95C4011B
 for <buildroot@lists.busybox.net>; Sat, 30 Mar 2024 18:00:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TgGTQ0vLFt-Q for <buildroot@lists.busybox.net>;
 Sat, 30 Mar 2024 18:00:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::433; helo=mail-wr1-x433.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5E1FA40201
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5E1FA40201
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5E1FA40201
 for <buildroot@buildroot.org>; Sat, 30 Mar 2024 18:00:30 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-34175878e3cso2184815f8f.0
 for <buildroot@buildroot.org>; Sat, 30 Mar 2024 11:00:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711821628; x=1712426428;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qaVcLjRAIT0dIDHPlb5bwJ+0+OXMXTppkt3dLRgbTwE=;
 b=F4na3n+WWMIL+1XkCbueA47uCO8LiZmzJE7cL5L+YsVauvsuaYe3/93Xcba5anHijq
 g8/vCuflqziBHEMxEXYTIwtnJIhoC9nNj5qlLaa0tIj0tETrupGAz5CNuqwMJNrVVI5g
 Oq+m4w9Zd+fyhoyfSxrItZcikuBbiSvp4e6WiSYhtm7GuzvdyUEKHoekgXCF/Y4bEc1B
 6EuBXP8/Ji9is5eOjiwSa+z3jBEK30lwdnIIVSdZy5ZpnyBAJCegyFobLpzZC9oYECGw
 nj7O65aPQEj9buMuOv9uD9d5jLSUb9DJSSLAo3pbWwjivgzywVRQx+XOTs9ta1LQvcIX
 A/wQ==
X-Gm-Message-State: AOJu0Yx8JI9DSEBqi5zNtjM4/xytpvS1ruKTBLug/Gn3ma4fjBGhQGc7
 +SOSZqMzR3S36K6QKK7YHluk3TRQEafmLyJFku+HB0E+fK9qugUyTdLVujui
X-Google-Smtp-Source: AGHT+IEGVjtvy1SHara2SpFshXONOz9+0/hxfVMZpiUJdRVwqLNs4niWxtkkkYOHvi7FXPFb0cwxDA==
X-Received: by 2002:a05:6000:4014:b0:33e:7333:d459 with SMTP id
 cp20-20020a056000401400b0033e7333d459mr4871123wrb.49.1711821627794; 
 Sat, 30 Mar 2024 11:00:27 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 t1-20020adfe441000000b0033e756ed840sm6946013wrm.47.2024.03.30.11.00.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Mar 2024 11:00:27 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 30 Mar 2024 19:00:23 +0100
Message-ID: <20240330180023.787791-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1711821628; x=1712426428; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=qaVcLjRAIT0dIDHPlb5bwJ+0+OXMXTppkt3dLRgbTwE=;
 b=atesUYbx3o2TEqnidrjzD2ZoevP/HdAmqvKzkezc3VQ2FtwT8159IZE2btS4As1ifZ
 OGHUN9oynY0qnvczwKj7J77bxWqJ1Ip5qrpOEeSYRlJVe5DejV+12z5rmgz1RgIyHJxj
 cT6r7V7i2hdRsQeStBfRVAZ2P39RkHp1m39pIzUq+jFiaAH5bVOcYOqZTKO+yHa2gV3s
 5fdQ19giKi4ZlZ46IbRT1wFnILS2R7OuJz4ssdjTGxOO5MNt/B425BLKP7KY+K/ug2/4
 wfsBu/U52lNLcL4sf6dS83a+vTYjLnDcfmwIgQpbappoveJWX4/X3iFDAHFx90/UhK7s
 ehuw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=atesUYbx
Subject: [Buildroot] [PATCH 1/1] package/php: fix build without threads
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
Cc: Bernd Kuhls <bernd@kuhls.net>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure without threads raised since bump to
version 8.3.4 in commit e50460f9f12a8c5f82f2166733afe9cca3c8cd19 and
https://github.com/php/php-src/commit/a11c8a30399e90c17c287b9656c0077bc5131c9c:

/home/buildroot/instance-0/output-1/build/php-8.3.4/Zend/zend_call_stack.c:39:11: fatal error: pthread.h: No such file or directory
   39 | # include <pthread.h>
      |           ^~~~~~~~~~~

Fixes: e50460f9f12a8c5f82f2166733afe9cca3c8cd19
 - http://autobuild.buildroot.org/results/a4ef648a9da50b26ed56d5d490e4cf5a1bfff970

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...ll_stack.c-fix-build-without-pthread.patch | 39 +++++++++++++++++++
 1 file changed, 39 insertions(+)
 create mode 100644 package/php/0006-Zend-zend_call_stack.c-fix-build-without-pthread.patch

diff --git a/package/php/0006-Zend-zend_call_stack.c-fix-build-without-pthread.patch b/package/php/0006-Zend-zend_call_stack.c-fix-build-without-pthread.patch
new file mode 100644
index 0000000000..10b0083655
--- /dev/null
+++ b/package/php/0006-Zend-zend_call_stack.c-fix-build-without-pthread.patch
@@ -0,0 +1,39 @@
+From c3e37c438a11d59d858fcc7b46eac00a8074972b Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sat, 30 Mar 2024 17:51:55 +0100
+Subject: [PATCH] Zend/zend_call_stack.c: fix build without pthread
+
+Fix the following build failure without pthread raised since version
+8.3.0 and
+https://github.com/php/php-src/commit/a11c8a30399e90c17c287b9656c0077bc5131c9c:
+
+/home/buildroot/instance-0/output-1/build/php-8.3.4/Zend/zend_call_stack.c:39:11: fatal error: pthread.h: No such file or directory
+   39 | # include <pthread.h>
+      |           ^~~~~~~~~~~
+
+Fixes:
+ - http://autobuild.buildroot.org/results/a4ef648a9da50b26ed56d5d490e4cf5a1bfff970
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Upstream: https://github.com/php/php-src/pull/13843
+---
+ Zend/zend_call_stack.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/Zend/zend_call_stack.c b/Zend/zend_call_stack.c
+index 97cbed9041..97de938a0f 100644
+--- a/Zend/zend_call_stack.c
++++ b/Zend/zend_call_stack.c
+@@ -35,7 +35,8 @@
+ #  include <sys/types.h>
+ # endif
+ #endif /* ZEND_WIN32 */
+-#if defined(__linux__) || defined(__FreeBSD__) || defined(__APPLE__) || defined(__OpenBSD__)
++#if (defined(HAVE_PTHREAD_GETATTR_NP) && defined(HAVE_PTHREAD_ATTR_GETSTACK)) || \
++    defined(__FreeBSD__) || defined(__APPLE__) || defined(__OpenBSD__)
+ # include <pthread.h>
+ #endif
+ #ifdef __FreeBSD__
+-- 
+2.43.0
+
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
