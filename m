Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3360C433F5
	for <buildroot@archiver.kernel.org>; Wed, 12 Jan 2022 17:24:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 485F540145;
	Wed, 12 Jan 2022 17:24:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6N5FzS7nCUjq; Wed, 12 Jan 2022 17:24:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2C82E403A2;
	Wed, 12 Jan 2022 17:24:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7160C1BF357
 for <buildroot@lists.busybox.net>; Wed, 12 Jan 2022 17:24:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6DEA884BF9
 for <buildroot@lists.busybox.net>; Wed, 12 Jan 2022 17:24:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JDfUXR019jkW for <buildroot@lists.busybox.net>;
 Wed, 12 Jan 2022 17:24:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 656AB84BF5
 for <buildroot@buildroot.org>; Wed, 12 Jan 2022 17:24:21 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id d19so5630083wrb.0
 for <buildroot@buildroot.org>; Wed, 12 Jan 2022 09:24:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vJH23ocEadoZPQRGmEtm8+Ei/2cmvHGjik3CgJKlh4A=;
 b=YHU326Nc0YE+WArOnzggKmqM1++GY8M/NeJ/wWeHFPbD8DOBVzEI3pP/AT/1nNmUZe
 iY4GYnHz27eSMjhwQiqJWaKdIHhCMy0Z5kc3z3S39g8VUJQO0uqYDRhxLKLQzNVeJKdn
 K69LQP47ZznIHczO/zJsHxkCr1OUQK8ZrUfW+51FHUCzLOR+D30LKEAIlm1pk0llIsze
 XqP15pDbwcgdZThwe1GtTE2vJ/L/WIdUW87s7uwn1NCMiXVYBZgfvIrt+lgdHoUFOpsI
 MNvHrzMLDY6i3DBRwsLoafA8goLXAMj2hZsBypEGvP66xfpqj+HuDK3ubU+An6lQPA0I
 SYgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vJH23ocEadoZPQRGmEtm8+Ei/2cmvHGjik3CgJKlh4A=;
 b=FqUWRzkSE94S6Gg1ompcmyjrG5ASsTFXh6admt59zgpN4+VEM+t+tajaODHvBM17UK
 SvyHqEHzNlml1W+2JDxIufrrigcxED/mbdOdcf6QuSO8ilHjx/6JsRRbkvuoevs9Ni17
 Yrv/ixDYQnQSC7zfyzqCfgb8ojnB06dNJAf2jPbBhQcyvyWyRr+26quRHLGEVDmZS3HN
 k7aIVt+m7vHF6DvyLAWjB0EoBL+J3b+WZ+0L+Z6Qkj3RFWT63vSuxSKDxeeGlBGN4SXj
 NqmboEk+dPixXaCzUQBO0zHPehL9SO48vF1IW+8qVHeaTOxancfsFZuUaMmmgynx5LfQ
 ChWg==
X-Gm-Message-State: AOAM531M/W0fz7SKWjG1rlgwUOnUvkKJ/iRhcUMAVpqA7OV6qmsErX+p
 fJWHlMPjBCgVAYF3nBAsjp7/tpIJdYw=
X-Google-Smtp-Source: ABdhPJxjtEIKV5t6nMjvnUQ1wV6erXV7UfHt4pxS737E5f6u1auELEVFrfW7Qn9KWso6wmopMbioiA==
X-Received: by 2002:a05:6000:186b:: with SMTP id
 d11mr294619wri.461.1642008259521; 
 Wed, 12 Jan 2022 09:24:19 -0800 (PST)
Received: from kali.home (lfbn-ren-1-358-126.w2-10.abo.wanadoo.fr.
 [2.10.19.126])
 by smtp.gmail.com with ESMTPSA id p11sm480877wru.99.2022.01.12.09.24.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jan 2022 09:24:19 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 12 Jan 2022 18:23:02 +0100
Message-Id: <20220112172302.2991419-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/tinycbor: disable -Werror
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

Disable -Werror to avoid the following build failure with gcc 4.8 raised
since bump to version 0.6.0 in commit
ee1a2826dcf7ff75f90b0bf9f7aa53d19ce19cf6 and
https://github.com/intel/tinycbor/commit/e2a4ed135c4d9101c4df83f2dd033cd249b6ef07:

