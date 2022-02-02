Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 333FAC433F5
	for <buildroot@archiver.kernel.org>; Wed,  2 Feb 2022 03:48:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BFC2D83DF3;
	Wed,  2 Feb 2022 03:48:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kKQKzdDqEbpN; Wed,  2 Feb 2022 03:48:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 002DF833CA;
	Wed,  2 Feb 2022 03:48:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7F5F51BF95D
 for <buildroot@lists.busybox.net>; Wed,  2 Feb 2022 03:48:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6E018833CA
 for <buildroot@lists.busybox.net>; Wed,  2 Feb 2022 03:48:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LcXU7uzc9hCL for <buildroot@lists.busybox.net>;
 Wed,  2 Feb 2022 03:47:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com
 [IPv6:2607:f8b0:4864:20::d2e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 866F382D40
 for <buildroot@buildroot.org>; Wed,  2 Feb 2022 03:47:59 +0000 (UTC)
Received: by mail-io1-xd2e.google.com with SMTP id s18so23814498ioa.12
 for <buildroot@buildroot.org>; Tue, 01 Feb 2022 19:47:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZeMcBathyu3W8tDw1w1RRi40gbbDFS2+9jVWIY+Fj+c=;
 b=goA9ezOqH5cPFrTcbkNynqX3fzqKBXGxAJ3W1GBFqsN3KFKl85O31QgtZAHbUhnNdF
 6gz8xMN6K6piNyTpEvTqocMFgnvTkdXxl/dCJ+vj1G87oSrk83vPNCyPuajvIMYgCcVv
 KVB9jaG/YWPodQbJjeBd3fA+vka+faIfV4jF/Rvd8bKj7YmHhKo07t2bqdymqfGgBSNi
 D050LlsiA/0ftAwaE1KKrrVXmVE/m2GcaKyaW4BYr2scd5ckMjav63ciB7Wf2S4T6thK
 zigNeNuYC2GIVtxI66xZq10hj9UFgOiKxdHATkaGfTl8C0Ek1CoE8l/NUzzw+Xl0/FDR
 gMfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZeMcBathyu3W8tDw1w1RRi40gbbDFS2+9jVWIY+Fj+c=;
 b=pbxLdL8ScjGWAEMnNW3SzI1+cdJh6RpS0VAyA9G9TiNljcOmJGRcdgCXTlui/Ie3IV
 22hhhZmaA5wsKw6DjOHKYa4b551AoFXl8Qy+TIfk4jMm2C9UkaJrx1H5tTyJoF2H9OwM
 +uzoJ6VcjCerR5Wg761bjJM8zH4I7qHfs8MEt+6FjOX4qKraIAfJohnr7SxZRldKk7f8
 wkTi2I9GdJeP5bKQEPt/VaAZKGwh6EQOCTAnvTQ/eo4N8IkJUy9wcfU/thoNq7Fgwo/q
 480zf00uU2DROtrBmYD0h0GH/9xu7Ob8VaPIHfX7NF4tqAzM9he1DZaygw0+invcwy3v
 o79Q==
X-Gm-Message-State: AOAM530pGysG4rzGszBV7VuKZC8F39KgvEaQFeoKTbm/dq8P/l0w057S
 Hfj5ksROlmWS54qD6+GamS1VIiZkH1Q=
X-Google-Smtp-Source: ABdhPJzVqnV0DpeclR6fxkpEaUYHMiYqODQDKUl8qba/M/OJ0/KO6Ld+/+I/kmeXY7pRqno1B0GyKQ==
X-Received: by 2002:a05:6602:1302:: with SMTP id
 h2mr15737403iov.65.1643773678420; 
 Tue, 01 Feb 2022 19:47:58 -0800 (PST)
Received: from james-x399.localdomain (71-218-245-50.hlrn.qwest.net.
 [71.218.245.50])
 by smtp.gmail.com with ESMTPSA id r15sm20200130ilo.25.2022.02.01.19.47.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Feb 2022 19:47:58 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  1 Feb 2022 20:47:55 -0700
Message-Id: <20220202034755.2191344-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-fonttools: bump to version
 4.29.1
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
 package/python-fonttools/python-fonttools.hash | 4 ++--
 package/python-fonttools/python-fonttools.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-fonttools/python-fonttools.hash b/package/python-fonttools/python-fonttools.hash
index 1f9b546c23..df0bdf980d 100644
--- a/package/python-fonttools/python-fonttools.hash
+++ b/package/python-fonttools/python-fonttools.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/fonttools/json
-md5  4a894b3cd108432f7636849b4026b771  fonttools-4.28.5.zip
-sha256  545c05d0f7903a863c2020e07b8f0a57517f2c40d940bded77076397872d14ca  fonttools-4.28.5.zip
+md5  7fc490291991da874911fed1e743362d  fonttools-4.29.1.zip
+sha256  2b18a172120e32128a80efee04cff487d5d140fe7d817deb648b2eee023a40e4  fonttools-4.29.1.zip
 # Locally computed sha256 checksums
 sha256  6787208f83f659ccbc2223b2fde952ffa6f7e8aca62f1a8a2bf5bc51bb1b2383  LICENSE
diff --git a/package/python-fonttools/python-fonttools.mk b/package/python-fonttools/python-fonttools.mk
index c5c605161b..d5c4cdf8e5 100644
--- a/package/python-fonttools/python-fonttools.mk
+++ b/package/python-fonttools/python-fonttools.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FONTTOOLS_VERSION = 4.28.5
+PYTHON_FONTTOOLS_VERSION = 4.29.1
 PYTHON_FONTTOOLS_SOURCE = fonttools-$(PYTHON_FONTTOOLS_VERSION).zip
-PYTHON_FONTTOOLS_SITE = https://files.pythonhosted.org/packages/ce/1b/d4cd86f4e6cbd54a3c4f807015b116299bcd6d6587ea0645d88ba9d932bb
+PYTHON_FONTTOOLS_SITE = https://files.pythonhosted.org/packages/2d/4c/49ba863863502bb9fea19d8bd04a527da336b4a2698c8a0c7129e9cc2716
 PYTHON_FONTTOOLS_SETUP_TYPE = setuptools
 PYTHON_FONTTOOLS_LICENSE = MIT
 PYTHON_FONTTOOLS_LICENSE_FILES = LICENSE
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
