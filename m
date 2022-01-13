Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81345C433F5
	for <buildroot@archiver.kernel.org>; Thu, 13 Jan 2022 18:11:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3CCCA408BE;
	Thu, 13 Jan 2022 18:11:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PtXwDNNsG5ja; Thu, 13 Jan 2022 18:11:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8D9134165C;
	Thu, 13 Jan 2022 18:11:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B05B01BF4D8
 for <buildroot@lists.busybox.net>; Thu, 13 Jan 2022 18:11:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9F16E83F51
 for <buildroot@lists.busybox.net>; Thu, 13 Jan 2022 18:11:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qUGsbaKCUenE for <buildroot@lists.busybox.net>;
 Thu, 13 Jan 2022 18:11:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A19EA83F41
 for <buildroot@buildroot.org>; Thu, 13 Jan 2022 18:11:03 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 f141-20020a1c1f93000000b003497aec3f86so4222927wmf.3
 for <buildroot@buildroot.org>; Thu, 13 Jan 2022 10:11:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mRP7G5MFnwzqAAS27eBGFMdbKKDHA8E4eLdUbKBrKks=;
 b=UcNV0yzo7r9as6Rze8eYXh6mzJLM36ShGbjf1tTsSwAt/AqwH8pw9+e0MsrgGL1WVV
 n+erKmGYGV0vo5pEvvUqbo8m237UGDGZFFsYvfmvwvpGHQFK+7MkI38M9s6pwUpgzNzj
 gl9xyZKKSpD5qtW2LoVxsdVkTxBSLfT4gGJII40hY3wdvnl6SOYaYHgDgqwEM20bJ8Ro
 T0P2o2F16m9P81bl2ku9gpiMJQZ8joEMGhpgNeF2eWbEQegeU88uQeA68NfnnlLMtMR9
 UuDSPZhBfJb+C4jI1cVegPlcjRP6OjewJMhGCbSmXe2nGmgh56yWPYB0PHOmqBrNoFxK
 cVig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mRP7G5MFnwzqAAS27eBGFMdbKKDHA8E4eLdUbKBrKks=;
 b=gmBXuhjl2N4Zn9Z6eVJtIPlySLEygW7nYiR88fcn46twy35IKgHjvtiNce9A1VVYNX
 F83cJdyt8dEtvySmy9MlDIbHBsny3KTicyhZ9wgMAxGZK9NmahcLRmGog1FaCf0i3BrZ
 iJNshfCrCW7GldfteJXK0qP7LqQqPbx9bCY9RF5xItLicaNGFjEH479/ijBgH0m8p3sk
 kAmmuTkQGfmTZmLCWPBdUHVHF8nSimNX8kFYx2JNFFSO06oVE2n7nzkVc7UNpmfaqnJ1
 /FfohQq0ZhdbGBl57jFABmBnmwjqpvMDFMRYV1fgMFd2bkiUFi/kslPe0vVedEzHA44N
 QlYA==
X-Gm-Message-State: AOAM530cNG2B3hSMZWnD9yYXPuIFlV/GSO3dQ/k6F/CFd5sgqwaWOR89
 9n5oD6FxSOGdMY3UOx/kyKVvO7NYCms=
X-Google-Smtp-Source: ABdhPJwKaymA65VrGaO1dkh74GLuqiXtb3mgGNNWWqYA1z18hY+c/1dn6omJowjoaRTsgIgJkiqUwg==
X-Received: by 2002:a05:600c:3caa:: with SMTP id
 bg42mr12292103wmb.106.1642097461815; 
 Thu, 13 Jan 2022 10:11:01 -0800 (PST)
Received: from kali.home (lfbn-ren-1-358-126.w2-10.abo.wanadoo.fr.
 [2.10.19.126])
 by smtp.gmail.com with ESMTPSA id c185sm3075918wma.24.2022.01.13.10.11.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Jan 2022 10:11:01 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 13 Jan 2022 19:09:40 +0100
Message-Id: <20220113180940.232530-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/tinyalsa: fix musl build
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

Fix the following build failure on musl raised since bump to version
2.0.0 in commit 3b9c8f8cb53e449e39899a40712703c272c5eeff:

