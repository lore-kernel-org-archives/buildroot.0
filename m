Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B887C433F5
	for <buildroot@archiver.kernel.org>; Fri,  7 Jan 2022 22:26:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DEF5D8125B;
	Fri,  7 Jan 2022 22:26:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CNGlxrkEQvxy; Fri,  7 Jan 2022 22:26:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3E9E68124C;
	Fri,  7 Jan 2022 22:26:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9762B1BF30A
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 22:26:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8579C81D4D
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 22:26:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fDoUVLKwneNO for <buildroot@lists.busybox.net>;
 Fri,  7 Jan 2022 22:26:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com
 [IPv6:2607:f8b0:4864:20::d32])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A7C9581BCB
 for <buildroot@buildroot.org>; Fri,  7 Jan 2022 22:26:21 +0000 (UTC)
Received: by mail-io1-xd32.google.com with SMTP id 19so8891768ioz.4
 for <buildroot@buildroot.org>; Fri, 07 Jan 2022 14:26:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GkCfT1qf8RLqm1MNZ3w03Zl+YGCLtVvOY1YuFfj/028=;
 b=hNLSWLKXvutQp3n0k/xFdG93kytdcDQSVRH0Ch5QXeCPAG/KYZyN6AvqPdUG6UsThF
 oDOl580b9ZeIAUTck6u8WNHp7yHp38Z+1/xMwRFjOpPkAyV2N8emVFaZSSoXxW+jL/qa
 Yonlctc1TV7VZDHCj96zBH0a9bH9SASArTHCSVTKvhuSDFxBsMrDUwhYYu1ucoAbb23/
 5leYxeQ2OKBBwIOwKso+HZSbDd+IiVUtHCDqeuZSFAtXnV/UWVam0wvLO8KI9PN9N71r
 RfxmZPUYEw39f+f9IcoZrgP0SfKD3HFV8XmD9w9n0WdXz+LIz3bBeruCGj3XbcsipNZ7
 5A6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GkCfT1qf8RLqm1MNZ3w03Zl+YGCLtVvOY1YuFfj/028=;
 b=enRCrU5wxuK5SyrMAFzJaGx+psxMV7PC+fY6zQFs6f+rHzHZGfsPR2/3Wyd1+qUhwK
 uyGFJ2Sz2xeKcPsL2MD7mQ4VVO9Ye011+7uJqUWgHC34q43djNoXplTPjbpJ6WlsAqjC
 KomGm4d7PHiQ9yATcX6NsHMzI2GVa+SpJ7KJdY5JzC+770TJIYRgcv+ldysTPCYVZsII
 9RGnwK6yaBwyRtdm8gTGPciVqjbM82lgpjxNjUWwTjRjE0eXhQgVbbUkXMnnLr9qcaqk
 hPI9jAdNp5VChTN26FYN/LAZpwdH1DEXi5bied144waF1id8JuH6v0AcFzNUPquoPcM+
 +Spw==
X-Gm-Message-State: AOAM531XzZc/CCVU9xJjDAZU8vEqwhLkPRbq9/vOokKoDfycr1SNoPaO
 CLXtSBsKO645+PwpzAdOw0zW62oiN88=
X-Google-Smtp-Source: ABdhPJze11qGruwUllU2ustNTGfDx/ZNnt4UbS/nk4FC63tVwkn4lmN7HaNVeVxZOqKnFlx4ynN4Eg==
X-Received: by 2002:a05:6602:2acc:: with SMTP id
 m12mr31089648iov.107.1641594380583; 
 Fri, 07 Jan 2022 14:26:20 -0800 (PST)
Received: from james-x399.localdomain (71-218-242-12.hlrn.qwest.net.
 [71.218.242.12])
 by smtp.gmail.com with ESMTPSA id k12sm3596453ioc.50.2022.01.07.14.26.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 14:26:20 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  7 Jan 2022 15:26:11 -0700
Message-Id: <20220107222613.4124764-3-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220107222613.4124764-1-james.hilliard1@gmail.com>
References: <20220107222613.4124764-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 3/5] package/lv2: new package
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 DEVELOPERS            |  1 +
 package/Config.in     |  1 +
 package/lv2/Config.in |  8 ++++++++
 package/lv2/lv2.hash  |  4 ++++
 package/lv2/lv2.mk    | 32 ++++++++++++++++++++++++++++++++
 5 files changed, 46 insertions(+)
 create mode 100644 package/lv2/Config.in
 create mode 100644 package/lv2/lv2.hash
 create mode 100644 package/lv2/lv2.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index bc54ab590c..6c6e93f089 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1254,6 +1254,7 @@ F:	package/exfatprogs/
 F:	package/gensio/
 F:	package/lua-std-debug/
 F:	package/lua-std-normalize/
+F:	package/lv2/
 F:	package/pipewire/
 F:	package/python-aioconsole/
 F:	package/python-aiodns/
diff --git a/package/Config.in b/package/Config.in
index 6133d6ce32..a439a456a4 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1358,6 +1358,7 @@ menu "Audio/Sound"
 	source "package/libsoundtouch/Config.in"
 	source "package/libsoxr/Config.in"
 	source "package/libvorbis/Config.in"
+	source "package/lv2/Config.in"
 	source "package/mp4v2/Config.in"
 	source "package/openal/Config.in"
 	source "package/opencore-amr/Config.in"
diff --git a/package/lv2/Config.in b/package/lv2/Config.in
new file mode 100644
index 0000000000..aeeb6d0451
--- /dev/null
+++ b/package/lv2/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_LV2
+	bool "lv2"
+	help
+	  LV2 is a plugin standard for audio systems. It defines
+	  a minimal yet extensible C API for plugin code and a
+	  format for plugin "bundles".
+
+	  https://lv2plug.in/
diff --git a/package/lv2/lv2.hash b/package/lv2/lv2.hash
new file mode 100644
index 0000000000..ed21620bee
--- /dev/null
+++ b/package/lv2/lv2.hash
@@ -0,0 +1,4 @@
+# Locally calculated after checking signature
+# https://lv2plug.in/spec/lv2-1.18.2.tar.bz2.asc
+sha256  4e891fbc744c05855beb5dfa82e822b14917dd66e98f82b8230dbd1c7ab2e05e  lv2-1.18.2.tar.bz2
+sha256  0b0b07d852e3ce7fa04986e141f73001bd7f260683968f0a19e02dbcc4131aa6  COPYING
diff --git a/package/lv2/lv2.mk b/package/lv2/lv2.mk
new file mode 100644
index 0000000000..589b518545
--- /dev/null
+++ b/package/lv2/lv2.mk
@@ -0,0 +1,32 @@
+################################################################################
+#
+# lv2
+#
+################################################################################
+
+LV2_VERSION = 1.18.2
+LV2_SITE = https://lv2plug.in/spec
+LV2_SOURCE = lv2-$(LV2_VERSION).tar.bz2
+LV2_LICENSE = ISC
+LV2_LICENSE_FILES = COPYING
+LV2_DEPENDENCIES = host-pkgconf
+LV2_INSTALL_STAGING = YES
+
+LV2_CONF_OPTS += \
+	--no-coverage \
+	--no-check-links \
+	--copy-headers
+
+ifeq ($(BR2_PACKAGE_CAIRO),y)
+LV2_DEPENDENCIES += cairo
+endif
+
+ifeq ($(BR2_PACKAGE_LIBSNDFILE),y)
+LV2_DEPENDENCIES += libsndfile
+endif
+
+ifeq ($(BR2_PACKAGE_LIBGTK2),y)
+LV2_DEPENDENCIES += libgtk2
+endif
+
+$(eval $(waf-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
