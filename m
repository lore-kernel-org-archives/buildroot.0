Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8F86C433EF
	for <buildroot@archiver.kernel.org>; Mon, 10 Jan 2022 06:23:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3A4FC405BE;
	Mon, 10 Jan 2022 06:23:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AuHcz6ewYvEG; Mon, 10 Jan 2022 06:23:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 42796405B4;
	Mon, 10 Jan 2022 06:23:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B09341BF37C
 for <buildroot@lists.busybox.net>; Mon, 10 Jan 2022 06:23:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id ADE57408BD
 for <buildroot@lists.busybox.net>; Mon, 10 Jan 2022 06:23:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yuoVXjym8heu for <buildroot@lists.busybox.net>;
 Mon, 10 Jan 2022 06:23:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com
 [IPv6:2607:f8b0:4864:20::d2d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D568A408BB
 for <buildroot@buildroot.org>; Mon, 10 Jan 2022 06:23:44 +0000 (UTC)
Received: by mail-io1-xd2d.google.com with SMTP id s6so16229794ioj.0
 for <buildroot@buildroot.org>; Sun, 09 Jan 2022 22:23:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wnljtMgXQWm6RxQEFbbmSFHwLiNFStRsDfrbZYvzeC0=;
 b=TxvGYjDAKIT15ieValI50hT26hEeTDu7duxNfEx4O8FO8LHYdtdSOg6hgp3sn8WMPY
 Z7OzxYmYAraDky+K+5fFivealsP8c1CA3o379OarGvNEaXdveUxLJz0nkmMpCJTvyp5s
 LElpUUmqYWJ4Hga4+ajMm9w+LLnAT2nMIE171Pz2dhPawBsle9PM3eYWHa50a5X2Y21B
 YTX4e1sUtl2TKe1l2YP8yb/jc1uJQ/TxwqJ8DixHI6+i+jIe6rOX6GELg4BUBsK++zDs
 h7vfvs34XW91tTmTwiklPpIzkn1TcG+iaCThU8QwwVFehDv39vQRPipctPttgT/E7dRE
 RETg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wnljtMgXQWm6RxQEFbbmSFHwLiNFStRsDfrbZYvzeC0=;
 b=Ofnz0HaLVjAK9V9NkTxhj8K1xf3fMnHuWlojm3BKjcIK1WI6fShYbPJTQdPBomNKGW
 yXcIROzIgStesvUK8GI3c7z79N+JPH3Cgz3ndj+ARzWn3qxp9HR7k5C+IRTuxJcc6GKx
 oMelf5VnilEiMbSM2n+SHd0sE/mB+t+BDJ/r+FfoDB/e897gG86jK6IdxCQgmhBAA8Hm
 9T5arSRzWsbfDe3XHGKUEgNkd1mogWOf3PTob/quRha99pyLsUHF8P4A7ZMoL6SZCzdy
 ygwkmlCrjY0L58YTrMoPcmkUoZVCXW4/vOtxZReQD/fGtXlZGIlWwalaTqx9Y9hJZKUj
 SNPg==
X-Gm-Message-State: AOAM531eojYAHDCJZ4iRUFa6zN/dAs6g++l7b3kd3eGwON/fF5P4fCGg
 lbzsrJh2D7FPa+my6K4bOw8y++fmi6M=
X-Google-Smtp-Source: ABdhPJw34Fyges6PEi0YO1EUcuLZWe5cbniveKIc2ucCQzAtplpBWXDh9FD1LFhb42gBxvJYB3ehCQ==
X-Received: by 2002:a02:81c3:: with SMTP id r3mr13491938jag.53.1641795823752; 
 Sun, 09 Jan 2022 22:23:43 -0800 (PST)
Received: from james-x399.localdomain (97-118-242-51.hlrn.qwest.net.
 [97.118.242.51])
 by smtp.gmail.com with ESMTPSA id s20sm3806190iog.25.2022.01.09.22.23.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Jan 2022 22:23:43 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  9 Jan 2022 23:23:27 -0700
Message-Id: <20220110062327.1302104-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-pyparsing: bump to version
 3.0.6
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pyparsing/python-pyparsing.hash | 4 ++--
 package/python-pyparsing/python-pyparsing.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pyparsing/python-pyparsing.hash b/package/python-pyparsing/python-pyparsing.hash
index 2c52ff0843..a21baf46e5 100644
--- a/package/python-pyparsing/python-pyparsing.hash
+++ b/package/python-pyparsing/python-pyparsing.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pyparsing/json
-md5  f0953e47a0112f7a65aec2305ffdf7b4  pyparsing-2.4.7.tar.gz
-sha256  c203ec8783bf771a155b207279b9bccb8dea02d8f0c9e5f8ead507bc3246ecc1  pyparsing-2.4.7.tar.gz
+md5  2f5fad6c8e99ac2562ab08ad9e45b195  pyparsing-3.0.6.tar.gz
+sha256  d9bdec0013ef1eb5a84ab39a3b3868911598afa494f5faa038647101504e2b81  pyparsing-3.0.6.tar.gz
 # Locally computed sha256 checksums
 sha256  10d5120a16805804ffda8b688c220bfb4e8f39741b57320604d455a309e01972  LICENSE
diff --git a/package/python-pyparsing/python-pyparsing.mk b/package/python-pyparsing/python-pyparsing.mk
index 5741458d65..b6ab353a6d 100644
--- a/package/python-pyparsing/python-pyparsing.mk
+++ b/package/python-pyparsing/python-pyparsing.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYPARSING_VERSION = 2.4.7
+PYTHON_PYPARSING_VERSION = 3.0.6
 PYTHON_PYPARSING_SOURCE = pyparsing-$(PYTHON_PYPARSING_VERSION).tar.gz
-PYTHON_PYPARSING_SITE = https://files.pythonhosted.org/packages/c1/47/dfc9c342c9842bbe0036c7f763d2d6686bcf5eb1808ba3e170afdb282210
+PYTHON_PYPARSING_SITE = https://files.pythonhosted.org/packages/ab/61/1a1613e3dcca483a7aa9d446cb4614e6425eb853b90db131c305bd9674cb
 PYTHON_PYPARSING_LICENSE = MIT
 PYTHON_PYPARSING_LICENSE_FILES = LICENSE
 PYTHON_PYPARSING_SETUP_TYPE = setuptools
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
