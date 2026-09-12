Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12F64C88E56
	for <buildroot@archiver.kernel.org>; Sat, 12 Sep 2026 21:46:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B4A2E80D96;
	Sat, 12 Sep 2026 21:46:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lhqby9CiV1bQ; Sat, 12 Sep 2026 21:46:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 5D14880E76
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789249571;
	b=ZCA9Pq94yTWNkM70UrTpSmEzbCEkV5RPnIXCCZVhr2yAtmiTacMNGmj1t6nrvcvZX8jP
	 OI4fKUOT3jE1m0xNjev4zUXkHbDpkKvlb9QCUppbIFgzuVwYO9JqnWX43gibC8JwIh7S9
	 KOEMWDV3eVgOtu8QHn8p2qgmtNiBzb7iWTVR2G7LkEgyH4iOIhSiv6dH4Ju8AQlqoQj5d
	 ux0tGzT1hCaPP9i9WbSvyiZSOx1L5jE173D62HLyltgnD7uEWpTbkDK427FPh3BJBMnp8
	 JZrCs7FZPbWASg+ex7P3DOpUt2mvzUHby3a4nfiO7xmK1ZxS/4RHDEeYsBwfiLVx25A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789249571;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 X-Last-TLS-Session-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Type:Content-Transfer-Encoding:
	 Errors-To:Sender;
	bh=VTS7em13g+7n5QU4xSMtT+e/uEK+E0YW+RP+6JJUZOA=;
	b=Qx2HPWMrf+KaEa5671Hyz4GFgqzxiR4H9Dpv0s3k09UU/wkD7CGQOc8FhRJgbSPbMs1M
	 PkSTW8N8lbyq03o0HFEx+fIrdVvGyKdJ42OCtmrqQhYHz1Z7XNuN+Syk0aXFJe8Jg0QYG
	 VwGANd6Gp0kGZsrhA//qOSRQ8JvlV8FIlwNwkoqzpJm+zgmgxpEjtMn5GywfIATHeIIJK
	 zuwpRFf7obAaj2QKaStxlY63RziAkAvM0OXD6pwCe+2XQ0r/GxFoIi3jlJ0LTKPx5dwG1
	 m5PtsYnHprnAHKoXwJhuhbgaXR8U+a0IOWtMESl2kGogdz8Ap8fAjtIOj/R6HC09mcQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789249571;
	bh=VTS7em13g+7n5QU4xSMtT+e/uEK+E0YW+RP+6JJUZOA=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=hThoXbYdMdy8Yn99a5AhL/lN4kvFtaripFxAYT5quHh1/8pgV6mP6nLoOjXoucdfH
	 lHTeROWmQad2tGtf837CjOPTVOf5zdSSLPq/4T8CCgkrhpNDl52tkEe1VSYiolxwE3
	 JL/Rb4fawOG/VQ3CrGO1deZV0pbzEne7J2pjDQOy54bg9Z8goNYwODvWcySQNSuxk4
	 VC8jEeRtXcuqm2w1cZNCmy1/oPxkW84pmE4qDE3yJTPbhOjJnRPf16fFm8mbzy1iLn
	 igLqBA32MNcyTmZUOEibKR8yc0QPGG+nrce3zFb6AFcgZthRhkW/DVEL2CUhkqjpZu
	 hPehTT+CKQeBw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5D14880E76;
	Sat, 12 Sep 2026 21:46:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1897F32F
 for <buildroot@buildroot.org>; Sat, 12 Sep 2026 21:46:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E9E71406AE
 for <buildroot@buildroot.org>; Sat, 12 Sep 2026 21:46:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uf8RiLbeizgh for <buildroot@buildroot.org>;
 Sat, 12 Sep 2026 21:46:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 531DF40680
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789249568;
 b=sHm+V9SNlQ4k50whH2x28ZslouDNCSN44op+P03LHdBWRsH7eCkBlAHCfYF0e3PYk7dF
 Y2m7AMJUVJ86ZPrv1BJZNMhmZ7OsVPlvsiqAmKxyQF8C2bAt2wIpWtvb7hVaeddiF0qkA
 A5bZbgEWOWIV7Zx2FebpLZ+PhN8ODHy1jDeFSusqMXZDjd9fogKf0q2ptluPdJ0xfDhtG
 ihU0OeNMZYgTc+W7PncR1qFBPypHFat3eGzJ8jszxijJTUYgvI94nLWXhYFXkrOenh0oB
 FrjIB6TRNRRrFfFwIx07rPIp9/o8sJrXEx6WSh4nGalY65VyKQPt6UQ3lmRaVIsDFIg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789249568;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
 bh=Vv+t26tfGwb+uDeb3d7NuJ9xbPbbDFljhdfvNiGVazM=;
 b=a2dVUCt0se3cC6TAes4IUMYEf/42kfsl1H4XgQ02OVYNDzzRk8Kf0gTlZq4QZyyJy4bh
 LP+MHiA8OEvcnZrB9aOAXIAqAMkvQIt2/bjqE48piCDUujwELDcy3MNloA6dyRbHQ8mCY
 dAm/EtRtcrt4bS0Gj/JVMg4wbVXL204Q808LIHQxIRuJM5XXIqgdDIm/OempctSlgATMD
 /e3whyKxQ/b6LIRr9qMEyZbzaYps5u1ZJixSCaWKl1SWMiZsHf/nL7e71gSvyzy3fsEm+
 F1Nbz19O2iiMkZkpIO+1fBfa2Je+0Mq0mun0NaDz2lLvkZc63RS7AZA0kTG5LX8P2jQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=p8ycwrPQ; 
 arc=none smtp.remote-ip=185.171.202.116
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 531DF40680
 for <buildroot@buildroot.org>; Sat, 12 Sep 2026 21:46:07 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 306E6C63448;
 Sat, 12 Sep 2026 21:46:47 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id B90CB60580;
 Sat, 12 Sep 2026 21:46:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 7D41911C7AFA9; 
 Sat, 12 Sep 2026 23:45:58 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Bernd Kuhls <bernd@kuhls.net>
