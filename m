Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F365E606A31F
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 18:22:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=nEHQuhHs;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=AqQ8RSCb
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C7544811C8;
	Fri, 30 Oct 2026 18:22:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oUZLdzpU9dIc; Fri, 30 Oct 2026 18:22:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 15998811BF
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793384522;
	b=gSz9J/lFFQYQigNHWVVs7TSzIj4KGmitutKZYflwaYO5tvTVYbhj/C9Emy7ixKoQS6gA
	 bD6b/kSzvc93OtRoGffXyIpUvdhqbWtmEp/BQA52Eym68UD5gUVWNQvIojAWWBDTncQhq
	 Gri2aVgFI3qz36E0FA2tCwAbGET4j5AZnsQNa0QwJG1twwA0H3QLieR52E9/B5V9Lg+/K
	 lo/OOyO7w4aC6Gd1njER7SzLPBhyYH3Y251PtPlHJlrhZnG56EECSlVxblZhmKtXemp6z
	 AMytZCnRsPEv8TV2TseQtlpPUg57ydbSnDJD94pmq5jQOGnyAZLqQrWDB22jaGO7X9Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793384522;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=4NKaYXQaacnNtJoyOOk7/OHTqVuz93KtufBNvtklkdY=;
	b=GvoPayFcHjZc7hZ8MmDr8b6PYpgVaoHFuyf2zYJIMeHGhQpxWKeAKKPFV6JcfIl3MBE4
	 VLxQuSIo+5lgGigpb3QOKTJtUkywkNHiGJF39Vtudf8+QCO11GY3IEZtuo9Q0Jioz2Kf+
	 h3vEPrMtVX2CEO7A1f3yRyDOGhuiH3UaSAvE4tmAU43ONod02eQyXEqYFTjep/O7JIYeN
	 5rIjuBfilbrTDGdX9JXPUCCdprWqKL2JZwPWqKaYDdYhobAFOI9H2HoOYF106ANY42Edx
	 PebosQJjaZIbCYQ9kckouAnBgEGYNUf5QAPKsnwHjyis+0cbv1+iaFdw6uFOm+Hv/Hw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793384522;
	bh=4NKaYXQaacnNtJoyOOk7/OHTqVuz93KtufBNvtklkdY=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=nEHQuhHsI9nSI3znCljLVchQZ+8m3btOzIXyf5C1igSIuMmnt1Mi7nZIs8BivieEM
	 /tiRtdJPKcJ+wZXhkw4yBZ4weLTiX+u0P140VEc5yIwhrGH1RbRzzTPqTgxfukB4kl
	 zQ2PDbzcxo6YfUfM3HlfT5lzkKwXlRc5DF6C1gPab/kxxKHFbjpJAZSbp+xuk7KlNv
	 kUwE8RhLA2Pgm+0s5kNdTHyaQ6k2ClULyKJ96SZO8fKWL4CWNsO8d1cmc7LcOEk83b
	 +36L30wtM+ExAfBfaf3CB05hBA+iIzRFHUYEYfrZL/h2q0/hB0pG4uT5lFhksJtnlK
	 mqbymqYK1rQhQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 15998811BF;
	Fri, 30 Oct 2026 18:22:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id C7E71235
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 18:22:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id ADC39406E6
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 18:22:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FJRUE4OZh6Zs for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 18:21:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 128B74068E
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793384519;
 b=Ii1Bd1307G8h2UeNq9xb2/wwmyZoVgwFa+hleT/7eip23YgI5FCIF0WCMwkQi7ZeYxqF
 hwqydsGIrA7FPU0ODg2m7Ut94vmvtd+UeCUhOp+avdARuOfw5zDLRj5DydbVE6YDb8cjS
 hUOO8l9Okv/ufZwjabwFUohtitTPKBOfa8kPgKtmyfqI7E2YI88QWP1JBLcQ/XVOIknzA
 GsXqKmF0FFv/wr6CzvNOVbpB+OXNTRynzfkZDDd4dMcN9ciB1s+kGi3MDeSSpoxWm1kGW
 THm1MBhDhKu365cgGjfzoBttnEmAiiroKYt5lpIzjzHF/dFRd/kJzy8CzxhNXif0gVg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793384519;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=idPBcUwl47SL8Xz2DoTpxRAgJvpcyqoBe7yyfOykt5I=;
 b=TCZ/oaYXpRvN9jaSZcnBsqKGAj+WgHpHZMjydqIALocTF5o+CH0I/GPskq3mZ8IgmIf3
 b69IHzC9z/2dUNFN24uAEvyi02tlSdg5yK7SjGxX5IGxvna/pc2WvULWhTtIwm04n2+Fg
 fLBSIYJsHnbkEVcLOsVaoYZQGdrfoRCPhx3eTgw7j7GsVUT2WQ0OXmb8lX2iobE6UXox+
 HtU9xp0+wBYIyB8V+Nbv4j2JrLEtHKSc5xFd7eCO+VK629e3elz8lDn+6V2KZ6srq5w6G
 Pk8gLx9ZYaknixKKPwHvLjUx11+B7j9HrHNIz+NBTlzH473i1Bix2g38wK1a49c80EA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=kuhls.net;
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=AqQ8RSCb; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=AqQ8RSCb
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 128B74068E
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 18:21:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1793384514;
 bh=idPBcUwl47SL8Xz2DoTpxRAgJvpcyqoBe7yyfOykt5I=;
 h=From:To:Subject:Date:From;
 b=AqQ8RSCbxEyDb/HaaJN+T3uqGXUgFLQSvp6qeeSYIuG0S6oIEmrmRN0948sSsHZqq
 DNsYlwrccA24rKJKOgiA3AHjk5Rza4qyDhbUxSCPZLtQqOeQcoC8fBdDyvYyU0FXRM
 Uj15pTGRRrtuRxvXrfE2SvVzTGSy42V8RunH7JpK71dNiEqe/Wtn39nj0f77GVLFTE
 pGIw9RSI92vLmnBCgwljq3gSXVKw4L3ZqBtraK3AYbpRuOxxVSJf3HudSIKJVOM+zq
 JX8sii74OOb95b9LHLBEyc06YLahN/oQuxFmiIYjRYL9SPbbhYZF/Vxwy8UvWYIhaR
 eIZFwAo1ol9VQ==
