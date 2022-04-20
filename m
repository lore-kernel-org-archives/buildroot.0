Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D53FC433F5
	for <buildroot@archiver.kernel.org>; Wed, 20 Apr 2022 18:20:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 33DFE823C6;
	Wed, 20 Apr 2022 18:20:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ou_MA_rE0shl; Wed, 20 Apr 2022 18:20:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 380A781D2D;
	Wed, 20 Apr 2022 18:20:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 02BBA1BF3B0
 for <buildroot@lists.busybox.net>; Wed, 20 Apr 2022 18:20:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F40EA81B35
 for <buildroot@lists.busybox.net>; Wed, 20 Apr 2022 18:20:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id n-_pBcs_JACU for <buildroot@lists.busybox.net>;
 Wed, 20 Apr 2022 18:20:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-x12f.google.com (mail-il1-x12f.google.com
 [IPv6:2607:f8b0:4864:20::12f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2BE3D81D2D
 for <buildroot@buildroot.org>; Wed, 20 Apr 2022 18:20:16 +0000 (UTC)
Received: by mail-il1-x12f.google.com with SMTP id e1so1537821ile.2
 for <buildroot@buildroot.org>; Wed, 20 Apr 2022 11:20:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7K2yOi4xC1YK0z7sUYWVi/ZjGNPXko82mru94VzM130=;
 b=H1eWgN9d3IRcIQCswNL5Cc7eVWBepVhKCydX9GcE8QinE7zHHw44t7vMMFyA/Ln5Bu
 DiLR5TgkWq9EGQs7E/zK627JIdZKa8hNXRW+MBHtAHAmEZa0B8UIEWbk0S7dSh8X4HsZ
 KDsg7FYGaELH837cCv7kbZ9YbOtsrrwMhcWFXstp0RCjbk3pStUJ6usjsGxhWHhE5RhN
 1Pt2PwYBYG0sAKwn4jiLplettgq14++Wuuvo6JMWsT/7tPk3LNHQNfSGWKc30dmn4bkb
 mCjDzvKfA3FwJtsaoqCIDfY4CmMNicrMIy2zyfxEzO29E6ZEtxD1+mOZ58NzyP8bdtk2
 JXCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7K2yOi4xC1YK0z7sUYWVi/ZjGNPXko82mru94VzM130=;
 b=qffmDPEOyCQljvtJOsQd2jOlNilunWxBTcELDQtjfqIcgcSK760TADtDgwDoBbB8d3
 lekqlbTNFVsYARSVwCnoJaARDddvYktDLcL9yRqm9KemVk9+/vZqgGa4JBksloB15gbQ
 NZ8l4wK5OPirIU/kWDh6W+6YvVc8uM7EVDBfere2rmaZ3HESmrjuxuUSgi5MTmCwLiNJ
 ZEPUcqSmHNY26hzEisO+OLD8wY3e0MPbslAl8XJmZL1As1vIKlLgzaxl7DhN/l1/n0Hx
 J859imgcD+bPvYOByUU6YMwxQ3bLNFWjnrokzCsve55Uwdm591sv52p2N8T5B4NBcCvA
 T/ig==
X-Gm-Message-State: AOAM531r5xS8fyQNnrhP77cqBOLOkPdhYaHwieLljdpeDw4dJEhkJuNn
 VJO3PnPKg2/qYH8dQxc9VSvPQUPaTHX8wg==
X-Google-Smtp-Source: ABdhPJwP6lfwX1Wce2+yCfRUaqpGCOwDjXL2ZX8nEuhu7/PgiTaTo5qC8oFXuVXHeoGXuh9Vi5a27Q==
X-Received: by 2002:a05:6e02:13e6:b0:2ca:a5b3:fa34 with SMTP id
 w6-20020a056e0213e600b002caa5b3fa34mr10209412ilj.273.1650478815027; 
 Wed, 20 Apr 2022 11:20:15 -0700 (PDT)
Received: from james-x399.localdomain (97-118-252-238.hlrn.qwest.net.
 [97.118.252.238]) by smtp.gmail.com with ESMTPSA id
 o16-20020a92c690000000b002cbf7f76878sm9032627ilg.6.2022.04.20.11.20.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 11:20:14 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 20 Apr 2022 12:20:13 -0600
Message-Id: <20220420182013.763567-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-charset-normalizer: bump to
 version 2.0.12
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 .../python-charset-normalizer/python-charset-normalizer.hash  | 4 ++--
 .../python-charset-normalizer/python-charset-normalizer.mk    | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-charset-normalizer/python-charset-normalizer.hash b/package/python-charset-normalizer/python-charset-normalizer.hash
index 3c6e58a616..da540bbb8f 100644
--- a/package/python-charset-normalizer/python-charset-normalizer.hash
+++ b/package/python-charset-normalizer/python-charset-normalizer.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/charset-normalizer/json
-md5  2abe3754fef25c99799a518cb83a81ae  charset-normalizer-2.0.11.tar.gz
-sha256  98398a9d69ee80548c762ba991a4728bfc3836768ed226b3945908d1a688371c  charset-normalizer-2.0.11.tar.gz
+md5  f6664e0e90dbb3cc9cfc154a980f9864  charset-normalizer-2.0.12.tar.gz
+sha256  2857e29ff0d34db842cd7ca3230549d1a697f96ee6d3fb071cfa6c7393832597  charset-normalizer-2.0.12.tar.gz
 # Locally computed sha256 checksums
 sha256  eb31a0c5a4fb09b8a4e32055d25c1e5f9c358a2752fef3cd720213d1ccfee241  LICENSE
diff --git a/package/python-charset-normalizer/python-charset-normalizer.mk b/package/python-charset-normalizer/python-charset-normalizer.mk
index c37b068b36..0742fac639 100644
--- a/package/python-charset-normalizer/python-charset-normalizer.mk
+++ b/package/python-charset-normalizer/python-charset-normalizer.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CHARSET_NORMALIZER_VERSION = 2.0.11
+PYTHON_CHARSET_NORMALIZER_VERSION = 2.0.12
 PYTHON_CHARSET_NORMALIZER_SOURCE = charset-normalizer-$(PYTHON_CHARSET_NORMALIZER_VERSION).tar.gz
-PYTHON_CHARSET_NORMALIZER_SITE = https://files.pythonhosted.org/packages/e8/e8/b6cfd28fb430b2ec9923ad0147025bf8bbdf304b1eb3039b69f1ce44ed6e
+PYTHON_CHARSET_NORMALIZER_SITE = https://files.pythonhosted.org/packages/56/31/7bcaf657fafb3c6db8c787a865434290b726653c912085fbd371e9b92e1c
 PYTHON_CHARSET_NORMALIZER_SETUP_TYPE = setuptools
 PYTHON_CHARSET_NORMALIZER_LICENSE = MIT
 PYTHON_CHARSET_NORMALIZER_LICENSE_FILES = LICENSE
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
