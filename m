Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0929AC04A68
	for <buildroot@archiver.kernel.org>; Wed, 27 Jul 2022 12:26:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 66C708148D;
	Wed, 27 Jul 2022 12:26:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 66C708148D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rZeXgGfGVbgp; Wed, 27 Jul 2022 12:26:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 95C4D81570;
	Wed, 27 Jul 2022 12:26:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 95C4D81570
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 558A81BF372
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 12:26:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2E899409F7
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 12:26:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2E899409F7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AA0tu34P2B29 for <buildroot@lists.busybox.net>;
 Wed, 27 Jul 2022 12:26:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A1D1E40977
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A1D1E40977
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 12:26:01 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 u14-20020a05600c00ce00b003a323062569so919229wmm.4
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 05:26:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ghlkxSev047d3puccujA0jnpmq+nZzr9x2eQEiowgGk=;
 b=AfmDqhyIbgY39u7IxTFYwuYvXfazDzl6I3w3l3s+TnAfVReMJUUlr0am/cXRQUQxpu
 a6EdlaT5YiNzObFeeYIffk3ETytOahDlOBL4YRojhf26gCYFOVoPacxzrMrMJQiKP0gG
 1uCmZh4WoyKItyPqbKqpS7vWbvxA96IpmNxXP2cO0CAWg+eUe9+/dte13nz1wlRCzNg0
 x19bnOw8Jr37UZg6zq84vRgCjpBSSWuFsGWLROald5ISTcGhIf2cCkDCWPFNkHRwCtAO
 +33q4Pem7Y8U2yuVKUveidbfCDY8XizNqt0axbyXa04z2F2DpA2GZp0TEN9wn+NSdRhk
 AL4g==
X-Gm-Message-State: AJIora/y9r4uL7W+l8fCYmTiOSU9c9SIm07XwufgKz7UGSvUuWiv9F+q
 bJXes+UjQ6XBU8ioz+KMHSI1U1iLe54=
X-Google-Smtp-Source: AGRyM1tQ2Q6IcFQl4WOaTK4UNTk7gUm1BoZz1GQUSxhWnmOy9wQ09E7RwelqoGkSg9rrVPzfpSDCJA==
X-Received: by 2002:a05:600c:4e4b:b0:3a3:19bf:35e1 with SMTP id
 e11-20020a05600c4e4b00b003a319bf35e1mr2999465wmq.74.1658924759437; 
 Wed, 27 Jul 2022 05:25:59 -0700 (PDT)
Received: from kali.home (2a01cb0680494f3e376d079efd3cafb3.ipv6.abo.wanadoo.fr.
 [2a01:cb06:8049:4f3e:376d:79e:fd3c:afb3])
 by smtp.gmail.com with ESMTPSA id
 z11-20020a05600c0a0b00b003a319bd3278sm2822261wmp.40.2022.07.27.05.25.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Jul 2022 05:25:58 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 27 Jul 2022 14:25:51 +0200
Message-Id: <20220727122551.1179103-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ghlkxSev047d3puccujA0jnpmq+nZzr9x2eQEiowgGk=;
 b=KDUKdJizM2X+T3on1bLgjjpIJ3YI1CB+tH9GlHmBdd54cPRj/zx8WV317WLpvSy+GU
 QZqk8NupH0GpT4ylvQl3N0A66EOpV/Xtat9N+lxdfpdiGHI1sLq1ln67Qy2ER9SoWlCB
 Af4kBxeMiEAis0CN6S9oCVWH8FQmE9faYcbrSCeuRzhpHoI9oiePRHKs4Nxf8QuGn6g8
 WMZ5TUT5dq0U3Q5qGRa4v+la8dXlHjK4QQ3FoEts4WXFBGebDcZ/XOP1uNHAkmMTCfP6
 nbTs0174AXdO3Z5s0vwELCIx5Kc1F8vJRm5lmJOa8mC5ihpGSQrOdIsWFkR3XY+9Je0M
 Cnhw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=KDUKdJiz
Subject: [Buildroot] [PATCH 1/1] package/libmodsecurity: bump to version
 3.0.7
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
Cc: Frank Vanbever <frank.vanbever@essensium.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Switch to pcre2 as pcre is deprecated

https://github.com/SpiderLabs/ModSecurity/releases/tag/v3.0.7

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...build-pcre.m4-fix-build-without-pcre.patch | 29 +++++++++++++++++++
 package/libmodsecurity/libmodsecurity.hash    |  4 +--
 package/libmodsecurity/libmodsecurity.mk      |  9 +++---
 3 files changed, 36 insertions(+), 6 deletions(-)
 create mode 100644 package/libmodsecurity/0004-build-pcre.m4-fix-build-without-pcre.patch

