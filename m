Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64ECAC0015E
	for <buildroot@archiver.kernel.org>; Tue, 25 Jul 2023 13:56:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EDE8681F75;
	Tue, 25 Jul 2023 13:56:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EDE8681F75
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id v5Hwq5xd6Nio; Tue, 25 Jul 2023 13:56:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 22C6F81EF9;
	Tue, 25 Jul 2023 13:56:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 22C6F81EF9
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 338291BF84C
 for <buildroot@lists.busybox.net>; Tue, 25 Jul 2023 13:56:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 098B260FA2
 for <buildroot@lists.busybox.net>; Tue, 25 Jul 2023 13:56:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 098B260FA2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mZM6McQU6RuQ for <buildroot@lists.busybox.net>;
 Tue, 25 Jul 2023 13:56:14 +0000 (UTC)
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com
 [IPv6:2607:f8b0:4864:20::12d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1911860773
 for <buildroot@buildroot.org>; Tue, 25 Jul 2023 13:56:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1911860773
Received: by mail-il1-x12d.google.com with SMTP id
 e9e14a558f8ab-348c9b58870so11688665ab.3
 for <buildroot@buildroot.org>; Tue, 25 Jul 2023 06:56:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690293372; x=1690898172;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wfXb611x3xqre5+hkEeBB9z2p/rAx/wiEYIhRtm35yI=;
 b=dqUyJW/ztSHNultaIGTdJmZBcSGhQ23DfQB0XumcpJf/VZ7RAU1rAjAFNQU6TKWBCz
 2Rx1xwBg2FAesoJrrfW/alaHK6gCSdxhaVf4H148GS+03ZaETMiVorWB4iSN89K/LgE6
 3U+TxvNfLmq/6OYmrn16Us27GJa2E0VQrN/WlLz9AIGCT2arSXEaJ1E2877z0bUuctAL
 GZxFIDnzN1Q29HPNHFWmDRer+MdygDWu5ML+eDtWEO0c4J5w0pyNMW4lD+e/fVblPhbH
 Tla8hXmh9/xfoxytkHc8gQAaLeYgbusJ/5n5nZc62TCq7IYvuFBGkfVj/xJ0UanisqM1
 Eoug==
X-Gm-Message-State: ABy/qLbRVtNIM0MijWXk9PGH0AS+JGO59WpGEbS56lezRU8GwE1oBpzK
 4Gw19OnjZINJYN8l9n3FojbX6BfeH/w=
X-Google-Smtp-Source: APBJJlGOwvHhcj4h8mtTBpOtikE+1/+g+3Oy4eqVeUjpzzrha7TbMdl+EhOsCunxEGujMuU1aZnY8Q==
X-Received: by 2002:a05:6e02:16ce:b0:348:8519:1280 with SMTP id
 14-20020a056e0216ce00b0034885191280mr3820386ilx.0.1690293372603; 
 Tue, 25 Jul 2023 06:56:12 -0700 (PDT)
Received: from james-x399.localdomain (71-33-156-134.hlrn.qwest.net.
 [71.33.156.134]) by smtp.gmail.com with ESMTPSA id
 o5-20020a92c045000000b00345da2c4776sm3675644ilf.81.2023.07.25.06.56.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jul 2023 06:56:11 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 25 Jul 2023 07:56:10 -0600
Message-Id: <20230725135610.302289-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690293372; x=1690898172;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=wfXb611x3xqre5+hkEeBB9z2p/rAx/wiEYIhRtm35yI=;
 b=MhdwP2c1fCWW5K4wbqSl4hWQmVwuyhU/UL69p3yobj7x3KC3p3I9t/AfJ0ROifyRXC
 xrwjsWObs3g10s2s45Ou+B1p4SvBePRdBehU7f56kJXNIIdb5v2iUwxceFbu5tb9ejrk
 18S6DtTQrlCrr7u7bydgQ6lCX++XNZnx/QzeSTlkaC/FkGXVcruthyCUf8m2V9ERMRHz
 ez0xjKQ0A0hRtrocyfRLjcH5RZJrXa4cmgZXwsY770ctIN9Ve/NnD7SZr+kuWmNL8hrJ
 GTRxpy/bE4b49Nu1wODV2oukLnfJvM/ccgpn0azqYInaYDkvOBQg3D+z10EY7NWJi7Yy
 UNyw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=MhdwP2c1
Subject: [Buildroot] [PATCH 1/1] package/python-pillow: bump to version
 10.0.0
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
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pillow/python-pillow.hash | 4 ++--
 package/python-pillow/python-pillow.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pillow/python-pillow.hash b/package/python-pillow/python-pillow.hash
index 43bb824b6a..bca66a7436 100644
--- a/package/python-pillow/python-pillow.hash
+++ b/package/python-pillow/python-pillow.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/pillow/json
-md5  ed80942ad1ade1aab0fcf3790d0be3ec  Pillow-9.5.0.tar.gz
-sha256  bf548479d336726d7a0eceb6e767e179fbde37833ae42794602631a070d630f1  Pillow-9.5.0.tar.gz
+md5  2a8f327ba2250aad26ed101337c8fa56  Pillow-10.0.0.tar.gz
+sha256  9c82b5b3e043c7af0d95792d0d20ccf68f61a1fec6b3530e718b688422727396  Pillow-10.0.0.tar.gz
 
 # Locally computed sha256 checksums
 sha256  0fdb68ffb39062553be40be4e6eaea9700b4f5e870a720ae86b8925d67613ddd  LICENSE
diff --git a/package/python-pillow/python-pillow.mk b/package/python-pillow/python-pillow.mk
index b69d329cde..95a67f304e 100644
--- a/package/python-pillow/python-pillow.mk
+++ b/package/python-pillow/python-pillow.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PYTHON_PILLOW_VERSION = 9.5.0
-PYTHON_PILLOW_SITE = https://files.pythonhosted.org/packages/00/d5/4903f310765e0ff2b8e91ffe55031ac6af77d982f0156061e20a4d1a8b2d
+PYTHON_PILLOW_VERSION = 10.0.0
+PYTHON_PILLOW_SITE = https://files.pythonhosted.org/packages/0f/8b/2ebaf9adcf4260c00f842154865f8730cf745906aa5dd499141fb6063e26
 PYTHON_PILLOW_SOURCE = Pillow-$(PYTHON_PILLOW_VERSION).tar.gz
 PYTHON_PILLOW_LICENSE = HPND
 PYTHON_PILLOW_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