Date: Sat, 12 Sep 2026 23:45:55 +0200
Message-ID: <20260912214557.1572535-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Subject: [Buildroot] [PATCH 1/2] package/intel-mediasdk: add missing
 BR2_TOOLCHAIN_GCC_AT_LEAST_8 dependency
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

BR2_PACKAGE_INTEL_MEDIASDK selects BR2_PACKAGE_INTEL_MEDIADRIVER but
forgets to propagate the "depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8".

This issue was introduced in commit
51b60c8acf3f4b534d0954b801f1034491b59c94, when "depends on
BR2_TOOLCHAIN_GCC_AT_LEAST_8" was added to mesa3d, propagated to
intel-mediadriver, but not intel-mediasdk.

Fixes: 51b60c8acf3f4b534d0954b801f1034491b59c94 ("package/mesa3d: needs gcc >= 8")
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/intel-mediasdk/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/intel-mediasdk/Config.in b/package/intel-mediasdk/Config.in
index c1f609e3f8..7738dcbbeb 100644
--- a/package/intel-mediasdk/Config.in
+++ b/package/intel-mediasdk/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_INTEL_MEDIASDK
 	depends on BR2_x86_64
 	depends on !BR2_STATIC_LIBS # intel-mediadriver
 	depends on BR2_INSTALL_LIBSTDCPP # intel-mediadriver
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8 # intel-mediadriver
 	depends on BR2_TOOLCHAIN_HAS_SYNC_1 # intel-mediadriver
 	depends on BR2_TOOLCHAIN_HAS_THREADS # intel-mediadriver
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # intel-mediadriver
@@ -20,7 +21,8 @@ config BR2_PACKAGE_INTEL_MEDIASDK
 
 	  http://mediasdk.intel.com/
 
-comment "intel-mediasdk needs a toolchain w/ dynamic library, C++, NPTL"
+comment "intel-mediasdk needs a toolchain w/ dynamic library, gcc >= 8, C++, NPTL"
 	depends on BR2_x86_64 && BR2_TOOLCHAIN_HAS_SYNC_1
 	depends on BR2_STATIC_LIBS || !BR2_INSTALL_LIBSTDCPP || \
-		!BR2_TOOLCHAIN_HAS_THREADS_NPTL
+		!BR2_TOOLCHAIN_HAS_THREADS_NPTL || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_8
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
