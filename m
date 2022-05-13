Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A94BC433EF
	for <buildroot@archiver.kernel.org>; Fri, 13 May 2022 20:29:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F372083F85;
	Fri, 13 May 2022 20:29:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ahQpPVvnV19x; Fri, 13 May 2022 20:29:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0089183F69;
	Fri, 13 May 2022 20:29:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 35F4E1BF3CD
 for <buildroot@lists.busybox.net>; Fri, 13 May 2022 20:29:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3269983F69
 for <buildroot@lists.busybox.net>; Fri, 13 May 2022 20:29:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id K2-hAQM-EHVs for <buildroot@lists.busybox.net>;
 Fri, 13 May 2022 20:29:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1E9FF83F55
 for <buildroot@buildroot.org>; Fri, 13 May 2022 20:29:42 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 125-20020a1c1983000000b003941f354c62so5338746wmz.0
 for <buildroot@buildroot.org>; Fri, 13 May 2022 13:29:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vcA3TVv7Vcg7LOMjStIB+bwheSo0r54+0w7myXN+0YA=;
 b=ZnJhJXhb1MOrRc9+2/wHvyDQ6d9THr4/69rcc5vyStWpzy/TwKj87uiBwYj+gmTdz5
 YemhhBHYDofTguePIkVgMeZqCGSP8cALwyUgMECCg/85R9CeGJoS0+u/2eQMKq0yCGre
 1hrH2KYEEiJU7G4m9LPNbnN/hOFFV9OS0BUVTBVuFTrv2o3DnhhsBQ+JKtr/1JMnUgV6
 Sr8bNFegh8jqCkCvh3jZlV2088r4GERBCdITDAo5zvuYBYsZc7lFdZ6h5js2LMvoqply
 /igEFuhZhK85mBli46RriOnhLifBQRUUlv6S3Insn6zQji6rkOXx1MH9yM4ZhqEJdrk2
 7h3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vcA3TVv7Vcg7LOMjStIB+bwheSo0r54+0w7myXN+0YA=;
 b=4U/T8c2+jhpq6qqFlPXLAeFeRNxy84AprizpsxF5kHZoDZmr8s9+UyWfiPrcXjxsmS
 0Ef97f0Hixjpf5YW1hUMus8co7HdpxwL4cXtpUHNatFEe2dVww/CXDUeq3jJGjYRqBuq
 ojyEDrSKFIZHhjTnFralYyt733Ws08aA1P5n8jE0g3XAIva2Q4HTuh/ZM4tJyGjudwSz
 0r469T595n+4E1Oqge1xSKRZNpJ7e5whNbb2EqMcxqWyeB0IcNgZdY/tix0nhsGu1vjy
 KjKyhrJXUyON7fkJ6leU73ucOpKAv+ny21N/JghoDKmpw/3oT63/R9h28AC1MD3nRkjN
 i5SQ==
X-Gm-Message-State: AOAM533fJ8pRtO5s9VsQCMG/xdno3p0bl9Te6Lr6KbYbJ8gKccrSdMNC
 fH3SHETuzeyw+gzk1HYPc8jc7OArxlw=
X-Google-Smtp-Source: ABdhPJznre9UgpxPfXHYq56xxDT0It9JAKwthbb0ZG3AGqUNGUu50S9fHjgovt9/lAMmeAVKzDzfLQ==
X-Received: by 2002:a05:600c:2258:b0:394:2045:bed with SMTP id
 a24-20020a05600c225800b0039420450bedmr6187738wmm.174.1652473780607; 
 Fri, 13 May 2022 13:29:40 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 p39-20020a05600c1da700b003942a244f4esm6486664wms.39.2022.05.13.13.29.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 May 2022 13:29:40 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 13 May 2022 22:27:32 +0200
Message-Id: <20220513202732.751829-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/snmppp: fix build with libressl >=
 3.5.0
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
Cc: Luca Ceresoli <luca@lucaceresoli.net>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure with libressl raised since bump to
version 3.5.2 in commit 8b216927db080b38fdbf1f8b025b6f90a89d4bc2:

