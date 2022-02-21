Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44828C433F5
	for <buildroot@archiver.kernel.org>; Mon, 21 Feb 2022 22:07:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CD3FF408DF;
	Mon, 21 Feb 2022 22:07:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AcVkW9sHXnYb; Mon, 21 Feb 2022 22:07:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 154BD408D7;
	Mon, 21 Feb 2022 22:07:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 913211BF3A7
 for <buildroot@lists.busybox.net>; Mon, 21 Feb 2022 22:07:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7A176408C8
 for <buildroot@lists.busybox.net>; Mon, 21 Feb 2022 22:07:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vdBOJm2vMVrY for <buildroot@lists.busybox.net>;
 Mon, 21 Feb 2022 22:07:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 903B7408D7
 for <buildroot@buildroot.org>; Mon, 21 Feb 2022 22:07:05 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id s13so799650wrb.6
 for <buildroot@buildroot.org>; Mon, 21 Feb 2022 14:07:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nmFmfXlRlmf7vJu1AgSbnFJuEz35ydxkZ5vw+Fni4r4=;
 b=BG30q8hx5dDSf+hHj6Ok5u7AvlPa+CovihuZ+VhFijjc0WeUJ+xTfS4i+sngzvQ70c
 4NEi56y1Gec+TFOgcmaSWwpQuNoX2i+R9smyiHhnECpk8dC2pdJSqUOpB0AbGgjXTpzS
 UFBNHO3rPOkknXTSyF2N92j+eocb28hTYrBlmF5N5iF/Z9Ot48R4DwvJZd6PW5sHqVxJ
 f+6hJIFwYq7Upu3VY7X6M67WCx/TuEEhb6wOirgGGbC2KmjMkxvmIIKqiR+0zAoVxG/Y
 +sKQO+2YrHblCcGRDVoLTs1qJU8Uvy8OKF/2i97NSx/+BJj0Z8NiX5w53h2yHCVYayfk
 k2ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nmFmfXlRlmf7vJu1AgSbnFJuEz35ydxkZ5vw+Fni4r4=;
 b=VeypfLSwJv9krhnuU58n1UlrVRYpVRsda7ChspvKO6dMknn+uKborlfPqIGs1iVQlh
 TrQ5xDI5hKW41qB0vx1TiplAUnEeJxdeUyZZV7h/jau1zHefzhFShKqsUnlQPotpXBMJ
 YZQhNYaTLspZZkg1kF6vGSFVYHo6LSkHtTe+aHnCZmsMv0pIETJdOHmpu0Apc5IUmXw6
 LOC4hvmLDxy4tP1UNk4ZxU7t+n6t0wXLdETT+yq/qE01En6lcxPEu0dCDxdhdSMIXgtt
 IXgox4G4UC/LJ4AYz3basF6wc0BQzLmmuP92lZapZZdAs/6BP4pNlvncLh1f7oGyN/J/
 fJOA==
X-Gm-Message-State: AOAM5309Motf7ogLqURoAkzuE1WwtVHCa9CTzOLmf1moXrW/OP69UIMB
 bP5yFvUkUwr1JTEx5X8c6VXHQxoAXQo=
X-Google-Smtp-Source: ABdhPJwc8gJmeQng/6UXykmq/Wc8VGxcyDC7zFFJQGnKwIvu9dc1AW1MfZ6cVGLfXK7iKiWUXxk5fQ==
X-Received: by 2002:adf:fc08:0:b0:1e1:a1b9:7d2c with SMTP id
 i8-20020adffc08000000b001e1a1b97d2cmr17392147wrr.649.1645481223558; 
 Mon, 21 Feb 2022 14:07:03 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 11-20020a05600c26cb00b0037ff53511f2sm486701wmv.31.2022.02.21.14.07.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Feb 2022 14:07:03 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 21 Feb 2022 23:07:03 +0100
Message-Id: <20220221220703.2198424-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2,1/1] package/re2: fix build with gcc <= 5
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

Fix the following build failure with gcc <= 5 raised since bump to
version 2022-02-01 in commit d2cf91e0c6a082261cc7ebb06dfdbd7bc2c2956f
and
https://github.com/google/re2/commit/a022cc0c55b0519629d64d775e7a5195af34a477

./re2/sparse_array.h:266:37: warning: defaulted and deleted functions only available with -std=c++11 or -std=gnu++11
 SparseArray<Value>::SparseArray() = default;
                                     ^
./re2/sparse_array.h: In copy constructor 're2::SparseArray<Value>::SparseArray(const re2::SparseArray<Value>&)':
./re2/sparse_array.h:273:3: error: 'copy_n' is not a member of 'std'
   std::copy_n(src.sparse_.data(), src.max_size(), sparse_.data());
   ^

Fixes:
 - http://autobuild.buildroot.org/results/8ebbac67f32fe24416a1f72aad0afd42b567b403

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2 (after review of Yann E. Morin):
 - Don't set prefix in build step

 package/re2/re2.mk | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/package/re2/re2.mk b/package/re2/re2.mk
index 41392cb179..30791a68e5 100644
--- a/package/re2/re2.mk
+++ b/package/re2/re2.mk
@@ -10,19 +10,23 @@ RE2_LICENSE = BSD-3-Clause
 RE2_LICENSE_FILES = LICENSE
 RE2_INSTALL_STAGING = YES
 
+RE2_MAKE_OPTS = \
+	$(TARGET_CONFIGURE_OPTS) \
+	CXXFLAGS="$(TARGET_CXXFLAGS) -std=c++11"
+
 define RE2_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) \
+	$(TARGET_MAKE_ENV) $(MAKE) $(RE2_MAKE_OPTS) \
 		-C $(@D) $(if $(BR2_STATIC_LIBS),static)
 endef
 
 define RE2_INSTALL_STAGING_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) \
+	$(TARGET_MAKE_ENV) $(MAKE) $(RE2_MAKE_OPTS) \
 		DESTDIR="$(STAGING_DIR)" prefix=/usr -C $(@D) \
 		$(if $(BR2_STATIC_LIBS),static-install,install)
 endef
 
 define RE2_INSTALL_TARGET_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) \
+	$(TARGET_MAKE_ENV) $(MAKE) $(RE2_MAKE_OPTS) \
 		DESTDIR="$(TARGET_DIR)" prefix=/usr -C $(@D) \
 		$(if $(BR2_STATIC_LIBS),static-install,install)
 endef
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
