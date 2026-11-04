Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CADEC606A326
	for <buildroot@archiver.kernel.org>; Wed,  4 Nov 2026 12:52:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=M1YCTsoM;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=S1Y9eX0f
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A985A605DA;
	Wed,  4 Nov 2026 12:52:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nLpVOvgt-UjE; Wed,  4 Nov 2026 12:52:23 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org A18176062C
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793796743;
	b=KttQdiE0ExBqx51bAiB5jb5nEwhwb/FTM4P3yG1xNG228jUwricM+XrxgxPlmJ9M2LW1
	 D4FXvdpohPM34i5P1kWo7ohgP8iXT2jTnxs9hLlIatulQqxnnE3mF5VqM/MFo8FeyT738
	 JC7rFXufJfg7+/5hJqqY0LkdeTfThle60elPv8erG/LMy/Eu9JKDKrozPkWPPBlxZGMx2
	 xmUFPdKTBuKvWxsOQl62XAhTbCoF8d8/+0jqwk87Sbl0DSrBvJqNxoMqAKs8XBocSPw+q
	 Z4d3O1TAVDxLKI27/dzNr9UiFIn8bquwTL3BkE5nR+hYc4jpDcFCz4D14PGftq2O7vw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793796743;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:Date:From:To:Cc:Message-ID:MIME-Version:
	 Content-Disposition:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=nPFidgcHaSt1nuDeaYH6H8LeDoIV7dithX4QIsBj5qs=;
	b=pdPIOEYizn95CUsAA/3xp+KlldxtnGNAFhUfAY4i23M6Oie6svmNaQBLGYmnPrYWV176
	 c6khw3Ucht5e8kJz2D498Ll6w3LB/p/2iK4b0xSqxViK1PSK4Wygo/trM2yDY6RnVEFrt
	 wG02eq+hqWLI28RFIM2T5LnSs2jYSBo/oFGkTBtYiIYOQEaXfwHw7XQT9wlNayYAHUjf9
	 eAXo/gflsRBddq2Yr3F96pkb2Rf0Zl/SBDUqvwAeqzdCuqU3QU+TYC2Yi+Y/BJsAGxPLP
	 xHmL4hTk4GAYmWU2RSDWp/s3nF5dvQ7d6OTJk1SyIx9nop6jAZ0ibYjfdCKMovOBt1w==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793796743;
	bh=nPFidgcHaSt1nuDeaYH6H8LeDoIV7dithX4QIsBj5qs=;
	h=Date:From:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=M1YCTsoMHHoVStqqFrHqtveqm051O9k6UNtXziDOk9D0gsPWE/pAYUhjV+2bYzNs9
	 WoPhtnIBI+Zb60bX9Iy2/28w4cDVt8L0I6dlW3tZPBClW6QiJqfP93vh7RWdp1zFvR
	 fKaZe3v8KCYNxEkXOv4+CbGhMyeuQpJaspsgXrWM3kN0UkgBkvu7ywnSrdKvbdVLeJ
	 M5XVOskxPMZj6xNDrbBX07wDpQAlhH8a5YFnMyN+QdzuWgUT7jeRsNknNVfOr7i32o
	 MdO6xsCq0Z67Of/zkfAmu95UMAjoYQIDv+Gi+NB0ZbsjAYsFqW3nCOJR2ti7bepC4G
	 aabcNfZCOXaCA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A18176062C;
	Wed,  4 Nov 2026 12:52:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8ADC1341
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 12:52:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7054880FFE
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 12:52:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HEWdXYCf36GX for <buildroot@buildroot.org>;
 Wed,  4 Nov 2026 12:52:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 99E3880FA9
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::32b"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793796742;
 b=N/O+IyiFzjX0Md+b0H6eg5zrbZ5WhkzqsDVFjNOkL6929nSHiwpr+q/wdyq8dyUTAFH8
 VPKrXEaEzz6PFjiMmWjUEatUuDhidaVtbg/VINyOxQf6R7cftqKcq/7Zd8SV5JQZ9/77M
 JP6ZHX8Sf/lWyunufqu92PMU2YIi+GMjz33DAEmmfSDnUUIYeXEXFSqzzAm/7J+v/N7aJ
 TzBh8QR1vJBvxejvRXD7Wv1crIro5DkPqgyAf7yP7nco+ax31ODGfIAssgGhhNF+AqMpC
 FrsWBi8MaM/YgCgl4biAHHj+xT2bq3lFV3mgyl9g9hKOCYL4rDVdj7tk2/zgAuXwnpA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793796742;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
 Subject:Message-ID:MIME-Version:Content-Type:Content-Disposition;
 bh=H3ag0SIYm5GqUzh460s4lbjzvtumiA0hM1Q4fNwihLE=;
 b=YfQ1iyeokZgZ3f3jx/YIr/iZZXNGhTqrptoSuN871eGpBhTi8G0ZcLj1DONF07tSEfMb
 gy1cZEmBlo6+TjhY2BrjZX8WCEvprNutcRuH0YY3MpFwjuMsHqKaJ3Ybw4FUfMBFElLWh
 pE/e2vHn4pYn6u3OqAzMKKMO0UxWAyxH8YyhLyRmFijdLekBlAD39l45xbWyuRNe1S1K1
 QK+BpJY5FONPcLHWZOfpFutsnx6DOYlvhgGBguJS+gsoO8PEubeLofWNv0DkBlMLJ60KN
 g0eiWIHxUgB0ivxH5fr7qGb56SFYcw6sshlt260VXR2XCyY+sI6x3c9TkUme2A/0f/A==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=S1Y9eX0f; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::32b"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=leo.denieul.yoshino@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=S1Y9eX0f
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 99E3880FA9
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 12:52:21 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4a140e7405dso5875125e9.3
 for <buildroot@buildroot.org>; Wed, 04 Nov 2026 04:52:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793796739; x=1794401539; darn=buildroot.org;
 h=content-disposition:content-type:mime-version:message-id:subject:cc
 :to:from:date:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=H3ag0SIYm5GqUzh460s4lbjzvtumiA0hM1Q4fNwihLE=;
 b=S1Y9eX0fvsZNjnBzP24W7b6YrCLxae92P4ktZJTgye0Kx2D1qO6Y9WUIAKRh4dNi4Y
 6Pm/fLbGqm6++CJpzKktdnDmCNzV/hh47p9KVp3YgWg0HOWp6ZmgwaZ8ojmq7UmFS5Kt
 FtB1HqBmxsYRz2ao6cXHqXBG1ayYU4oFovvJboVl9rA2T4XFiKzTwz63DNKffMuouURE
 ky/R4EWHBCJZK0tM0F+woCSR+6bC7eYJSfdXfu9bykFuiTQs1CrDNXX2ByUiNuvVld9y
 cf8t18XE/+ZDlBVQjAptsMKD9C5O5uxVMhw76fdoEImuXamOjfW3P2h4eZ2d/SxYQxtV
 H6GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793796739; x=1794401539;
 h=content-disposition:content-type:mime-version:message-id:subject:cc
 :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=H3ag0SIYm5GqUzh460s4lbjzvtumiA0hM1Q4fNwihLE=;
 b=1bCVuOpEAjOJk4ul8vZG/NTUe0ovfWLoqSrymnr06UCSNSQYHaAOjxokIgOWn2/YXg
 Eqe6ke7Aa7C6XIYWQ61E0ldmy9V4NUv2+iN8/2tzOo+CwB7hA2SBqFCZ+Ic9yQopu4NZ
 9Slj207kWEb55XlvPiyoETDA2ZFH5e7HkK4LBS8I62Db17J6gH53tmq1gYdW5R3HdnKy
 NFaa60KihU5dSX/BM/WFHuIccFi//xJGcbym2E0xwbwpsBa9VGEpL64iOrPqpVOcmVTi
 y3ws2JocjKwxtFuSq10CwlpdoW1zZsGNcWHipx8ILnyTyqYAlxTIC3zEcYQQiNNjWeE5
 oD4w==
