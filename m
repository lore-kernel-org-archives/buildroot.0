Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFE4EC48BF6
	for <buildroot@archiver.kernel.org>; Thu, 29 Feb 2024 22:41:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9F59C41D6C;
	Thu, 29 Feb 2024 22:41:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0XGSAMNoYupo; Thu, 29 Feb 2024 22:41:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B5FFF41D71
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B5FFF41D71;
	Thu, 29 Feb 2024 22:41:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C522A1BF368
 for <buildroot@lists.busybox.net>; Thu, 29 Feb 2024 22:41:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B08E441D71
 for <buildroot@lists.busybox.net>; Thu, 29 Feb 2024 22:41:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ywkvYeKcHDGC for <buildroot@lists.busybox.net>;
 Thu, 29 Feb 2024 22:41:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42b; helo=mail-wr1-x42b.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6003F41D6C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6003F41D6C
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6003F41D6C
 for <buildroot@buildroot.org>; Thu, 29 Feb 2024 22:41:27 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-33ddd1624beso950305f8f.1
 for <buildroot@buildroot.org>; Thu, 29 Feb 2024 14:41:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709246485; x=1709851285;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8O6082Xj142YM1SkN2acKs6nhzRHzShzlH/JNRuR9tc=;
 b=Y0Q9M8EVcRFISIOy7o0itP1NYyw3eRaHEIuvtxjAZmy5hcupHxa+q4/rBVBmg/PfH1
 kY4FRME1nQtd3x4m4Y3KDWkyf+jqZYy6nOX/OhMiPaybIB2jUoMOzS/QtMim7V4S0f/N
 8h9M2Y2K+bUJD219FPWuFPLvULqzXevRnR8ekPTTNKDj5MOGVapaW7YHLNkI13vB5K8L
 5nne5MFEjxrVVmj5fM1gxituNZ8E3t0xZSCRI8zUzE9U7b21+gim/aa3o5O4vCf1AR7T
 VZhCbOGcqtIub0ScT0HfciGU3R7OwRcnrehTtyE1JrDeHe9nioESrkOWSExWbq3IM7mr
 vqAw==
X-Gm-Message-State: AOJu0Yze5uvfJBqHCEnkR3SvQEBINkiT1MbH3X5FHDMMN/fgP+Jf1mhm
 bxkC2qKzKRrbL9auflvCuXTsm8Lzh5H6rZvUknqyaKUe394CXjN5rlQdDJWO/+pU2aZugFDNhjz
 h
X-Google-Smtp-Source: AGHT+IGhu6fsaZQsNoRZU6VsgzgWE7Ph0aki0jY3vlObiW+chlm77qZfWtJqA4H8uwkSCNRlqhSkwQ==
X-Received: by 2002:adf:db0f:0:b0:33e:1cd7:6434 with SMTP id
 s15-20020adfdb0f000000b0033e1cd76434mr247696wri.19.1709246484930; 
 Thu, 29 Feb 2024 14:41:24 -0800 (PST)
Received: from P-NTS-Evian.home
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 jh1-20020a05600ca08100b00412b944b58dsm3300481wmb.15.2024.02.29.14.41.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Feb 2024 14:41:24 -0800 (PST)
From: Romain Naour <romain.naour@smile.fr>
To: buildroot@buildroot.org
Date: Thu, 29 Feb 2024 23:41:20 +0100
Message-ID: <20240229224122.1085300-1-romain.naour@smile.fr>
X-Mailer: git-send-email 2.43.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1709246485; x=1709851285;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=8O6082Xj142YM1SkN2acKs6nhzRHzShzlH/JNRuR9tc=;
 b=YjEnkk0x8TdqmXYfnfcJuJ2ZeERPtbkbJmw7eoIhZpArgJf3mRzp3yFHpDtufvowHL
 oR5frMkWJMOnsvLBKOjRl5YPsJ9twSaSBxlkeS45bfiwcwQETz4eOG5F4rc86/FErctM
 sH7QYYxlKbry36Bg2/m1eS+tlSY+0UK9qQfFFGHZkecrI9B1SSYrqwsEJj7/edjcInG+
 sEzVUCmGSAvBtM4z8TwNzgu+5BHaOBVn6X+7JvFb5W6HMqM6TsrFPseSyqr55V5IGHKa
 IXolAeNaURYkjHBK7vlCWRNILtYWt9uwOMky8wbrkyy78MmoYb00oIDYbmmbwLmv2QWx
 PiXA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=YjEnkk0x
Subject: [Buildroot] [PATCH v2 1/3] package/rust/rust.mk: add missing
 host-zlib dependency
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
Cc: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Several rust tool are linking against zlib, so add
the depedency explicitely in HOST_RUST_DEPENDENCIES.

For now, host-rust build system is not able to find
provided by Buildroot in HOST_DIR due to at least two
issues that will be fixed in followup commits.

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
v2: new commit
---
 package/rust/rust.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/rust/rust.mk b/package/rust/rust.mk
index f7a5c0fcd5..16a397407f 100644
--- a/package/rust/rust.mk
+++ b/package/rust/rust.mk
@@ -20,6 +20,7 @@ HOST_RUST_DEPENDENCIES = \
 	host-python3 \
 	host-rust-bin \
 	host-openssl \
+	host-zlib \
 	$(BR2_CMAKE_HOST_DEPENDENCY)
 
 HOST_RUST_VERBOSITY = $(if $(VERBOSE),2,0)
-- 
2.43.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
