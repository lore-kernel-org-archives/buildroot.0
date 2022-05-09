Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31B75C433EF
	for <buildroot@archiver.kernel.org>; Mon,  9 May 2022 01:09:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D4893409DA;
	Mon,  9 May 2022 01:09:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id M-A9buPHHle2; Mon,  9 May 2022 01:09:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E5B444049A;
	Mon,  9 May 2022 01:09:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BFD4D1BF387
 for <buildroot@lists.busybox.net>; Mon,  9 May 2022 01:09:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BCF91409DA
 for <buildroot@lists.busybox.net>; Mon,  9 May 2022 01:09:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dneJGWEVyT5w for <buildroot@lists.busybox.net>;
 Mon,  9 May 2022 01:09:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com
 [IPv6:2607:f8b0:4864:20::d2f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CE01D404A9
 for <buildroot@buildroot.org>; Mon,  9 May 2022 01:09:23 +0000 (UTC)
Received: by mail-io1-xd2f.google.com with SMTP id i20so13815176ion.0
 for <buildroot@buildroot.org>; Sun, 08 May 2022 18:09:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uckR8ENqbWN4yUcHmaPX4BeDJJiggpE66a+avPM9E0U=;
 b=YYIT8Dejs5/MiqWI41ReoHf6ZiVEEuk1k/Oo8KbSxE52rJFWm29jzaRAswo7gSt2q/
 1Nc1TGhK7cZk+IGa76jH3WRYKpYsLaJE/05u+O+wovEmZBOnQ4m+ZGtl3cufl+h4XsKe
 uFH9+A4NZe2gxrtWuqjFDBmRl0gBJtTRCvemVU6qOGzOe6VaxJf2BSa45w5wzqfasY0v
 KRmaBlB8HJbNASAVWRyzsg4trhHG7ifTfPcmrMQmwX5BN0kwZqlLxe0pC2oEmJYs86Fy
 tEQgkLC9dte8txPm8XGLvy0f4Ec5ZHmunA0EuCjX8rTMoN7npYER+nGXytmhARTpE2on
 Ms1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uckR8ENqbWN4yUcHmaPX4BeDJJiggpE66a+avPM9E0U=;
 b=FoyLboXw/yIl7Omp8aniSUwtsp75V7oa58llRoJIFaljigqq7/JkqpiJwyjO1MFOGb
 /P9MdWla1iEM5U9gyNLu66vplyJN2eJDgLQQMq1xZzG6tbE65iwflDX358raBfHv0Av/
 rz4VOuXNPYDx4G3dGrk15mdr7gJGeSJksAUmtFkb87R7Ob2Bb1baoQPNMjguUbRm2YVE
 qoju1/OyZfUM8Pla93GWm23ZDl4S4OIjalU4ureZcEdB9zawnHhxdsGFpCNAzxiLlfSi
 Kw09WpeJVOh7S/ERaJ3Zb9rObmfGn266b4ERbiSsKOKh8SqW4j4rFwowRz61NKMyNgym
 yzow==
X-Gm-Message-State: AOAM531v/e4nqoNn5zE2lJVJavr1psD1N/tD3GQDwRZCEah0ONReTvQx
 giI3jQh7XJ2dI32AbWYfac9XE4Q3TRc=
X-Google-Smtp-Source: ABdhPJyED8JMy1dcVrmT0ej7tCw1DmZFjc6VJcBdFmmStIlsHb/qqZ359TWRiY7LYvCQtxOOAuJEsg==
X-Received: by 2002:a05:6638:52e:b0:32a:e022:5a9e with SMTP id
 j14-20020a056638052e00b0032ae0225a9emr6455565jar.60.1652058562606; 
 Sun, 08 May 2022 18:09:22 -0700 (PDT)
Received: from james-x399.localdomain (97-118-252-238.hlrn.qwest.net.
 [97.118.252.238]) by smtp.gmail.com with ESMTPSA id
 bp13-20020a056638440d00b0032b3a781755sm3213847jab.25.2022.05.08.18.09.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 May 2022 18:09:22 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  8 May 2022 19:09:17 -0600
Message-Id: <20220509010917.1485280-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220509010917.1485280-1-james.hilliard1@gmail.com>
References: <20220509010917.1485280-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] package/python-cssutils: bump to version
 2.4.0
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-cssutils/python-cssutils.hash | 4 ++--
 package/python-cssutils/python-cssutils.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-cssutils/python-cssutils.hash b/package/python-cssutils/python-cssutils.hash
index e22dde6e56..13459f7270 100644
--- a/package/python-cssutils/python-cssutils.hash
+++ b/package/python-cssutils/python-cssutils.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/cssutils/json
-md5  71955999f595e4b0eb5a218d614652ca  cssutils-2.3.0.tar.gz
-sha256  b2d3b16047caae82e5c590036935bafa1b621cf45c2f38885af4be4838f0fd00  cssutils-2.3.0.tar.gz
+md5  4ae0e6c670483043260363f593e96a69  cssutils-2.4.0.tar.gz
+sha256  2d97210a83b0a3fe1e4469f5ff9a6420b078572035188b1bab7103c3a36dc89b  cssutils-2.4.0.tar.gz
 # Locally computed sha256 checksums
 sha256  03c570a068086ee577dcd795519ea93462b2ed2fcb6dcc4dfce56a71a2fd6e5a  COPYING.LESSER
diff --git a/package/python-cssutils/python-cssutils.mk b/package/python-cssutils/python-cssutils.mk
index 09c2ca44d6..fc65c893ac 100644
--- a/package/python-cssutils/python-cssutils.mk
+++ b/package/python-cssutils/python-cssutils.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CSSUTILS_VERSION = 2.3.0
+PYTHON_CSSUTILS_VERSION = 2.4.0
 PYTHON_CSSUTILS_SOURCE = cssutils-$(PYTHON_CSSUTILS_VERSION).tar.gz
-PYTHON_CSSUTILS_SITE = https://files.pythonhosted.org/packages/f5/c6/878abb7df855938a067b762a688da3fcdfea4e41c2399feaf80369b61ed7
+PYTHON_CSSUTILS_SITE = https://files.pythonhosted.org/packages/f4/ea/d09b04b5cf6ad84f45ca4c523d3e153dd9be1f12650c825d1c92ca0618a2
 PYTHON_CSSUTILS_LICENSE = LGPL-3.0+
 PYTHON_CSSUTILS_LICENSE_FILES = COPYING.LESSER
 PYTHON_CSSUTILS_SETUP_TYPE = setuptools
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
