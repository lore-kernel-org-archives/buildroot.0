Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B129CC433F5
	for <buildroot@archiver.kernel.org>; Mon,  6 Dec 2021 12:03:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4E91140448;
	Mon,  6 Dec 2021 12:03:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MkU_zh6hKgpQ; Mon,  6 Dec 2021 12:03:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3D3684014B;
	Mon,  6 Dec 2021 12:03:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A1D4E1BF3C0
 for <buildroot@lists.busybox.net>; Mon,  6 Dec 2021 12:03:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8D9D440447
 for <buildroot@lists.busybox.net>; Mon,  6 Dec 2021 12:03:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0VPuJhUxufq1 for <buildroot@lists.busybox.net>;
 Mon,  6 Dec 2021 12:03:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com
 [IPv6:2607:f8b0:4864:20::d2f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8CACD400D9
 for <buildroot@buildroot.org>; Mon,  6 Dec 2021 12:03:39 +0000 (UTC)
Received: by mail-io1-xd2f.google.com with SMTP id e128so12582833iof.1
 for <buildroot@buildroot.org>; Mon, 06 Dec 2021 04:03:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5hpigwG3K+sAaxswoluVd07XPWWeq4ht2plyumlXBlU=;
 b=Yay0d+0+olpde0LFUsSt83lxszg5ZHUwLtTTgr+dn4hCa+iwIhp567euKL4Cx9MFAs
 /4iE7XAnuat+xWOFN7BlCJWq7XeceZ/OmpmxbRER5mbpjdQJwspsy5Qsuz5LPGbU5MfT
 I4ZXuSVAlG6YrAogelg/4k8m2dZbDo3Y3QqkqlwtRH1hk7LtJnv38M/2mODcTJuRQ9Z4
 k6rk3SDuNtBnK4fTbQUmNIa0t6/zE9vqROkGDOJI1jZnpY5q/zex90loR4c7Nobt+VIO
 VoeEdeuSRn2Lf9E9XLFCf9YgVVqIY3UydxEzb258T9Kdp9jwpZ1alcp7uWAoSqZvwe34
 2hmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5hpigwG3K+sAaxswoluVd07XPWWeq4ht2plyumlXBlU=;
 b=60zenSoaG6+WWBa2E9onS7JdKc39ES48DI0CCUI2JPAQROogfEqEhxmYR72PLudrPn
 FAWj9v9vGbann2puqFbFFEJ4sqvOYSL8gPbp6LHu6/5URZbxKT54rWeKwqPVDhMEF8Pt
 Lk0364i0j39cpQn1/LdgNNbWNoTGeL4tAYi1t0fSemco2Vuvn1CNU8rlzeXvPOatUIiK
 pBaWZaP9K3BT9xLm3BQqxbvHY5VxjAhUEV5wSAn62Ywg2QYrL87nLRAd0GLS54opVBKO
 gpBiLz04QzcVFd4TipbXocKQI+XMlNxbFJroqhZCWN2YntOz0/6wbs9k1fnT895DQzXP
 tolg==
X-Gm-Message-State: AOAM532WoVCkFwq3E/jdIIkcdnqnRd2OJY39XrCvAoKuqQLzCc/cE60v
 /NDVBH89UtVp4ygx2gKT5/HvtmSFJ4w=
X-Google-Smtp-Source: ABdhPJyVWa4+UUTFJqpfYMSBrI2PCDqKmXiZYPEXvw0vYmWzcsZMi7sKKibEG72RHa5WSkLZpztQsg==
X-Received: by 2002:a02:b616:: with SMTP id h22mr40548499jam.127.1638792218486; 
 Mon, 06 Dec 2021 04:03:38 -0800 (PST)
Received: from james-x399.localdomain (71-218-107-26.hlrn.qwest.net.
 [71.218.107.26])
 by smtp.gmail.com with ESMTPSA id u4sm7153406ilv.66.2021.12.06.04.03.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Dec 2021 04:03:38 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  6 Dec 2021 05:03:21 -0700
Message-Id: <20211206120325.3120351-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211206120325.3120351-1-james.hilliard1@gmail.com>
References: <20211206120325.3120351-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/6] package/python-pep517: new package
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
Cc: Asaf Kahlon <asafka7@gmail.com>, James Hilliard <james.hilliard1@gmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pep517/python-pep517.hash |  5 +++++
 package/python-pep517/python-pep517.mk   | 16 ++++++++++++++++
 2 files changed, 21 insertions(+)
 create mode 100644 package/python-pep517/python-pep517.hash
 create mode 100644 package/python-pep517/python-pep517.mk

diff --git a/package/python-pep517/python-pep517.hash b/package/python-pep517/python-pep517.hash
new file mode 100644
index 0000000000..4dd4c47fa0
--- /dev/null
+++ b/package/python-pep517/python-pep517.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/pep517/json
+md5  7ed0adb5f737c316e071d48d66329a5d  pep517-0.12.0.tar.gz
+sha256  931378d93d11b298cf511dd634cf5ea4cb249a28ef84160b3247ee9afb4e8ab0  pep517-0.12.0.tar.gz
+# Locally computed sha256 checksums
+sha256  1b22b049b5267d6dfc23a67bf4a84d8ec04b9fdfb1a51d360e42b4342c8b4154  LICENSE
diff --git a/package/python-pep517/python-pep517.mk b/package/python-pep517/python-pep517.mk
new file mode 100644
index 0000000000..da0431a637
--- /dev/null
+++ b/package/python-pep517/python-pep517.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# python-pep517
+#
+################################################################################
+
+PYTHON_PEP517_VERSION = 0.12.0
+PYTHON_PEP517_SOURCE = pep517-$(PYTHON_PEP517_VERSION).tar.gz
+PYTHON_PEP517_SITE = https://files.pythonhosted.org/packages/0a/65/6e656d49c679136edfba25f25791f45ffe1ea4ae2ec1c59fe9c35e061cd1
+PYTHON_PEP517_LICENSE = MIT
+PYTHON_PEP517_LICENSE_FILES = LICENSE
+PYTHON_PEP517_SETUP_TYPE = distutils
+HOST_PYTHON_PEP517_NEEDS_HOST_PYTHON = python3
+HOST_PYTHON_PEP517_DEPENDENCIES = host-python-tomli
+
+$(eval $(host-python-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
