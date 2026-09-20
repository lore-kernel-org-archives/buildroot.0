Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABFB5C982D8
	for <buildroot@archiver.kernel.org>; Sun, 20 Sep 2026 14:56:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6EDD86073D;
	Sun, 20 Sep 2026 14:56:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JK91ceAXaQeP; Sun, 20 Sep 2026 14:56:32 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 860D360767
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789916192;
	b=kilEQPVmOGihaxvGDJEZaijGMtoPNSeSlnl9ySe3+qXmuLigM8x0GE6Kvg9W1HOyk0ZT
	 KrD8/+d4ojg/MnRfygo3Yg9l1lpXjEADKaAnCQZy5RF3SSB4sZkdT1lMfkcjhrMacNz70
	 kvmIi27T/+GbUNiMDzY5KEGL7RFmlKYQ8YJs2U9lBev7utWYKnoPxYFdUFmlgzRGhOQdC
	 rm+tmW1tmJlsPbebUDALYf/HJ1ZCIpKIhkfHL9eyggv+DC5wgfblghzEMFTdTawaOeUE3
	 AymA+aMTVEnpE2+T9Q6wCbniAeBgH3furK3BL8CzEJA8VcVx6apQcJ/bP+wqm/sBJnQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789916192;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=235skMEz307yiyV9CXz+xd/ZQkAz+x4P3WQCD2hRQuM=;
	b=ohctvNl4gBaGRKR0EN9XpnU3oIjLVRMVZVcKh6YwTdZbHW8JpL35ypdX6aK9q027nX0M
	 0l34cYr/NYQBqBsMQlau5uGKZ8w/rfpbhzCfbR5U+3R0W53IEvJuLDzcPvP12NOMF6YlW
	 g/lgzb0zEG/P+8x4ihimrcPZacpTe6zcwNloo4nB6hAfUt4RAbzQ+AXogi4K2BtYsZ+S0
	 8ailmh2bChQD4MiY/aeBZtPKp5tulBiSZBG/LnGDuEwHDTqjfggiVPFl0IuHTD1hgskLR
	 +1x52TlB1h23fPkqlPucthYv3iT2TtarXBLl+GcHFW4fFQtxybLaY8ElzQ5qYlsFbUA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789916192;
	bh=235skMEz307yiyV9CXz+xd/ZQkAz+x4P3WQCD2hRQuM=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kggdFRvqydCxW5vdvdmAhIRifQF7akG4Q+VSFhGQ5/NauvBa5EhaGpueKq7j/YXzA
	 LXPcx8FCWI3hYUyqBDML79O1tLw3qkD3NXE6T5z3vTEAD2mijiKU01DrjvjhMbuMVT
	 tZeeevNpUJv+3UwtDQ/nsy1EZYZ4BKVqnupR6eJ88+9Am+yePb/1CKZBRCKWvCAhHn
	 2N4zDlozH2yTn3OrXv3Qq3QQJscmRaf+JV6lfWdhfEdxMHkojx/EE6f9JHzt8Jx539
	 4AOOGxP7JuZA1hrUtYgBL7yBK4wuY8vYRf3xbYaLwMZB1UQ0Dw420+CK4yLhi5gU0n
	 rLIrDTqM0qeZQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 860D360767;
	Sun, 20 Sep 2026 14:56:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id DD7C324D
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:56:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C3C608101F
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:56:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 96iUhsA9uTqJ for <buildroot@buildroot.org>;
 Sun, 20 Sep 2026 14:56:31 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org D60CD80F9F
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789916191;
 b=oj0sY1lYf1yHfDH2KNd62GO0bjKbkw2EvMbN7tiXZaCoSqGK2bD4z0HYpmkcg22ljtre
 Dtsji1ahpuc0bMVH8mcPgNyQYbfGJTvvjvmAjRBJDmHK46IrnrU3K78H3jBydrNfdOqNg
 p7M0+MWGI1oddJHKpWgNo4rH1qiGWo7fm5DZo94uR8aAnuAl6wFfPaATyKPC53XSnzShG
 sfXwhTHM6uXGgXUW98LkuwgALYigcKfvkkQbq53tjok9KW1Lx7KTQja+YoNS/37jesj+l
 kErLJM/+7J1dyM2aM0euM3YZSX1B82sKCHXmw6OWi5f7OcVt9t5vufcA+MxqLKhFAbw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789916191;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=3aKZb4LJYzzut3vuILtIB9xtnqzSTwUpR3VdLJSINBs=;
 b=swUSlL8vMbjKb5EZRWKG9+jaG8d9q8LQSwK1XTHwLkYs5comhoPlwoJL9ckUpT1q4jkC
 XkDhquwozDz5L8AoKCV1/dBLSPNMLVirM8WUoxDB1w7xxjzzdxUocmnI6dg7UuZOvouSb
 Ckx+bfly4nO7SozEjp/1tpfbnLO+nePzCeOhzZ2oYMskwAq9/temLAyTma8N37EQbMeDc
 rHwQbFvGdigjVP+ZAWS4wXkdzjWVhE/ZMVR6khEqmBvpe+AlFIFFOOECWln0PGkL1/l5/
 dKG2JnoHqlp0EZ+p+SF3BAUmIGbbipUNSp9KQo/IwhYHnkcyoKF8Ykuu+d3amm7neEg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=TFrGwL3c; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=TFrGwL3c
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D60CD80F9F
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:56:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789915505;
 bh=3aKZb4LJYzzut3vuILtIB9xtnqzSTwUpR3VdLJSINBs=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=TFrGwL3cpAc0PxrIKUg/SCMi66V5LlpMgUy2s+S+U6ZNhtIm21rWCtJsK6tAfmX2a
 ThJvY0jW3EquNpOq6ny8BhW3qsbyar0rsS+bk9IdUcEPPbp6jP0roA5OkdXZdimivf
 +BF+qCwYYsIA+opttfjC+4NL5hqb6Le5N+7be1o6dDx0D3UWoPAvdcQUed1Ygs4DF7
 VuUY0WUTsaIQCt+JZKBw80uxBqJJN5vNuxgrqACgvNrvYxFMf5plPAyxojAoKRUUbl
 ofB7KJvTDI9HZKS5fOnG2Ebwh3iE3Hi2CUgtfzdB+t/pcw2enu3VSqbM0V3rSYHsxZ
 yvIP0tIZwTRWg==
