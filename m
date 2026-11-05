Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2BCE606A326
	for <buildroot@archiver.kernel.org>; Thu,  5 Nov 2026 13:17:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=edKoQ2+F
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C5D064087D;
	Thu,  5 Nov 2026 13:17:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rnHlj3e8tKBz; Thu,  5 Nov 2026 13:17:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 8022E407FF
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793884620;
	b=ZvSGaYnL7BYAopZb4KS3OiybKjBlk+SzJeTtnCkMWLlaGy6jzx8RjDduWa6Bu8XHpeCn
	 CKkIEz3wSbydxrTsrFwQ7AYiPoo7BQiLvKbuSGBeREPc32mM93D92QNroktBYTuS9KPDD
	 2I5nSVmTRGCGq+DRBVdVtuJpdLQzJ+7UuFDjRj9AdAwJA6KmwDxkORzvTOPF7w24gedki
	 O24kMbTmOmA05cp1DCu8U6+/O8HcnP14DYIQeIYyLpksAXBDHM+lzSVGnvmalS0g7/FdF
	 E8A8N+9Kh6dByICNZlCnSaF0UG/FGCZMc05AABX33uTkq2zaU+xEmg7vxMiRnZdgD5A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793884620;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 X-UI-Sender-Class:Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:X-Provags-ID:UI-OutboundReport:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=9r75MuZxurS4ShwmGyTck+TcMYAQ2NQKSsHxpBv3oYk=;
	b=Z3sEze8g0g5Vz9jyUYy/WEY94WLuvSsvyX3bX2OzVnmoYtzzLZGWCleKUJm3ChoNrD4m
	 bHZFQjsxJyuvc3+3ofObaesMvCY2o3tBJcFpM0z5dH/JSBF+aSfVDBFG5mgueuzbtq425
	 wnrGyxBHF4uXeeHSqcoj52rg3v/CB0vf5aKFsTf4YrCyIsRCCDkLeXpAEydqoMcX7zZDA
	 PpodTeSXfwh6SWQeA+LR4t9cbOBbONXhJuYg7XfdGgC7g0Q3vRgYlgbB5dlZHi7Zhk1hk
	 P06SRVNy1IAg+de+vE6fyTZMHWjZJcHtNURj/PUdhyvzCqcAcJl0n/5chLNCq29v01w==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793884620;
	bh=9r75MuZxurS4ShwmGyTck+TcMYAQ2NQKSsHxpBv3oYk=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=edKoQ2+FC0JrpLUKlzZhO/8EMIM1d5X84sBCM+2rGDJQxFcDjnMZk/R1YAdsyfMSU
	 e4qeu9UuPrZPXEeAt+gf4EaPzT6ON2QlwPnOIFLtxe4v8Z9IXVHAe+x7a39NkwwXOh
	 SGlzxRw8/TBD8V6xia09Ns5a/zd7aeiMO9rl7Acu5hoi8HDfeVMT4N2STw/xOjLT1l
	 0GejjV8PPNrhHIKtjTx3diFbUOIpp+HnpMxS94/dQTj5S1LvWYjHUe2RSE3ixvyy9E
	 rjjEJgDwZE3G3G4KWatMqHN4uGKB2hAU3OcvSGsMVLK/SL8LPKyomyVqogpOxczUbP
	 Ai9h95qaquqRw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8022E407FF;
	Thu,  5 Nov 2026 13:17:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5EE96280
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 13:16:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 41FFC607D5
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 13:16:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AmheHfRCHMNf for <buildroot@buildroot.org>;
 Thu,  5 Nov 2026 13:16:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 00CA4606CB
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.21;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 00CA4606CB
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 13:16:56 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MfpSb-1ws7Uh2N5N-00b6TZ; Thu, 05
 Nov 2026 14:16:50 +0100
To: buildroot@buildroot.org
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Norbert Lange <nolange79@gmail.com>, Sen Hastings <sen@hastings.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Julien Olivain <ju.o@free.fr>,
 "Fiona Klute (othermo GmbH)" <fiona.klute@gmx.de>
Date: Thu,  5 Nov 2026 14:16:38 +0100
Message-ID: <20261105131639.3779778-2-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261105131639.3779778-1-fiona.klute@gmx.de>
References: <20261105131639.3779778-1-fiona.klute@gmx.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Provags-ID: V03:K1:v9SIMkXEnysmlgdhm9DRb00tq/RrMDse0sI5i9kFm8U39UCXGQA
 Dde4NTQSr67z3870nobxAL2zMLBd3mopqsixqwEg8dvpLQHKIqCmE4mz8PmeUdulrRKTPe8
 +M+R9lK+grb6cZoM8HpJfaUKNhMNMVok+dcJy0NR7rqpbgp2hvQlr3VHDm8/UpRN/amX9Ue
 AgkokXN25E0L8Gxq0j9gg==
UI-OutboundReport: notjunk:1;M01:P0:uXIs/sjAzJw=;6cJLFFuRHG/wYR8YxjzbBeN/06O
 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
Subject: [Buildroot] [PATCH v4 2/3] package/lvm2: depend on libudev if
 enabled
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: "Fiona Klute (othermo GmbH)" <fiona.klute@gmx.de>

If a sufficiently new libudev (>= 176, so actually pretty old) is
found, the udev rules installed by lvm2 request the built-in blkid
implementation of udev, instead of calling "blkid -o udev", which
Busybox's blkid does not provide. A practical effect of that command
failing is that systemd never considers device-mapper block devices as
ready (seen with dm-crypt and dm-verity) when Busybox blkid is
used. So depend on libudev if it is part of the build.

Signed-off-by: Fiona Klute (othermo GmbH) <fiona.klute@gmx.de>
---
Changes v2 -> v3:
* clarify commit message

 package/lvm2/lvm2.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/lvm2/lvm2.mk b/package/lvm2/lvm2.mk
index 21fd5134c1..2656d81716 100644
--- a/package/lvm2/lvm2.mk
+++ b/package/lvm2/lvm2.mk
@@ -39,6 +39,9 @@ LVM2_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR)
 
 ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
 LVM2_CONF_OPTS += --enable-udev_rules
+ifeq ($(BR2_PACKAGE_HAS_LIBUDEV),y)
+LVM2_DEPENDENCIES += libudev
+endif
 endif
 
 ifeq ($(BR2_PACKAGE_LIBSELINUX),y)
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
