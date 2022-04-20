Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8AA8C433F5
	for <buildroot@archiver.kernel.org>; Wed, 20 Apr 2022 18:57:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5C49084057;
	Wed, 20 Apr 2022 18:57:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TG_3OfN0dJL4; Wed, 20 Apr 2022 18:57:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6F1A283FF4;
	Wed, 20 Apr 2022 18:57:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D7BAA1BF3B0
 for <buildroot@lists.busybox.net>; Wed, 20 Apr 2022 18:57:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D11F341902
 for <buildroot@lists.busybox.net>; Wed, 20 Apr 2022 18:57:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id D6cjX-CtTF1p for <buildroot@lists.busybox.net>;
 Wed, 20 Apr 2022 18:57:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com
 [IPv6:2607:f8b0:4864:20::d2b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0C7FF41903
 for <buildroot@buildroot.org>; Wed, 20 Apr 2022 18:56:59 +0000 (UTC)
Received: by mail-io1-xd2b.google.com with SMTP id p62so2917721iod.0
 for <buildroot@buildroot.org>; Wed, 20 Apr 2022 11:56:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Hsw58ZyasoJEjNzDfFScHuRjXrYQ9pXe5F/1gZ57c9Q=;
 b=XaX7Oty1aV5+nWE2qFHGI3KEsdRjMl+ohpIgVjQjfzfOREiO30oD3WSvn3yOKhw+bt
 jiKAIth8MMyHRprdmkGrW6ORYZGjvW+FhwKIDXrD87pE3FRWiI8Z/okT5iHnOgnYjX+x
 lZNJl+93dK7kmkyr7UkbztaWV0AaWfetORHetdgC7An8rFhYHYRtYbOvBwOP3/g9oHzS
 1DM3K4H8JNYDUo0LtYmHIDe51qIfFWIDeO4nF8ar32wCV8ZHlwcK5ZUilhMuJepOOnSp
 Buo8OpcWqfgNxNLskWWYmrHhFAL+fJ9INs+Xb/B7lDKnkU3K+BSE3kA5LiWCUAwGAQqk
 1aaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Hsw58ZyasoJEjNzDfFScHuRjXrYQ9pXe5F/1gZ57c9Q=;
 b=rr9GD7to3IdbtHmIrqnTQJJpSFXSacwBZFD7bYsrxv3RATKYyEobpddHejbgYSSFa1
 c0Fl8YYoQeMYBbW72mu8ACgB3pmeUZTYlFlBAt+1vdgttLG1Yp8pyCgWDT3WP7YIxoT8
 3ZuzVvNaoIxrnDTv4jYlYrfk7y3SbG3WSmLmOtEHLrSFFjnuCfWrBl/tPH+kLuvI5+mf
 rGKbBkHDs4Ho7h2HLkZEDLZjr3QKg+3MmbOyJlq5FQnF3XGcAYBSF3zSd6aNv7VaJwRI
 kNYmZSa2N5UL/XBGyGFcaga2WfW/Ee/UPi16+I2cf/P5sM1xLw7Oj2qRbW8LEnXjtx75
 Oz3A==
X-Gm-Message-State: AOAM530SOSaRD2R6EF0nFeUZoH4I5N+9NHc8M7sKnL43aR6a4AVrOyzz
 dFCBh8s6cB0Kk+MdbnoFFjkevo8Jtk5z5w==
X-Google-Smtp-Source: ABdhPJzpR75ZCbno8p06tJC/IqOEKl/ovRcW7o8Nb9vheg3PdMZb1P/xVpPEOJ1i1zY9D0IAt/mHGw==
X-Received: by 2002:a05:6638:300b:b0:317:a127:53ac with SMTP id
 r11-20020a056638300b00b00317a12753acmr10179391jak.77.1650481018862; 
 Wed, 20 Apr 2022 11:56:58 -0700 (PDT)
Received: from james-x399.localdomain (97-118-252-238.hlrn.qwest.net.
 [97.118.252.238]) by smtp.gmail.com with ESMTPSA id
 z5-20020a92cec5000000b002cbe5a870dfsm10750153ilq.36.2022.04.20.11.56.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 11:56:58 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 20 Apr 2022 12:56:56 -0600
Message-Id: <20220420185656.794855-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/zchunk: bump to version 1.2.2
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Libcurl is now an optional dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/zchunk/Config.in   |  1 -
 package/zchunk/zchunk.hash |  2 +-
 package/zchunk/zchunk.mk   | 10 ++++++++--
 3 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/package/zchunk/Config.in b/package/zchunk/Config.in
index 2d2a78a210..11463dd4bd 100644
--- a/package/zchunk/Config.in
+++ b/package/zchunk/Config.in
@@ -2,7 +2,6 @@ config BR2_PACKAGE_ZCHUNK
 	bool "zchunk"
 	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_ARGP_STANDALONE if BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_MUSL
-	select BR2_PACKAGE_LIBCURL
 	help
 	  A file format designed for highly efficient deltas while
 	  maintaining good compression.
diff --git a/package/zchunk/zchunk.hash b/package/zchunk/zchunk.hash
index d6b425dc70..fa097d4ae0 100644
--- a/package/zchunk/zchunk.hash
+++ b/package/zchunk/zchunk.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  33934adecddc50c64615dd8cdfe52a79df674a5bb1d5e83a9c09e1d1e6e9b92c  zchunk-1.1.16.tar.gz
+sha256  bc36f13b1bcb2ab52d046bfc3ec04a9bd1f89b070b4e8fca52eded235a583526  zchunk-1.2.2.tar.gz
 sha256  3c6a4fd5a93cacec6bf694d0537246bc15a95a274f5c5301749754e56d27b797  LICENSE
diff --git a/package/zchunk/zchunk.mk b/package/zchunk/zchunk.mk
index 6f7ac799a0..5582c21e77 100644
--- a/package/zchunk/zchunk.mk
+++ b/package/zchunk/zchunk.mk
@@ -4,15 +4,21 @@
 #
 ################################################################################
 
-ZCHUNK_VERSION = 1.1.16
+ZCHUNK_VERSION = 1.2.2
 ZCHUNK_SITE = $(call github,zchunk,zchunk,$(ZCHUNK_VERSION))
 ZCHUNK_LICENSE = BSD-2-Clause
 ZCHUNK_LICENSE_FILES = LICENSE
 ZCHUNK_INSTALL_STAGING = YES
 ZCHUNK_DEPENDENCIES = \
-	libcurl \
 	$(if $(BR2_PACKAGE_ARGP_STANDALONE),argp-standalone)
 
+ifeq ($(BR2_PACKAGE_LIBCURL),y)
+ZCHUNK_DEPENDENCIES += libcurl
+ZCHUNK_CONF_OPTS += -Dwith-curl=enabled
+else
+ZCHUNK_CONF_OPTS += -Dwith-curl=disabled
+endif
+
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 ZCHUNK_DEPENDENCIES += openssl
 ZCHUNK_CONF_OPTS += -Dwith-openssl=enabled
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
