Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96B25C25B78
	for <buildroot@archiver.kernel.org>; Wed, 22 May 2024 15:02:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 43841400F1;
	Wed, 22 May 2024 15:02:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jxRo12LKMiNC; Wed, 22 May 2024 15:02:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 819CB40454
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 819CB40454;
	Wed, 22 May 2024 15:02:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CD9F61C5C7D
 for <buildroot@lists.busybox.net>; Wed, 22 May 2024 15:02:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B831B82149
 for <buildroot@lists.busybox.net>; Wed, 22 May 2024 15:02:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RVdRdrFlut0Q for <buildroot@lists.busybox.net>;
 Wed, 22 May 2024 15:02:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0D89E8210B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0D89E8210B
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0D89E8210B
 for <buildroot@buildroot.org>; Wed, 22 May 2024 15:02:39 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-41fe54cb0e3so39103465e9.2
 for <buildroot@buildroot.org>; Wed, 22 May 2024 08:02:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716390158; x=1716994958;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2rJh1A56qQUHHVkE+PSXGnKDruoapxWd9Jsoi/4ng00=;
 b=VehEhwy7Pqd2IBR2/BDjRuj7C24F4on2as15SLDP7CMH4k+VE8gI/e/mV0xRY7+KfN
 y6jcE6JWiafjHkFFIYHew8XfYUUGR3RD+Kxhu/vKhytMEYkvkS042G2jNBKPr1ZMenSI
 QELC846wULE7E7drC5+khQI7xuGYkvJIVe543ewquqxZoBaMUHPHso5hiwOau9tOg6fQ
 WR6IvX3RCsLZiSBg3UehGXDZGzB/7QdOdl+8YTG1+0Iu/+f5l23ApUsAqqkliGlEk5S+
 zr9hDggSA8ikmdYN2zbZlOUYS4JHRrPE3sE08nnGGva4tokdPEA9HnYMPoapiuwNKHNO
 FJRw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWD8IzA/yAd0US4RmQyljTS/aCH7KcN02TNVs7sqRBREHharqzD2cI9VkbarzQObP7zKHdCMrbGO6W86yp6WayMKl2yF00RSQ==
X-Gm-Message-State: AOJu0YwgQ0NC0PVYJu6V6lU8a/Fv4Px78SKUzSclRSiwGOCHpmGlIFRk
 WTObbtvKqWyUn8WZhL0CxaflygPtwfKkjCkfyO9TUUC0TbcI8tLbdAIwMCVWimbgVQO47PSqC8m
 X
X-Google-Smtp-Source: AGHT+IHrWoFyybH8sjFZUPjilgO2VRmtismlI2UMPHT+WNE3CjGFKJ433e0Km0sFV7APB5n2oyV6zA==
X-Received: by 2002:a05:600c:6a8d:b0:420:110b:4211 with SMTP id
 5b1f17b1804b1-420fd38577dmr15411975e9.39.1716390157693; 
 Wed, 22 May 2024 08:02:37 -0700 (PDT)
