Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 781F9C433F5
	for <buildroot@archiver.kernel.org>; Tue, 17 May 2022 20:19:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 199B160B6A;
	Tue, 17 May 2022 20:19:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id D688kNB8YvIG; Tue, 17 May 2022 20:19:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1FAEA60B07;
	Tue, 17 May 2022 20:19:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B21A41BF83C
 for <buildroot@lists.busybox.net>; Tue, 17 May 2022 20:19:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9F613400D6
 for <buildroot@lists.busybox.net>; Tue, 17 May 2022 20:19:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id S9O2NIOwjtha for <buildroot@lists.busybox.net>;
 Tue, 17 May 2022 20:19:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com
 [IPv6:2607:f8b0:4864:20::d36])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CE76B400D0
 for <buildroot@buildroot.org>; Tue, 17 May 2022 20:19:18 +0000 (UTC)
Received: by mail-io1-xd36.google.com with SMTP id z18so36908iob.5
 for <buildroot@buildroot.org>; Tue, 17 May 2022 13:19:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VO/RGGq60y1xnuEZLfk5uA9YfAvn/3kBfSqyf3OOngI=;
 b=mTWiDiI6IZvzRwyHXqxdxFPJMDULPcS3r7qoxgNG73eSSluvYfU/JhMdq64oG3RZG0
 HCQBm92VXVzk6f3MR5EWrn9c9Qunlv4WrVlglCfM6dIu+4VFRpVxaJKH8Mcdw8RZr06J
 D6Y3QaaFsVs4Nn1G6z5xl2rUwvDRI9+efsgZY3Ht9J/pgZFO/BUugwcVjgBbdaCCnQ8+
 NTUUMFvj/boxi36K+iU5IwcUW7Kggw9y5R4wR2hxLJSVfvl7lyidVOW7xhkEPYj3K3k/
 4Z3Vk6lRU1YZwpbA96V/UPNXfKilh/3XgKJqL9/ZmFidWzALgw5465Bem21JWfHWHYBZ
 3+WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VO/RGGq60y1xnuEZLfk5uA9YfAvn/3kBfSqyf3OOngI=;
 b=OTU3tOyr+3mKEgeaWcHCnMEyCPr9rQ4gTS+xfPaICPUkQDoUXFUxolFs9mQWa/M3XE
 NS/nsguSH+HyrMdJJyC+4nbehjrO63L3+NLqs8dcHO2+/BvuRgBpWGzvnqHuTajVQJMM
 JJ7oXmThp9xC0MqWpAu3QRT2mcxqWkU604mwPAd0VOPKeojB8wf92lYSFyRi3DKueTgV
 curS+Sl065rzgol8bWouIe3o97pBZ+fpst3HS8iVw2DCmpvTIqwqA5sEEeNX+pVy1OQt
 BRAd6uHPlXuiH2ej8M65FhORMZP9ShxOeHh7Jgb00a2W+xzKSOZppv3ogMJB4sJFrh3n
 wwLw==
X-Gm-Message-State: AOAM533V0KWVHI5UXG+DovPg1mzH6exAssTVC551Cqfp4fU6s6EEFSai
 qmsei6Uj5KYmfNxzKo+lIDT45JjSQ3c=
X-Google-Smtp-Source: ABdhPJwDBOrdaCFp8OiX6BSjYuxZHIHNu8keSYLNeWHIIAXkptFQDR/9L9lK/Vbd6n60zNLYxg3slg==
X-Received: by 2002:a05:6602:2dc4:b0:648:adac:bae8 with SMTP id
 l4-20020a0566022dc400b00648adacbae8mr11439331iow.9.1652818757849; 
 Tue, 17 May 2022 13:19:17 -0700 (PDT)
Received: from james-x399.localdomain (97-118-134-20.hlrn.qwest.net.
 [97.118.134.20]) by smtp.gmail.com with ESMTPSA id
 r24-20020a028818000000b0032b52f27d73sm19402jai.57.2022.05.17.13.19.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 May 2022 13:19:17 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 17 May 2022 14:19:16 -0600
Message-Id: <20220517201916.1521398-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-click: bump to version 8.1.3
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

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-click/python-click.hash | 6 +++---
 package/python-click/python-click.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-click/python-click.hash b/package/python-click/python-click.hash
index fb6e457ad5..81d19c419e 100644
--- a/package/python-click/python-click.hash
+++ b/package/python-click/python-click.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/click/json
-md5  53692f62cb99a1a10c59248f1776d9c0  click-7.1.2.tar.gz
-sha256  d2b5255c7c6349bc1bd1e59e08cd12acbbd63ce649f2588755783aa94dfb6b1a  click-7.1.2.tar.gz
-# Locally computed sha256
+md5  a804b085de7a3ff96968e38e0f6f2e05  click-8.1.3.tar.gz
+sha256  7682dc8afb30297001674575ea00d1814d808d6a36af415a82bd481d37ba7b8e  click-8.1.3.tar.gz
+# Locally computed sha256 checksums
 sha256  9a8ad106a394e853bfe21f42f4e72d592819a22805d991b5f3275029292b658d  LICENSE.rst
diff --git a/package/python-click/python-click.mk b/package/python-click/python-click.mk
index a829257f5e..6444d0148e 100644
--- a/package/python-click/python-click.mk
+++ b/package/python-click/python-click.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CLICK_VERSION = 7.1.2
+PYTHON_CLICK_VERSION = 8.1.3
 PYTHON_CLICK_SOURCE = click-$(PYTHON_CLICK_VERSION).tar.gz
-PYTHON_CLICK_SITE = https://files.pythonhosted.org/packages/27/6f/be940c8b1f1d69daceeb0032fee6c34d7bd70e3e649ccac0951500b4720e
+PYTHON_CLICK_SITE = https://files.pythonhosted.org/packages/59/87/84326af34517fca8c58418d148f2403df25303e02736832403587318e9e8
 PYTHON_CLICK_LICENSE = BSD-3-Clause
 PYTHON_CLICK_LICENSE_FILES = LICENSE.rst
 PYTHON_CLICK_SETUP_TYPE = setuptools
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