X-KAS-Sym: v3:f51bdf72230551df:j1ooNvRtvfNFxTi1SnO/GQOKYrYu7jInXO9qrgafYX/tP
 91HmeC+38P9dhjIWHP8jyM8V6RZdqOM76QsYndGsVZw4yNpld+eriVHMOhi0Rp10J8mZV/BwPUg
 I8YjWbNP8lpcJVJlJTOYqRdW8+8OIq1UOWYc3Spt7w8mMNg0XmpzDnU5UFWRqLYSOIEqubrNTyA
 i/ROxyjcfraV3NQt9nRc3IgxuHyN8qDGJ1eIp6EGt/a9unL4MPb40kri7G+j0PlGZkAo1qAiCft
 TTgfBG4rWr8+rSAdK9f5SG5USh/pKZAMXT2sU7wFw1CPOGw8iNoUnzaMNNPaJJSOwq8VIKAg==:
 9oXXg0IO1BG+NcsYyD2w+Hg7Z2ngPBTv+N8m7+d9PPQbOzTV68vqDna0iDtxH55cpDw9Oj378VW
 wLrPzChiyXUFTcH6YTr0Y3gvRgTv9xAKRj4J8EWEBiWKMWre8TMoQlHz2a3wneiCf8PGia/rH4e
 GF5uaoOzUcJW0rlzB6R0koYftUR4BYkblXxwJ6zpzNVy33xqUobhygL8fKEp0LSGUYrYkideqkE
 O3CODG+z7jUNgRfS84Z6jcR52CRij4uWhwrS7oiDvf+f8qg98aVuIJ02yXpXYXDTTA1sThoyHqW
 VPMYNCyIeqfsPqF8KI+H0eRVA3uW0hul5jVU5jnliJ4AkyEQWnGpUVX97SDBlgfdtb5/FXmrY/g
 eBMsLrzUItdmi0vxphjcSsETTkq2FurfruQjYuiMI02feGX8yFYae2itUbO48pUcDnMXsnJwoim
 5d4yCCKr2SmqWXG5H8NsmwuZs1o/CRF6Bg8YqY5sM+M9qzszf/XPu79XE/bktjwryQdauc/TvVa
 ZVCvauEYCvQ8iCMmMEfeAKkSokahX42BIxiSiUrBX0xOJ/VO2PB2ktcul24bAStaxY+e3Iz8O0Y
 tDBr4w==
