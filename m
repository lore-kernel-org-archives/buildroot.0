Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9ECDC433F5
	for <buildroot@archiver.kernel.org>; Sun,  8 May 2022 23:16:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 061E240994;
	Sun,  8 May 2022 23:16:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eT5Uyk8DfwqX; Sun,  8 May 2022 23:16:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A9255408F8;
	Sun,  8 May 2022 23:16:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7E4721BF3E3
 for <buildroot@lists.busybox.net>; Sun,  8 May 2022 23:16:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 770D460F03
 for <buildroot@lists.busybox.net>; Sun,  8 May 2022 23:16:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DYhCmvuDs-Ft for <buildroot@lists.busybox.net>;
 Sun,  8 May 2022 23:16:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com
 [IPv6:2607:f8b0:4864:20::d2c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8B99A6059C
 for <buildroot@buildroot.org>; Sun,  8 May 2022 23:16:01 +0000 (UTC)
Received: by mail-io1-xd2c.google.com with SMTP id e15so13642395iob.3
 for <buildroot@buildroot.org>; Sun, 08 May 2022 16:16:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0+cix7fDMzq+bO88Yiflfnih8E6F+yChsCVBPN1RaB4=;
 b=T2fthJTNNF+hugfK0zKJbfsSEoL/viyy2oG5cgt/HudeFpXWUtocvpgj5jkB4e2m76
 0uA3BTBoci1sAKLYd3HWwFSCpDIRWrWM/Z0Zb6Q023AKStkI1zsn0Euw1FJywADI2T4M
 384Wqv5T2vppeSDwZSzOvkLhghb7hnpNIz2MgiaH3TxXjA7PCETs48foIl3PHMDfywKK
 NvwEaNrCw41El4zk9PVm9KPgluErWghNKEPvSeQxXZoFtN8jq9ZyTw1vl0yxyf5G8Z6z
 ZlcgS082OXh6VJ0R1mpqYRn2AhleWGnUavaLa8eD4f3vNVZm9tJWqGJoB60hgigLfppo
 He4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0+cix7fDMzq+bO88Yiflfnih8E6F+yChsCVBPN1RaB4=;
 b=Ef8QipvevdswF+io2QlR8Mrxk6maKywB9CZonPLGKN2fuK2NYzDc4+bq0/zgkwSc3X
 hotjRImY0qbT3PVRhXZ63L+tvCrx5Vrmh0PwWF49j9uBuv1DJ8q85ihegqE4pjvlXS5V
 SXUuRGQpmJgC+GFzTYh3/5V3w+TM/5qzDqrpp1ImQDvB910dlvb9VE3PV+Op4Geadc2Y
 ploDMr6ZF97LM5KWtepPg1FtPi026d6Z2HgYV/VQuENeo41qnl3ofHxG38ZF2qq4Fowl
 mhkAKrSGD38mnwfmov1V9PUDO3+1Du3EsoS2FGpDRqm0xxDFMjnlAQdsClQZQFnseBIK
 d8eA==
X-Gm-Message-State: AOAM531CFw0NhwPO/6IPIVDsD/UqxcTUw1w8BtwSi4oYozI6pS7nG5uE
 7Mz2rmyHTv7ohr4MaoQ2q2YmimN1EZk=
X-Google-Smtp-Source: ABdhPJyV+kHQDHiSW68b6exbeygihqL1Im/n90R+7hqxRS9UbEEfb6aEhz3QbvnWVBXQu95iS6j8zw==
X-Received: by 2002:a05:6602:14c7:b0:65a:a689:2dec with SMTP id
 b7-20020a05660214c700b0065aa6892decmr5578524iow.104.1652051760437; 
 Sun, 08 May 2022 16:16:00 -0700 (PDT)
Received: from james-x399.localdomain (97-118-252-238.hlrn.qwest.net.
 [97.118.252.238]) by smtp.gmail.com with ESMTPSA id
 q19-20020a02c8d3000000b0032b3a781744sm3178989jao.8.2022.05.08.16.16.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 May 2022 16:16:00 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  8 May 2022 17:15:57 -0600
Message-Id: <20220508231557.1332204-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-async-lru: bump to version
 1.0.3
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
 package/python-async-lru/python-async-lru.hash | 8 ++++----
 package/python-async-lru/python-async-lru.mk   | 6 +++---
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/python-async-lru/python-async-lru.hash b/package/python-async-lru/python-async-lru.hash
index 6fa61e0e12..231af32baa 100644
--- a/package/python-async-lru/python-async-lru.hash
+++ b/package/python-async-lru/python-async-lru.hash
@@ -1,5 +1,5 @@
-# md5, sha256 from https://pypi.org/pypi/async_lru/json
-md5	69bed62927426353513e68aec77989ab  async_lru-1.0.2.tar.gz
-sha256	baa898027619f5cc31b7966f96f00e4fc0df43ba206a8940a5d1af5336a477cb  async_lru-1.0.2.tar.gz
+# md5, sha256 from https://pypi.org/pypi/async-lru/json
+md5  4dfcb328f2e9a8fdc9cf78dfdb6d3eef  async-lru-1.0.3.tar.gz
+sha256  c2cb9b2915eb14e6cf3e717154b40f715bf90e596d73623677affd0d1fbcd32a  async-lru-1.0.3.tar.gz
 # Locally computed sha256 checksums
-sha256	ea65975679bc2093be925d520358e41096bd96fddedee3e929160a5faadcf573  LICENSE
+sha256  ea65975679bc2093be925d520358e41096bd96fddedee3e929160a5faadcf573  LICENSE
diff --git a/package/python-async-lru/python-async-lru.mk b/package/python-async-lru/python-async-lru.mk
index adaa8f628d..872540b713 100644
--- a/package/python-async-lru/python-async-lru.mk
+++ b/package/python-async-lru/python-async-lru.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ASYNC_LRU_VERSION = 1.0.2
-PYTHON_ASYNC_LRU_SOURCE = async_lru-$(PYTHON_ASYNC_LRU_VERSION).tar.gz
-PYTHON_ASYNC_LRU_SITE = https://files.pythonhosted.org/packages/7e/c1/a3d6207deaaeb582d16dc9a0fd217f192efc9487ce59897131cf9a2bdc1c
+PYTHON_ASYNC_LRU_VERSION = 1.0.3
+PYTHON_ASYNC_LRU_SOURCE = async-lru-$(PYTHON_ASYNC_LRU_VERSION).tar.gz
+PYTHON_ASYNC_LRU_SITE = https://files.pythonhosted.org/packages/fe/67/4cb179c14ffa8b4a35fbe02255744bee4cbbaf61b35612c96ba4a618e4d5
 PYTHON_ASYNC_LRU_SETUP_TYPE = setuptools
 PYTHON_ASYNC_LRU_LICENSE = MIT
 PYTHON_ASYNC_LRU_LICENSE_FILES = LICENSE
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
