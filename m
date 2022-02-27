Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFAFBC433F5
	for <buildroot@archiver.kernel.org>; Sun, 27 Feb 2022 10:36:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4A89A828E3;
	Sun, 27 Feb 2022 10:36:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3GWmfxnA-A6c; Sun, 27 Feb 2022 10:36:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 831EB82894;
	Sun, 27 Feb 2022 10:36:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8CACB1BF2F9
 for <buildroot@lists.busybox.net>; Sun, 27 Feb 2022 10:36:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 892D8606E7
 for <buildroot@lists.busybox.net>; Sun, 27 Feb 2022 10:36:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Msa2vDKDh19P for <buildroot@lists.busybox.net>;
 Sun, 27 Feb 2022 10:36:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 82E9C6068F
 for <buildroot@buildroot.org>; Sun, 27 Feb 2022 10:36:10 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id d28so11074112wra.4
 for <buildroot@buildroot.org>; Sun, 27 Feb 2022 02:36:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=D9s1WHsNNKV5yzU2cdtKhaxIGG0UU0FTyHHrcaAJmXM=;
 b=a25qmBXgRt5p3088NAzLvF1wM11EU8u+PxrUOV4ILy4W43DWKkgqTF3w5ZFbR30QBP
 uBU6rpGKccj4tSuSeaou2++9NaVwOwIAb+OwaYETryXMWzPWL2Mj6vzhvqtJUHJJHRLH
 asBDBjgvz62u5sOC10syegkZAJBbQdOGmRvSbdSz8qfbqXrvskReRDhIaWao8zx8L0Ba
 9zZ7EK4JMAQTHDBtFaZxEgWA8UCb3tezdXBoxemuDKXv0d9LonTVVQ5YuDPLilBdf/YD
 OJSyH4InxjlnUrfx3aK30dETjkmAsgxPtBCdW5DzWaf2KD/heb3wbdGfkzXUQVsDf0kl
 qC8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=D9s1WHsNNKV5yzU2cdtKhaxIGG0UU0FTyHHrcaAJmXM=;
 b=MUuHYTBIcV9O4uzP7pnS5t291cmfqVcXgU15td89Tz/D71Sfr0lpcYXpTMGgdbiljh
 s+HXlJRDHqloDNBxImkZgtiyS1AQ7OEFjS6wiqZqUXiLCnQ17FWgGvxYpBznR5xbR+sN
 3yUUip0eP1ftuJJmLEgX86gAtcGrUUajoaizVM5O2cnDNyNQbO3BkckYu+kWqeIINhfo
 3Ke3MLrWbXYzYigD5ZdLUrOeSiVb5FqZlCtrF7j53JVw8hyqaW404KFnlPBInTxgU6Cp
 EvxF4MMlLHe01p4a11M9sj1VgxyACSRXeVZ3YpxFinsaNfs+5Ne75fYbx0dfxBzY8YFa
 5sfQ==
X-Gm-Message-State: AOAM5334q9MKD1wQ1hFGeQ3XizG0CJOf+Z9/7KJIefTXDk+xwRWk8uDI
 AqnzcS54RyQtyWvQZMTmVeIo8mDwxwc=
X-Google-Smtp-Source: ABdhPJxZ0fKjsdAZ9TZxCvEeTtDL9C+rzUOz3xpcF1f9Ohp2Y3pvHd4g281gveq72k8E46lJQBiemw==
X-Received: by 2002:a5d:6106:0:b0:1ed:b56f:73f7 with SMTP id
 v6-20020a5d6106000000b001edb56f73f7mr13179043wrt.601.1645958168491; 
 Sun, 27 Feb 2022 02:36:08 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 a3-20020adfe5c3000000b001e68a5e1c20sm7293835wrn.4.2022.02.27.02.36.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Feb 2022 02:36:08 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 27 Feb 2022 11:35:27 +0100
Message-Id: <20220227103528.3888282-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH/next 1/2] package/valijson: drop boost dependency
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
Cc: Matt Weber <matthew.weber@collins.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

boost is not mandatory since the deactivation of tests when bumping to
version 0.2.0 in commit d8e2876104be3f9f01613b17d3e60120883be1a1 and
https://github.com/tristanpenman/valijson/commit/1844241d2a2379bca79a0d654f4b007209b10883

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/valijson/Config.in   | 8 ++------
 package/valijson/valijson.mk | 1 -
 2 files changed, 2 insertions(+), 7 deletions(-)

diff --git a/package/valijson/Config.in b/package/valijson/Config.in
index 10721b3703..07706cd963 100644
--- a/package/valijson/Config.in
+++ b/package/valijson/Config.in
@@ -1,10 +1,6 @@
 config BR2_PACKAGE_VALIJSON
 	bool "valijson"
-	depends on BR2_USE_WCHAR
 	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_TOOLCHAIN_HAS_THREADS
-	select BR2_PACKAGE_BOOST
-	select BR2_PACKAGE_BOOST_REGEX
 	help
 	  Valijson is a header-only JSON Schema Validation library for
 	  C++. Valijson provides a simple validation API that allows
@@ -14,5 +10,5 @@ config BR2_PACKAGE_VALIJSON
 
 	  https://github.com/tristanpenman/valijson
 
-comment "valijson needs a toolchain w/ C++, threads, wchar  support"
-	depends on !BR2_INSTALL_LIBSTDCPP  || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
+comment "valijson needs a toolchain w/ C++"
+	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/valijson/valijson.mk b/package/valijson/valijson.mk
index e425757d26..71c5b05f2b 100644
--- a/package/valijson/valijson.mk
+++ b/package/valijson/valijson.mk
@@ -11,7 +11,6 @@ VALIJSON_LICENSE_FILES = LICENSE
 VALIJSON_CPE_ID_VENDOR = valijson_project
 VALIJSON_INSTALL_STAGING = YES
 VALIJSON_INSTALL_TARGET = NO
-VALIJSON_DEPENDENCIES = boost
 VALIJSON_CONF_OPTS = -Dvalijson_INSTALL_HEADERS=TRUE -Dvalijson_BUILD_TESTS=FALSE
 
 $(eval $(cmake-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
