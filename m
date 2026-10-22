Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4122606ACC6
	for <buildroot@archiver.kernel.org>; Thu, 22 Oct 2026 15:14:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=XpQgqe6c;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=qldDf7w8
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B7A7640932;
	Thu, 22 Oct 2026 15:14:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0qiKL6kqSFKc; Thu, 22 Oct 2026 15:14:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org D0C8540800
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792682056;
	b=cX1rnET5fK49Aopjbrtv8JDW+jzf5ehTh3W8czbkZosZn5H7Wk5nMK1rtnzxhxN1LiJQ
	 AXDtR0aDgAHTQKSuJoR0sCocQkrcbhRE8K3GdnUL1RFQtOpFciCEZVhWCYZwKyzxgFuJ5
	 VDMk0qz6y7SbfKJJueedqqQu0HAWO/wOh5wTWeBK/jt5pRzScigYrkkdZw/Z2FpGSfhha
	 Mhrwa2FgbhrQd2EoXiE9vACo2bhZRy2B9MtZEsTwG07ECCgQIcuJ3YfbWiljlubhv/lVU
	 SyOSGsSmW1yWPuUDirYvTytMVrJfFwQBOEjtZ9vJUvwZsnS0kaNFN5VybjoTZvsQtsw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792682056;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=5nmKY/bOPN1kOsEi0SjR/7lVhYkXmvu/4YaW4eFDw/s=;
	b=ZgR6u6k2anfW5p1JJJ77L1I/dOHlhDCh087MY09R1xInDXz2t/qaoiX26nppi+9enU9U
	 VLcrFPRqJRk2PcMbsyzhfrwYYqBkDMJiVsBeaUXB++I3ee2mesFGUivEArU7mN8yKF/H1
	 EdO8iS0xAIokCB72rSHgps2tLQUB3ZKPy7E0gynxPtiCgKIVuvVRRzxVnuFUVH3Z5NclZ
	 IeLkDI2dTkVZAQIUL5Vp/ucV2uwVhQM0oVpjmbRwq6jOORRUzrDBG9uCXazpXnpLDqGcU
	 7d/8FIZ+W3UbYYXANQcl0a3CKbVbyyvOA+ysqE1RyrSKBv8y2AJAeBjTlkga+G322AQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792682056;
	bh=5nmKY/bOPN1kOsEi0SjR/7lVhYkXmvu/4YaW4eFDw/s=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XpQgqe6cgyIoliiYWQPCIHNqpAzxUc2kcWzh2MVQArB8xfkOUN1lL+iPGmsYT6wDN
	 VRbmvNvqwLFT4y8pshrY1Sp4Yu6rwtI2YjQlFPdMElDlCz42TGHLAkr0hQ2mK7E+I5
	 IFx3kg4U6Fu9MuZaIMiyJ6/HI1/BTsLcAqD5VtiHaUfn8jAj4lOttroQsV13gF8jq4
	 dy5DQcFSmQzc8oG2XyC1QvNfhnDhsDRcXcGUejP2R9mrqf/CLzfcI/946bVmcuKiyc
	 Wc29Wj0Fqbikgh4dsSLXrznmfkx5HT6ehpUmiuSuhBp6E0BYnyBYddZPz82yqDQQQI
	 7sWUa36VL5LvQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D0C8540800;
	Thu, 22 Oct 2026 15:14:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9DD7F3A4
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 15:14:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9085F40082
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 15:14:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H6MXv2jo8nxt for <buildroot@buildroot.org>;
 Thu, 22 Oct 2026 15:14:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org BEA4A40024
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::431"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792682051;
 b=crzsfeednacVmfrBMKe8y3A6LTlIUWitLBigMMIseGbbTYwqAUYAxqiLNWpqWohij6Sg
 2Jw0i8yQgavyWEW+6TpTOlXBYnzzoy7+LEpvOvjaWVvpuGRH4KSNWr4rJKiT+T2CJTSrm
 ja+W7Pc138oUuCNSKUKi31AXwqZufmJhhLo0mTBx1LX2NowDn1WJrrEIMo2nU+Lc9YQ+1
 MYbH4zPm+U6ckCH2l3On9RoPZp9Ljh9D/YLs+uxP31OlY4lHFSGYLiB+s5hcDDUQnwGy/
 Ca9KscKi38DF+Hd56l3UbAjSoX78ZtdIf3Xe2IwwpOlaVXHMU/JAdUQ8t30P43Nmugg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792682051;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=KscwIoITOa8ksLjk5YfEEZFGJTi7/1K0ZO6HXPO6yQY=;
 b=jEnBqAuVqaOR3T38frvSMOWL8pjMnirTa3NV0Xe5BoSjzvnmsUhrAsUd3y2VOckwxuqX
 MAPYAO42D7N/r9Zf0CT96lq9rES22zwtg8f4FUMXcS3ZdRlXbgLV1PZS/p+ZdRN58IoZ4
 EQRkz53wsdBXCgABov5GO0wowID9aIa9POdSYG7exuhTBQIu0K92POD7ESsnU5kzMrQgU
 u+dheVOPH0jBincd9tpaXLAU6U2xooeXXayAgXsE1P0yMCUtbaBYJo4Rzkt5Vdql9pEFH
 2/yOZi7j1sIkHmHW1a89ZfYVEc+vxWWvEG2BEMTY7lYVRAdXVTKy7seAQGuDQjhJ4KA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=amarulasolutions.com;
 dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=qldDf7w8; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::431"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::431; helo=mail-wr1-x431.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=qldDf7w8
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BEA4A40024
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 15:14:10 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-48afbd2c386so1357928f8f.3
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 08:14:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1792682048; x=1793286848;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=KscwIoITOa8ksLjk5YfEEZFGJTi7/1K0ZO6HXPO6yQY=;
 b=qldDf7w8m4PkVwgGNCsTFAyy7p9NEKdwvCufH5vYOcN9qCLkpVL8yqrxiCWE66WXrY
 mvD2FMYcUPFB0uDz/ZDJtJqtvRE0rTQbuROTHRIrFOaqoi0sjD78MuCElEq89j/8O7o1
 VRHIwtoewx1PVS6I67HUqBNXFKhQi5BIHnxXI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792682048; x=1793286848;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=KscwIoITOa8ksLjk5YfEEZFGJTi7/1K0ZO6HXPO6yQY=;
 b=hPd0AwF31J8Z8gj6RusEI2AuDM2p2OOKtJjec3OddsthPmZYrA3U2kWlN42FQA8Zr/
 FLijoyuPGFYrUkDmedy3s81OUYLB/BPMA6W+PE1FbWbf6SJi0432xKaYSsECcWAHYzLy
 AVd2bWku9ROmf/+V6c3pu66McSaxV/bBNsmxt8+BPZOYsfZNlusqybTjLq71zAsGR410
 PJIuheSYA1d2E5p/AZxGUS6mCfXeLCJQO8M8o7g+qA0DIRVZNzbgXBVTGKw3DaHUXs0j
 Jy4itgIWvjN4EyFlOty0mOveb3lMOffhzNk6TlbovyaNGvjx89yr4B42wEq+bbuiUF6n
 eMuw==
