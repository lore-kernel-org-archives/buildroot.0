Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 917FFEB64D7
	for <buildroot@archiver.kernel.org>; Fri, 23 Jun 2023 07:11:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E4F8B60B1C;
	Fri, 23 Jun 2023 07:11:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E4F8B60B1C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ccyF9hGlJCx8; Fri, 23 Jun 2023 07:11:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 261E260AED;
	Fri, 23 Jun 2023 07:11:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 261E260AED
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E07E71BF4DD
 for <buildroot@lists.busybox.net>; Fri, 23 Jun 2023 07:11:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C52F4419D3
 for <buildroot@lists.busybox.net>; Fri, 23 Jun 2023 07:11:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C52F4419D3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WW9NdUlcraet for <buildroot@lists.busybox.net>;
 Fri, 23 Jun 2023 07:11:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 67CF1418F1
Received: from mail-il1-x135.google.com (mail-il1-x135.google.com
 [IPv6:2607:f8b0:4864:20::135])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 67CF1418F1
 for <buildroot@buildroot.org>; Fri, 23 Jun 2023 07:11:39 +0000 (UTC)
Received: by mail-il1-x135.google.com with SMTP id
 e9e14a558f8ab-341dd309b6fso1153875ab.1
 for <buildroot@buildroot.org>; Fri, 23 Jun 2023 00:11:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687504298; x=1690096298;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=AOiNmM4z/ohK5o9ncBj9/xCavVGqZLtzJdmeiv7+X4E=;
 b=YPiipHVYBD7le9dv6M9BrSaG3JhWqrAtyewZs3boUsgYDiO7W8qvnN4BixqddAgJLW
 yC3LRpzazT8I8WpO2xB9bRUgDtFf11MHPxxwrIJ0cmX7+tegd2TnNs8SAQud2onEG6ri
 RIHBS/y/rEUpkKNt7+h62UtRvRbrJM6PB41jNnlgViX+iW1zS/iD9iyil7z0xVZFVVSa
 LteAeHGJ17B8IpeqBz3m1xwApWnWQPLrxB9dP13KcKNnTjpfFIDkPrbH3ghdxpZWGui6
 7ns6S5yZ/LfDDaJ+L93+2Xiawbpwtxc9/IYxAMXLAuxb3zJWL9hx2vSm3+7sKDA3kZDH
 LTCg==
X-Gm-Message-State: AC+VfDzkKqBwIuKlWcthCp+CsJqDaFjcinQavs31FMhvbmIJoV5K2n5S
 /jsIiBG3rmfpVXY9kcK6zWo1w4ejLfg=
X-Google-Smtp-Source: ACHHUZ70zVcmWWpNhf40jA7IlmRmuGMm8GoxNitkkydqH+/L0hnP/IE4fw4i4zvJXJ3EAP5lkjtL2g==
X-Received: by 2002:a92:dc0a:0:b0:340:4e87:9947 with SMTP id
 t10-20020a92dc0a000000b003404e879947mr18690462iln.9.1687504298308; 
 Fri, 23 Jun 2023 00:11:38 -0700 (PDT)
Received: from james-x399.localdomain (71-218-252-17.hlrn.qwest.net.
 [71.218.252.17]) by smtp.gmail.com with ESMTPSA id
 s11-20020a92d90b000000b00333b5ae4ab7sm2516260iln.87.2023.06.23.00.11.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Jun 2023 00:11:37 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 23 Jun 2023 01:11:36 -0600
Message-Id: <20230623071136.126003-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1687504298; x=1690096298;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=AOiNmM4z/ohK5o9ncBj9/xCavVGqZLtzJdmeiv7+X4E=;
 b=Rq+tjkhFjjuYepEoazDjGmAFanznnzPhrEY23nn9McPP1/pstRExA1DPJua1cPVcAu
 RXY8jo6poD/FERIi+Osr0CjAo+T2Xgp4CfWp/zBqs6xUVvCK2SM3Ra4TqUAg9feSYnTW
 XCUkGc/upTTSbER6xcGc9aQ72Bz0G312qzaqWvBOiKq/CQ1PDmdt8CPmBSltKk3eMUZw
 QlrY2Wgli2enMgHRvILJN5TYXVygDLFdM6Aw56QvGZVZJMPsU2MyZKvXeYoCEc/2kqP/
 uCCkhXFUIZoNqbGKUIhfcigQEAAsHDDsNq97yZPcJdASUadh4RCzqq8uiYkcu6Wb1uXE
 Lxhg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=Rq+tjkhF
Subject: [Buildroot] [PATCH 1/1] package/python-cryptography: bump to
 version 39.0.2
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
 package/python-cryptography/python-cryptography.hash | 2 +-
 package/python-cryptography/python-cryptography.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/python-cryptography/python-cryptography.hash b/package/python-cryptography/python-cryptography.hash
index a23944a06f..e083014750 100644
--- a/package/python-cryptography/python-cryptography.hash
+++ b/package/python-cryptography/python-cryptography.hash
@@ -1,5 +1,5 @@
 # Locally calculated after vendoring
-sha256  531348679f144d118156be5b17ddac750974cdcd9f44bb0a7cfd7ddcfee79c80  cryptography-39.0.1.tar.gz
+sha256  405c9a6271e1a088ea0b432bc2094e2e8baadb2241e192ce9c73a7cc9793b127  cryptography-39.0.2.tar.gz
 # Locally computed sha256 checksums
 sha256  43dad2cc752ab721cd9a9f36ece70fb53ab7713551f2d3d8694d8e8c5a06d6e2  LICENSE
 sha256  aac73b3148f6d1d7111dbca32099f68d26c644c6813ae1e4f05f6579aa2663fe  LICENSE.APACHE
diff --git a/package/python-cryptography/python-cryptography.mk b/package/python-cryptography/python-cryptography.mk
index a130b2d10d..67aa20742d 100644
--- a/package/python-cryptography/python-cryptography.mk
+++ b/package/python-cryptography/python-cryptography.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CRYPTOGRAPHY_VERSION = 39.0.1
+PYTHON_CRYPTOGRAPHY_VERSION = 39.0.2
 PYTHON_CRYPTOGRAPHY_SOURCE = cryptography-$(PYTHON_CRYPTOGRAPHY_VERSION).tar.gz
-PYTHON_CRYPTOGRAPHY_SITE = https://files.pythonhosted.org/packages/6a/f5/a729774d087e50fffd1438b3877a91e9281294f985bda0fd15bf99016c78
+PYTHON_CRYPTOGRAPHY_SITE = https://files.pythonhosted.org/packages/fa/f3/f4b8c175ea9a1de650b0085858059050b7953a93d66c97ed89b93b232996
 PYTHON_CRYPTOGRAPHY_SETUP_TYPE = setuptools
 PYTHON_CRYPTOGRAPHY_LICENSE = Apache-2.0 or BSD-3-Clause
 PYTHON_CRYPTOGRAPHY_LICENSE_FILES = LICENSE LICENSE.APACHE LICENSE.BSD
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