X-Gm-Message-State: APuU4Z8bZwexthwNwTA0rUrU4X5U0MmascQpBLKtvIWiOQbd14EADZ+K
 VZNhP8HpIzdrHXAZz5EBLdW8fBYg41YWBEEBzvbS8OiByj/cgLrt2ubNo/Ku8uhB
X-Gm-Gg: AYBFou0Q5YAFyIPBuRdRfh2WGMAObv06z2f56PVob0OkWNqelU5dLd5f14e313VlULS
 PvTsa4qrTINGNizlPZY7V5O/dOxV+O8c9+llfmMnrxMgV84KNO7AXN9rRS1WWNu/XRxNktrpb54
 5F/fy2O5XDHj900o5UaGj7PojLBoh85V4NpExQhO5Zzk3o4OBH3Gtj7ybjDW8nlW58zHxNFVWVE
 pRpQevkKQx69bWU9By9DyNFVTXBGJbsAPDwXwgoP/MO2MCidxYZtZra0eBAxvV0UVQFRPkovTGO
 rHRC34nAHYDAiPxNnrezMVz+gVetCZPRBQcRiuV02WkF4QYctgZjFdn0i1qa/x9XV08aLEZ1SyQ
 +fXXbwbapOM11nsIva4sy8dKZ6siO46e6VA60PiFsedqjlkfRKBvUASXdKzsC0ALarh/7RTP2i0
 wvOLY215UU05fjrSoeA5tjOl2uD7YljRDri06v6gVmIVE5lNGDsNN7D+P15WiFaahENOGvmmWdc
 c2piBTRLrVOw6g8tBxRry1cKrlo8fWmpn/WuUepp3eM0OXRy9SQtdbBNYmo215LO4olYNb//XmM
 wS2A5J80FitiVzj76+a284cdHHL0xE2sar8FmrhloFYF6zb1aazHTGA3fSDbefTsY/DSaglJOHG
 T6NsV8oQu4pMrX3v7qyV+mPmcNNxcul2DiHB2AGJu9Q==