In file included from ../src/pcm_hw.c:42:
/home/peko/autobuild/instance-1/output-1/host/i586-buildroot-linux-musl/sysroot/usr/include/sound/asound.h:444:18: error: field 'trigger_tstamp' has incomplete type
  444 |  struct timespec trigger_tstamp; /* time when stream was started/stopped/paused */
      |                  ^~~~~~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/a75e23dc585bd071f4d65face5489ed6ac22edbe

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../0001-include-time.h-before-asound.h.patch | 76 +++++++++++++++++++
 1 file changed, 76 insertions(+)
 create mode 100644 package/tinyalsa/0001-include-time.h-before-asound.h.patch

diff --git a/package/tinyalsa/0001-include-time.h-before-asound.h.patch b/package/tinyalsa/0001-include-time.h-before-asound.h.patch
new file mode 100644
index 0000000000..c91213e2eb
--- /dev/null
+++ b/package/tinyalsa/0001-include-time.h-before-asound.h.patch
@@ -0,0 +1,76 @@
+From d91e947bda590765e1c791f40e8ffb4135ab1cd3 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Tue, 11 Jan 2022 00:01:49 +0100
+Subject: [PATCH] include time.h before asound.h
+
+Include time.h before asound.h to avoid the following build failure on
+musl that was already fixed a long time with
+https://github.com/tinyalsa/tinyalsa/commit/c8333f8c7a4e4b9549abeef7530b2cd20a18e537
+but reappeared on version 2.0.0:
+
+In file included from ../src/pcm_hw.c:42:
+/home/peko/autobuild/instance-1/output-1/host/i586-buildroot-linux-musl/sysroot/usr/include/sound/asound.h:444:18: error: field 'trigger_tstamp' has incomplete type
+  444 |  struct timespec trigger_tstamp; /* time when stream was started/stopped/paused */
+      |                  ^~~~~~~~~~~~~~
+
+Fixes:
+ - http://autobuild.buildroot.org/results/a75e23dc585bd071f4d65face5489ed6ac22edbe
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Retrieved from:
+https://github.com/tinyalsa/tinyalsa/commit/c127110249967e0722d80bb41e33713accdcff8f]
+---
+ src/mixer.c      | 1 +
+ src/mixer_hw.c   | 1 +
+ src/pcm_hw.c     | 1 +
+ src/pcm_plugin.c | 1 +
+ 4 files changed, 4 insertions(+)
+
+diff --git a/src/mixer.c b/src/mixer.c
+index afbc015..029fc84 100644
+--- a/src/mixer.c
++++ b/src/mixer.c
+@@ -55,6 +55,7 @@
+ #define __user
+ #endif
+ 
++#include <time.h>
+ #include <sound/asound.h>
+ 
+ #include <tinyalsa/mixer.h>
+diff --git a/src/mixer_hw.c b/src/mixer_hw.c
+index da5a390..50e9d07 100644
+--- a/src/mixer_hw.c
++++ b/src/mixer_hw.c
+@@ -42,6 +42,7 @@
+ #include <sys/ioctl.h>
+ 
+ #include <linux/ioctl.h>
++#include <time.h>
+ #include <sound/asound.h>
+ 
+ #include "mixer_io.h"
+diff --git a/src/pcm_hw.c b/src/pcm_hw.c
+index 5eb53be..2383ae0 100644
+--- a/src/pcm_hw.c
++++ b/src/pcm_hw.c
+@@ -41,6 +41,7 @@
+ #include <sys/ioctl.h>
+ #include <sys/mman.h>
+ #include <linux/ioctl.h>
++#include <time.h>
+ #include <sound/asound.h>
+ #include <tinyalsa/asoundlib.h>
+ 
+diff --git a/src/pcm_plugin.c b/src/pcm_plugin.c
+index 47bf4a5..b6b69aa 100644
+--- a/src/pcm_plugin.c
++++ b/src/pcm_plugin.c
+@@ -40,6 +40,7 @@
+ 
+ #include <sys/ioctl.h>
+ #include <linux/ioctl.h>
++#include <time.h>
+ #include <sound/asound.h>
+ #include <tinyalsa/asoundlib.h>
+ #include <tinyalsa/plugin.h>
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
