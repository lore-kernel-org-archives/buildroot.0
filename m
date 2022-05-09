Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1325EC433EF
	for <buildroot@archiver.kernel.org>; Mon,  9 May 2022 02:17:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A4CFE409EC;
	Mon,  9 May 2022 02:17:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id C9CshThAYK74; Mon,  9 May 2022 02:17:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AFCE1409E3;
	Mon,  9 May 2022 02:17:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2C48D1BF3D9
 for <buildroot@lists.busybox.net>; Mon,  9 May 2022 02:17:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 28373409EA
 for <buildroot@lists.busybox.net>; Mon,  9 May 2022 02:17:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id e0CPW-IHsLKp for <buildroot@lists.busybox.net>;
 Mon,  9 May 2022 02:17:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-x129.google.com (mail-il1-x129.google.com
 [IPv6:2607:f8b0:4864:20::129])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4233A40363
 for <buildroot@buildroot.org>; Mon,  9 May 2022 02:17:13 +0000 (UTC)
Received: by mail-il1-x129.google.com with SMTP id f5so8398557ilj.13
 for <buildroot@buildroot.org>; Sun, 08 May 2022 19:17:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7tRf2asdailhrhoWlEzTkDjHAvMsuDicMFPOJSYFtj0=;
 b=BpdRkzd5REm9Vb5tTbLion9Ip9Gp27ZUciGF8VghFh0qwrHS377Rk+9KhTZCWG0GRt
 of2s6qeICxVqoa2pQQgq/I01o9s4Hu5CbIGoPmLVBvz5cDo7fKxHkEHdLScjQ0yEYpJr
 e/2ojTKpy7nm2wCjnXms49BlvvkewUpUNc3sagbDifaLxkLlTA8j/fChIcFD/zfAV7cj
 DPQQ1cEVp3p8l5L/0/t1KPdrpKCroqD6NLHJ92gVs6Fox17ISn/bgcF9o0BEJPFLoSfU
 OOKEdSkv/ap9jv62jmhxjHFkbYwv2nkHU4OWxm/IzzycYItTq/GqHR+s6T7Yr0AmmwaH
 +2Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7tRf2asdailhrhoWlEzTkDjHAvMsuDicMFPOJSYFtj0=;
 b=3TKw6GKjbBeWqAx8ml7hFb+Qxtp1JkCXe3cHitUkQHAJZRM29oUbYBhnHi0FVbex8+
 cvvzq8SEZdART7iwZKkWSjbUexiuyEqqVl56+3QFwPZ976uBUqpAF2XlstncD3heLKNf
 KPaM+deCtAIjKaTmZalYQTYOSz25Uwmvvnuhkk2Kbx9TA8OacZ59mJsMiAfVyNrpZFvC
 JOZrQBZkVXQTs4lQCNgxRadUDCj4r/QubouyjHDdY47C4MWJHzt1qgRTzcWHJFldGlLm
 GAi0OgfphS3FvVPwGONRwFjf77QIctgJQDV/CPwNaO2XBEzIxzHQkRLQgbSki+wTd55m
 ot3w==
X-Gm-Message-State: AOAM532HzcSDDya/9fjuVMMKJafLcfa88IHPou8CKlLDP2gNy8vA+JHl
 a9ABtnSJN5SiQ1dppxYKy0kiIQrOWh4=
X-Google-Smtp-Source: ABdhPJzcCyB5cUHSBT0SqiHWW+HGFnx+66iQeTHWpwadk0qEHOkYx0OevGJFjd2POCQ6wjTdb+OWNQ==
X-Received: by 2002:a05:6e02:1605:b0:2cf:99a5:1069 with SMTP id
 t5-20020a056e02160500b002cf99a51069mr2991892ilu.293.1652062632206; 
 Sun, 08 May 2022 19:17:12 -0700 (PDT)
Received: from james-x399.localdomain (97-118-252-238.hlrn.qwest.net.
 [97.118.252.238]) by smtp.gmail.com with ESMTPSA id
 g15-20020a92cdaf000000b002cde6e352e7sm2756247ild.49.2022.05.08.19.17.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 May 2022 19:17:11 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  8 May 2022 20:17:10 -0600
