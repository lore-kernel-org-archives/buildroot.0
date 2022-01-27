Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F48FC433F5
	for <buildroot@archiver.kernel.org>; Thu, 27 Jan 2022 19:24:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D377C610EF;
	Thu, 27 Jan 2022 19:24:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BT1N4Ls_VP6E; Thu, 27 Jan 2022 19:24:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D6C18610E3;
	Thu, 27 Jan 2022 19:24:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A0A7D1C113E
 for <buildroot@lists.busybox.net>; Thu, 27 Jan 2022 19:23:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9D038415B3
 for <buildroot@lists.busybox.net>; Thu, 27 Jan 2022 19:23:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id omb_Ck4gNrzQ for <buildroot@lists.busybox.net>;
 Thu, 27 Jan 2022 19:23:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com
 [IPv6:2607:f8b0:4864:20::d2d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AA95841484
 for <buildroot@buildroot.org>; Thu, 27 Jan 2022 19:23:45 +0000 (UTC)
Received: by mail-io1-xd2d.google.com with SMTP id h7so4888778iof.3
 for <buildroot@buildroot.org>; Thu, 27 Jan 2022 11:23:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zU1DLq0fDCYIUVSn0/IN9dkF3V0mubm51jqN5nUHZk8=;
 b=Zt/hh6NGX2ugCRA93AOHRMp95RB/tKzwYc6x0LbVCcXqMYw+yBkdRyD+jKqWuXReUA
 WASkUQYYGMxRx8kdwgGBV7l6biGFN7i15JPR4na3xnN7g02SBorSIcNLbgj1YX8dOQkh
 gau3X/5fD3duPHBPqqZpeFHDFGA+FVz2k19DuHyF3t1+trHGXk8cThl20exde9YXNlfd
 wYOREOJJqY25a/HhvhDm0303nX93uxucnG4bR3hAbtdU8Ry419+64Zm4bZ4gDRsY2Jy3
 4MqAXOZCjevX0BA/LlCc9DhRp0+zzrDvdnV1Pj625gcYqAgmbxQbPgHXNHwhHiKEJa0J
 B6nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zU1DLq0fDCYIUVSn0/IN9dkF3V0mubm51jqN5nUHZk8=;
 b=NWc3SJ7I8J11wawju1NH2tYlm3SCYC0UPZRLp4/8S84IzLh9yDEPVYLWwCS08i8mQI
 7tv4NLsqyLJFSWhzFTkFnv8y8wgulawUAiBotqlupMD6jzxNmgZu7l7AgYmucNNYyUAJ
 4UiKG0El6wzA+/1HRWG8zgswWBcNguH2TBSss7u4IQGVRDuh8/zgJJLc7MvV/1hJ+dgQ
 TdZD3EeGzww448cx90ecd21J/ZIwjTZvqERQWRhfyVeq9MDYhe8BdQ91g/vW1hOCH4jR
 21KEuB3vKV91XRMqdiYW1iLFAVUG152lumTMvWUsRJWFaYfSfkH+BR2qMOglz7MgjaCu
 Y6Uw==
X-Gm-Message-State: AOAM531IjFfXiVb910hCyy9snu7jINGsnCrTWM6zaOzqoCcqu4YQHC5h
 1PD01phSROtBSU2XjIMHJqbeDG5saZA=
X-Google-Smtp-Source: ABdhPJwmLeJU53zPZaWJifGQ/JGMLTaLaoqjfBjfHHeLQywRCVwdJl5shAxuiauaE8WVpQrC1+ZyaA==
X-Received: by 2002:a02:a493:: with SMTP id d19mr2533231jam.261.1643311424634; 
 Thu, 27 Jan 2022 11:23:44 -0800 (PST)
Received: from james-x399.localdomain (71-218-245-50.hlrn.qwest.net.
 [71.218.245.50])
 by smtp.gmail.com with ESMTPSA id f12sm669023ilj.47.2022.01.27.11.23.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jan 2022 11:23:44 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 27 Jan 2022 12:23:11 -0700
Message-Id: <20220127192311.1954197-5-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220127192311.1954197-1-james.hilliard1@gmail.com>
References: <20220127192311.1954197-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 5/5] package/lilv: new package
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
 Gilles Talis <gilles.talis@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes v1 -> v2:
  - require dynamic library support
