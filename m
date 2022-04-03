Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F011C433F5
	for <buildroot@archiver.kernel.org>; Sun,  3 Apr 2022 15:48:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B23FC4057F;
	Sun,  3 Apr 2022 15:48:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id S2bpuTPg_oDx; Sun,  3 Apr 2022 15:48:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DBA95404BB;
	Sun,  3 Apr 2022 15:48:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B9DEC1BF2AF
 for <buildroot@lists.busybox.net>; Sun,  3 Apr 2022 15:48:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A80BC40438
 for <buildroot@lists.busybox.net>; Sun,  3 Apr 2022 15:48:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id unkqc3KndUzG for <buildroot@lists.busybox.net>;
 Sun,  3 Apr 2022 15:48:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0264840125
 for <buildroot@buildroot.org>; Sun,  3 Apr 2022 15:47:59 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id r13so10937665wrr.9
 for <buildroot@buildroot.org>; Sun, 03 Apr 2022 08:47:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=groh4wDh0zx38Gl8HreZqsT4wOMO8Drl77O4MNDNvFo=;
 b=CGq8mVcoCdreB0gJDUAxXCrEgKye9x9KgsQuAUVrqtGYSqfG3lzzFrnOwXxKMSZgof
 QHN2FtTlVS6ZDVqAfMeENPwxb3ir1it3O4u4nbHvXkM3hK3rwW1HQUJEBzQbUDT4EeTT
 LixSXkpO0krzdUgsIsWG4jSMbIAby3TRqGAN3q4LKS8KorcRAFBr1wRSJBAfGjvumwhc
 aTR5oxknIo6ptI2/i0Iyy7pyDE9UxzPNO/HefDpOlIg3wCVUi/6aCU9FgweCQeWe5zLN
 gQMj/xaq5BHLra75aU071qj48Py4YXem7F75AXK6SPmQX2vEoL1namaGYkTT1iw+4akr
 a8aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=groh4wDh0zx38Gl8HreZqsT4wOMO8Drl77O4MNDNvFo=;
 b=BRc0TQia9dJ+Sdz5Y9cJqIJqPZnh0grjjmtsv5GCEn1xsI6rVNP3sEPhkQD29+3BFm
 fIQnoTeuWmCmNm4NqeYI5yYu0oikumq0jscWMJWF+BC8Xwx/gf+xkp64s5NdfbYV7xhm
 fcjWZ7jKbp0WFv+8Jvjv3QmNTKWbC0qkS3qLgsDq2Ec9U9FCYIlDG35QqlpGCS9pBsbi
 XKVHo/jvZfhsGapPblfcW7X6Ke5T7tRUzWMi4qKgTJfOptBVOPwB+EitieFyKwE8wqom
 We+ea3P7fJjcFNsb0yfG9wtWDb4O8pj9G9O15Q1Tk/6XD7E/dit2RnY8KUVS2u9vAl3V
 oZzA==
X-Gm-Message-State: AOAM533qJ4/fS6EZfNKMoMzN6XY/iRiuMlLFDwYbeFPDOAPkN/45BnIl
 l4T0sN+YJhfoMbWKppSWqh38Pq5nNF0=
X-Google-Smtp-Source: ABdhPJy0B+OqfYmAATQNdKTPM+0CvsJ3CaqQ6uz4VYqY6J6YeTLUob4KOKSGECAtpBG+i9eeMoIETA==
X-Received: by 2002:adf:e74a:0:b0:1f0:25cb:3ad5 with SMTP id
 c10-20020adfe74a000000b001f025cb3ad5mr14572121wrn.231.1649000878084; 
 Sun, 03 Apr 2022 08:47:58 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 f13-20020adff58d000000b002060e84bcc9sm1406573wro.44.2022.04.03.08.47.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Apr 2022 08:47:57 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  3 Apr 2022 17:46:10 +0200
Message-Id: <20220403154612.4158174-2-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220403154612.4158174-1-fontaine.fabrice@gmail.com>
References: <20220403154612.4158174-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/4] package/cppcms: libgcrypt is optional,
 not mandatory
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

If libgcrypt (or openssl) is not enabled, aes_encryptor is disabled

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/cppcms/Config.in | 2 --
 package/cppcms/cppcms.mk | 9 ++++++++-
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/package/cppcms/Config.in b/package/cppcms/Config.in
index 25fd93a7d0..6c0bff934c 100644
--- a/package/cppcms/Config.in
+++ b/package/cppcms/Config.in
@@ -1,12 +1,10 @@
 config BR2_PACKAGE_CPPCMS
 	bool "cppcms"
 	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS # libgcrypt
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	depends on !BR2_STATIC_LIBS # dlopen()
 	depends on BR2_USE_WCHAR
 	select BR2_PACKAGE_PCRE
-	select BR2_PACKAGE_LIBGCRYPT
 	help
 	  CppCMS is a Free High Performance Web Development Framework
 	  (not a CMS) aimed for Rapid Web Application Development. It
diff --git a/package/cppcms/cppcms.mk b/package/cppcms/cppcms.mk
index 530b44427b..357909f31d 100644
--- a/package/cppcms/cppcms.mk
+++ b/package/cppcms/cppcms.mk
@@ -18,7 +18,7 @@ CPPCMS_CONF_OPTS = \
 	-DCMAKE_SKIP_RPATH=ON \
 	-DCMAKE_CXX_FLAGS="$(CPPCMS_CXXFLAGS)"
 
-CPPCMS_DEPENDENCIES = pcre libgcrypt
+CPPCMS_DEPENDENCIES = pcre
 
 ifeq ($(BR2_PACKAGE_CPPCMS_ICU),y)
 CPPCMS_CONF_OPTS += -DDISABLE_ICU_LOCALE=OFF
@@ -28,6 +28,13 @@ else
 CPPCMS_CONF_OPTS += -DDISABLE_ICU_LOCALE=ON
 endif
 
+ifeq ($(BR2_PACKAGE_LIBGCRYPT),y)
+CPPCMS_CONF_OPTS += -DDISABLE_GCRYPT=OFF
+CPPCMS_DEPENDENCIES += libgcrypt
+else
+CPPCMS_CONF_OPTS += -DDISABLE_GCRYPT=ON
+endif
+
 ifeq ($(BR2_PACKAGE_ZLIB),y)
 CPPCMS_CONF_OPTS += -DDISABLE_GZIP=OFF
 CPPCMS_DEPENDENCIES += zlib
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