Message-Id: <20220509021710.1865154-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-service-identity: bump to
 version 21.1.0
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
Cc: Mauro Condarelli <mc5686@mclink.it>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Drop BR2_PACKAGE_PYTHON_CHARACTERISTIC runtime dependency which is no
longer used.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-service-identity/Config.in                 | 1 -
 .../python-service-identity/python-service-identity.hash  | 8 ++++----
 .../python-service-identity/python-service-identity.mk    | 6 +++---
 3 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/package/python-service-identity/Config.in b/package/python-service-identity/Config.in
index aa6d0fe715..d6ca060562 100644
--- a/package/python-service-identity/Config.in
+++ b/package/python-service-identity/Config.in
@@ -4,7 +4,6 @@ config BR2_PACKAGE_PYTHON_SERVICE_IDENTITY
 	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
 	# python-pyopenssl -> python-cryptography
 	select BR2_PACKAGE_PYTHON_ATTRS # runtime
-	select BR2_PACKAGE_PYTHON_CHARACTERISTIC # runtime
 	select BR2_PACKAGE_PYTHON_PYASN1 # runtime
 	select BR2_PACKAGE_PYTHON_PYASN1_MODULES # runtime
 	select BR2_PACKAGE_PYTHON_PYOPENSSL # runtime
diff --git a/package/python-service-identity/python-service-identity.hash b/package/python-service-identity/python-service-identity.hash
index 9a20d08925..f648918dbd 100644
--- a/package/python-service-identity/python-service-identity.hash
+++ b/package/python-service-identity/python-service-identity.hash
@@ -1,5 +1,5 @@
-# md5, sha256 from https://pypi.org/pypi/service_identity/json
-md5	c6b8bac93e7d899a1da313a19cc6570a  service_identity-18.1.0.tar.gz
-sha256	0858a54aabc5b459d1aafa8a518ed2081a285087f349fe3e55197989232e2e2d  service_identity-18.1.0.tar.gz
+# md5, sha256 from https://pypi.org/pypi/service-identity/json
+md5  5e5c195d8fcedc72f9068be2ad9b5a13  service-identity-21.1.0.tar.gz
+sha256  6e6c6086ca271dc11b033d17c3a8bea9f24ebff920c587da090afc9519419d34  service-identity-21.1.0.tar.gz
 # Locally computed sha256 checksums
-sha256	c5075126e1272b176504e36af369781a95c5c1124239da8e4f61b0f9c15a56cf  LICENSE
+sha256  c5075126e1272b176504e36af369781a95c5c1124239da8e4f61b0f9c15a56cf  LICENSE
diff --git a/package/python-service-identity/python-service-identity.mk b/package/python-service-identity/python-service-identity.mk
index 5330239e48..e4ae8e6889 100644
--- a/package/python-service-identity/python-service-identity.mk
+++ b/package/python-service-identity/python-service-identity.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SERVICE_IDENTITY_VERSION = 18.1.0
-PYTHON_SERVICE_IDENTITY_SOURCE = service_identity-$(PYTHON_SERVICE_IDENTITY_VERSION).tar.gz
-PYTHON_SERVICE_IDENTITY_SITE = https://files.pythonhosted.org/packages/9a/3d/9eb0563e066ea0540cf580695593ab079376e920016d4d1b3ff2fd8abf4b
+PYTHON_SERVICE_IDENTITY_VERSION = 21.1.0
+PYTHON_SERVICE_IDENTITY_SOURCE = service-identity-$(PYTHON_SERVICE_IDENTITY_VERSION).tar.gz
+PYTHON_SERVICE_IDENTITY_SITE = https://files.pythonhosted.org/packages/09/2e/26ade69944773df4748c19d3053e025b282f48de02aad84906d34a29d28b
 PYTHON_SERVICE_IDENTITY_LICENSE = MIT
 PYTHON_SERVICE_IDENTITY_LICENSE_FILES = LICENSE
 PYTHON_SERVICE_IDENTITY_SETUP_TYPE = setuptools
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