diff --git a/package/libmodsecurity/0004-build-pcre.m4-fix-build-without-pcre.patch b/package/libmodsecurity/0004-build-pcre.m4-fix-build-without-pcre.patch
new file mode 100644
index 0000000000..5a5baeacee
--- /dev/null
+++ b/package/libmodsecurity/0004-build-pcre.m4-fix-build-without-pcre.patch
@@ -0,0 +1,29 @@
+From af96f4fe916adc7dc6d649a07c10b45c978d31a1 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Wed, 27 Jul 2022 14:17:20 +0200
+Subject: [PATCH] build/pcre.m4: fix build without pcre
+
+Don't raise an error if pcre is disabled now that pcre2 is supported
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: not sent (no feedback on
+https://github.com/SpiderLabs/ModSecurity/pull/2596)]
+---
+ build/pcre.m4 | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/build/pcre.m4 b/build/pcre.m4
+index f6c9ae18..3e40f5c9 100644
+--- a/build/pcre.m4
++++ b/build/pcre.m4
+@@ -99,7 +99,6 @@ AC_SUBST(PCRE_LD_PATH)
+ 
+ if test -z "${PCRE_VERSION}"; then
+     AC_MSG_NOTICE([*** pcre library not found.])
+-    ifelse([$2], , AC_MSG_ERROR([pcre library is required]), $2)
+ else
+     AC_MSG_NOTICE([using pcre v${PCRE_VERSION}])
+     ifelse([$1], , , $1) 
+-- 
+2.35.1
+
diff --git a/package/libmodsecurity/libmodsecurity.hash b/package/libmodsecurity/libmodsecurity.hash
index 341dbc3765..087157d162 100644
--- a/package/libmodsecurity/libmodsecurity.hash
+++ b/package/libmodsecurity/libmodsecurity.hash
@@ -1,4 +1,4 @@
-# From https://github.com/SpiderLabs/ModSecurity/releases/download/v3.0.6/modsecurity-v3.0.6.tar.gz.sha256
-sha256  06315d9a32fc830997178f30a69e933c9c2364b263a2f036959bebc4dde59a08  modsecurity-v3.0.6.tar.gz
+# From https://github.com/SpiderLabs/ModSecurity/releases/download/v3.0.7/modsecurity-v3.0.7.tar.gz.sha256
+sha256  cfd8b7e7e6a0e9ca4e19b9adeb07594ba75eba16a66da5e9b0974c0117c21a34  modsecurity-v3.0.7.tar.gz
 # Localy calculated
 sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
diff --git a/package/libmodsecurity/libmodsecurity.mk b/package/libmodsecurity/libmodsecurity.mk
index 8fa3d59845..916ba8fbcb 100644
--- a/package/libmodsecurity/libmodsecurity.mk
+++ b/package/libmodsecurity/libmodsecurity.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBMODSECURITY_VERSION = 3.0.6
+LIBMODSECURITY_VERSION = 3.0.7
 LIBMODSECURITY_SOURCE = modsecurity-v$(LIBMODSECURITY_VERSION).tar.gz
 LIBMODSECURITY_SITE = https://github.com/SpiderLabs/ModSecurity/releases/download/v$(LIBMODSECURITY_VERSION)
 LIBMODSECURITY_INSTALL_STAGING = YES
@@ -12,12 +12,13 @@ LIBMODSECURITY_LICENSE = Apache-2.0
 LIBMODSECURITY_LICENSE_FILES = LICENSE
 LIBMODSECURITY_CPE_ID_VENDOR = trustwave
 LIBMODSECURITY_CPE_ID_PRODUCT = modsecurity
-# We're patching build/libmaxmind.m4
+# We're patching build/libmaxmind.m4 and build/pcre.m4
 LIBMODSECURITY_AUTORECONF = YES
 
-LIBMODSECURITY_DEPENDENCIES = pcre
+LIBMODSECURITY_DEPENDENCIES = pcre2
 LIBMODSECURITY_CONF_OPTS = \
-	--with-pcre="$(STAGING_DIR)/usr/bin/pcre-config" \
+	--without-pcre \
+	--with-pcre2="$(STAGING_DIR)/usr" \
 	--disable-examples \
 	--without-lmdb \
 	--without-ssdeep \
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