Received: from [10.5.0.27] (202-122-190-109.dsl.ovh.fr. [109.190.122.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-41f87d20488sm535846295e9.25.2024.05.22.08.02.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 May 2024 08:02:37 -0700 (PDT)
Message-ID: <75be4856-0446-4407-8345-542a9dce3f56@smile.fr>
Date: Wed, 22 May 2024 17:02:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Peter Korsgaard <peter@korsgaard.com>, buildroot@buildroot.org
References: <20240520111730.1231889-1-peter@korsgaard.com>
 <20240520111730.1231889-3-peter@korsgaard.com>
Content-Language: fr, en-US
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <20240520111730.1231889-3-peter@korsgaard.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1716390158; x=1716994958;
 darn=buildroot.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=2rJh1A56qQUHHVkE+PSXGnKDruoapxWd9Jsoi/4ng00=;
 b=0+5u6PYgTDz8n7MX+zlLa8hfuBCNobAywYt8j3PVeeOv1cfhTHHR6tLKdAWc3bkKeS
 MJELR9nbrv5RX93ZLiAr8Q9o8RkVE8IGp80Ny5ebtML9Glc5DIN0Uhon9LmMvttg5uHk
 tlruyfu0PzLHkZaYd4ozP7gm8o1USS/VGuDXKaG0UXj4mZTrfTeYToU5KMUWR8mxGZAG
 Pg7D+k238Hk9B0rDLiWEpq1qPXuHklJw23Mh/J7kKnhtMHIZFbKimdo6IsaYgS13bb7/
 wSkGD2317+aLAQVLqNBRB2qqRW9ie/G+Afi8PJqocEFrbFwd7ZLuY20Jpe0Z64JKNemJ
 iF6A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=0+5u6PYg
Subject: Re: [Buildroot] [PATCH 3/5] configs/orangepi_pc_defconfig: bump
 Linux kernel to 6.1.91
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gUGV0ZXIsCgpMZSAyMC8wNS8yMDI0IMOgIDEzOjE3LCBQZXRlciBLb3JzZ2FhcmQgYSDD
qWNyaXTCoDoKPiBMaW51eCA2LjYueCBjcmFzaGVzIGR1cmluZyBib290LCBzbyBzdGljayB0byA2
LjEueCBmb3Igbm93LgoKWW91ciBTb0IgbGluZSBpcyBtaXNzaW5nIGhlcmUuCgo+IC0tLQo+ICBj
b25maWdzL29yYW5nZXBpX3BjX2RlZmNvbmZpZyB8IDQgKystLQo+ICAxIGZpbGUgY2hhbmdlZCwg
MiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9jb25maWdz
L29yYW5nZXBpX3BjX2RlZmNvbmZpZyBiL2NvbmZpZ3Mvb3JhbmdlcGlfcGNfZGVmY29uZmlnCj4g
aW5kZXggYjE0Y2Y1NjE1NS4uYWQ2M2RhOGRhZCAxMDA2NDQKPiAtLS0gYS9jb25maWdzL29yYW5n
ZXBpX3BjX2RlZmNvbmZpZwo+ICsrKyBiL2NvbmZpZ3Mvb3JhbmdlcGlfcGNfZGVmY29uZmlnCj4g
QEAgLTEsNyArMSw3IEBACj4gIEJSMl9hcm09eQo+ICBCUjJfY29ydGV4X2E3PXkKPiAgQlIyX0FS
TV9GUFVfVkZQVjQ9eQo+IC1CUjJfUEFDS0FHRV9IT1NUX0xJTlVYX0hFQURFUlNfQ1VTVE9NXzVf
MTA9eQo+ICtCUjJfUEFDS0FHRV9IT1NUX0xJTlVYX0hFQURFUlNfQ1VTVE9NXzZfNj15CgpJdCBz
aG91bGQgYmUgQlIyX1BBQ0tBR0VfSE9TVF9MSU5VWF9IRUFERVJTX0NVU1RPTV82XzEgaGVyZSBi
dXQgaXQgc2VlbXMgcGF0Y2gKNC81IG5lZWRzIHRvIGJlIHNxdWFzaGVkLgoKQmVzdCByZWdhcmRz
LApSb21haW4KCgo+ICBCUjJfVEFSR0VUX0dFTkVSSUNfSE9TVE5BTUU9Ik9yYW5nZVBpX1BDIgo+
ICBCUjJfVEFSR0VUX0dFTkVSSUNfSVNTVUU9IldlbGNvbWUgdG8gQnVpbGRyb290IGZvciB0aGUg
T3JhbmdlIFBpIFBDIgo+ICBCUjJfU1lTVEVNX0RIQ1A9ImV0aDAiCj4gQEAgLTEwLDcgKzEwLDcg
QEAgQlIyX1JPT1RGU19QT1NUX0lNQUdFX1NDUklQVD0ic3VwcG9ydC9zY3JpcHRzL2dlbmltYWdl
LnNoIgo+ICBCUjJfUk9PVEZTX1BPU1RfU0NSSVBUX0FSR1M9Ii1jICQoQklOQVJJRVNfRElSKS9n
ZW5pbWFnZS5jZmciCj4gIEJSMl9MSU5VWF9LRVJORUw9eQo+ICBCUjJfTElOVVhfS0VSTkVMX0NV
U1RPTV9WRVJTSU9OPXkKPiAtQlIyX0xJTlVYX0tFUk5FTF9DVVNUT01fVkVSU0lPTl9WQUxVRT0i
NS4xMC4yMTciCj4gK0JSMl9MSU5VWF9LRVJORUxfQ1VTVE9NX1ZFUlNJT05fVkFMVUU9IjYuMS45
MSIKPiAgQlIyX0xJTlVYX0tFUk5FTF9ERUZDT05GSUc9InN1bnhpIgo+ICBCUjJfTElOVVhfS0VS
TkVMX0NPTkZJR19GUkFHTUVOVF9GSUxFUz0iYm9hcmQvb3JhbmdlcGkvb3JhbmdlcGktcGMvbGlu
dXguZnJhZ21lbnQiCj4gIEJSMl9MSU5VWF9LRVJORUxfRFRTX1NVUFBPUlQ9eQoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcg
bGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcv
bWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