X-Gm-Message-State: AFq9FYKj5Clwg9mRtdScwfCcwrSEyuEPwc9uXrh7glGuhMBRibVihaKV
 ujVcJcCtB19phHYe1/rVlaWhtSOtbdTxmffe00cLIdGJ2LJpvWSlPKybFhjPv0OPfzB5pb/Z6Sh
 kChft
X-Gm-Gg: AYBFou0vO+yYVD7ogxXxevCxcFV9xM5V45s8vc5oJbX0dHCCxla1VvUhykZW9dwicSY
 WcpRGQmLtu/MPXtVU6aUxs4QFweH5uePLaoYfyb7BxWI3m5M4OWF7Qjjl9XX93i5kJUtKP9F2E4
 XJpvYyjQs1ZUrze6jYugobuOYIyjVOkc5VjJt72+N593gGUyUSmC8SGVglwigA/xpGANief5DYj
 x9COvyxpijtjJgBIZLDKB/8IBBXDprPXaawmd7PA7P33qeOD2UtP9c7bMgyLxzEF++9Ii5zVCDO
 HK0Qo7kYa0S3TRqTtoeWRdcA7J/tpKdvJtKuF/T3WGJeytig461+Sj0Z9FC6qOl9KM+UldUeM9q
 4c02pIxgGrhdt1zPI30VRUtgrNCqsChD8kY41HTcbpAK1DuQd6tIBFQZJQg8CZ1MAOMpSWxrgYO
 k9KIUFpRNNrVOAJh9ypXOZ+gwEakHjbIExoFPZf7aecmnz4NlyMUfO5fT81L4OnUVI3QGwnYozF
 5fUzI6cxFvLpjSYhbC1qTuGUYzhQwacndZxJEWFBeCd5FyN6w8ipAWgifwjzUc8UH97bxA1FLRs
 ZECQ/9c4ipCAEK8oENX8Wf5V/AO3E2Wmiid7Steoe5MYhYNK5kZ/y07O8xlaeFEsBLSofNE3XM1
 gXxMRQ+U82YNSb5QSrWZcBU6cN56N3diEyxO1Oqtr8g+DYdNiBDSr
