Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDD53C433EF
	for <buildroot@archiver.kernel.org>; Fri, 26 Nov 2021 17:27:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4CACD82B1A;
	Fri, 26 Nov 2021 17:27:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id svbEuOMpy-8Z; Fri, 26 Nov 2021 17:27:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A64FA82AF8;
	Fri, 26 Nov 2021 17:27:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 45B671BF2B0
 for <buildroot@lists.busybox.net>; Fri, 26 Nov 2021 17:26:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3480A82AF8
 for <buildroot@lists.busybox.net>; Fri, 26 Nov 2021 17:26:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 11ol1xIVbjhM for <buildroot@lists.busybox.net>;
 Fri, 26 Nov 2021 17:26:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CBBC282AF5
 for <buildroot@busybox.net>; Fri, 26 Nov 2021 17:26:57 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id u1so20051780wru.13
 for <buildroot@busybox.net>; Fri, 26 Nov 2021 09:26:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vbUg8HhFBhGDIGL5SwQNXqpkJ9lgQlcefFG3sknheLo=;
 b=FXWx/dd1rtTgH90AAOfY9Zxj5WlAWiBMwgQp4PVPlZWrl2kmMZmWH+f2LEkczIoRYU
 5zZ0KiIbilO4dCGGINQ4I4qyr3lDAPMCrejlYQ4QR4jqiIFe9quJHJCzA2PxpG+T1JGS
 lhzwEX8U1liSX1Dfd1SyFZKtEC6KJ6JHICwfjUVPjQox3XmkDwQPmuKwpxeh6q/BdeJO
 5xrpZ3I2VpmjIo+syXewGyu6ffyPkIOwcsQTGPodH3Yw+S3a+L+Ji5GKIY76pv8MzisN
 /f+qI/YBL34A+u8xGiewM0lBXuv2c7Bm2YrZvabzZPYVI99pb6605UMYxuymdJkPXGb1
 fO6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vbUg8HhFBhGDIGL5SwQNXqpkJ9lgQlcefFG3sknheLo=;
 b=2B8zf1JC/y+ies96shi6Z51b20ysS6Da/v2/kkWNyF8nuX1aIjWFq0wPtZ1em14roG
 /2Rt/FpgbzO+bPLPwnebXY3LXMOkjSLfoKCJUha7jirQWcn06w9d3akpyeBl1PPQ7evd
 nXy38VjYO2ISbB3XWlMnaw2aiIeLGlaPFrdq0Gz42f2DL2uclWoz1E/7Y1Omi1sjtI9x
 sfzVyPxPIKc6y5tuKT42SicwU60etE2SNjOExIisZgmJWCaTtxm5xjcDOCzek2u+sl5P
 S0BqupPEknXS2K7bzKALwsLeixZrQZ3EZv7xM2fMDKQn2cHXhQTUKx0p2jXr0q+pI4hW
 m0/w==
X-Gm-Message-State: AOAM531mz1Ra/4XEVyseZMqKzXbwFkSyh3es6oBbjE8n4dIKaRUKYAtS
 dRa4XxNFEHlv3XPjDXz6MYkeUneIHYI=
X-Google-Smtp-Source: ABdhPJxWtfhMOWZPcy4ckOIEzp8m/WW6O2BBYhj3I0ixnc2ebXDreILONaHKwY7sAmzya0sYqpUHmg==
X-Received: by 2002:a05:6000:1a88:: with SMTP id
 f8mr15639372wry.54.1637947616161; 
 Fri, 26 Nov 2021 09:26:56 -0800 (PST)
Received: from v2021.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id a1sm8295513wri.89.2021.11.26.09.26.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Nov 2021 09:26:55 -0800 (PST)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Fri, 26 Nov 2021 18:26:49 +0100
Message-Id: <20211126172649.1273701-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/libressl: bump to version 3.4.2
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/libressl/libressl.hash | 2 +-
 package/libressl/libressl.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libressl/libressl.hash b/package/libressl/libressl.hash
index dbe353182..990ec8bda 100644
--- a/package/libressl/libressl.hash
+++ b/package/libressl/libressl.hash
@@ -1,4 +1,4 @@
 # From https://ftp.openbsd.org/pub/OpenBSD/LibreSSL/SHA256
-sha256  107ceae6ca800e81cb563584c16afa36d6c7138fade94a2b3e9da65456f7c61c  libressl-3.4.1.tar.gz
+sha256  cb82ca7d547336917352fbd23db2fc483c6c44d35157b32780214ec74197b3ce  libressl-3.4.2.tar.gz
 # Locally computed
 sha256  5c63613f008f16a9c0025c096bbd736cecf720494d121b5c5203e0ec6e5955b1  COPYING
diff --git a/package/libressl/libressl.mk b/package/libressl/libressl.mk
index 0ddc832db..6eee86dda 100644
--- a/package/libressl/libressl.mk
+++ b/package/libressl/libressl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBRESSL_VERSION = 3.4.1
+LIBRESSL_VERSION = 3.4.2
 LIBRESSL_SITE = https://ftp.openbsd.org/pub/OpenBSD/LibreSSL
 LIBRESSL_LICENSE = ISC (new additions), OpenSSL or SSLeay (original OpenSSL code)
 LIBRESSL_LICENSE_FILES = COPYING
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