X-KAS-Sym: v3:f51bdf72230551df:f9NnCreHs9kSnbMHh6AQdUFyi4vT0ysTuSfFuAQb1+Gxoi8Jfz3lO+KrB2DeTBKeXjT0lwPd2ophCA3F+v+GZvhFlIBU+QKhu+ybVOfg3EHT3MlcRpRvQktOsgJhRsIPALxvYyBhhxNnYCE6obl1o50gAonnv157yLjz1DqCWN47h7t3uGG6haE/+QCl6peUI/vdtKUEOPguOHtIjeLQw2ZSvs9SigPQ0ly22rWdnqQfFx4YWvu/1HbcD6LUsBe0xcLvKWC7ZgeG69JhrpeXORhdzb1VUBZOYiQJc18uAWs2B+mptoIqbEFj6Yl1D0sZ4aKGuMvi+V1/RbjqRW8wdA==:pmHLn8+F6JL+sztrEfc8YTtrI98PzILIBr2cqShpJDCRBLE34FH4tGaPeRD8PoZigadexxST8/d8ojOIwP0AfgAgWbWNUXjigNxcMIvYCS0M8K356RE1jvSgkKHrfHDzi1+K1GE8sYzXcHWgmoZL89cICogBiihfNCbpWbC+l15C/xt2njn9DCOl60IyzGLK0Xbz+y7nsrZHSQmYd2AzSEps2mAZc1tZTBDfQBNMANXhk+9UgVz6GSUXoIGid5XIfE7wzL/dhUmNlyZFqDHp3YJh6+dTy4CAG19HyrVdGQDt/NBT1c6R6zx0B7Lfh1WMMEE93zIVGXIawi8O7dgC4tXU6p4zJe/E4/NFNuoHJ+YUIlIl5JsM1eyowYNmCBhcKfln+gZSrrnvylAgI+gM/SAWj8hDkcusSeavx3BRJR//zS5dllct/GIPp2HCtLMegcJLR2wsURPGBI5ewQYwS1D63xPrW4+lvAuW0FaPf7HrZ2TozWIL6egLlpKeivV07+Xo2Ijt1Mg8MqfK8CcME86CaYjpb87XZte9s7f1S2rWaWGRtbvZHHnDGg0yD6BhIreh639FqJS6BI8KgWP7mQRXJ1F6KoQ=
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id DFD03A4C48AF
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 16:45:05 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:47000)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x8Imn-000000000hB-2RQX
 for buildroot@buildroot.org; Sun, 20 Sep 2026 14:44:57 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 20 Sep 2026 16:44:21 +0200
Message-ID: <20260920144428.3009612-61-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260920144428.3009612-1-bernd@kuhls.net>
References: <20260920144428.3009612-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: -
Subject: [Buildroot] [PATCH v4 60/66] package/thrift: Fix build with OpenSSL
 4.0.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...recated-OpenSSL-API-ASN1_STRING_data.patch | 35 +++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 package/thrift/0003-Replace-deprecated-OpenSSL-API-ASN1_STRING_data.patch

diff --git a/package/thrift/0003-Replace-deprecated-OpenSSL-API-ASN1_STRING_data.patch b/package/thrift/0003-Replace-deprecated-OpenSSL-API-ASN1_STRING_data.patch
new file mode 100644
index 0000000000..279daef4e2
--- /dev/null
+++ b/package/thrift/0003-Replace-deprecated-OpenSSL-API-ASN1_STRING_data.patch
@@ -0,0 +1,35 @@
+From d586077a37e14446cf385893608ea9e60a59d083 Mon Sep 17 00:00:00 2001
+From: Brad Smith <brad@comstyle.com>
+Date: Sun, 23 Aug 2026 01:26:50 -0400
+Subject: [PATCH] Replace deprecated OpenSSL API ASN1_STRING_data()
+
+ASN1_STRING_data() has been deprecated since OpenSSL 1.1.0. Replace
+with ASN1_STRING_get0_data(). ASN1_STRING_data() has been removed
+with OpenSSL 4.
+
+Upstream: https://github.com/apache/thrift/commit/d586077a37e14446cf385893608ea9e60a59d083
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ lib/cpp/src/thrift/transport/TSSLSocket.cpp | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/lib/cpp/src/thrift/transport/TSSLSocket.cpp b/lib/cpp/src/thrift/transport/TSSLSocket.cpp
+index bb8dfd13f..48b96ebf7 100644
+--- a/lib/cpp/src/thrift/transport/TSSLSocket.cpp
++++ b/lib/cpp/src/thrift/transport/TSSLSocket.cpp
+@@ -770,7 +770,11 @@ void TSSLSocket::authorize() {
+       if (name == nullptr) {
+         continue;
+       }
++#if OPENSSL_VERSION_NUMBER >= 0x10100000
++      const char* data = (const char*)ASN1_STRING_get0_data(name->d.ia5);
++#else
+       char* data = (char*)ASN1_STRING_data(name->d.ia5);
++#endif
+       int length = ASN1_STRING_length(name->d.ia5);
+       switch (name->type) {
+       case GEN_DNS:
+-- 
+2.47.3
+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
