Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEE5CC433EF
	for <buildroot@archiver.kernel.org>; Mon, 22 Nov 2021 09:13:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 90EE980D5D;
	Mon, 22 Nov 2021 09:13:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XU6L4olHEzzc; Mon, 22 Nov 2021 09:13:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E87E880CD1;
	Mon, 22 Nov 2021 09:13:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 498811BF381
 for <buildroot@lists.busybox.net>; Mon, 22 Nov 2021 09:13:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 43BEF40198
 for <buildroot@lists.busybox.net>; Mon, 22 Nov 2021 09:13:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MeyfyxCQnfeO for <buildroot@lists.busybox.net>;
 Mon, 22 Nov 2021 09:13:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 277DE40192
 for <buildroot@buildroot.org>; Mon, 22 Nov 2021 09:13:53 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id y12so73750058eda.12
 for <buildroot@buildroot.org>; Mon, 22 Nov 2021 01:13:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Nz9CjYkvnTlDRRqV1S8qWnUcZxqTgaKgMluSIsi4Dd8=;
 b=XRjnJPjsfn2d99YmRP6z0/wGM5Kw/LVzT8wIcF9eBzXGlkJfqsIalAzyTz4854vWGJ
 zneR8hV7NyZparG/JoTqW8ONaTBShMoIZK9XXYuXiUrmR6ZvcusqJXOoieT/D2fhunEI
 FBR1Wig0b+15GNAomDI4E/7hedtm2sc9yerckFSbvLczB9AQZ3zsk+s+rh6bfrZIeDz3
 vVgGJpceIOZ1sRw1+KD0cGtGsR5FzquHSwLQ3JLvLgkOv9FjVcJw7i+j0gEPKtAWsxSg
 KDdBasUZD2FTSwNqFLzeoKQOTKNarHhQcCneTtnr3guVttYa0GgzEhBNPs1vblGZiZ9d
 U38Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Nz9CjYkvnTlDRRqV1S8qWnUcZxqTgaKgMluSIsi4Dd8=;
 b=tls3x3vdmp4Fhprav3rSZwG3nxwuuuXIJ683RaPnN+W5xRfytEAYffOdxFAo7QTZX2
 LiXHBG6hzI3PW2hD9oQ0uj67USNGvkc7ajAWt2ACGN9tK45gmcfzYOS/VTIxbRNttR6F
 LDLVdivc3VPDJzgYVf+6ftgrk0I53q9ZIS9xGtN+NEIKa0E2RzfGnpv6PvtzRHgARFMZ
 kHG2mT1X0iyaFuW4yQvKXaCFZPHD2rzWBBHrlQDnyVxTj97Z2YEeVRJ755r9eW5mLxYa
 YwXDIlwEpgxoJvtV+9TGCtTh/MwgA05WwK/A4kkQoZnx94IHsuG/r7GemDNEvZIyk06T
 lEJA==
X-Gm-Message-State: AOAM5334TJA9jrzQDACkkH46zEheWBAh1YI+xqWtPUu27EUBXab4s9LC
 FccmwCLPO1OEXJAgHc/PpMSJvayXzr8=
X-Google-Smtp-Source: ABdhPJwhsceEJzgInM7vjtJw600F7CzvJAUDoDqU1skrvHTCdkQusUyqO3DCPHTtbmwa8q1OPgSNNA==
X-Received: by 2002:aa7:cac2:: with SMTP id l2mr63896863edt.168.1637572431378; 
 Mon, 22 Nov 2021 01:13:51 -0800 (PST)
Received: from localhost.localdomain ([2a02:a03f:63d3:7700:47c:f3ae:fe47:54e6])
 by smtp.gmail.com with ESMTPSA id qf9sm3490985ejc.18.2021.11.22.01.13.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Nov 2021 01:13:51 -0800 (PST)
From: Titouan Christophe <titouanchristophe@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 22 Nov 2021 10:13:33 +0100
Message-Id: <20211122091333.79971-1-titouanchristophe@gmail.com>
X-Mailer: git-send-email 2.34.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/mosquitto: bump to v2.0.14
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
Cc: Titouan Christophe <titouanchristophe@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is a small bugfix release, read the announcement on
https://mosquitto.org/blog/2021/11/version-2-0-14-released/

Signed-off-by: Titouan Christophe <titouanchristophe@gmail.com>
---
 package/mosquitto/mosquitto.hash | 2 +-
 package/mosquitto/mosquitto.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mosquitto/mosquitto.hash b/package/mosquitto/mosquitto.hash
index 7b950208c8..24b8869d13 100644
--- a/package/mosquitto/mosquitto.hash
+++ b/package/mosquitto/mosquitto.hash
@@ -1,6 +1,6 @@
 # Locally calculated after checking gpg signature
 # from https://mosquitto.org/files/source/mosquitto-2.0.13.tar.gz.asc
-sha256  9cf83a558f1588e8798edd8647b1632af88e88ef2cd45054e903c517df5bd2cd  mosquitto-2.0.13.tar.gz
+sha256  d0dde8fdb12caf6e2426b4f28081919a2fce3448773bdb8af0d3cd5fe5776925  mosquitto-2.0.14.tar.gz
 
 # License files
 sha256  d3c4ccace4e5d3cc89d34cf2a0bc85b8596bfc0a32b815d0d77f9b7c41b5350c  LICENSE.txt
diff --git a/package/mosquitto/mosquitto.mk b/package/mosquitto/mosquitto.mk
index b02f0c2f43..3e7a728acb 100644
--- a/package/mosquitto/mosquitto.mk
+++ b/package/mosquitto/mosquitto.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MOSQUITTO_VERSION = 2.0.13
+MOSQUITTO_VERSION = 2.0.14
 MOSQUITTO_SITE = https://mosquitto.org/files/source
 MOSQUITTO_LICENSE = EPL-2.0 or EDLv1.0
 MOSQUITTO_LICENSE_FILES = LICENSE.txt epl-v20 edl-v10
-- 
2.34.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
