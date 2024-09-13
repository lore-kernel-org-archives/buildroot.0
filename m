Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B835DFC6172
	for <buildroot@archiver.kernel.org>; Fri, 13 Sep 2024 21:08:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 59F9C60585;
	Fri, 13 Sep 2024 21:08:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TlOB2xgmX6ue; Fri, 13 Sep 2024 21:08:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6644A60614
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6644A60614;
	Fri, 13 Sep 2024 21:08:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DA13B1BF852
 for <buildroot@lists.busybox.net>; Fri, 13 Sep 2024 21:08:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C96EE846AF
 for <buildroot@lists.busybox.net>; Fri, 13 Sep 2024 21:08:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nFOR-K452tzD for <buildroot@lists.busybox.net>;
 Fri, 13 Sep 2024 21:08:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.126.134;
 helo=mout.kundenserver.de; envelope-from=paguilar@paguilar.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1D1508455C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1D1508455C
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.134])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1D1508455C
 for <buildroot@buildroot.org>; Fri, 13 Sep 2024 21:08:38 +0000 (UTC)
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from uxmal.fritz.box ([151.51.184.1]) by mrelayeu.kundenserver.de
 (mreue011 [212.227.17.189]) with ESMTPSA (Nemesis) id
 1N5mWp-1rwx8Z1b1n-01495o; Fri, 13 Sep 2024 23:03:32 +0200
From: Pedro Aguilar <paguilar@paguilar.org>
To: buildroot@buildroot.org
Date: Fri, 13 Sep 2024 23:03:01 +0200
Message-Id: <20240913210301.6681-1-paguilar@paguilar.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Provags-ID: V03:K1:BRQOXLoPkVDEW8GnAxxEVb3pPwIpVc40NOlwa5MZzdMMBuzB6QG
 I+C5WML588ykFHWeVa3RK1n58Pocc8Pxgh1Wl/ArhikGYqv8K9VAGLVqqK/OPmYMI5Fi8hq
 TGglKN73cgsNfgOcU4FGXKlmXKjNkV8j62zBchtm3L5UTtvBNSHZRA+iSQkL93lQ2XrFD/V
 HQvrmjr6xdJlh3oDx6Csw==
UI-OutboundReport: notjunk:1;M01:P0:eduEKPdq/cg=;eWcA2SazbzLq5PMTHA1DH+ccXXw
 yqfervpaHqHOu0qgG2D/a88+FauHebI/sKxfqGviivr89A6nluU09nKyVlgv1e3fLHTwvRqOH
 TRPy6E3AXCUttnySYuQLAdwOZZUysoqYzSY6EIaw/dUoDDb8w5g9X+a3VDg5N0OiDzDVZtvvd
 eK5Q/k+/IBUFMg4qiUkboc5ClLvKp8du8sBvhJNBgKamRnSl3OFsE1oXgOIDxtj4RYDklqoZP
 LJJJ00jGew3NZHY0+VSXnCM6C3ZnaTuGRzhAZySsAaWyeEoAhBdu8pMep3NLmQbZI9Sg0JxNX
 kud3AenZwcaTLTuCuYmb4v8tSfkj/c2xR6X/hzdpFH5NRyqqT87B/g3gBsiety/LuI0xuJylW
 kJ9HAW8NQHnYnpGGdqcLvqJVWtqjWrJxG07DEZswEbzS5B9Jx1DO8T0QYwZTC7uM3v7Lsceso
 FpLpjt3ZRPo1dw0gIKV4qdRRv57TFEEHeajxX8yU9tJvNttlfvOmFqmnEdSkMhf4d4OUoPKX2
 RABx5hwwiNW7YxzSnukVjT+fzOuNHo25YCnAsOO/Ryy/PgbmmADEYDUDCPiNLgtboDWot44nS
 EQNA0ten0Ht7wWcM9IrTaOx+CJKb3vFY+d7JhPD4cUnoS/Gv7z9ryMIziqVXL5O/ZVldx1B5U
 pcm7tyQCbaNHYeJwPQx2ZIU47tf5gm18mIh5R8z5lLerc6uJZHlDc7Qf20B7sr2+78s6TNvev
 JbD1XEc/jbrK12pEGVHk6Tx2VDrVkF7HA==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=paguilar.org; 
 s=s1-ionos; t=1726261717; x=1726866517; i=paguilar@paguilar.org;
 bh=mYdHs9OrouKOoSdVT6MhRbQSscfKgzJ3qDd2R8sZRBk=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:
 MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=fgIAtMVZGkhrxIbJTtzzQ7b3BsqVNXFKwDU7f0proJuiTmDu3iTfap5l7UdPUoG2
 mVJ3sKs5fSOPYw41OqAJ/13DPq0tdleeMRyQOXER0tk++cSZHD25Ei64QDh0RnrM3
 PT+DUhaQYoP7r2Lo3xKrEJ6KFeJuh45ccQwCqLpyhsXq+CbSkNnoPCnRRmkCXr11I
 WGeqB9Lz+/zQevD7OlcaF6gW84oGV7DSywFFjbvpUrfLsdq7DXhPhclpZCOVYK7ny
 zJ98lhFHa32aW9bkrcWHYokxQUrbrWv5AtovdLPW9ab3Idoo/H9eUbwR/dnDH3mE9
 4hfHBmuwxytz3iRAFw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=paguilar.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=paguilar.org header.i=paguilar@paguilar.org
 header.a=rsa-sha256 header.s=s1-ionos header.b=fgIAtMVZ
Subject: [Buildroot] [PATCH 1/1] package/bdwgc: bump to version 8.2.6
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
Cc: paguilar@paguilar.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Pedro Aguilar <paguilar@paguilar.org>
---
 package/bdwgc/bdwgc.hash | 4 ++++
 package/bdwgc/bdwgc.mk   | 4 ++++
 2 files changed, 8 insertions(+)

diff --git a/package/bdwgc/bdwgc.hash b/package/bdwgc/bdwgc.hash
index 917089da08..1e8cc6df98 100644
--- a/package/bdwgc/bdwgc.hash
+++ b/package/bdwgc/bdwgc.hash
@@ -1,3 +1,7 @@
 # Locally computed
+<<<<<<< Updated upstream
 sha256  f30107bcb062e0920a790ffffa56d9512348546859364c23a14be264b38836a0  gc-8.2.2.tar.gz
+=======
+sha256  b9183fe49d4c44c7327992f626f8eaa1d8b14de140f243edb1c9dcff7719a7fc  gc-8.2.6.tar.gz
+>>>>>>> Stashed changes
 sha256  a9b077aeb4e9e1aaf9742119d8023ef26f52f445cdc3f60d390bf59e1647f54a  README.QUICK
diff --git a/package/bdwgc/bdwgc.mk b/package/bdwgc/bdwgc.mk
index e776fb7458..e1cdbce62c 100644
--- a/package/bdwgc/bdwgc.mk
+++ b/package/bdwgc/bdwgc.mk
@@ -4,7 +4,11 @@
 #
 ################################################################################

+<<<<<<< Updated upstream
 BDWGC_VERSION = 8.2.2
+=======
+BDWGC_VERSION = 8.2.6
+>>>>>>> Stashed changes
 BDWGC_SOURCE = gc-$(BDWGC_VERSION).tar.gz
 BDWGC_SITE = https://github.com/ivmai/bdwgc/releases/download/v$(BDWGC_VERSION)
 BDWGC_INSTALL_STAGING = YES
--
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