X-Received: by 2002:a05:600c:1f93:b0:4a5:75d2:c104 with SMTP id
 5b1f17b1804b1-4ac17ffa050mr378712935e9.22.1793796738839; 
 Wed, 04 Nov 2026 04:52:18 -0800 (PST)
Received: from leo-ThinkPad-P16s-Gen-4-AMD (free-mobile.vlq16.iliad.fr.
 [213.36.7.11]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4b4338f764bsm32266355e9.2.2026.11.04.04.52.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Nov 2026 04:52:18 -0800 (PST)
Date: Wed, 4 Nov 2026 13:52:17 +0100
From: =?iso-8859-1?B?TOlv?= DENIEUL <leo.denieul.yoshino@gmail.com>
To: buildroot@buildroot.org
Cc: Sergey Matyukevich <geomatsi@gmail.com>, Dick Olsson <hi@senzilla.io>,
 Vincent Jardin <vjardin@free.fr>
Message-ID: <ausqgYQmLF5N9AZn@leo-ThinkPad-P16s-Gen-4-AMD>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
Subject: [Buildroot] [PATCH] boot/arm-trusted-firmware: pass HOSTLD and
 HOSTLDFLAGS
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
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Since TF-A v2.15, commit 0607fb7f6bd9 ("feat(build): add HOSTLDFLAGS to
pass flags to host links"), the host tools such as fiptool are linked
with $(HOSTLD) instead of $(HOSTCC).

As Buildroot exports HOSTLD=ld, fiptool fails to link (undefined
reference to optind), so pass the host compiler and the host link
flags.

Signed-off-by: Leo DENIEUL <leo.denieul.yoshino@gmail.com>
---
 boot/arm-trusted-firmware/arm-trusted-firmware.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/boot/arm-trusted-firmware/arm-trusted-firmware.mk b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
index 798efd5a15..2aaa7e3d19 100644
--- a/boot/arm-trusted-firmware/arm-trusted-firmware.mk
+++ b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
@@ -67,7 +67,9 @@ ARM_TRUSTED_FIRMWARE_MAKE_OPTS += \
 	$(call qstrip,$(BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES)) \
 	PLAT=$(ARM_TRUSTED_FIRMWARE_PLATFORM) \
 	TARGET_BOARD=$(ARM_TRUSTED_FIRMWARE_TARGET_BOARD) \
-	HOSTCC="$(HOSTCC) $(HOST_CFLAGS) $(HOST_LDFLAGS)"
+	HOSTCC="$(HOSTCC) $(HOST_CFLAGS) $(HOST_LDFLAGS)" \
+	HOSTLD="$(HOSTCC)" \
+	HOSTLDFLAGS="$(HOST_LDFLAGS)"
 
 ifeq ($(BR2_TARGET_ARM_TRUSTED_FIRMWARE_SSP),y)
 ARM_TRUSTED_FIRMWARE_MAKE_OPTS += \
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
