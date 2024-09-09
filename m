Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74AB5ECE577
	for <buildroot@archiver.kernel.org>; Mon,  9 Sep 2024 16:28:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3B81A80E63;
	Mon,  9 Sep 2024 16:28:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yopboqABrIm4; Mon,  9 Sep 2024 16:28:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1BEFA80EAA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1BEFA80EAA;
	Mon,  9 Sep 2024 16:28:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 326A51BF345
 for <buildroot@lists.busybox.net>; Mon,  9 Sep 2024 16:27:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B0FD280C7D
 for <buildroot@lists.busybox.net>; Mon,  9 Sep 2024 16:27:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C3j_XX9dpoSv for <buildroot@lists.busybox.net>;
 Mon,  9 Sep 2024 16:27:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org AFC2E80C9C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AFC2E80C9C
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AFC2E80C9C
 for <buildroot@busybox.net>; Mon,  9 Sep 2024 16:27:54 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-42cbb08a1a5so6000435e9.3
 for <buildroot@busybox.net>; Mon, 09 Sep 2024 09:27:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725899273; x=1726504073;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=r2lsFm586/jptk41lUQL+/SHB2AUrGdT2jdMiHyoqGQ=;
 b=KUvyw2GVw9MdW/9NEGZ7aTo7nvSLTaFF0/mTvMTSEOWPcpPBv9a8ShOpyF7bHx4k6B
 dQuP4Vdpqpj34ZEDeTyf+e7Nn76GysHD5g7YF9FDlrb25incLtCXpWvLPTpYAjcQjhVA
 73JNw2CHIJ4vEaZFBwLgpfiUocgLSw3EyI6xoVFgyco9JffdxXdaj0A9Usov6HBgCe+Y
 bmRFy4fqjd9ZfAbBSLfB9Aec9smxcxiRa1oblHjlxRmnG7/W5XIUZZ2taHBS/E3Os8r9
 wh8iifo4bfTP+CEIB9yPnTCebsHKfW22LllXJPi/+hffGasncm+ijDggIxcDd/Flk3JU
 A6tw==
X-Gm-Message-State: AOJu0Yz49yBvW1crB3TWfwl5p6GNwht2pXxscOv76o4gxZB0mSHHTwfo
 HMjUK7rVg0NnZcJKtScxhRjyTyKeMeVLcKX/gZFt6BJVTSPZqq6rr6D3zbFO2WcDz3oYc9kLOwV
 qLw==
X-Google-Smtp-Source: AGHT+IE6l11WXK/Ka119prCTFWdQD53isQCt9ibiY66oO44pOngDHUlYsEmg18fFqTqkskFzyQ5MMg==
X-Received: by 2002:a05:600c:22cf:b0:42c:a8cb:6a75 with SMTP id
 5b1f17b1804b1-42ca8cb6c5amr67214685e9.17.1725899271957; 
 Mon, 09 Sep 2024 09:27:51 -0700 (PDT)
Received: from vm-2404.. (255.7.65.37.rev.sfr.net. [37.65.7.255])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42ca0600651sm114500595e9.32.2024.09.09.09.27.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Sep 2024 09:27:51 -0700 (PDT)
From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Mon,  9 Sep 2024 18:26:44 +0200
Message-ID: <20240909162703.3439481-2-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240909162703.3439481-1-francois.perrad@gadz.org>
References: <20240909162703.3439481-1-francois.perrad@gadz.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1725899273; x=1726504073; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=r2lsFm586/jptk41lUQL+/SHB2AUrGdT2jdMiHyoqGQ=;
 b=Y/f4nKm8pXUAONWPm7VH9OvLrOqH10sa/JYEx4ZkfmKWZWlWWuoI1/siR/nl6wGtE3
 lfWyA9x4gVYZwMd0JDnP0I4KnBRp08fWbfO42sFg82qaRRTVag1j3SnRn4a31J529LoN
 l0h5ehfw7YN1LRtEjRq7nxZiiaJc1omNAOz6Vwx4Xg3Kc8kndMw0LkDGvJEQA554tark
 8YrRf7DSm6mzDAkPq9EWTwIqMnbqEA5dTegmYHN4Kks+wfDC0gDfeEduL9cokEFFCuUg
 UK4hyp9YMLgpupC56zep/7wxcpfnC1BLW4KvxXhxkhTaK1rZvEeUC9d+GAn8T5MPkUHz
 Or+w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gadz.org header.i=@gadz.org
 header.a=rsa-sha256 header.s=google header.b=Y/f4nKm8
Subject: [Buildroot] [PATCH 02/20] package/perl-data-uuid: bump to version
 1.227
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
 package/perl-data-uuid/perl-data-uuid.hash | 6 +++---
 package/perl-data-uuid/perl-data-uuid.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/perl-data-uuid/perl-data-uuid.hash b/package/perl-data-uuid/perl-data-uuid.hash
index b2c862960..1405f1d0b 100644
--- a/package/perl-data-uuid/perl-data-uuid.hash
+++ b/package/perl-data-uuid/perl-data-uuid.hash
@@ -1,6 +1,6 @@
-# retrieved by scancpan from http://cpan.metacpan.org/
-md5  13468e0fb65a0b5ce27b8628cb2f0109  Data-UUID-1.226.tar.gz
-sha256  093d57ffa0d411a94bafafae495697db26f5c9d0277198fe3f7cf2be22996453  Data-UUID-1.226.tar.gz
+# retrieved by scancpan from https://cpan.metacpan.org/
+md5  6463f46996e5f00beb57317e49e238b5  Data-UUID-1.227.tar.gz
+sha256  95bda7276265f57bc48ffdeddec5ef28cd6f765e3a183757fa5f09f0ce6b98ac  Data-UUID-1.227.tar.gz
 
 # computed by scancpan
 sha256  0560c8eea8e1fb8173faa6c2e9b7e9f8728b8ae8250a814709a53c30b778d5fb  LICENSE
diff --git a/package/perl-data-uuid/perl-data-uuid.mk b/package/perl-data-uuid/perl-data-uuid.mk
index 93060964b..fc272fb48 100644
--- a/package/perl-data-uuid/perl-data-uuid.mk
+++ b/package/perl-data-uuid/perl-data-uuid.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PERL_DATA_UUID_VERSION = 1.226
+PERL_DATA_UUID_VERSION = 1.227
 PERL_DATA_UUID_SOURCE = Data-UUID-$(PERL_DATA_UUID_VERSION).tar.gz
-PERL_DATA_UUID_SITE = $(BR2_CPAN_MIRROR)/authors/id/R/RJ/RJBS
+PERL_DATA_UUID_SITE = $(BR2_CPAN_MIRROR)/authors/id/G/GT/GTERMARS
 # The license is documented at
 # https://fedoraproject.org/wiki/Licensing:MIT#HP_Variant as the "HP
 # Variant" of the MIT license. There is no official SPDX tag for this
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
