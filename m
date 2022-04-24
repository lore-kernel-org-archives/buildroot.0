Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECC7CC433EF
	for <buildroot@archiver.kernel.org>; Sun, 24 Apr 2022 20:57:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AF42D81BB0;
	Sun, 24 Apr 2022 20:57:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oIWHql199Cx8; Sun, 24 Apr 2022 20:57:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A391381BD6;
	Sun, 24 Apr 2022 20:57:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AF4C31BF404
 for <buildroot@lists.busybox.net>; Sun, 24 Apr 2022 20:56:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C480C4019A
 for <buildroot@lists.busybox.net>; Sun, 24 Apr 2022 20:56:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gyFB8UfiMutW for <buildroot@lists.busybox.net>;
 Sun, 24 Apr 2022 20:56:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com
 [IPv6:2607:f8b0:4864:20::134])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DFECC4018F
 for <buildroot@buildroot.org>; Sun, 24 Apr 2022 20:56:50 +0000 (UTC)
Received: by mail-il1-x134.google.com with SMTP id y16so8217794ilc.7
 for <buildroot@buildroot.org>; Sun, 24 Apr 2022 13:56:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XUbd3wQymtyoJiocuSnhGpQs5QQDcZb8co9prDL/U7A=;
 b=VYga7bii6afL9aGWdNV7Z6nXxsCnYb2HO4lvxQYruiTx7mqXIwa6RVSBMAh4XPswPW
 0zbZurmc7SZI6X6AbQWvKlsoQI9THm/xHiLboWQV2VGDyTTeHtefEf0EiqqwVYW0FPW1
 u7hIoxmAwAdoJkOkTmL1Y1kvwp0ckmjlen+fwVy+JLLYq2JMdztjFwpLBVAISwHnD0jX
 Rjl+xZCWsLVEHRltWAuiGgrDv15RvKmKNGe32NxUR/Y4Uvpol4Du+6O2YdPjqdeqokNv
 W7mNnUL2bYvhUM93EcctaPH3qYTmYhvSi6knChc1OrHRW4MaHZXV9PdfKWsjl60zhQoJ
 vkIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XUbd3wQymtyoJiocuSnhGpQs5QQDcZb8co9prDL/U7A=;
 b=n3VrhSpm1ALSqgq7lE4kj+mGSKYjPkWiAG1jK8DFcsCsPHzJh3cc1UGy47EYoe6Rm3
 88pzWbpEzeoNFoqFcJ/7lzxUzbcvhFgUp5KTNz3nM/+QqU5l5gmVBniPA3ig/oQkDR9F
 mvOlatUMk1sL1MoeSClMHB/Re4NdEDE3llNkT/XLY+2MMH+lZ55hbsy9w2JVI+zYBgo/
 cB58+JBEHGGBg/1hsIzQSwedcbc5EnvKHs2OFi1I1NZlx1u6Ozs5wGylrbkb0DlhOK3V
 asxfNxon5lKamIT7149dMO+rgre4XxjhbjyEqPXyxGzuCQegRxCRQ7Tj+LICA031yj3m
 w/BA==
X-Gm-Message-State: AOAM533QfeS771VSFKt/D5NeKtRZrw26JZ9+P603ryxPabP1A+gdZZao
 5/eJ0f44t6F4sMEfVYZfIc6AgdHcVNdZzA==
X-Google-Smtp-Source: ABdhPJw4EcMphn5LiIgPj9tWE0xipTjk2h2wbI6Lcf3kjQMgFCSe9N1tvSkLl65kkOcXULpWYwGVMA==
X-Received: by 2002:a05:6e02:1a8d:b0:2cd:5b32:972d with SMTP id
 k13-20020a056e021a8d00b002cd5b32972dmr6004176ilv.229.1650833809800; 
 Sun, 24 Apr 2022 13:56:49 -0700 (PDT)
Received: from james-x399.localdomain (97-118-252-238.hlrn.qwest.net.
 [97.118.252.238]) by smtp.gmail.com with ESMTPSA id
 j1-20020a926e01000000b002cc52449a19sm5152350ilc.35.2022.04.24.13.56.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Apr 2022 13:56:49 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 24 Apr 2022 14:56:39 -0600
Message-Id: <20220424205639.1618386-5-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220424205639.1618386-1-james.hilliard1@gmail.com>
References: <20220424205639.1618386-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v6 5/5] package/python-pyparsing: bump to
 version 3.0.8
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
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This package now requires flit and must use the flit-bootstrap setup
type since it is a dependency of host-python-pypa-build.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pyparsing/python-pyparsing.hash | 4 ++--
 package/python-pyparsing/python-pyparsing.mk   | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-pyparsing/python-pyparsing.hash b/package/python-pyparsing/python-pyparsing.hash
index 1e56e878a1..e7137d55c9 100644
--- a/package/python-pyparsing/python-pyparsing.hash
+++ b/package/python-pyparsing/python-pyparsing.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pyparsing/json
-md5  9d38774991175444e21a3dfa865876cc  pyparsing-3.0.7.tar.gz
-sha256  18ee9022775d270c55187733956460083db60b37d0d0fb357445f3094eed3eea  pyparsing-3.0.7.tar.gz
+md5  971252e99e1e02a4c27f001894e0422d  pyparsing-3.0.8.tar.gz
+sha256  7bf433498c016c4314268d95df76c81b842a4cb2b276fa3312cfb1e1d85f6954  pyparsing-3.0.8.tar.gz
 # Locally computed sha256 checksums
 sha256  10d5120a16805804ffda8b688c220bfb4e8f39741b57320604d455a309e01972  LICENSE
diff --git a/package/python-pyparsing/python-pyparsing.mk b/package/python-pyparsing/python-pyparsing.mk
index 2fb705bc7a..f3e2caf21e 100644
--- a/package/python-pyparsing/python-pyparsing.mk
+++ b/package/python-pyparsing/python-pyparsing.mk
@@ -4,12 +4,12 @@
 #
 ################################################################################
 
-PYTHON_PYPARSING_VERSION = 3.0.7
+PYTHON_PYPARSING_VERSION = 3.0.8
 PYTHON_PYPARSING_SOURCE = pyparsing-$(PYTHON_PYPARSING_VERSION).tar.gz
-PYTHON_PYPARSING_SITE = https://files.pythonhosted.org/packages/d6/60/9bed18f43275b34198eb9720d4c1238c68b3755620d20df0afd89424d32b
+PYTHON_PYPARSING_SITE = https://files.pythonhosted.org/packages/31/df/789bd0556e65cf931a5b87b603fcf02f79ff04d5379f3063588faaf9c1e4
 PYTHON_PYPARSING_LICENSE = MIT
 PYTHON_PYPARSING_LICENSE_FILES = LICENSE
-PYTHON_PYPARSING_SETUP_TYPE = setuptools
+PYTHON_PYPARSING_SETUP_TYPE = flit-bootstrap
 
 $(eval $(python-package))
 $(eval $(host-python-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