auth_priv.cpp: In member function 'virtual int Snmp_pp::AuthMD5::password_to_key(const unsigned char*, unsigned int, const unsigned char*, unsigned int, unsigned char*, unsigned int*)':
auth_priv.cpp:1132:20: error: aggregate 'Snmp_pp::MD5HashStateType md5_hash_state' has incomplete type and cannot be defined
   MD5HashStateType md5_hash_state;
                    ^~~~~~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/b50b883c03e82564198a8b7e91bd14bf007772e0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../0001-fix-build-with-libressl-3-5-0.patch  | 39 +++++++++++++++++++
 1 file changed, 39 insertions(+)
 create mode 100644 package/snmppp/0001-fix-build-with-libressl-3-5-0.patch

diff --git a/package/snmppp/0001-fix-build-with-libressl-3-5-0.patch b/package/snmppp/0001-fix-build-with-libressl-3-5-0.patch
new file mode 100644
index 0000000000..f60f84f9a2
--- /dev/null
+++ b/package/snmppp/0001-fix-build-with-libressl-3-5-0.patch
@@ -0,0 +1,39 @@
+fix build with libressl >= 3.5.0
+
+Fix the following build failure with libressl >= 3.5.0:
+
+auth_priv.cpp: In member function 'virtual int Snmp_pp::AuthMD5::password_to_key(const unsigned char*, unsigned int, const unsigned char*, unsigned int, unsigned char*, unsigned int*)':
+auth_priv.cpp:1132:20: error: aggregate 'Snmp_pp::MD5HashStateType md5_hash_state' has incomplete type and cannot be defined
+   MD5HashStateType md5_hash_state;
+                    ^~~~~~~~~~~~~~
+
+Fixes:
+ - http://autobuild.buildroot.org/results/b50b883c03e82564198a8b7e91bd14bf007772e0
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: merged (emailed to katz.agentpp.com@magenta.de)]
+
+diff -Naurp snmp++-3.4.9.orig/src/auth_priv.cpp snmp++-3.4.9/src/auth_priv.cpp
+--- snmp++-3.4.9.orig/src/auth_priv.cpp	2022-05-13 11:39:14.083038544 +0200
++++ snmp++-3.4.9/src/auth_priv.cpp	2022-05-13 15:00:42.576102348 +0200
+@@ -79,8 +79,9 @@ static const char *loggerModuleName = "s
+ 
+ /* -- START: Defines for OpenSSL -- */
+ 
+-#if OPENSSL_VERSION_NUMBER < 0x10100000L || defined(LIBRESSL_VERSION_NUMBER)
+-// OpenSSL versions up to 1.0.x and LibreSSL
++#if OPENSSL_VERSION_NUMBER < 0x10100000L || \
++	(defined(LIBRESSL_VERSION_NUMBER) && LIBRESSL_VERSION_NUMBER < 0x30500000L)
++// OpenSSL versions up to 1.0.x and LibreSSL versions up to 3.4.x
+ typedef EVP_MD_CTX            EVPHashStateType;
+ 
+ int evpAllocAndInit(EVP_MD_CTX *ctx, const EVP_MD *md)
+@@ -138,7 +139,7 @@ typedef EVP_MD_CTX*           MD5HashSta
+ #define MD5_PROCESS(s, p, l)  EVP_DigestUpdate(*(s), p, l)
+ #define MD5_DONE(s, k)        evpDigestFinalAndFree(s, k)
+ 
+-#endif // OPENSSL_VERSION_NUMBER < 0x10100000L || defined(LIBRESSL_VERSION_NUMBER)
++#endif // OPENSSL_VERSION_NUMBER < 0x10100000L || (defined(LIBRESSL_VERSION_NUMBER) && LIBRESSL_VERSION_NUMBER < 0x30500000L)
+ 
+ typedef DES_key_schedule      DESCBCType;
+ #define DES_CBC_START_ENCRYPT(c, iv, k, kl, r, s) \
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
