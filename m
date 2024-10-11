Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83A3BD0EE1E
	for <buildroot@archiver.kernel.org>; Fri, 11 Oct 2024 17:25:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 248F060A4A;
	Fri, 11 Oct 2024 17:25:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bdrOqDCTPHAw; Fri, 11 Oct 2024 17:25:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 245FA60A51
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 245FA60A51;
	Fri, 11 Oct 2024 17:25:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 457D71BF37C
 for <buildroot@lists.busybox.net>; Fri, 11 Oct 2024 17:25:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3406D60A4A
 for <buildroot@lists.busybox.net>; Fri, 11 Oct 2024 17:25:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YVTSrJhA79yI for <buildroot@lists.busybox.net>;
 Fri, 11 Oct 2024 17:25:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d30; helo=mail-io1-xd30.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 350EA60A4C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 350EA60A4C
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com
 [IPv6:2607:f8b0:4864:20::d30])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 350EA60A4C
 for <buildroot@buildroot.org>; Fri, 11 Oct 2024 17:25:18 +0000 (UTC)
Received: by mail-io1-xd30.google.com with SMTP id
 ca18e2360f4ac-835453714e5so96505539f.0
 for <buildroot@buildroot.org>; Fri, 11 Oct 2024 10:25:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728667517; x=1729272317;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EPFYFc2Z/PXshl2bv6D/Y0Y87azjsvXGy7d8GIZLo1o=;
 b=YQ2Rw5LC2X7bDtf0ZzmTGIRTGSth7bJvjrffUOMKXHjr8p7RvX3NxNlg+Xa9vINFC9
 4P53dq1GG8sNEol9/GKJF3RaSB5ccXmQpCJTUlV2QfPKXbsxo7NboOtMFMXLqAI+nqSO
 yYzbZ2C6v/Y9Hj1O4GdiPo4PFaywhb+k28JAGaBoK7JvgPALaS35wj6XsTF9T7mBEItZ
 mFCCz7JEZHng33//tO/FDZA+R8R6bgQk8KScTi6YMcCAtk31xMt08ME9kLhe13Bs5x9t
 Y/So3G6uBVQ503EIkuvPJ87Xx00B8HytJgl7o0NC+AswdKxaZOpmNZwBDZXmnzGafXLT
 dN+g==
X-Gm-Message-State: AOJu0Yxq7R8+lVty3i1UYB1wKnQCAY1Gon2Pv7vsHNgWnPqLGVM4YNjn
 lcbXSqSmRcFEXM24IKlh2kbtdsiGK3fHBClW7Ou3SShNHFQL6OSRQu8gWg==
X-Google-Smtp-Source: AGHT+IEhSCdYdQr/ixT+QMDxNFj2KR2OxQO4Pp+jbOmX2TXd8jhMbLZOg4uOH9wXlbXPq8juhgtLnQ==
X-Received: by 2002:a05:6602:641d:b0:834:f34d:859 with SMTP id
 ca18e2360f4ac-8379231994dmr409502939f.3.1728667516842; 
 Fri, 11 Oct 2024 10:25:16 -0700 (PDT)
Received: from james-x399.localdomain (71-33-159-223.hlrn.qwest.net.
 [71.33.159.223]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4dbada849a8sm718061173.118.2024.10.11.10.25.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Oct 2024 10:25:16 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 11 Oct 2024 11:25:15 -0600
Message-Id: <20241011172515.2759554-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1728667517; x=1729272317; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=EPFYFc2Z/PXshl2bv6D/Y0Y87azjsvXGy7d8GIZLo1o=;
 b=HRgYkH6An1UuvBFFD7N8wOKVq7x39Wvc8kY4j7r3PBA4+AzXrIafDG1CHe08/q785i
 Ygqn3SL0C1Nzru4XR7Cil3ZrFn8tnwY0e+MTWKNwUoACMnXa7EHL+hCRL+aVmQTFNGJY
 2RAO2Pu3fJxXyWhJobNbX9EM92aM5JwzMAt/YC1p90ODmvulwQCHCjdpnZABn10ukxqc
 pdIJ9sJfa42dS2aNtcdf90AxQvHil2Vj6pbQpkS35/s4lfq92Fey8nCu7DI6NWd/EgRh
 E6AFWIay8JowXhOAunWWF+rVPsVzQ/K5eJiNQ7vQnqkQ37HYHKtrWsoIBX+DOIlYWHQ0
 isyQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=HRgYkH6A
Subject: [Buildroot] [PATCH 1/1] package/python-aiohttp: bump to version
 3.10.10
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
 package/python-aiohttp/python-aiohttp.hash | 4 ++--
 package/python-aiohttp/python-aiohttp.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-aiohttp/python-aiohttp.hash b/package/python-aiohttp/python-aiohttp.hash
index 9f06fbaad1..fd3ca7d72a 100644
--- a/package/python-aiohttp/python-aiohttp.hash
+++ b/package/python-aiohttp/python-aiohttp.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/aiohttp/json
-md5  887aab9d024b90084f251c28f6c0a752  aiohttp-3.10.9.tar.gz
-sha256  143b0026a9dab07a05ad2dd9e46aa859bffdd6348ddc5967b42161168c24f857  aiohttp-3.10.9.tar.gz
+md5  fa0526dab4bf4b755537ae5718a43e25  aiohttp-3.10.10.tar.gz
+sha256  0631dd7c9f0822cc61c88586ca76d5b5ada26538097d0f1df510b082bad3411a  aiohttp-3.10.10.tar.gz
 # Locally computed sha256 checksums
 sha256  9f80d0db7d755a941db4572172c270ecbd8f082ba215ddd095985942ed94a9eb  LICENSE.txt
diff --git a/package/python-aiohttp/python-aiohttp.mk b/package/python-aiohttp/python-aiohttp.mk
index 5d8b66f8cb..17eeae72b3 100644
--- a/package/python-aiohttp/python-aiohttp.mk
+++ b/package/python-aiohttp/python-aiohttp.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AIOHTTP_VERSION = 3.10.9
+PYTHON_AIOHTTP_VERSION = 3.10.10
 PYTHON_AIOHTTP_SOURCE = aiohttp-$(PYTHON_AIOHTTP_VERSION).tar.gz
-PYTHON_AIOHTTP_SITE = https://files.pythonhosted.org/packages/14/40/f08c5d26398f987c1a27e1e351a4b461a01ffdbf9dde429c980db5286c92
+PYTHON_AIOHTTP_SITE = https://files.pythonhosted.org/packages/17/7e/16e57e6cf20eb62481a2f9ce8674328407187950ccc602ad07c685279141
 PYTHON_AIOHTTP_SETUP_TYPE = setuptools
 PYTHON_AIOHTTP_LICENSE = Apache-2.0
 PYTHON_AIOHTTP_LICENSE_FILES = LICENSE.txt
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
