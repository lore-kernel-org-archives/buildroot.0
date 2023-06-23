Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3B4CEB64D7
	for <buildroot@archiver.kernel.org>; Fri, 23 Jun 2023 07:25:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6C21240328;
	Fri, 23 Jun 2023 07:25:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6C21240328
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id v_6UqEBIy4dv; Fri, 23 Jun 2023 07:25:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 945D5401D5;
	Fri, 23 Jun 2023 07:25:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 945D5401D5
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1D93D1BF4DD
 for <buildroot@lists.busybox.net>; Fri, 23 Jun 2023 07:25:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0478381D47
 for <buildroot@lists.busybox.net>; Fri, 23 Jun 2023 07:25:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0478381D47
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Vg8giEjp0_eY for <buildroot@lists.busybox.net>;
 Fri, 23 Jun 2023 07:25:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A3FB781B8A
Received: from mail-il1-x131.google.com (mail-il1-x131.google.com
 [IPv6:2607:f8b0:4864:20::131])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A3FB781B8A
 for <buildroot@buildroot.org>; Fri, 23 Jun 2023 07:25:04 +0000 (UTC)
Received: by mail-il1-x131.google.com with SMTP id
 e9e14a558f8ab-341c362a851so1141975ab.2
 for <buildroot@buildroot.org>; Fri, 23 Jun 2023 00:25:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687505103; x=1690097103;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bdnEb8J5Tr2WCq9WdkCFfjj8yCbXLNUOG02O+MCbTsE=;
 b=MIRq8aPBfJ/FPyoZCnat/0kA2bAcH3XZ7iuvc0hxkm+DI+Wrp1lEHE5M84WWVT6DQn
 7lZjTNAHxh8YqZB/nh9AesBmLFDXvXNf15KGrOJbEVgHeErz604Jmlq9J+dRGXiZ1ccP
 USk/npa8M+b1qzjityvD6RxernhzkPF+iq2IDk60824x35KETDoGxKDY7i/j0B1j2+Am
 K5qXS0hBAILM2+DFfFtVpDbbMDtKVYI+sLPH/yqz0WMtXFvUzrAURZu7TgQa+chPoXNz
 3BhV0tfwewrt/SNgIkEVullg3fLX3I0AS653WAlQDmKGEaQvzZivO0y6vXzYMB20G46N
 RHpw==
X-Gm-Message-State: AC+VfDxf3y76Ji6iRKBTJlV7snLYfeJnzZ8vwlswBG4L9GBULjIWwyq7
 Wj6X3/euP0L8iPMvb5qFjVN0OSmiDfo=
X-Google-Smtp-Source: ACHHUZ6RiUpWqZII2S8rbOKBJ5VMReNbfI4v8VwFcgF/vbQ9QE9sCkQi5KqteWfJPu5FVyjyis1OWw==
X-Received: by 2002:a92:d9cb:0:b0:340:9f52:a981 with SMTP id
 n11-20020a92d9cb000000b003409f52a981mr15455152ilq.2.1687505103408; 
 Fri, 23 Jun 2023 00:25:03 -0700 (PDT)
Received: from james-x399.localdomain (71-218-252-17.hlrn.qwest.net.
 [71.218.252.17]) by smtp.gmail.com with ESMTPSA id
 h11-20020a92c08b000000b00342a1941daesm2541242ile.81.2023.06.23.00.25.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Jun 2023 00:25:03 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 23 Jun 2023 01:24:57 -0600
Message-Id: <20230623072457.130591-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1687505103; x=1690097103;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=bdnEb8J5Tr2WCq9WdkCFfjj8yCbXLNUOG02O+MCbTsE=;
 b=lbVBIEo0opYMhpNuYY1Kz8dHNqSmmqPjFzNJQJ+T9nMY5KYuQXl0zokwDPNFxyHyUU
 b2DMMwKbQLdqQdTuWUDN8sQjFXmVl9hi99x/FpfQY48Hxo+i1IwPahlgoOenvwlMabVE
 JjoyRzfjelLW7S4QubyxvBy3uOsALse7C8zKAv/aN9lN269OW2ne4PKUM0TX3WZVXKGJ
 +bsIfBVVW9q8EXstqZWDx++qxAqpP/81P/XZitA8LhDbwu3sqnFnkMnfeTIDJ5vacw93
 GIyPnT8HKjfB0sd1iywqYb1Fh5qX81BTk6CNn2SKlCWN/Kkz3A2FT5bEqvIRidJB68/c
 z+Ow==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=lbVBIEo0
Subject: [Buildroot] [PATCH 1/1] package/python-setuptools: bump to version
 68.0.0
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
 package/python-setuptools/python-setuptools.hash | 4 ++--
 package/python-setuptools/python-setuptools.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-setuptools/python-setuptools.hash b/package/python-setuptools/python-setuptools.hash
index be13063728..45413af27e 100644
--- a/package/python-setuptools/python-setuptools.hash
+++ b/package/python-setuptools/python-setuptools.hash
@@ -1,4 +1,4 @@
 # From https://pypi.org/pypi/setuptools/json
-md5  628ab1ae7d14185e5e536740ea31b5ce  setuptools-67.8.0.tar.gz
-sha256  62642358adc77ffa87233bc4d2354c4b2682d214048f500964dbe760ccedf102  setuptools-67.8.0.tar.gz
+md5  c5e4ff6557d99204464aa300c0bad7d4  setuptools-68.0.0.tar.gz
+sha256  baf1fdb41c6da4cd2eae722e135500da913332ab3f2f5c7d33af9b492acb5235  setuptools-68.0.0.tar.gz
 sha256  86da0f01aeae46348a3c3d465195dc1ceccde79f79e87769a64b8da04b2a4741  LICENSE
diff --git a/package/python-setuptools/python-setuptools.mk b/package/python-setuptools/python-setuptools.mk
index 6d10172cdc..2674947162 100644
--- a/package/python-setuptools/python-setuptools.mk
+++ b/package/python-setuptools/python-setuptools.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SETUPTOOLS_VERSION = 67.8.0
+PYTHON_SETUPTOOLS_VERSION = 68.0.0
 PYTHON_SETUPTOOLS_SOURCE = setuptools-$(PYTHON_SETUPTOOLS_VERSION).tar.gz
-PYTHON_SETUPTOOLS_SITE = https://files.pythonhosted.org/packages/03/20/630783571e76e5fa5f3e9f29398ca3ace377207b8196b54e0ffdf09f12c1
+PYTHON_SETUPTOOLS_SITE = https://files.pythonhosted.org/packages/dc/98/5f896af066c128669229ff1aa81553ac14cfb3e5e74b6b44594132b8540e
 PYTHON_SETUPTOOLS_LICENSE = MIT
 PYTHON_SETUPTOOLS_LICENSE_FILES = LICENSE
 PYTHON_SETUPTOOLS_CPE_ID_VENDOR = python
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
