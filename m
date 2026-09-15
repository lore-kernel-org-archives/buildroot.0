Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36B77C88E77
	for <buildroot@archiver.kernel.org>; Tue, 15 Sep 2026 22:11:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 29BAE406AC;
	Tue, 15 Sep 2026 22:11:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NZSNgRpWVi0B; Tue, 15 Sep 2026 22:11:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 7FACC40639
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789510285;
	b=XTCIJRVH48AwQMEn4ZCheAg68LU4zh4rZzIZRxuv/L31KUVJVdw8Gi24e3Ex47FGO/ke
	 U9U+6lmrHCaQ80zGI/pv4HOOapusWIvCfIf1CvfuMQ8k7r6aJs/zRoJf+fQ1V997BrTSN
	 jP+LWyL6r6xzMC8uRRoOe2YFaUwkkodQFPlyRWYEMqky3iHENBj0NoJIpAfFplKuzzIro
	 MIdHohB65KrvAeljTzYxmqLG/gYrKsBfm1KdtfSLSPfCFq1W98RUXUiNW9V7+qCl5gxGC
	 ZYunXb8fXQ8vdD+yb6lTfjC/gybgAdxM1CztMdCuFmHGQ4n2iFJ0bBU0grfrD13gz3w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789510285;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=37cJAd2V7RtZvqvctr86vMidqr58bfxJ6UxSRdla0gQ=;
	b=m1iTcFwlasXzmylmnGESrQQsWNjYmaWgId7+t8ocV625F6YqR4TUClAtJaReHgQOd89d
	 6YnRNMK1YDXGZhey4TGB2as7+MoBAqie7q6QwxdGqiIkjrsd+7lx822RZMXyO41ZhLWfc
	 GUgJBKm2gRsRwrRkX16ViMthTyIAAh/Rl4uGZZlcqBnVuBS5koTlqd7uOYhTwc3SojTJ6
	 xO5l9LqaDfHV3a1DXKDXgh8EsC1gm5AgwUEPmgi32mi6jcZaHMeD3TeKwkqffnVqtOqaR
	 0nE1c0yBrl+urYPtAfVCglR8MeR4mNlTxsUxepJrui1s/ZL1TGCdyeFcX3ArR/Cs0sQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789510285;
	bh=37cJAd2V7RtZvqvctr86vMidqr58bfxJ6UxSRdla0gQ=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=nCKZL5lIacaw6W40KFRBslWi/5V70CnD/PJyz1hGhVE2HapliQmmvD+Giv5ET4QCY
	 dNlrNXS/XoDVqdwH4gIPuPW5Sy25AO6yOEeDcMgewfF67nrwVRemWlW586G4xtXdSA
	 +4UqlyIgL24D7UfRZJjXAiAMEshMfBtGLUElcwdfZcsAeAy50i8dNXZvF1lEcuRNpJ
	 0SExyZumUF4+inc5aVq0NhmDId+CmLnzIZQ3Rtlt5MjxTWmfoTo/oqxt4TxshRcvlp
	 ia6ztjQoaUcSAF9Fx3WQaPHh40Ry0ef9AYvQvXv4NgJddXSkxbZ7NYgh8RTVwqOQZu
	 uHGGhiYD9KAGg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7FACC40639;
	Tue, 15 Sep 2026 22:11:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id B1D8A388
 for <buildroot@buildroot.org>; Tue, 15 Sep 2026 22:11:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AF93640261
 for <buildroot@buildroot.org>; Tue, 15 Sep 2026 22:11:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u5YapIq0ISCO for <buildroot@buildroot.org>;
 Tue, 15 Sep 2026 22:11:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org EE2A240260
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789510284;
 b=WiuTJNXLRqzom2bRdq2fpfBJ1OlRhdnIFOL3hLsjqpRLGjGXHXArGiuaDlDFpCrYkR4g
 lspUeTa2ydNcMwCUhntzevKsY6rDDntW7I9mhWo44eL0oD9AV/ZfsdPFLZawzf8MtfsFB
 RxwB9HSPK5f2PxGUC0WWdskyf3wHq8HVt5kUkN8D7x0sbD6wJ4G5JGQkLWGJ8afog+sbQ
 pJd4+u6aubmMZktSwNwntNc1t9jt3+9HgavMSyDXkPrWNJp4eUhrWAzIuyPv4sJzwpq7i
 tJy/3tbeBQrmhhlTY5gkEKrBTxtWzF+bNdFck05tgHyIzPqplYXsdVupNbYjPWrRFCA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789510284;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
 bh=wJFZW0N2jV9+OvsqjX32nj4pvg27CqHZA53Av5Ma9DE=;
 b=s1Zwqlpuja6LreJY3bwHGrq2y1palitb4YH+MIdo+bgGABG8qdbyB66NIZW3fV2m/1k4
 3Ltjeq6hv7JR/yZAoDv2HNMSgucULYbv73F3pVun+Ne3D7Ab6JxOS+bPfEpaPDjCVo5DN
 58yduWP6Ys41J3vgtsb3Cs4BvhsDDdldeLPfzs1JTDKAFgfHKaeK11KNdASgBjSfnSmiJ
 Kqmp8oNX+1bcZeO6DleaIZX/pgl+X15cD7C62ROVJ33Z7cSJukB//FdyvJey5H44n8DxF
 eEEc8GnZ12DZRZq6+2WzJSI3X8w0RQaHo6nnnV7dqwEIPp3234gv47clE+bXVip7GPQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=J5tvRNmB; 
 arc=none smtp.remote-ip=185.171.202.116
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EE2A240260
 for <buildroot@buildroot.org>; Tue, 15 Sep 2026 22:11:23 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 02607C62215;
 Tue, 15 Sep 2026 22:12:06 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 12CFC602B0;
 Tue, 15 Sep 2026 22:11:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 7FA1B11C7B00A; 
 Wed, 16 Sep 2026 00:11:17 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
Date: Wed, 16 Sep 2026 00:11:08 +0200
Message-ID: <20260915221110.2037230-2-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260915221110.2037230-1-thomas.petazzoni@bootlin.com>
References: <20260915221110.2037230-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Subject: [Buildroot] [PATCH 2/2] package/gnuradio: show Config.in comment
 only when needed
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

The comment about the toolchain requirements to have Python support in
gnuradio is always displayed, even if architecture requirements are
not met and if Python is not enabled. For the latter: the option
BR2_PACKAGE_GNURADIO_PYTHON also depends on python, so it makes sense
for the Config.in comment to also depend on it.

Fixes: 7a546b87d5b8781b03f3ba5d311d61f4169ee899 ("package/python-numpy: add reverse dependency on packages using python-numpy")
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gnuradio/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/gnuradio/Config.in b/package/gnuradio/Config.in
index e87275de4d..0e8dc66dc4 100644
--- a/package/gnuradio/Config.in
+++ b/package/gnuradio/Config.in
@@ -89,6 +89,8 @@ config BR2_PACKAGE_GNURADIO_PYTHON
 	  Enable python component
 
 comment "python support needs a glibc or musl toolchain w/ gcc >= 9, host gcc >= 9"
+	depends on BR2_PACKAGE_PYTHON3
+	depends on BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS
 	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_9 || !BR2_HOST_GCC_AT_LEAST_9 || \
 		!(BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL)
 
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