Received: from fli4l.lan.fli4l (p5b3a01b5.dip0.t-ipconnect.de [91.58.1.181])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id ED770A4C036B
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 19:21:53 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:47276)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xMrEf-000000006vq-0oKk
 for buildroot@buildroot.org; Fri, 30 Oct 2026 18:21:53 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri, 30 Oct 2026 19:21:53 +0100
Message-ID: <20261030182153.1377722-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH 1/1] {linux, linux-headers}: bump 7.3.x, 7.2.x,
 6.18.x, 6.12.x, 6.6.x, 6.1.x, 5.15.x, 5.10.x series
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Update the latest kernel releases to:
 - 7.3 -> 7.3.1
 - 7.2.13 -> 7.2.14
 - 6.18.59 -> 6.18.60
 - 6.12.114 -> 6.12.115
 - 6.6.160 -> 6.6.161
 - 6.1.190 -> 6.1.191
 - 5.15.223 -> 5.15.224
 - 5.10.272 -> 5.10.273

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 linux/{5.10.272 => 5.10.273}                 |  0
 linux/{5.15.223 => 5.15.224}                 |  0
 linux/{6.1.190 => 6.1.191}                   |  0
 linux/{6.12.114 => 6.12.115}                 |  0
 linux/{6.18.59 => 6.18.60}                   |  0
 linux/{6.6.160 => 6.6.161}                   |  0
 linux/{7.2.13 => 7.2.14}                     |  0
 linux/{7.3 => 7.3.1}                         |  0
 linux/Config.in                              | 14 +++++++-------
 linux/before-6.17/linux.hash                 | 10 +++++-----
 linux/from-6.17/linux.hash                   |  6 +++---
 package/linux-headers/{5.10.272 => 5.10.273} |  0
 package/linux-headers/{5.15.223 => 5.15.224} |  0
 package/linux-headers/{6.1.190 => 6.1.191}   |  0
 package/linux-headers/{6.12.114 => 6.12.115} |  0
 package/linux-headers/{6.18.59 => 6.18.60}   |  0
 package/linux-headers/{6.6.160 => 6.6.161}   |  0
 package/linux-headers/{7.2.13 => 7.2.14}     |  0
 package/linux-headers/{7.3 => 7.3.1}         |  0
 package/linux-headers/Config.in.host         | 16 ++++++++--------
 20 files changed, 23 insertions(+), 23 deletions(-)
 rename linux/{5.10.272 => 5.10.273} (100%)
 rename linux/{5.15.223 => 5.15.224} (100%)
 rename linux/{6.1.190 => 6.1.191} (100%)
 rename linux/{6.12.114 => 6.12.115} (100%)
 rename linux/{6.18.59 => 6.18.60} (100%)
 rename linux/{6.6.160 => 6.6.161} (100%)
 rename linux/{7.2.13 => 7.2.14} (100%)
 rename linux/{7.3 => 7.3.1} (100%)
 rename package/linux-headers/{5.10.272 => 5.10.273} (100%)
 rename package/linux-headers/{5.15.223 => 5.15.224} (100%)
 rename package/linux-headers/{6.1.190 => 6.1.191} (100%)
 rename package/linux-headers/{6.12.114 => 6.12.115} (100%)
 rename package/linux-headers/{6.18.59 => 6.18.60} (100%)
 rename package/linux-headers/{6.6.160 => 6.6.161} (100%)
 rename package/linux-headers/{7.2.13 => 7.2.14} (100%)
 rename package/linux-headers/{7.3 => 7.3.1} (100%)

