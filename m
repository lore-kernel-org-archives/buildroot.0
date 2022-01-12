Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A76FC433EF
	for <buildroot@archiver.kernel.org>; Wed, 12 Jan 2022 21:30:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1301284C1C;
	Wed, 12 Jan 2022 21:30:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mxbQhR6zLku1; Wed, 12 Jan 2022 21:30:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3924884BD7;
	Wed, 12 Jan 2022 21:30:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C2B481BF2EA
 for <buildroot@lists.busybox.net>; Wed, 12 Jan 2022 21:30:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BF2E984BE2
 for <buildroot@lists.busybox.net>; Wed, 12 Jan 2022 21:30:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vtxJZskQU4cW for <buildroot@lists.busybox.net>;
 Wed, 12 Jan 2022 21:30:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BA6A184BCB
 for <buildroot@buildroot.org>; Wed, 12 Jan 2022 21:30:24 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id c66so2513360wma.5
 for <buildroot@buildroot.org>; Wed, 12 Jan 2022 13:30:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BXBhZqIqPbVi7rGC9wKVgwHoIwoN50mT/NA/b73pd/g=;
 b=bZVnZEDjudzzP6D0Yh4Hea1XIJ94/lFv8FnwXQfh4UIEyuRmXq4FMAdwvbIMqTF5/U
 PtrlwmLVxsuNg8jQIKGac8NGhfkzNYf6M8X8WtoZJ7a0hdfwHhtODqQRvC+GwyaUhh/q
 zl32uuM8G7+tDZknQhAHMnI6mq7+pWVX7btYOQdek+8NsKmcG3EMckTX30f9wtfGBBnF
 6aix8C2kGciXRskMB6Sy7xx9pKSw7Juf75IpBWb9pfNtZG/K7M2RJTQujEvnjHp37bb5
 iC9EKonM9JP0UJUvNPUA7xza88y8cqFwIMoiOOyh8+PWvF2CPmPARkb9HeKVi35rT0Nn
 nCaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BXBhZqIqPbVi7rGC9wKVgwHoIwoN50mT/NA/b73pd/g=;
 b=h/CbHyaClSPFjafw8rkZgQh+8d7KWTety41XEHSAhrg9gKmSuSj2Ci9oCLYcSkIUui
 MdDBqQZff7iI1tuVS0REhDO5AYZnPLFJ0cH/mlEyD+bKfkS+JojBc/+X/CBvbRH7VmGZ
 Rt2CrlH07RhtGKvDnJJvsxpv50ziG1hTrP8FqFVO16h0XimZGp4aQIlprXIlgkQpL88t
 O5KTH0hVL3NSjFz8q+dMxiplZvrSw86jMwkDbpjaTlGZk6oYvZQdnzTNtUgAmJJx/3Im
 +HkGsdGygmcc645LKuGdHnM4gQnafTR1Hl7Kr+lVMKf5aXvuD/sedBdHq6t0Wy7N5tar
 Ecbw==
X-Gm-Message-State: AOAM531VrP4X03wZ1DqdMah2oP4+9F+wnn2e250AH+TIxUn0XPoITckx
 2/IIfLIEtRDZqpkpaaKkcd8wqRNz3gc=
X-Google-Smtp-Source: ABdhPJyrxf73imDI0iCLLg+rp12JlXNU30ToCJB34t4VYT/dcDma6J6tuoTLx5sV489MWI9cwrkVBQ==
X-Received: by 2002:a7b:c8c7:: with SMTP id f7mr8332624wml.16.1642023022749;
 Wed, 12 Jan 2022 13:30:22 -0800 (PST)
Received: from kali.home (lfbn-ren-1-358-126.w2-10.abo.wanadoo.fr.
 [2.10.19.126])
 by smtp.gmail.com with ESMTPSA id v13sm725654wmh.45.2022.01.12.13.30.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jan 2022 13:30:22 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 12 Jan 2022 22:28:47 +0100
Message-Id: <20220112212847.3166081-3-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220112212847.3166081-1-fontaine.fabrice@gmail.com>
References: <20220112212847.3166081-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 3/3] package/python-hyperframe: bump to version
 6.0.1
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
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Update site in Config.in
- python 2.7 support has been dropped since version 6.0.0
- Update indentation in hash file (two spaces)

https://github.com/python-hyper/hyperframe/blob/v6.0.1/CHANGELOG.rst

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/python-hyperframe/Config.in              | 3 ++-
 package/python-hyperframe/python-hyperframe.hash | 6 +++---
 package/python-hyperframe/python-hyperframe.mk   | 4 ++--
 3 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/package/python-hyperframe/Config.in b/package/python-hyperframe/Config.in
index f3318a20e2..30457fe86e 100644
--- a/package/python-hyperframe/Config.in
+++ b/package/python-hyperframe/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_PYTHON_HYPERFRAME
 	bool "python-hyperframe"
+	depends on BR2_PACKAGE_PYTHON3
 	help
 	  HTTP/2 framing layer for Python.
 
-	  http://hyper.rtfd.org
+	  https://github.com/python-hyper/hyperframe/
diff --git a/package/python-hyperframe/python-hyperframe.hash b/package/python-hyperframe/python-hyperframe.hash
index 3e686a4aa2..b39ab51a72 100644
--- a/package/python-hyperframe/python-hyperframe.hash
+++ b/package/python-hyperframe/python-hyperframe.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/hyperframe/json
-md5	6919183242feb26d8bce3b4cba81defd  hyperframe-5.2.0.tar.gz
-sha256	a9f5c17f2cc3c719b917c4f33ed1c61bd1f8dfac4b1bd23b7c80b3400971b41f  hyperframe-5.2.0.tar.gz
+md5  153c064e8ac654aaf136b3388c36de48  hyperframe-6.0.1.tar.gz
+sha256  ae510046231dc8e9ecb1a6586f63d2347bf4c8905914aa84ba585ae85f28a914  hyperframe-6.0.1.tar.gz
 # Locally computed sha256 checksums
-sha256	763a9342a04df62046c9dc748a5287934eb0a5331c6863b3ca0aee20e18cb4ed  LICENSE
+sha256  763a9342a04df62046c9dc748a5287934eb0a5331c6863b3ca0aee20e18cb4ed  LICENSE
diff --git a/package/python-hyperframe/python-hyperframe.mk b/package/python-hyperframe/python-hyperframe.mk
index 7640ade5fd..4b13ca51a3 100644
--- a/package/python-hyperframe/python-hyperframe.mk
+++ b/package/python-hyperframe/python-hyperframe.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_HYPERFRAME_VERSION = 5.2.0
+PYTHON_HYPERFRAME_VERSION = 6.0.1
 PYTHON_HYPERFRAME_SOURCE = hyperframe-$(PYTHON_HYPERFRAME_VERSION).tar.gz
-PYTHON_HYPERFRAME_SITE = https://files.pythonhosted.org/packages/e6/7f/9a4834af1010dc1d570d5f394dfd9323a7d7ada7d25586bd299fc4cb0356
+PYTHON_HYPERFRAME_SITE = https://files.pythonhosted.org/packages/5a/2a/4747bff0a17f7281abe73e955d60d80aae537a5d203f417fa1c2e7578ebb
 PYTHON_HYPERFRAME_SETUP_TYPE = setuptools
 PYTHON_HYPERFRAME_LICENSE = MIT
 PYTHON_HYPERFRAME_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
