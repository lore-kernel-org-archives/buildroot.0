Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8397C433EF
	for <buildroot@archiver.kernel.org>; Fri, 18 Feb 2022 10:27:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 71CF741D42;
	Fri, 18 Feb 2022 10:27:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3mpzYrZwIKQR; Fri, 18 Feb 2022 10:27:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A6B8341CDD;
	Fri, 18 Feb 2022 10:27:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BE4231BF311
 for <buildroot@lists.busybox.net>; Fri, 18 Feb 2022 10:27:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A0B0941CDD
 for <buildroot@lists.busybox.net>; Fri, 18 Feb 2022 10:27:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xQB4d24H0kG9 for <buildroot@lists.busybox.net>;
 Fri, 18 Feb 2022 10:27:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AED2041513
 for <buildroot@buildroot.org>; Fri, 18 Feb 2022 10:27:10 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id w13so4442249wmi.2
 for <buildroot@buildroot.org>; Fri, 18 Feb 2022 02:27:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kA/lUXNwm4n0B/8IREnbh1PpMtHmpPQ5zIB4hU9Y8z4=;
 b=WiLtQIlMeaccZ6RmeS50V5Vtp5FqdZ+popGHkbEb43WpvNS3IqJcvEnrQZmZVPUqUr
 yeE30dWWbaVsTqkMLzxI/aPz0BPqVjNQttmxumoZk6n5iaa3hqLJ7Vs5DaG8BpNoHxH3
 8UFa5nEwN8OEVTOLaHWhL3uIxQsy1sxzTHRQ9FB7keENmlErZIrb4HkIMQ7Fa4pX0oF6
 dddrtnnWN7aQKKHQjk+tvPw9Qz/4sxJivPxnBDjoQEoDm4zPwlYK0lZcjRXAdGj2y3my
 xWXFpW6oE1pFxHvDvNaoPzvIgghw6QowyZQZA3KoYvm+zINbqBud8F3KiR6+Yf82m+3C
 dcQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kA/lUXNwm4n0B/8IREnbh1PpMtHmpPQ5zIB4hU9Y8z4=;
 b=s/2wPS2jdJyMt/ImwmxIrGZx/WRt5V/T3XYs2OekpB7MUrrYPhY/WrwnTU9L9mG/3s
 S73mGtalJ3nsLvhcRd3WTJQl2i9LGaiazuUoYCbxOC82THYnJbKikxHCNQ4eBwuj8wiA
 w06hQ5y6RIGpAHNqcxSf4LhtrZARON4j9Xcduzcmubk15ktZQCuklYt4wGm7JQG7W8dJ
 k7MuL2sz+Ds3CGVtGz0zS4PPNInM98++a2WCDBeGD9cLL1LL/OOUMfVqr5lCvg+t4cm1
 2L2ng0RwfZsuu7d0AURBqCopiUz+BjqgrPBMzh8EdZUdse8bPI/JEllWMLNCO+m4A9PP
 /4JA==
X-Gm-Message-State: AOAM533RqSOatXLTx1ML9oev29i1zUu4fwl++/GeJCwCT5+V3Y0GGolF
 7TIblBWFOWAKjPhg38bKi0RLpH+babw=
X-Google-Smtp-Source: ABdhPJwCXfH7C7cJoBb9zRh2I/rrZsyKV+0O6ao7jgXO5It1ZCxkstIFtvxTboOOOue0NTuaLJcPpA==
X-Received: by 2002:a05:600c:2b82:b0:37b:fb77:aff with SMTP id
 j2-20020a05600c2b8200b0037bfb770affmr10173082wmc.152.1645180028668; 
 Fri, 18 Feb 2022 02:27:08 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id k34sm4025460wms.35.2022.02.18.02.27.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Feb 2022 02:27:08 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 18 Feb 2022 11:27:19 +0100
Message-Id: <20220218102719.693274-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/pkg-python: fix headers install
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
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

For an unknown reason, installation of headers is broken since commit
7c1bb5c2bfdc9d726c41a66b30b7aa8e759c6596 which sets _PYTHON_PROJECT_BASE

As _PYTHON_PROJECT_BASE value seems correct and fix its own build
failures, use --install-headers to set install path for headers and
avoid the following build failure with python-greenlet or python-pygame:

python-greenlet: installs files in /home/peko/autobuild/instance-0/output-1/target//home/peko/autobuild/instance-0/output-1

python-pygame: installs files in /home/peko/autobuild/instance-1/output-1/target//home/peko/autobuild/instance-1/output-1

Fixes:
 - http://autobuild.buildroot.org/results/f5b52dee7e72f0a1f72b9f87723bc585743c7b31
 - http://autobuild.buildroot.org/results/9eb2685d32756864000e1b38f8a183b57f6ea528

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/pkg-python.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/pkg-python.mk b/package/pkg-python.mk
index b8dc9cd9e5..c4e590bd70 100644
--- a/package/pkg-python.mk
+++ b/package/pkg-python.mk
@@ -51,10 +51,12 @@ PKG_PYTHON_DISTUTILS_BUILD_OPTS = \
 	--executable=/usr/bin/python
 
 PKG_PYTHON_DISTUTILS_INSTALL_TARGET_OPTS = \
+	--install-headers=/usr/include/python$(PYTHON3_VERSION_MAJOR) \
 	--prefix=/usr \
 	--root=$(TARGET_DIR)
 
 PKG_PYTHON_DISTUTILS_INSTALL_STAGING_OPTS = \
+	--install-headers=/usr/include/python$(PYTHON3_VERSION_MAJOR) \
 	--prefix=/usr \
 	--root=$(STAGING_DIR)
 
@@ -81,12 +83,14 @@ PKG_PYTHON_SETUPTOOLS_ENV = \
 	_python_exec_prefix=/usr
 
 PKG_PYTHON_SETUPTOOLS_INSTALL_TARGET_OPTS = \
+	--install-headers=/usr/include/python$(PYTHON3_VERSION_MAJOR) \
 	--prefix=/usr \
 	--executable=/usr/bin/python \
 	--single-version-externally-managed \
 	--root=$(TARGET_DIR)
 
 PKG_PYTHON_SETUPTOOLS_INSTALL_STAGING_OPTS = \
+	--install-headers=/usr/include/python$(PYTHON3_VERSION_MAJOR) \
 	--prefix=/usr \
 	--executable=/usr/bin/python \
 	--single-version-externally-managed \
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