---
 DEVELOPERS             |  1 +
 package/Config.in      |  1 +
 package/lilv/Config.in | 15 +++++++++++++++
 package/lilv/lilv.hash |  4 ++++
 package/lilv/lilv.mk   | 30 ++++++++++++++++++++++++++++++
 5 files changed, 51 insertions(+)
 create mode 100644 package/lilv/Config.in
 create mode 100644 package/lilv/lilv.hash
 create mode 100644 package/lilv/lilv.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index c4c46fc3bd..5bde1695e7 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1285,6 +1285,7 @@ F:	package/exfatprogs/
 F:	package/gensio/
 F:	package/lua-std-debug/
 F:	package/lua-std-normalize/
+F:	package/lilv/
 F:	package/lv2/
 F:	package/pipewire/
 F:	package/python-aioconsole/
diff --git a/package/Config.in b/package/Config.in
index 547620a266..84a53577e7 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1372,6 +1372,7 @@ menu "Audio/Sound"
 	source "package/libsoundtouch/Config.in"
 	source "package/libsoxr/Config.in"
 	source "package/libvorbis/Config.in"
+	source "package/lilv/Config.in"
 	source "package/lv2/Config.in"
 	source "package/mp4v2/Config.in"
 	source "package/openal/Config.in"
diff --git a/package/lilv/Config.in b/package/lilv/Config.in
new file mode 100644
index 0000000000..08d54bcf8b
--- /dev/null
+++ b/package/lilv/Config.in
@@ -0,0 +1,15 @@
+config BR2_PACKAGE_LILV
+	bool "lilv"
+	depends on !BR2_STATIC_LIBS
+	select BR2_PACKAGE_LV2
+	select BR2_PACKAGE_SERD
+	select BR2_PACKAGE_SORD
+	select BR2_PACKAGE_SRATOM
+	help
+	  Lilv is a C library to make the use of LV2 plugins as simple
+	  as possible for applications.
+
+	  https://drobilla.net/software/lilv.html
+
+comment "lilv needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
diff --git a/package/lilv/lilv.hash b/package/lilv/lilv.hash
new file mode 100644
index 0000000000..afa20fc083
--- /dev/null
+++ b/package/lilv/lilv.hash
@@ -0,0 +1,4 @@
+# Locally calculated after checking signature
+# https://download.drobilla.net/lilv-0.24.12.tar.bz2.asc
+sha256  26a37790890c9c1f838203b47f5b2320334fe92c02a4d26ebbe2669dbd769061  lilv-0.24.12.tar.bz2
+sha256  e06562d6bcf0341b2ac2ad0f0ca36801d2ebf388d5ef297011625e4c36e963f0  COPYING
diff --git a/package/lilv/lilv.mk b/package/lilv/lilv.mk
new file mode 100644
index 0000000000..5f9186e66a
--- /dev/null
+++ b/package/lilv/lilv.mk
@@ -0,0 +1,30 @@
+################################################################################
+#
+# lilv
+#
+################################################################################
+
+LILV_VERSION = 0.24.12
+LILV_SITE = https://download.drobilla.net
+LILV_SOURCE = lilv-$(LILV_VERSION).tar.bz2
+LILV_LICENSE = ISC
+LILV_LICENSE_FILES = COPYING
+LILV_DEPENDENCIES = host-pkgconf lv2 serd sord sratom
+LILV_INSTALL_STAGING = YES
+
+LILV_CONF_OPTS += \
+	--dyn-manifest \
+	--no-bash-completion \
+	--no-coverage
+
+ifeq ($(BR2_PACKAGE_PYTHON3),y)
+LILV_DEPENDENCIES += python3
+else
+LILV_CONF_OPTS += --no-bindings
+endif
+
+ifeq ($(BR2_PACKAGE_LIBSNDFILE),y)
+LILV_DEPENDENCIES += libsndfile
+endif
+
+$(eval $(waf-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
