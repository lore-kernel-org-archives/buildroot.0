Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43665C433EF
	for <buildroot@archiver.kernel.org>; Mon, 24 Jan 2022 10:52:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E8FB740240;
	Mon, 24 Jan 2022 10:52:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id m4KIptGVHPFh; Mon, 24 Jan 2022 10:52:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 15AA14021F;
	Mon, 24 Jan 2022 10:52:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4BFA71BF3A4
 for <buildroot@lists.busybox.net>; Mon, 24 Jan 2022 10:52:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3AC3F83EA3
 for <buildroot@lists.busybox.net>; Mon, 24 Jan 2022 10:52:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Rsjh1uMy-MVt for <buildroot@lists.busybox.net>;
 Mon, 24 Jan 2022 10:52:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com
 [IPv6:2607:f8b0:4864:20::d31])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 60A0E83E72
 for <buildroot@buildroot.org>; Mon, 24 Jan 2022 10:52:54 +0000 (UTC)
Received: by mail-io1-xd31.google.com with SMTP id 9so3298888iou.2
 for <buildroot@buildroot.org>; Mon, 24 Jan 2022 02:52:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6KrpcHT2U+ATzvprjhI5TOoopGTRvuX2hvT8VYaigEM=;
 b=lkQtHEENipdENMym6naBerGxFZuoJmueMX2lXDyeCkn7BRsDGFlrBzWHyOEBC4YjKp
 +s1y5KzrirpK/ajjUmPVfss43+9wC7XfWsRgC923/73rcSu29r1qI0/BGZ0qoIXNeP1A
 JHACPHX3aITk0t7Tr22Oh64eBzjvapC384HWb2GO91npfhZsJKtjIsZhIoqXJ+bxiERl
 oWf1G1F29n73neswCOnp4o6qYKrE5heyTBNVh6CCVr1nB/Ar6Gze4+SEvfnRoMYKjGb5
 LRHtkUgx0H/lgbgASfRxU19XTXfVWtA3G+9F9zclGtT0LjjTPVVvgfdDWrDoL/MG+Ceg
 mCgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6KrpcHT2U+ATzvprjhI5TOoopGTRvuX2hvT8VYaigEM=;
 b=aVSCBrOZUNq5/KRovxCFsIpWykHC/zsLNqpZa4O9wmew6Ab65YSIaGQMJk2lD779b9
 93S8SgRKdfntG9Z4YYRn75Dev15vwV3mmB2ni2PnpdZEyE+mXvOM9eL1JJKuDuu5wq4U
 d1NlThx1+VL4TRvI0R3ybGEWBcqCeesgx9y1oYwzqmdiUl7tx6XwS1zx+Bxfy3PlT2Fe
 4buyngNGG/NCS3UFqxL4Yed+3vwUVzYSEJjApDthH8IEJm3ZhQj+1bDTSzTJ6KUZO/EY
 8kShW+gnWUEg6QYXiRJH85Bx34j5CNX1efvfcOBHd0/hdrcX///HgCOvzlo8IpOnaFqp
 F3Kw==
X-Gm-Message-State: AOAM530shJZQHZOlhMuws7/ox4yHOMVpJFBCyWLe/kiByNemfSY1aC6l
 vx7ETNs7nG82tz7MTRbktjLoJKHP1W0=
X-Google-Smtp-Source: ABdhPJwp41z/76PtGXwxY+BL2sBzMIvtakIa2JDQm4PawoMh7k9EilNMx9f0OAFIr6ILEuYNFPdUqQ==
X-Received: by 2002:a02:b707:: with SMTP id g7mr4865249jam.111.1643021573126; 
 Mon, 24 Jan 2022 02:52:53 -0800 (PST)
Received: from james-x399.localdomain (97-118-239-242.hlrn.qwest.net.
 [97.118.239.242])
 by smtp.gmail.com with ESMTPSA id m3sm7067167ilf.70.2022.01.24.02.52.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jan 2022 02:52:52 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 24 Jan 2022 03:52:51 -0700
Message-Id: <20220124105251.535089-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-certifi: bump to version
 2021.10.8
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
 package/python-certifi/python-certifi.hash | 4 ++--
 package/python-certifi/python-certifi.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-certifi/python-certifi.hash b/package/python-certifi/python-certifi.hash
index ae122ffc23..0245496ebf 100644
--- a/package/python-certifi/python-certifi.hash
+++ b/package/python-certifi/python-certifi.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/certifi/json
-md5  4b38238b7305fcb3ffbc4368be4e8845  certifi-2021.5.30.tar.gz
-sha256  2bbf76fd432960138b3ef6dda3dde0544f27cbf8546c458e60baf371917ba9ee  certifi-2021.5.30.tar.gz
+md5  880ed9e5d04aff8f46f5ff82a3a3e395  certifi-2021.10.8.tar.gz
+sha256  78884e7c1d4b00ce3cea67b44566851c4343c120abd683433ce934a68ea58872  certifi-2021.10.8.tar.gz
 # Locally computed sha256 checksums
 sha256  be9d82f36112f87a7f1d74ecd4887e1467bbae8878a84004a00117b1e475a3e2  LICENSE
diff --git a/package/python-certifi/python-certifi.mk b/package/python-certifi/python-certifi.mk
index 486548f8c2..17098e3fae 100644
--- a/package/python-certifi/python-certifi.mk
+++ b/package/python-certifi/python-certifi.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CERTIFI_VERSION = 2021.5.30
+PYTHON_CERTIFI_VERSION = 2021.10.8
 PYTHON_CERTIFI_SOURCE = certifi-$(PYTHON_CERTIFI_VERSION).tar.gz
-PYTHON_CERTIFI_SITE = https://files.pythonhosted.org/packages/6d/78/f8db8d57f520a54f0b8a438319c342c61c22759d8f9a1cd2e2180b5e5ea9
+PYTHON_CERTIFI_SITE = https://files.pythonhosted.org/packages/6c/ae/d26450834f0acc9e3d1f74508da6df1551ceab6c2ce0766a593362d6d57f
 PYTHON_CERTIFI_SETUP_TYPE = setuptools
 PYTHON_CERTIFI_LICENSE = ISC (Python code), MPL-2.0 (cacert.pem)
 PYTHON_CERTIFI_LICENSE_FILES = LICENSE
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