diff --git a/linux/5.10.272 b/linux/5.10.273
similarity index 100%
rename from linux/5.10.272
rename to linux/5.10.273
diff --git a/linux/5.15.223 b/linux/5.15.224
similarity index 100%
rename from linux/5.15.223
rename to linux/5.15.224
diff --git a/linux/6.1.190 b/linux/6.1.191
similarity index 100%
rename from linux/6.1.190
rename to linux/6.1.191
diff --git a/linux/6.12.114 b/linux/6.12.115
similarity index 100%
rename from linux/6.12.114
rename to linux/6.12.115
diff --git a/linux/6.18.59 b/linux/6.18.60
similarity index 100%
rename from linux/6.18.59
rename to linux/6.18.60
diff --git a/linux/6.6.160 b/linux/6.6.161
similarity index 100%
rename from linux/6.6.160
rename to linux/6.6.161
diff --git a/linux/7.2.13 b/linux/7.2.14
similarity index 100%
rename from linux/7.2.13
rename to linux/7.2.14
diff --git a/linux/7.3 b/linux/7.3.1
similarity index 100%
rename from linux/7.3
rename to linux/7.3.1
diff --git a/linux/Config.in b/linux/Config.in
index c7f1db7b73..d192620e1f 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -182,13 +182,13 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "7.3" if BR2_LINUX_KERNEL_LATEST_VERSION
-	default "6.18.59" if BR2_LINUX_KERNEL_LATEST_6_18
-	default "6.12.114" if BR2_LINUX_KERNEL_LATEST_6_12
-	default "6.6.160" if BR2_LINUX_KERNEL_LATEST_6_6
-	default "6.1.190" if BR2_LINUX_KERNEL_LATEST_6_1
-	default "5.15.223" if BR2_LINUX_KERNEL_LATEST_5_15
-	default "5.10.272" if BR2_LINUX_KERNEL_LATEST_5_10
+	default "7.3.1" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.18.60" if BR2_LINUX_KERNEL_LATEST_6_18
+	default "6.12.115" if BR2_LINUX_KERNEL_LATEST_6_12
+	default "6.6.161" if BR2_LINUX_KERNEL_LATEST_6_6
+	default "6.1.191" if BR2_LINUX_KERNEL_LATEST_6_1
+	default "5.15.224" if BR2_LINUX_KERNEL_LATEST_5_15
+	default "5.10.273" if BR2_LINUX_KERNEL_LATEST_5_10
 	default "5.10.254-cip72" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.254-cip72-rt32" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/before-6.17/linux.hash b/linux/before-6.17/linux.hash
index 8be46f25a9..eb8307fe8f 100644
--- a/linux/before-6.17/linux.hash
+++ b/linux/before-6.17/linux.hash
@@ -1,10 +1,10 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  7a8589912bd7a8adb07fed074283652cf482a35facef8954554654f0154b4af3  linux-6.12.114.tar.xz
-sha256  b24c40a9e2188695803358567edda51c4080176424a57dbefca45e5ac44ec225  linux-6.6.160.tar.xz
-sha256  8aa50daca0412a3d0a61a87af3744f39773d40b3132635fb7bc9be652cdb7b0c  linux-6.1.190.tar.xz
+sha256  0ec90fe4b20422b1b664b77e6d2dde22b40bd41e7eb2cad8ac8739a4749cb1bb  linux-6.12.115.tar.xz
+sha256  7d34405be5cd4989b2a5e9cbefa798e3a175218901271e034af3fe4e840b71c6  linux-6.6.161.tar.xz
+sha256  02f15b77d213e15607923832ef9382e2414ea90df6c007f15a910e139645c35d  linux-6.1.191.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256  c1faba89652ec4af585fb96131fdb70d99e891c2b368cbf6d9c1e5fb7f156c23  linux-5.15.223.tar.xz
-sha256  e7e6e7db0fc009fa223ed10bb37be059042c463593f35f50b5c5cc4a70351614  linux-5.10.272.tar.xz
+sha256  2757f8ad099cf77499ebab0896b5d31a467b74d5bb18c32b62da059d33b30711  linux-5.15.224.tar.xz
+sha256  02ec2bcda2f6227fa69fd7a4e8cc04e6e948c9120932880663c6215b4632979d  linux-5.10.273.tar.xz
 # Locally computed
 sha256  bd5db7fe3b0475cce4fc72db7a7f7df1c22b970aabe5ebff6ddd48098973bdf2  linux-cip-5.10.254-cip72.tar.gz
 sha256  97d7d5139900c10ff7435779be4857dda531e7cf6abba52c12a5f39aae195411  linux-cip-5.10.254-cip72-rt32.tar.gz
