Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7BDBC433F5
	for <buildroot@archiver.kernel.org>; Mon, 24 Jan 2022 10:40:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 92FAC83DF3;
	Mon, 24 Jan 2022 10:40:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QQXngpFN-UNR; Mon, 24 Jan 2022 10:40:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D105783323;
	Mon, 24 Jan 2022 10:40:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A4B891BF3A4
 for <buildroot@lists.busybox.net>; Mon, 24 Jan 2022 10:40:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A075A60DB7
 for <buildroot@lists.busybox.net>; Mon, 24 Jan 2022 10:40:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Mcf0wzyeuaTq for <buildroot@lists.busybox.net>;
 Mon, 24 Jan 2022 10:40:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com
 [IPv6:2607:f8b0:4864:20::d2a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7D4C860D73
 for <buildroot@buildroot.org>; Mon, 24 Jan 2022 10:40:06 +0000 (UTC)
Received: by mail-io1-xd2a.google.com with SMTP id d188so4561890iof.7
 for <buildroot@buildroot.org>; Mon, 24 Jan 2022 02:40:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LRjHeKJHUuYMzQbxU2mk0iK3ACB/LavtE5HIhHTx6f8=;
 b=JbrvE6ASlUJUIcgqnWhx0hHM78iGfCVnElQLluBrCnOO3B8RPBpPbMaECHN6JEWmHX
 HeXHvTh9uJU6PWe0wcsqSjsHt9q52E818XXeEavWAbZJp4OGyR05cIujIhb4P6yKhF47
 mYJKO5BtjCxxP3TAgC25JbTl1mNkNycm+nLZ2FD8lxkApxnb9rTvHJMBwyGiK6CXfl8Q
 TqZiym8MpZuxO7ByCs+YaY/km19H3zcQFIVsziEZX2ibn8TRZEG91/zd/md9v8Kb9Ti7
 qyYDBdi9V3aV4wrDqRsYErtD+9XGfM+OFqLA5N+O6VdjvIGa3MtbLfTdaWVevDUFnEnQ
 IXsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LRjHeKJHUuYMzQbxU2mk0iK3ACB/LavtE5HIhHTx6f8=;
 b=Jt6jmsOLSLSf1ilQS0St4QFEPMK6isvFakNqIP7SEQdCwJsHSg1YaX46LuSYj2HEHz
 LP9F3XSegPmDsPKmaJTqLWJo55l5ERFJuIQpxS6kjRxsnT828KTDf5ilaVxzqsrI5p2U
 hTsz4ow0VGLQ9RiV/yZgK+PWRmWobnqjPhyJGNwtvONzMQcahRhWbsG/0cfNqa0Ljcsh
 2Lr8aR7rrcs3rFrrnZWnA5fE5+KjUkxpFFE/Swz/DSvubqJykeI7036skx+ZDk+Z3d4H
 Rbw7t9gqQqntRG1GrobTS4F1JsKEMnhjruImHguMEjGSjhuBZD5+LMZgkf4XR7MKRWCT
 EM9w==
X-Gm-Message-State: AOAM530wbA3FDnlmAzR2JZN1G9ieKuCbaEi566fSJITUwfAxvI08S48F
 DisjHJyUpDiuEIHs6G5lOQYYKvpEcj8=
X-Google-Smtp-Source: ABdhPJzjnWXF3VbWL3Hk7tx/1F82IQIjCVf/hI+8kCd0MXZwUpkvv0aLq2R/uTTKqDHcwdT15k7LUw==
X-Received: by 2002:a05:6602:2d4b:: with SMTP id
 d11mr7628115iow.35.1643020805405; 
 Mon, 24 Jan 2022 02:40:05 -0800 (PST)
Received: from james-x399.localdomain (97-118-239-242.hlrn.qwest.net.
 [97.118.239.242])
 by smtp.gmail.com with ESMTPSA id n1sm7110422ilq.50.2022.01.24.02.40.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jan 2022 02:40:05 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 24 Jan 2022 03:40:03 -0700
Message-Id: <20220124104003.529661-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-frozenlist: bump to version
 1.3.0
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
 package/python-frozenlist/python-frozenlist.hash | 4 ++--
 package/python-frozenlist/python-frozenlist.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-frozenlist/python-frozenlist.hash b/package/python-frozenlist/python-frozenlist.hash
index fdbf694963..034150397b 100644
--- a/package/python-frozenlist/python-frozenlist.hash
+++ b/package/python-frozenlist/python-frozenlist.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/frozenlist/json
-md5  8f1851ef871d95a15ebcf20255c12f6d  frozenlist-1.2.0.tar.gz
-sha256  68201be60ac56aff972dc18085800b6ee07973c49103a8aba669dee3d71079de  frozenlist-1.2.0.tar.gz
+md5  e65d870bd189ba3c21ab7eb10eab22b7  frozenlist-1.3.0.tar.gz
+sha256  ce6f2ba0edb7b0c1d8976565298ad2deba6f8064d2bebb6ffce2ca896eb35b0b  frozenlist-1.3.0.tar.gz
 # Locally computed sha256 checksums
 sha256  6fd5243e92dd7f98ec69c7ac377728e74905709ff527a5bf98d6d0263c04f5b6  LICENSE
diff --git a/package/python-frozenlist/python-frozenlist.mk b/package/python-frozenlist/python-frozenlist.mk
index 4e26499808..ad618971f7 100644
--- a/package/python-frozenlist/python-frozenlist.mk
+++ b/package/python-frozenlist/python-frozenlist.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FROZENLIST_VERSION = 1.2.0
+PYTHON_FROZENLIST_VERSION = 1.3.0
 PYTHON_FROZENLIST_SOURCE = frozenlist-$(PYTHON_FROZENLIST_VERSION).tar.gz
-PYTHON_FROZENLIST_SITE = https://files.pythonhosted.org/packages/5c/ee/7c6287928ba776567603248e160387cf4143641ecf734e393ad9b2c82475
+PYTHON_FROZENLIST_SITE = https://files.pythonhosted.org/packages/f4/f7/8dfeb76d2a52bcea2b0718427af954ffec98be1d34cd8f282034b3e36829
 PYTHON_FROZENLIST_SETUP_TYPE = setuptools
 PYTHON_FROZENLIST_LICENSE = Apache-2.0
 PYTHON_FROZENLIST_LICENSE_FILES = LICENSE
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
