Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F2A8C433EF
	for <buildroot@archiver.kernel.org>; Sun, 15 May 2022 08:49:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EB277415F6;
	Sun, 15 May 2022 08:49:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id m4wEL5JzqD9n; Sun, 15 May 2022 08:49:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B025B415D2;
	Sun, 15 May 2022 08:49:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 21F6C1BF2C7
 for <buildroot@lists.busybox.net>; Sun, 15 May 2022 08:49:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 17F968284B
 for <buildroot@lists.busybox.net>; Sun, 15 May 2022 08:49:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oeLqVuHzeroe for <buildroot@lists.busybox.net>;
 Sun, 15 May 2022 08:49:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1426382849
 for <buildroot@buildroot.org>; Sun, 15 May 2022 08:49:40 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id d5so16817034wrb.6
 for <buildroot@buildroot.org>; Sun, 15 May 2022 01:49:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JM/g+QyqObo+0+mbgSpbwxXTALtOzB3wvOLY2S/q0fA=;
 b=P7yiDHMIJm4kwJ3Kip4PGYScQ582llHqJxBiMFuG5Gq3ZA9URovFMyzUogVRAevov/
 BOpxkdSla2vBZq7m6NJtlZ79BNoEJjoCpPNTej4dWkOO6HME1p+/YTGbkh8gqghkDpt6
 fxzSQ7jmwVmF1ucLGt3OQRPyEs4cK12PZSYCZO+ZkzRk+9QgOIWXfeSpIR6N5KyhRawe
 RYABlva9zRsM6fE/46qBMHNLG7YGATxCdTstarSHRryJbIo7EEgh0dL29zfh7KkXNNKr
 380GWQW97+4h9cy1JcS9STDPMeFRfV02tcgYGXNMWfo04e1c980VEmWgdUpkJdmjYgCy
 WwFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JM/g+QyqObo+0+mbgSpbwxXTALtOzB3wvOLY2S/q0fA=;
 b=5VaNGcs8l12NbdqDawozynTd5J0JZULI/dQuW6AWshW5Um+SSFyowCu4fbkZUifRl9
 hnAQuYyjnZ+yFXKeqZbA5XrlDKoZJia+YGaOuuE5GbaqqPVqisNWrXibgD0u+bSeVc2J
 JsmYVLiwJrQcpr1AgPOIkAkBhD3EHV5Xu7pN5Lu/3HROIRBLXoLueBCkn2tfKlPlcX3t
 Ijp1rxuAWgkDHM/BHQtBnySuZV0GKVKhlQB7UmXpUD+vWi3Ga2dRgmwkmPIRym/d7rW7
 udXo/rNDn/D700J6kcjxnzx6AkQDcM0DstnCgsAEbFyZTfMVUCHOxbXFkWgK7nmnlbnB
 fX5A==
X-Gm-Message-State: AOAM531aIK8wIX2jh1bx4TadEh68B+uR4Hqj9A9VHbsbC2w4hjSMV1Je
 l/XAO1hp1CmN1g8+CRfPla+RaZiPRkw=
X-Google-Smtp-Source: ABdhPJz2aUL+Vvb8BdjP9bEHNHf+HTAlL3ANb9pJsj5afK+LctDv/YS9oI0RZ9N+mdAlFLESoPczJQ==
X-Received: by 2002:a5d:6d83:0:b0:20c:7329:7c36 with SMTP id
 l3-20020a5d6d83000000b0020c73297c36mr10519694wrs.518.1652604578888; 
 Sun, 15 May 2022 01:49:38 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 i10-20020a05600c354a00b003942a244f37sm11575603wmq.16.2022.05.15.01.49.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 May 2022 01:49:38 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 15 May 2022 10:47:22 +0200
Message-Id: <20220515084722.394596-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/libressl: disable tests
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

Disable tests to avoid the following build failure since bump to version
3.5.2 in commit 8b216927db080b38fdbf1f8b025b6f90a89d4bc2:

In file included from /nvmedata/autobuild/instance-11/output-1/host/aarch64_be-buildroot-linux-uclibc/sysroot/usr/include/stdio.h:71,
                 from /nvmedata/autobuild/instance-11/output-1/build/libressl-3.5.2/tests/../include/compat/stdio.h:18,
                 from /nvmedata/autobuild/instance-11/output-1/build/libressl-3.5.2/tests/rfc3779.c:18:
/nvmedata/autobuild/instance-11/output-1/host/aarch64_be-buildroot-linux-uclibc/sysroot/usr/include/bits/uClibc_stdio.h:149:23: error: expected identifier or '(' before ';' token
  149 |         void *__unused;                         /* Placeholder for codeset binding. */
      |                       ^

Fixes:
 - http://autobuild.buildroot.org/results/620cb8d542c2e0c263233f5b746cbc9be1bd9547

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libressl/libressl.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libressl/libressl.mk b/package/libressl/libressl.mk
index c9c484d5d8..a52a15c676 100644
--- a/package/libressl/libressl.mk
+++ b/package/libressl/libressl.mk
@@ -10,7 +10,7 @@ LIBRESSL_LICENSE = ISC (new additions), OpenSSL or SSLeay (original OpenSSL code
 LIBRESSL_LICENSE_FILES = COPYING
 LIBRESSL_CPE_ID_VENDOR = openbsd
 LIBRESSL_INSTALL_STAGING = YES
-LIBRESSL_CONF_OPTS = -DOPENSSLDIR="/etc/ssl"
+LIBRESSL_CONF_OPTS = -DLIBRESSL_TESTS=OFF -DOPENSSLDIR="/etc/ssl"
 
 ifeq ($(BR2_PACKAGE_LIBRESSL_BIN),)
 define LIBRESSL_REMOVE_BIN
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
