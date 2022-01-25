Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4561C433F5
	for <buildroot@archiver.kernel.org>; Tue, 25 Jan 2022 21:22:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4F032829B1;
	Tue, 25 Jan 2022 21:22:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AGi4J2W8AHTG; Tue, 25 Jan 2022 21:22:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8504782A0E;
	Tue, 25 Jan 2022 21:22:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 82C531BF599
 for <buildroot@lists.busybox.net>; Tue, 25 Jan 2022 21:22:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 70F704012B
 for <buildroot@lists.busybox.net>; Tue, 25 Jan 2022 21:22:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PVJK-1qSh3Xh for <buildroot@lists.busybox.net>;
 Tue, 25 Jan 2022 21:22:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 34C2640108
 for <buildroot@buildroot.org>; Tue, 25 Jan 2022 21:22:24 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 o30-20020a05600c511e00b0034f4c3186f4so2494440wms.3
 for <buildroot@buildroot.org>; Tue, 25 Jan 2022 13:22:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JiG9d4L5EivnN3/jHfwO0+71S/kDEOTTLDQH+I9MeGE=;
 b=DWfvPYhQz60LylgJHxXhOCENmF5IEqDFTZ56u036Vh39DXBGMg5SewSO8peNfcFIm5
 3S6jlW0tcSBw62fCKXS0euv0JYugW0CD5kNhIoW+NMqq4yGkA02kmIpF5V/uPnExHaPG
 XZ1irQ0bTaimB4gKoCdZee3l7M9Tb5IxILDa5aoDI5vYCDW0Bo5mV0sN0QDzivyjs7zz
 4cOaBl/XePOlSC6v2J28stD5vjjEgnZY1ohuP+QJjgQ+HnvEU2ii0iesR7QiC6LUh1MA
 HpKbPkbI9QXOttBirqcrQY/FW0y3+r1f2VyCs8kRkOy98qA8JmkaK6OvfOLbc3QH0Ckh
 diUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JiG9d4L5EivnN3/jHfwO0+71S/kDEOTTLDQH+I9MeGE=;
 b=OYuGEtcHtsgyJq0e4ZW/fux7Zcvcf+ep2wRRO3xWBcRW56Ia/aWTxxH9Rsn0xMZ0T/
 hemSrDXliUsq41Ezd+dTmlhofozn70A7B0vr/ZybXfCeWET59cdY1zgyp8hPoMqZydzh
 2L2lf5kdWkWZDVYWV8krHmGjFjI5cM4bMjcVWKotNFVjMZ3BjnkjUWfy4wgXVT294Nso
 GYXzBIvIDk0fa2MMrJVwyuej69o8FgMP1cjfWMLB/hehQA5VeTWCtobeTyN9gnUp069/
 jfDr1Xjg+s7l/lan2H5QifKX06uwQAd4HFBUIneXMv9mqMDkXsJe3ycqUkh2OEsFAr8t
 B80w==
X-Gm-Message-State: AOAM530FHs6zF++3nc5CqyUQ+o4pVcnoaTFJo0J4j7ccZX1LFDfxa/b8
 6fWj5a/HV+K9vJugeIDmrWisFFslwIQ=
X-Google-Smtp-Source: ABdhPJyn76VrP4nJT6+8MeNKfGpiEj061A2pMks/fGUbZk/ti7Q//2EEtrCviXsoBD3Lullo6Hn3Rw==
X-Received: by 2002:a05:600c:1d05:: with SMTP id
 l5mr253671wms.182.1643145742169; 
 Tue, 25 Jan 2022 13:22:22 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id 16sm1347651wmj.12.2022.01.25.13.22.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jan 2022 13:22:21 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 25 Jan 2022 22:20:39 +0100
Message-Id: <20220125212039.300631-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-dataproperty: bump to
 version 0.54.2
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

https://github.com/thombashi/DataProperty/releases/tag/v0.54.2
https://github.com/thombashi/DataProperty/releases/tag/v0.54.1
https://github.com/thombashi/DataProperty/releases/tag/v0.54.0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/python-dataproperty/python-dataproperty.hash | 6 +++---
 package/python-dataproperty/python-dataproperty.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-dataproperty/python-dataproperty.hash b/package/python-dataproperty/python-dataproperty.hash
index 9a8c250125..380846e9f1 100644
--- a/package/python-dataproperty/python-dataproperty.hash
+++ b/package/python-dataproperty/python-dataproperty.hash
@@ -1,5 +1,5 @@
-# md5, sha256 from https://pypi.org/pypi/DataProperty/json
-md5  6a6930ae266399df58707a13a5f0cfa6  DataProperty-0.53.0.tar.gz
-sha256  9589b5c5b400a77e1aeb63d89d755043bbe00043219336963c93db5df49cbaf7  DataProperty-0.53.0.tar.gz
+# md5, sha256 from https://pypi.org/pypi/dataproperty/json
+md5  ce5fd0d37b6d0ca57f144e22cd62bfec  DataProperty-0.54.2.tar.gz
+sha256  df2fcf00e7a57f0a6089f686f847527eb3c91ded5c419daef6d06ee4bb1187b4  DataProperty-0.54.2.tar.gz
 # Locally computed sha256 checksums
 sha256  a93d75bcb0774e2990106380cadad6dcb2de193c55d435ffc56ba345a08b1dc2  LICENSE
diff --git a/package/python-dataproperty/python-dataproperty.mk b/package/python-dataproperty/python-dataproperty.mk
index 5ceb7f72f5..1b07dc1bb7 100644
--- a/package/python-dataproperty/python-dataproperty.mk
+++ b/package/python-dataproperty/python-dataproperty.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_DATAPROPERTY_VERSION = 0.53.0
+PYTHON_DATAPROPERTY_VERSION = 0.54.2
 PYTHON_DATAPROPERTY_SOURCE = DataProperty-$(PYTHON_DATAPROPERTY_VERSION).tar.gz
-PYTHON_DATAPROPERTY_SITE = https://files.pythonhosted.org/packages/df/d0/36deb707996c5ef48ab353804291f44f59bd9d46875c384d163ad106df1a
+PYTHON_DATAPROPERTY_SITE = https://files.pythonhosted.org/packages/9a/03/44fb9094c4fb8032f254eaa37b3b07db82fa35779ceca097b3cde8464749
 PYTHON_DATAPROPERTY_SETUP_TYPE = setuptools
 PYTHON_DATAPROPERTY_LICENSE = MIT
 PYTHON_DATAPROPERTY_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