/home/buildroot/autobuild/instance-1/output-1/host/bin/arm-none-linux-gnueabi-gcc -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -I./src -std=gnu99 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os -g0 -D_FORTIFY_SOURCE=1 -Werror=incompatible-pointer-types -Werror=implicit-function-declaration -Werror=int-conversion -fPIC  -c -o src/cborerrorstrings.pic.o src/cborerrorstrings.c
cc1: error: -Werror=incompatible-pointer-types: no option -Wincompatible-pointer-types
cc1: error: -Werror=int-conversion: no option -Wint-conversion

Fixes:
 - http://autobuild.buildroot.org/results/a9fe64c42bb96f9e7b4af3050464f6570c1c00fa

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../0001-Makefile-add-DISABLE_WERROR.patch    | 44 +++++++++++++++++++
 package/tinycbor/tinycbor.mk                  |  2 +-
 2 files changed, 45 insertions(+), 1 deletion(-)
 create mode 100644 package/tinycbor/0001-Makefile-add-DISABLE_WERROR.patch

diff --git a/package/tinycbor/0001-Makefile-add-DISABLE_WERROR.patch b/package/tinycbor/0001-Makefile-add-DISABLE_WERROR.patch
new file mode 100644
index 0000000000..334bea7eb0
--- /dev/null
+++ b/package/tinycbor/0001-Makefile-add-DISABLE_WERROR.patch
@@ -0,0 +1,44 @@
+From 5f26eaf8d7be760fafe11ef4a6e0f907e7e8c3f0 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Mon, 10 Jan 2022 23:17:45 +0100
+Subject: [PATCH] Makefile: add DISABLE_WERROR
+
+Allow the user to disable -Werror to avoid the following build failure
+with gcc 4.8 raised since version 0.6.0 and
+https://github.com/intel/tinycbor/commit/e2a4ed135c4d9101c4df83f2dd033cd249b6ef07:
+
+/home/buildroot/autobuild/instance-1/output-1/host/bin/arm-none-linux-gnueabi-gcc -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -I./src -std=gnu99 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os -g0 -D_FORTIFY_SOURCE=1 -Werror=incompatible-pointer-types -Werror=implicit-function-declaration -Werror=int-conversion -fPIC  -c -o src/cborerrorstrings.pic.o src/cborerrorstrings.c
+cc1: error: -Werror=incompatible-pointer-types: no option -Wincompatible-pointer-types
+cc1: error: -Werror=int-conversion: no option -Wint-conversion
+
+Fixes:
+ - http://autobuild.buildroot.org/results/a9f/a9fe64c42bb96f9e7b4af3050464f6570c1c00fa
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Retrieved from:
+https://github.com/intel/tinycbor/commit/5f26eaf8d7be760fafe11ef4a6e0f907e7e8c3f0]
+---
+ Makefile | 7 ++++++-
+ 1 file changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/Makefile b/Makefile
+index 6492ea16..3cde2b3d 100644
+--- a/Makefile
++++ b/Makefile
+@@ -236,10 +236,15 @@ tag: distcheck
+ .SECONDARY:
+ 
+ cflags := $(CPPFLAGS) -I$(SRCDIR)src
+-cflags += -std=gnu99 $(CFLAGS) \
++cflags += -std=gnu99 $(CFLAGS)
++
++ifneq ($(DISABLE_WERROR),1)
++cflags += \
+ 	-Werror=incompatible-pointer-types \
+ 	-Werror=implicit-function-declaration \
+ 	-Werror=int-conversion
++endif
++
+ %.o: %.c
+ 	@test -d $(@D) || $(MKDIR) $(@D)
+ 	$(CC) $(cflags) $($(basename $(notdir $@))_CCFLAGS) -c -o $@ $<
diff --git a/package/tinycbor/tinycbor.mk b/package/tinycbor/tinycbor.mk
index bf6e8e4c1e..cad50e633b 100644
--- a/package/tinycbor/tinycbor.mk
+++ b/package/tinycbor/tinycbor.mk
@@ -16,7 +16,7 @@ ifeq ($(BR2_PACKAGE_CJSON),y)
 TINYCBOR_DEPENDENCIES += cjson
 endif
 
-TINYCBOR_MAKE_OPTS = $(TARGET_CONFIGURE_OPTS) V=1
+TINYCBOR_MAKE_OPTS = $(TARGET_CONFIGURE_OPTS) DISABLE_WERROR=1 V=1
 
 ifeq ($(BR2_STATIC_LIBS),y)
 TINYCBOR_MAKE_OPTS += BUILD_STATIC=1 BUILD_SHARED=0
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