X-Received: by 2002:a05:6000:46dc:b0:48d:f7af:be35 with SMTP id
 ffacd0b85a97d-48e264b2968mr7814136f8f.29.1792682048580; 
 Thu, 22 Oct 2026 08:14:08 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it
 (host-79-14-29-58.business.telecomitalia.it. [79.14.29.58])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e25827087sm12732367f8f.21.2026.10.22.08.14.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Oct 2026 08:14:07 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Dick Olsson <hi@senzilla.io>, Sergey Matyukevich <geomatsi@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-amarula@amarulasolutions.com
Date: Thu, 22 Oct 2026 17:13:55 +0200
Message-ID: <20261022151358.2260712-4-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261022151358.2260712-1-dario.binacchi@amarulasolutions.com>
References: <20261022151358.2260712-1-dario.binacchi@amarulasolutions.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 3/6] boot/arm-trusted-firmware: pass HOSTLD
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

Starting from v2.13, TF-A selects the host linker from the HOSTLD
variable, which Buildroot exports as the plain host ld. The host tools
are then linked without the C library, and the build fails, e.g. for
the stm32mp2 stm32image tool:

  /usr/bin/ld: stm32image.c:(.text.startup+0x999): undefined reference to `__stack_chk_fail'

Pass the host C compiler as HOSTLD, as already done for HOSTCC.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 boot/arm-trusted-firmware/arm-trusted-firmware.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/boot/arm-trusted-firmware/arm-trusted-firmware.mk b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
index 798efd5a15ad..ebaaaeb38c4b 100644
--- a/boot/arm-trusted-firmware/arm-trusted-firmware.mk
+++ b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
@@ -67,7 +67,8 @@ ARM_TRUSTED_FIRMWARE_MAKE_OPTS += \
 	$(call qstrip,$(BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES)) \
 	PLAT=$(ARM_TRUSTED_FIRMWARE_PLATFORM) \
 	TARGET_BOARD=$(ARM_TRUSTED_FIRMWARE_TARGET_BOARD) \
-	HOSTCC="$(HOSTCC) $(HOST_CFLAGS) $(HOST_LDFLAGS)"
+	HOSTCC="$(HOSTCC) $(HOST_CFLAGS) $(HOST_LDFLAGS)" \
+	HOSTLD="$(HOSTCC) $(HOST_LDFLAGS)"
 
 ifeq ($(BR2_TARGET_ARM_TRUSTED_FIRMWARE_SSP),y)
 ARM_TRUSTED_FIRMWARE_MAKE_OPTS += \
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
