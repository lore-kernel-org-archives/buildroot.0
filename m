Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EC62C433F5
	for <buildroot@archiver.kernel.org>; Wed,  2 Feb 2022 03:40:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D82E68266A;
	Wed,  2 Feb 2022 03:40:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BUNXHZ3vRjWe; Wed,  2 Feb 2022 03:40:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 02730831D5;
	Wed,  2 Feb 2022 03:40:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EDD911BF95D
 for <buildroot@lists.busybox.net>; Wed,  2 Feb 2022 03:40:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DBFBE60AD5
 for <buildroot@lists.busybox.net>; Wed,  2 Feb 2022 03:40:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QeJ3hRjQZUCQ for <buildroot@lists.busybox.net>;
 Wed,  2 Feb 2022 03:40:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com
 [IPv6:2607:f8b0:4864:20::d2b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D939260ACB
 for <buildroot@buildroot.org>; Wed,  2 Feb 2022 03:40:39 +0000 (UTC)
Received: by mail-io1-xd2b.google.com with SMTP id p63so22996883iod.11
 for <buildroot@buildroot.org>; Tue, 01 Feb 2022 19:40:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wxS71YnCNvbZMfqvRKZ7mPbUxwmN8bHLwxyxoqmhhMs=;
 b=nPCWav7Ma5Bj3UpwxEs1LlNdIkfsphvmrAGiXVhbmYHHiHYBirE5DbstmUsTC8U2QG
 le6MIZ8YTGd9xkCCNFy/dqu56Jd1udchoELzqQzgE3MUMdzzin4Y7nFQHyRC6qGdwd8Z
 Penbx7HbfLOkd6FE1bVruLczvSruiTl9qg9dkqNckRNg0zCtkiO4zHHtlPq/3s4Ia+/2
 NqpZyYLt4mvIeRTKzvr4u4jq5z7Brs+N3lqL/i/tdpvjGN3Eq6uzTaK93P/TqsflD8OW
 T59o/bqwGRpL7UNaRGUa6wbIuw3SFBRSGAK3PY+53BiyrLPVUM0S1p5kHM92zdtRx/Sy
 3sTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wxS71YnCNvbZMfqvRKZ7mPbUxwmN8bHLwxyxoqmhhMs=;
 b=k9Eommmr+5rRbUSwysDTnPXcFmzOb6J/WGWHeICxrSfPO6GTno2hL1q8gqp/UMj9vM
 BP0Yr/ePKaWfVTpkIProLQU6V1tOIMlNGA+hv6F1Qv3FZMTiTWFqbn9GBxIJav3alM2p
 UAEgDZm2ZTYuhze/lJ+78N8KzaTvReGvYOEI2Z4/eRvLCmhuGxrvlBAunmDCErtuqrCR
 GRvsKU1cFsDUIFgX780VCitDGjQ2h+DS2ma9/ztuY2GpZQs1Hwz+WebxZ1RB1xeymvC3
 hM+ljuf7bvvebGhiTbysKpMMDqx98HVWAtLw61wdLbNBDOMrMO+ML6BOnmtx97L8zgAF
 h8JA==
X-Gm-Message-State: AOAM530B0miLLmRZjvbSufunbW9H3Jv0DEXdxlKp8glFgRsXVdeqhPlQ
 4mbtqIltURE+xft78KN0+6uPaUFzJ5c=
X-Google-Smtp-Source: ABdhPJyy+fgjr/Iv3g+bTjhU0ATZPJ53DN2Wiigjw571dBXc1Zo/wYXJvld9J2p6EuANih0nyskm4g==
X-Received: by 2002:a02:5b4a:: with SMTP id g71mr15163835jab.76.1643773238774; 
 Tue, 01 Feb 2022 19:40:38 -0800 (PST)
Received: from james-x399.localdomain (71-218-245-50.hlrn.qwest.net.
 [71.218.245.50])
 by smtp.gmail.com with ESMTPSA id k2sm8017133iow.7.2022.02.01.19.40.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Feb 2022 19:40:38 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  1 Feb 2022 20:40:36 -0700
Message-Id: <20220202034036.2188757-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python{3}-cython: bump to version
 0.29.27
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-cython/python-cython.hash | 4 ++--
 package/python-cython/python-cython.mk   | 4 ++--
 package/python3-cython/python3-cython.mk | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/python-cython/python-cython.hash b/package/python-cython/python-cython.hash
index b07f171c25..9c5f1225cf 100644
--- a/package/python-cython/python-cython.hash
+++ b/package/python-cython/python-cython.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/cython/json
-md5  971c9708dd5269180868fc0af986084c  Cython-0.29.26.tar.gz
-sha256  af377d543a762867da11fcf6e558f7a4a535ff8693f30cce123fab10c00fa312  Cython-0.29.26.tar.gz
+md5  2b2ba86abcf823985935d37f5e43b19a  Cython-0.29.27.tar.gz
+sha256  c6a442504db906dfc13a480e96850cced994ecdc076bcf492c43515b78f70da2  Cython-0.29.27.tar.gz
 # Locally computed sha256 checksums
 sha256  a6cba85bc92e0cff7a450b1d873c0eaa2e9fc96bf472df0247a26bec77bf3ff9  LICENSE.txt
 sha256  e1eb1c49a8508e8173dac30157e4a6439a44ad8846194746c424fbc3fc2b95d7  COPYING.txt
diff --git a/package/python-cython/python-cython.mk b/package/python-cython/python-cython.mk
index cf41086dea..89708cb9a8 100644
--- a/package/python-cython/python-cython.mk
+++ b/package/python-cython/python-cython.mk
@@ -5,9 +5,9 @@
 ################################################################################
 
 # Please keep in sync with package/python3-cython/python3-cython.mk
-PYTHON_CYTHON_VERSION = 0.29.26
+PYTHON_CYTHON_VERSION = 0.29.27
 PYTHON_CYTHON_SOURCE = Cython-$(PYTHON_CYTHON_VERSION).tar.gz
-PYTHON_CYTHON_SITE = https://files.pythonhosted.org/packages/bc/fa/8604d92ef753e0036d807f1b3179813ab2fa283e3b19c926e11673c8205b
+PYTHON_CYTHON_SITE = https://files.pythonhosted.org/packages/eb/46/80dd9e5ad67ebc766ff3229901bde4a7bc82907efe93cd7007c4df458dd5
 PYTHON_CYTHON_SETUP_TYPE = setuptools
 PYTHON_CYTHON_LICENSE = Apache-2.0
 PYTHON_CYTHON_LICENSE_FILES = COPYING.txt LICENSE.txt
diff --git a/package/python3-cython/python3-cython.mk b/package/python3-cython/python3-cython.mk
index da159cedc8..56d88b5bf7 100644
--- a/package/python3-cython/python3-cython.mk
+++ b/package/python3-cython/python3-cython.mk
@@ -5,9 +5,9 @@
 ################################################################################
 
 # Please keep in sync with package/python-cython/python-cython.mk
-PYTHON3_CYTHON_VERSION = 0.29.26
+PYTHON3_CYTHON_VERSION = 0.29.27
 PYTHON3_CYTHON_SOURCE = Cython-$(PYTHON3_CYTHON_VERSION).tar.gz
-PYTHON3_CYTHON_SITE = https://files.pythonhosted.org/packages/bc/fa/8604d92ef753e0036d807f1b3179813ab2fa283e3b19c926e11673c8205b
+PYTHON3_CYTHON_SITE = https://files.pythonhosted.org/packages/eb/46/80dd9e5ad67ebc766ff3229901bde4a7bc82907efe93cd7007c4df458dd5
 PYTHON3_CYTHON_SETUP_TYPE = setuptools
 PYTHON3_CYTHON_LICENSE = Apache-2.0
 PYTHON3_CYTHON_LICENSE_FILES = COPYING.txt LICENSE.txt
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
