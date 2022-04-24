Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F05ECC433F5
	for <buildroot@archiver.kernel.org>; Sun, 24 Apr 2022 20:57:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AB53A81760;
	Sun, 24 Apr 2022 20:57:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nQQ40vKUVSs3; Sun, 24 Apr 2022 20:57:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A8BC9814B3;
	Sun, 24 Apr 2022 20:57:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8CFD11BF404
 for <buildroot@lists.busybox.net>; Sun, 24 Apr 2022 20:56:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7B2984019A
 for <buildroot@lists.busybox.net>; Sun, 24 Apr 2022 20:56:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RR3zymxuCRfE for <buildroot@lists.busybox.net>;
 Sun, 24 Apr 2022 20:56:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com
 [IPv6:2607:f8b0:4864:20::d2f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 56F8F4002B
 for <buildroot@buildroot.org>; Sun, 24 Apr 2022 20:56:50 +0000 (UTC)
Received: by mail-io1-xd2f.google.com with SMTP id 79so13931435iou.7
 for <buildroot@buildroot.org>; Sun, 24 Apr 2022 13:56:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hiVYY4EVwQvs61L/eucD17hEuzDeIiB79Og/XU07rWg=;
 b=gFlOFGsUOORmQXwl1VUOegBCNCGN7JrAt1BVwSaWfx0UJT4QfzMk/hziyza59wq3en
 XHWq9vtC/luXXAm1DwaxOuL4idObtNaTeUARdTS7iOS7Sbndt3MtqjaWtCVmafnOAjkE
 nVR9vD4LnDqAEqQl1wLS8RB+i3QDlcv5aCJ9HuWKIijUHwLUHWkQm9tTKj3UvSushEvm
 Q/jfHryLgqOXL03T/0rYRu76iUcwIpTnqtbJWfYJPTFWLT/WTst0PnP+5vQinP2tOegO
 kws7mkwqi8KSTIpb3p12tUk9Zf/gTR3HBfrm2Qe9fUUqdlGqRl5wcSoyF+Qbuj9KsSJf
 Ot3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hiVYY4EVwQvs61L/eucD17hEuzDeIiB79Og/XU07rWg=;
 b=W+H5Z7f1HFPAeMF9iTmP+XvxSxIL1Emphph61GGS//nzQYNJNoYq/0et3izVy+m5Qv
 eH12+E7I11S8PsWU2sDzVkZpLJqluemEupjjLUj16JBhmag7824MWog/WazxMFvCFmMb
 SFuY8xNTsy5YR1mrFX7Lwjm0X0OpFtH7QLM1VbWRjtjqMUhN05jk0k+6GJjvxXwWJi5I
 P+5gWeJhIYIf9cvo9HR8P8d3OhVrCzZVIoY3s53S9Em9UTK8i3fU401omfAsm9Go6hRv
 qThMpczLNW6jGbFN9Nkfx/k7OkBSu1YNn46W0os8GICb5UW3skaYXwWONDuw7DpTdUvf
 lryQ==
X-Gm-Message-State: AOAM532270Hips+HQilFWStqJF8QtyWF1OubBhCyU/tqG5RWKgaEBjEW
 asA0T32m1UWLbxDSIfl80F6erc7bN4RrzA==
X-Google-Smtp-Source: ABdhPJy2I2ENyg9jWid9aXiH9y/3IayE1Iwlll6gXwcC6qnyIxOtVzd7R01AYhupk6NYKxKymFIaIA==
X-Received: by 2002:a02:878b:0:b0:326:8050:4706 with SMTP id
 t11-20020a02878b000000b0032680504706mr6426555jai.311.1650833809251; 
 Sun, 24 Apr 2022 13:56:49 -0700 (PDT)
Received: from james-x399.localdomain (97-118-252-238.hlrn.qwest.net.
 [97.118.252.238]) by smtp.gmail.com with ESMTPSA id
 j1-20020a926e01000000b002cc52449a19sm5152350ilc.35.2022.04.24.13.56.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Apr 2022 13:56:48 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 24 Apr 2022 14:56:38 -0600
Message-Id: <20220424205639.1618386-4-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220424205639.1618386-1-james.hilliard1@gmail.com>
References: <20220424205639.1618386-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v6 4/5] package/python-tomli: bump to version
 2.0.1
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
 package/python-tomli/python-tomli.hash | 4 ++--
 package/python-tomli/python-tomli.mk   | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-tomli/python-tomli.hash b/package/python-tomli/python-tomli.hash
index 1a274c8a40..8368f9ee13 100644
--- a/package/python-tomli/python-tomli.hash
+++ b/package/python-tomli/python-tomli.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/tomli/json
-md5  2ecbc7a23b8c8dc2fe96f588f88463d9  tomli-1.2.0.tar.gz
-sha256  d60e681734099207a6add7a10326bc2ddd1fdc36c1b0f547d00ef73ac63739c2  tomli-1.2.0.tar.gz
+md5  d4341621d423a7ca6822e23d6d52bb9a  tomli-2.0.1.tar.gz
+sha256  de526c12914f0c550d15924c62d72abc48d6fe7364aa87328337a31007fe8a4f  tomli-2.0.1.tar.gz
 # Locally computed sha256 checksums
 sha256  b80816b0d530b8accb4c2211783790984a6e3b61922c2b5ee92f3372ab2742fe  LICENSE
diff --git a/package/python-tomli/python-tomli.mk b/package/python-tomli/python-tomli.mk
index b8c20ca736..ce7495d6f0 100644
--- a/package/python-tomli/python-tomli.mk
+++ b/package/python-tomli/python-tomli.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-PYTHON_TOMLI_VERSION = 1.2.0
+PYTHON_TOMLI_VERSION = 2.0.1
 PYTHON_TOMLI_SOURCE = tomli-$(PYTHON_TOMLI_VERSION).tar.gz
-PYTHON_TOMLI_SITE = https://files.pythonhosted.org/packages/ec/38/8eccdc662c61aed187d5f5b168c18b1d2de3827976c3691e4da8be7375aa
-PYTHON_TOMLI_SETUP_TYPE = distutils
+PYTHON_TOMLI_SITE = https://files.pythonhosted.org/packages/c0/3f/d7af728f075fb08564c5949a9c95e44352e23dee646869fa104a3b2060a3
+PYTHON_TOMLI_SETUP_TYPE = flit-bootstrap
 PYTHON_TOMLI_LICENSE = MIT
 PYTHON_TOMLI_LICENSE_FILES = LICENSE
 
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
