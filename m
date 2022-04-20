Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90BEEC433F5
	for <buildroot@archiver.kernel.org>; Wed, 20 Apr 2022 20:05:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 241E941979;
	Wed, 20 Apr 2022 20:05:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BBqeKxejPGUP; Wed, 20 Apr 2022 20:05:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D421F41941;
	Wed, 20 Apr 2022 20:05:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 922C91BF2AF
 for <buildroot@lists.busybox.net>; Wed, 20 Apr 2022 20:05:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 80FE041941
 for <buildroot@lists.busybox.net>; Wed, 20 Apr 2022 20:05:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7IcQCGDU8c1X for <buildroot@lists.busybox.net>;
 Wed, 20 Apr 2022 20:05:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com
 [IPv6:2607:f8b0:4864:20::d2f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 80133418FD
 for <buildroot@buildroot.org>; Wed, 20 Apr 2022 20:05:42 +0000 (UTC)
Received: by mail-io1-xd2f.google.com with SMTP id o127so3049524iof.12
 for <buildroot@buildroot.org>; Wed, 20 Apr 2022 13:05:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lx0qpNi5u7FniqtzzuNj3pi9NSNwK3G9LSZmrQVf/zc=;
 b=oQv85JIrS1+wewM5Ok9tMuzagf0WQ5kLpF1otjvu9kyk9FjP4C9KWB00BfmXcxuqyw
 DbTB5nYESVayEbi+tsRVsmJkCZodv+ks7Ov17TuuhLezbH3u74lWsjjW19MSi5kTIngD
 p9FUW3aYagQJ6e4CUzLvyO9N2Ev+Emct4Sv3BR1wrm7Q6U6L/CRsvBOpVOETIViVf35m
 oIvg6mBSA4ufKPjThphxQVVUxuvjX/TBanhjd8iX+rD4+IYBVnA2Mkhf5EDO0hWQG/dU
 ueN0UzlqwCI50OA8FX3NPvSmKxdhjVg1QgIR/ZZYvaOLQ2cFxZPYqbrY19l+e2aBmkbr
 xlmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lx0qpNi5u7FniqtzzuNj3pi9NSNwK3G9LSZmrQVf/zc=;
 b=RNWnzSbwpCWQv79kX/yxK24RnYBOsI4J9XeGnfbJLNV7bFFMhWpcE+rTOIAQcu1unQ
 DXybIIHmAq4lOmxXa3ArjDDmaC7FLlt5hhGgHUblB18h5PnqmUd9sW1lWs24Ae4V1vtN
 4Tkp4FetuyhQ9oiEDjnzd/YTWk7BxUQpeFVQ1HjVo51/AivkbimdYxVzXnti0T18HYgA
 MGklxFtwqGGFog7OLb6btN0+J6reQWgRG5xTki++Hl1gFlnKsKYc4HtgBDQi76YgXWL7
 KYAyD5NZM8M5H5P2a27/SF5dZtbOraDwgPienijBpIGWbXGuZHbtI7rhEEqdiYpUZp2R
 5Npg==
X-Gm-Message-State: AOAM5319hJRGO/HH4YTrJDc+PpL6fPMN91mUoq1MBjMU4C+pWNaSV8oM
 SXHIOV0Zp46b+0ycGojjmkGNPAcNk2RhCA==
X-Google-Smtp-Source: ABdhPJxplMZM1ZqgAC6lkfAJsI9/PDFOZlTpsyReZs/Arjrywkcmf9b3e5F/eKsYrkdvNbXLzFdJtg==
X-Received: by 2002:a05:6638:d4a:b0:32a:7f4c:22e2 with SMTP id
 d10-20020a0566380d4a00b0032a7f4c22e2mr3878397jak.243.1650485141365; 
 Wed, 20 Apr 2022 13:05:41 -0700 (PDT)
Received: from james-x399.localdomain (97-118-252-238.hlrn.qwest.net.
 [97.118.252.238]) by smtp.gmail.com with ESMTPSA id
 j18-20020a92c212000000b002cc3f380cf3sm3731939ilo.39.2022.04.20.13.05.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 13:05:38 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 20 Apr 2022 14:05:08 -0600
Message-Id: <20220420200508.900163-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-pycryptodomex: bump to
 version 3.14.1
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
 package/python-pycryptodomex/python-pycryptodomex.hash | 4 ++--
 package/python-pycryptodomex/python-pycryptodomex.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pycryptodomex/python-pycryptodomex.hash b/package/python-pycryptodomex/python-pycryptodomex.hash
index 920cec2518..bb257499af 100644
--- a/package/python-pycryptodomex/python-pycryptodomex.hash
+++ b/package/python-pycryptodomex/python-pycryptodomex.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/pycryptodomex/json
-md5  18f571832bbfbf0f4516ccef009f2dfb  pycryptodomex-3.14.0.tar.gz
-sha256  2d8bda8f949b79b78b293706aa7fc1e5c171c62661252bfdd5d12c70acd03282  pycryptodomex-3.14.0.tar.gz
+md5  55f8c1121335891c7e972b73c15369ac  pycryptodomex-3.14.1.tar.gz
+sha256  2ce76ed0081fd6ac8c74edc75b9d14eca2064173af79843c24fa62573263c1f2  pycryptodomex-3.14.1.tar.gz
 # Locally computed sha256 checksums
 sha256  4e04660d77c1c64e89d79537919fb8240fa21484a7e3db29f358b2c7f84ea073  LICENSE.rst
 sha256  8e563c767164faa0831a333b57d23d4311cf566eb1b15d93250f4606be4eb549  Doc/LEGAL/COPYRIGHT.pycrypto
diff --git a/package/python-pycryptodomex/python-pycryptodomex.mk b/package/python-pycryptodomex/python-pycryptodomex.mk
index e3cc11afda..067516fc84 100644
--- a/package/python-pycryptodomex/python-pycryptodomex.mk
+++ b/package/python-pycryptodomex/python-pycryptodomex.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYCRYPTODOMEX_VERSION = 3.14.0
+PYTHON_PYCRYPTODOMEX_VERSION = 3.14.1
 PYTHON_PYCRYPTODOMEX_SOURCE = pycryptodomex-$(PYTHON_PYCRYPTODOMEX_VERSION).tar.gz
-PYTHON_PYCRYPTODOMEX_SITE = https://files.pythonhosted.org/packages/a6/b3/a5e59cd3ad65d4dc470a3a63381d0495885cf1ac7659c83c6bc9e9e79df6
+PYTHON_PYCRYPTODOMEX_SITE = https://files.pythonhosted.org/packages/24/40/e249ac3845a2333ce50f1bb02299ffb766babdfe80ca9d31e0158ad06afd
 PYTHON_PYCRYPTODOMEX_SETUP_TYPE = setuptools
 PYTHON_PYCRYPTODOMEX_LICENSE = \
 	BSD-2-Clause, \
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