diff --git a/linux/from-6.17/linux.hash b/linux/from-6.17/linux.hash
index 2f6ad625d7..b39e09f55c 100644
--- a/linux/from-6.17/linux.hash
+++ b/linux/from-6.17/linux.hash
@@ -1,9 +1,9 @@
 # From https://www.kernel.org/pub/linux/kernel/v7.x/sha256sums.asc
-sha256  87363c24f10e06321eb362765521094e94471f6bff8bce2d6b3e40f39f004953  linux-7.3.tar.xz
-sha256  08e7b0c4f2dd1971f972da274b5e589a98989390ac56acd7a1a5af922363ea6c  linux-7.2.13.tar.xz
+sha256  fa595aad93734f829c963c2a90ef7c3673224fd7fdae7b49406e397cde2de231  linux-7.3.1.tar.xz
+sha256  bb1b871ef95a8de10b3f7b7baf0e0d754abbf620f804b6caf860f226aa97647d  linux-7.2.14.tar.xz
 
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  53a55ac9863a5547e292b8e381d4e4c2240dd1127d5428a7c44dbc550be23963  linux-6.18.59.tar.xz
+sha256  3c2f44ef6acc021a7ad444d9a2e6ec1ef488ff09368793d0004a6080f69d621e  linux-6.18.60.tar.xz
 
 # Licenses hashes
 sha256  fb5a425bd3b3cd6071a3a9aff9909a859e7c1158d54d32e07658398cd67eb6a0  COPYING
diff --git a/package/linux-headers/5.10.272 b/package/linux-headers/5.10.273
similarity index 100%
rename from package/linux-headers/5.10.272
rename to package/linux-headers/5.10.273
diff --git a/package/linux-headers/5.15.223 b/package/linux-headers/5.15.224
similarity index 100%
rename from package/linux-headers/5.15.223
rename to package/linux-headers/5.15.224
diff --git a/package/linux-headers/6.1.190 b/package/linux-headers/6.1.191
similarity index 100%
rename from package/linux-headers/6.1.190
rename to package/linux-headers/6.1.191
diff --git a/package/linux-headers/6.12.114 b/package/linux-headers/6.12.115
similarity index 100%
rename from package/linux-headers/6.12.114
rename to package/linux-headers/6.12.115
diff --git a/package/linux-headers/6.18.59 b/package/linux-headers/6.18.60
similarity index 100%
rename from package/linux-headers/6.18.59
rename to package/linux-headers/6.18.60
diff --git a/package/linux-headers/6.6.160 b/package/linux-headers/6.6.161
similarity index 100%
rename from package/linux-headers/6.6.160
rename to package/linux-headers/6.6.161
diff --git a/package/linux-headers/7.2.13 b/package/linux-headers/7.2.14
similarity index 100%
rename from package/linux-headers/7.2.13
rename to package/linux-headers/7.2.14
diff --git a/package/linux-headers/7.3 b/package/linux-headers/7.3.1
similarity index 100%
rename from package/linux-headers/7.3
rename to package/linux-headers/7.3.1
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 100545ba6e..0856a2a211 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -482,14 +482,14 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "5.10.272"	if BR2_KERNEL_HEADERS_5_10
-	default "5.15.223"	if BR2_KERNEL_HEADERS_5_15
-	default "6.1.190"	if BR2_KERNEL_HEADERS_6_1
-	default "6.6.160"	if BR2_KERNEL_HEADERS_6_6
-	default "6.12.114"	if BR2_KERNEL_HEADERS_6_12
-	default "6.18.59"	if BR2_KERNEL_HEADERS_6_18
-	default "7.2.13"	if BR2_KERNEL_HEADERS_7_2
-	default "7.3"		if BR2_KERNEL_HEADERS_7_3
+	default "5.10.273"	if BR2_KERNEL_HEADERS_5_10
+	default "5.15.224"	if BR2_KERNEL_HEADERS_5_15
+	default "6.1.191"	if BR2_KERNEL_HEADERS_6_1
+	default "6.6.161"	if BR2_KERNEL_HEADERS_6_6
+	default "6.12.115"	if BR2_KERNEL_HEADERS_6_12
+	default "6.18.60"	if BR2_KERNEL_HEADERS_6_18
+	default "7.2.14"	if BR2_KERNEL_HEADERS_7_2
+	default "7.3.1"		if BR2_KERNEL_HEADERS_7_3
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
