Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70BDDC433FE
	for <buildroot@archiver.kernel.org>; Fri, 18 Feb 2022 10:56:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0AFB341D6E;
	Fri, 18 Feb 2022 10:56:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id znfwpz0fBzQK; Fri, 18 Feb 2022 10:56:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1C3A541D62;
	Fri, 18 Feb 2022 10:56:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CB13E1BF36A
 for <buildroot@lists.busybox.net>; Fri, 18 Feb 2022 10:55:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B8BEA41D62
 for <buildroot@lists.busybox.net>; Fri, 18 Feb 2022 10:55:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IZcY41fPQwYk for <buildroot@lists.busybox.net>;
 Fri, 18 Feb 2022 10:55:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B4FBE41D5A
 for <buildroot@buildroot.org>; Fri, 18 Feb 2022 10:55:57 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 m126-20020a1ca384000000b0037bb8e379feso8308069wme.5
 for <buildroot@buildroot.org>; Fri, 18 Feb 2022 02:55:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BHZlWBtmTAQ/+7SwIroyAKaiYOT+ZOish0Aq57VjzDY=;
 b=MxBHKEdTDNoGQI1gvbNeUVQzOjK8TUwMKYdmfX7eC2FNMVPRkreiDDbkbFk7lECcZy
 kUEg5rGEDG8B0sPYBuiZEjOggimvmePte9ZSdrCG8MwZROkRmYM3nrQNDNXIkZ/uGTt7
 cksfoYsLRUmm9TR4IEUqUR9jqnq/bIeXnqOJFII/l9ml4MtXjvaotrZ6mD9OCUzj2KEO
 xGM4/Y4kYGeTd2/7heT6KzyIhepmgvgtmzLHinEJDFoIQ/NGcTqiAZhO7+57XNvxOF9S
 pk5aiXQMJC8nsQKq6yjA9uEj6GnFaLX0N5aZCSmYrRAmGBZSyDD2eth/UGHc6pQnL4ch
 RH5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BHZlWBtmTAQ/+7SwIroyAKaiYOT+ZOish0Aq57VjzDY=;
 b=0mXn3w4Ic1UpTCdKQ6ZAM4SDXmOBJdJzMlu3tRG64SoBiNNZY8Mop3q/SXMFGlCbh2
 TkeAoMiyejHwXentCsOJLExN00ISwjOa1Q3KP5NqKmlWCYhJ9eFiLUxJMyyX3wSQbFSm
 gwoXWsLxrW+Bk08KEB1lUKzhOyPV8CvQitvAgRT1k/9ajqkkOGWLJPx2shQGll049m/s
 arh0Y6lKMLIelb9owpNHsxV/kGmI/23S4tLiUzFxeRrLrgZ1Nr30nY1vEURa0FiuaAzr
 ePuytciLpgZ9BLWvAZ48XUozrpMr0mw7b2XcrUEXBs0e5e41AszeBRHMRhokttWP4N6y
 T1cA==
X-Gm-Message-State: AOAM532AuthgtI8aziHMDcGnaK5Rhe+psBagfO0S1CJAsuYzKsmbu6Kq
 odWikOn+ctGMi8YqZjxfclM6HzdM7Zg=
X-Google-Smtp-Source: ABdhPJymuVTLLIkU8YibsGRJa9gw0O4cvDBcGU5D7COOomkM2dRBFGOocgcaLYEQr4OeF/Razxlo2w==
X-Received: by 2002:a05:600c:3d98:b0:352:cdcf:ef7f with SMTP id
 bi24-20020a05600c3d9800b00352cdcfef7fmr6578534wmb.28.1645181755747; 
 Fri, 18 Feb 2022 02:55:55 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id h10sm33999355wrt.57.2022.02.18.02.55.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Feb 2022 02:55:55 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 18 Feb 2022 11:55:57 +0100
Message-Id: <20220218105557.705926-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-twisted: security bump to
 version 22.1.0
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

Fix CVE-2022-21712: twisted is an event-driven networking engine written
in Python. In affected versions twisted exposes cookies and
authorization headers when following cross-origin redirects. This issue
is present in the `twited.web.RedirectAgent` and `twisted.web.
BrowserLikeRedirectAgent` functions. Users are advised to upgrade. There
are no known workarounds.

Update hash of license file (author added and update in year:
https://github.com/twisted/twisted/commit/13aa59746a73769b05a51c2198b28f5602dd382f
https://github.com/twisted/twisted/commit/adfdf23477abfcd09a867347993fc1d207cfb4dd
https://github.com/twisted/twisted/commit/7e65fbeed3d74a4eb1c40d7a6df5651782becbc8)

https://github.com/twisted/twisted/security/advisories/GHSA-92x2-jw7w-xvvx
https://github.com/twisted/twisted/releases/tag/twisted-22.1.0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/python-twisted/python-twisted.hash | 6 +++---
 package/python-twisted/python-twisted.mk   | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/python-twisted/python-twisted.hash b/package/python-twisted/python-twisted.hash
index c633112e9d..8f0935e4f0 100644
--- a/package/python-twisted/python-twisted.hash
+++ b/package/python-twisted/python-twisted.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/twisted/json
-md5  fc16d575730db7d0cddd09fc35af3eea  Twisted-20.3.0.tar.bz2
-sha256  d72c55b5d56e176563b91d11952d13b01af8725c623e498db5507b6614fc1e10  Twisted-20.3.0.tar.bz2
+md5  c818cb1ab241dc249517442e5a0e0412  Twisted-22.1.0.tar.gz
+sha256  b7971ec9805b0f80e1dcb1a3721d7bfad636d5f909de687430ce373979d67b61  Twisted-22.1.0.tar.gz
 # Locally computed sha256
-sha256  98426fd47315df70098e0d85efbb5d7dd8001c9c536386937354640d6d8d75b9  LICENSE
+sha256  686f6426a775450eb3afd00bc3a5c2621f305ddb9c8478ee9bf28a368ef2dece  LICENSE
diff --git a/package/python-twisted/python-twisted.mk b/package/python-twisted/python-twisted.mk
index 49d97af097..8e867cfb58 100644
--- a/package/python-twisted/python-twisted.mk
+++ b/package/python-twisted/python-twisted.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TWISTED_VERSION = 20.3.0
-PYTHON_TWISTED_SOURCE = Twisted-$(PYTHON_TWISTED_VERSION).tar.bz2
-PYTHON_TWISTED_SITE = https://files.pythonhosted.org/packages/4a/b4/4973c7ccb5be2ec0abc779b7d5f9d5f24b17b0349e23240cfc9dc3bd83cc
+PYTHON_TWISTED_VERSION = 22.1.0
+PYTHON_TWISTED_SOURCE = Twisted-$(PYTHON_TWISTED_VERSION).tar.gz
+PYTHON_TWISTED_SITE = https://files.pythonhosted.org/packages/77/b8/8108806ebf2b33654989fd1511281dc94a49fa7e03326d84fe5498ecfae4
 PYTHON_TWISTED_SETUP_TYPE = setuptools
 PYTHON_TWISTED_LICENSE = MIT
 PYTHON_TWISTED_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
