Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F2D2C43334
	for <buildroot@archiver.kernel.org>; Mon, 13 Jun 2022 20:33:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 27BE360EA1;
	Mon, 13 Jun 2022 20:33:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cC_UtTXP2TiB; Mon, 13 Jun 2022 20:33:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 44DA160E98;
	Mon, 13 Jun 2022 20:33:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 475351BF37C
 for <buildroot@lists.busybox.net>; Mon, 13 Jun 2022 20:33:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 35DB360A94
 for <buildroot@lists.busybox.net>; Mon, 13 Jun 2022 20:33:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9XpXsfdBuFbW for <buildroot@lists.busybox.net>;
 Mon, 13 Jun 2022 20:33:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E38D160E44
 for <buildroot@buildroot.org>; Mon, 13 Jun 2022 20:33:51 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id k19so8509619wrd.8
 for <buildroot@buildroot.org>; Mon, 13 Jun 2022 13:33:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6pTm6Kv2nh2W81HEYTQ+exkIIbf1c7M3YVm89xm3V2k=;
 b=g5jvbuBid7rV1qMARyldZiNPoHfLv0LKWyGP0C3GeXVmn7NsvMxq+vw4Wcd+wNJZnw
 A08knJE72/tL7yx8orvk0aiKNN2gHF2XKLooOdoFhB5dD79LNO4ho9ccfmnOoojop9Ik
 rqPA7n5Ok+X8d9k42PFPJTqwB+QpkWur7xkuxEKhgOnc/tZGR6XStN6iOeQU1zk7puKg
 Gcd7VOUmGmlcJRr6YRKEwk8TeKydeHSrctG7sWwcGJtT+y2cjjlC6mlgC8gyyBRX7dna
 TLe6jVNEBs3GzaZhsLPC2YVSwY6MacU5UicnZ3gsO8Vb46mbfEfzZ1wQJBeI6mSy9NdQ
 kyMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6pTm6Kv2nh2W81HEYTQ+exkIIbf1c7M3YVm89xm3V2k=;
 b=5q4v7yGTkacelXEu8Tt7tQAybzsYPLasF3piYwe+PUUMkFHTS3kRAmKv+wde8qAwGr
 JYIGMUT9hoX73w0RMb6lKJH++A+ueTnXgrmraDPrDtcJX0gySILyo9f81QYJm+4ikHrc
 GwC+frn1jawS1+F5a2TX8wPuVNAeEmrXpQDWQanEL5egWLMjQBi2/Q3u1EyWWJ/mNqop
 rWXVLn2wekMNDkvZy9m3PgWMbm9hXtSmwKQeYBpaqBPqc5xSX+QXQVj1Tf/039V5oeAs
 Yrl5csw3z2y2+vTnlpVUU6Uqjp97RSfTte2VETsWgYnHZ0Ogn5PFYMHO0o0iNIYD6nQp
 LCbQ==
X-Gm-Message-State: AJIora9WYzFkIEihdUv4xQHH1C9uNuGVX0Vdy5KAx1/awNdaCnC/Zy/x
 /THhBKszP7JMSSflS/jdFoVq1l9nzqc=
X-Google-Smtp-Source: AGRyM1tXqHIZ/VFY45Hca8sZnl/ILpVm6R9pdqHXnF8a32xBC/wW5a5CQKYwc4yKNWxN9ccqO92cxg==
X-Received: by 2002:a5d:584d:0:b0:216:a2a9:5f2c with SMTP id
 i13-20020a5d584d000000b00216a2a95f2cmr1543685wrf.184.1655152429766; 
 Mon, 13 Jun 2022 13:33:49 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 h9-20020a05600c350900b0039c4d022a44sm11584886wmq.1.2022.06.13.13.33.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jun 2022 13:33:48 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 13 Jun 2022 22:31:12 +0200
Message-Id: <20220613203113.294535-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] package/ecryptfs-utils: add pkcs11-helper
 optional dependency
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Marcin Bis <marcin@bis.org.pl>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

pkcs11-helper is an optional dependency which needs openssl

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/ecryptfs-utils/ecryptfs-utils.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/ecryptfs-utils/ecryptfs-utils.mk b/package/ecryptfs-utils/ecryptfs-utils.mk
index 737c5b0ebb..393ea4da78 100644
--- a/package/ecryptfs-utils/ecryptfs-utils.mk
+++ b/package/ecryptfs-utils/ecryptfs-utils.mk
@@ -26,6 +26,14 @@ endif
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 ECRYPTFS_UTILS_CONF_OPTS += --enable-openssl
 ECRYPTFS_UTILS_DEPENDENCIES += openssl
+
+ifeq ($(BR2_PACKAGE_PKCS11_HELPER),y)
+ECRYPTFS_UTILS_CONF_OPTS += --enable-pkcs11-helper
+ECRYPTFS_UTILS_DEPENDENCIES += pkcs11-helper
+else
+ECRYPTFS_UTILS_CONF_OPTS += --disable-pkcs11-helper
+endif
+
 else
 ECRYPTFS_UTILS_CONF_OPTS += --disable-openssl
 endif
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
