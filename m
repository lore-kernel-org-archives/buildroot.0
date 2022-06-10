Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3747C433EF
	for <buildroot@archiver.kernel.org>; Fri, 10 Jun 2022 16:56:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5495C401AD;
	Fri, 10 Jun 2022 16:56:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DM2DKiDtDOEY; Fri, 10 Jun 2022 16:56:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 871E44031C;
	Fri, 10 Jun 2022 16:56:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AB5FA1BF358
 for <buildroot@lists.busybox.net>; Fri, 10 Jun 2022 16:56:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A84A184422
 for <buildroot@lists.busybox.net>; Fri, 10 Jun 2022 16:56:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5aRv9620h4K2 for <buildroot@lists.busybox.net>;
 Fri, 10 Jun 2022 16:56:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 87681843BB
 for <buildroot@busybox.net>; Fri, 10 Jun 2022 16:56:06 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id a15so28784808wrh.2
 for <buildroot@busybox.net>; Fri, 10 Jun 2022 09:56:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mrtZeGJdAvGsIL8KKFL/NQNTBB9Kx7j0aTjlCmhmnBU=;
 b=fqlEizv9NhzlECiBXG9ohk/chUua+AovRH5BiLFquNicnk9/9hA6+kTSphe1R+C1WZ
 /5ffVZivp6wVGpxb+N8ofno75QTtXznXkRhRH3v/2P1xR6Dq5ERzK3y3GQY53Bs0qOTm
 MQzDFLft6RQBjACgJ6O+V/qGhwD6I+O11iHnhTX0a26iWIOzwWnO+XXhhAXZqsMlxUKe
 kHWG2ck0PsylN1cVniXyt1psma1KMiKms89+Q7j8zadt7PwOah+KCIxgWK+ggIIXnb8f
 MMQEGqMuhyiXQCDDhSOAsfyBgzGgtYwG6QMBNR6jtilXMW6JROZuXC0fNTB7g2hgNh03
 DGvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mrtZeGJdAvGsIL8KKFL/NQNTBB9Kx7j0aTjlCmhmnBU=;
 b=o7QAqKFmcUgsgbN+Wk5qJMaWBtU2CM3VQhN/u3KbYe/oOyHCOUCbbBuOeGFA4xQNnn
 RfDya21WuTI1NXnWMqrzW/Iwlngnmj/dK78kPHqNblR+uWxMrlvESmatV8EAXahcMDOr
 VNMHrBdVbBV9CpQA+TU1XM1bEvr4j64+EKo4+bHCvc6hFuZ++Efcg1FU79VVBaKEf8eL
 Eqk+B0zRUMFAwXo0jToXz8x+js7Weco6kQMDWfsrTz3sVt0UGS9X8lMsIBkiXjH65O6P
 8da/X4+pIncR7MzgoysBrVVQGRq2azLZO0RB1p38hVtr8+cxOaJaEdeFRp3Yh2c5boOM
 VuNQ==
X-Gm-Message-State: AOAM531FbCcrp779GS2w7Uyd96lvNFxwPFaRED9BA2zV64/GjXgVLaOb
 XAMj6PeIAzEiB7kz6MxQ66QOHXgsHAlAxw==
X-Google-Smtp-Source: ABdhPJxK720FnGRW8MlFxVjxDu6uY7IQ/6YBMWp+UxFRc3+R4LuwOUrs92hSgaVOA6e9tozfKzRYBQ==
X-Received: by 2002:a5d:59c1:0:b0:218:548f:864 with SMTP id
 v1-20020a5d59c1000000b00218548f0864mr19225936wry.361.1654880164674; 
 Fri, 10 Jun 2022 09:56:04 -0700 (PDT)
Received: from vm22.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 q16-20020adfcd90000000b00213abce60e4sm23967335wrj.111.2022.06.10.09.56.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jun 2022 09:56:03 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Fri, 10 Jun 2022 18:55:41 +0200
Message-Id: <20220610165541.2574405-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/gnutls: bump to version 3.7.6
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/gnutls/gnutls.hash | 4 ++--
 package/gnutls/gnutls.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gnutls/gnutls.hash b/package/gnutls/gnutls.hash
index c09e4665e..ff191278c 100644
--- a/package/gnutls/gnutls.hash
+++ b/package/gnutls/gnutls.hash
@@ -1,6 +1,6 @@
 # Locally calculated after checking pgp signature
-# https://www.gnupg.org/ftp/gcrypt/gnutls/v3.7/gnutls-3.7.4.tar.xz.sig
-sha256  e6adbebcfbc95867de01060d93c789938cf89cc1d1f6ef9ef661890f6217451f  gnutls-3.7.4.tar.xz
+# https://www.gnupg.org/ftp/gcrypt/gnutls/v3.7/gnutls-3.7.6.tar.xz.sig
+sha256  77065719a345bfb18faa250134be4c53bef70c1bd61f6c0c23ceb8b44f0262ff  gnutls-3.7.6.tar.xz
 # Locally calculated
 sha256  e79e9c8a0c85d735ff98185918ec94ed7d175efc377012787aebcf3b80f0d90b  doc/COPYING
 sha256  6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3  doc/COPYING.LESSER
diff --git a/package/gnutls/gnutls.mk b/package/gnutls/gnutls.mk
index f7f3e046e..f1af1e7b3 100644
--- a/package/gnutls/gnutls.mk
+++ b/package/gnutls/gnutls.mk
@@ -6,7 +6,7 @@
 
 # When bumping, make sure *all* --without-libfoo-prefix options are in GNUTLS_CONF_OPTS
 GNUTLS_VERSION_MAJOR = 3.7
-GNUTLS_VERSION = $(GNUTLS_VERSION_MAJOR).4
+GNUTLS_VERSION = $(GNUTLS_VERSION_MAJOR).6
 GNUTLS_SOURCE = gnutls-$(GNUTLS_VERSION).tar.xz
 GNUTLS_SITE = https://www.gnupg.org/ftp/gcrypt/gnutls/v$(GNUTLS_VERSION_MAJOR)
 GNUTLS_LICENSE = LGPL-2.1+ (core library)
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
