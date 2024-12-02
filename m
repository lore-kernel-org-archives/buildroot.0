Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5F38D78333
	for <buildroot@archiver.kernel.org>; Mon,  2 Dec 2024 16:15:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5D77580FA0;
	Mon,  2 Dec 2024 16:15:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 719y68JVMDal; Mon,  2 Dec 2024 16:15:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8222E80FAA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8222E80FAA;
	Mon,  2 Dec 2024 16:15:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 93BD91DAA
 for <buildroot@buildroot.org>; Mon,  2 Dec 2024 16:15:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8279C80FAF
 for <buildroot@buildroot.org>; Mon,  2 Dec 2024 16:15:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u1FlnHvhPwGu for <buildroot@buildroot.org>;
 Mon,  2 Dec 2024 16:15:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12b; helo=mail-lf1-x12b.google.com;
 envelope-from=alex.bennee@linaro.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6D1E980FA0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6D1E980FA0
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6D1E980FA0
 for <buildroot@buildroot.org>; Mon,  2 Dec 2024 16:15:01 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-53de8ecafeeso4836438e87.1
 for <buildroot@buildroot.org>; Mon, 02 Dec 2024 08:15:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733156099; x=1733760899;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=322bcIsQl+eOHICBE768vcz1SvD7M/P7vC5LGhQDJ6k=;
 b=QlVheqSlYOOaMmiofqFpWO1ug/N6BoDMOidHPGYLfydycmFrdfcJHKClIHy9rhO6JN
 N6zJ18+DmnKW+FM4Hp8nW5g2uGPYeAedF9uwmQ5ocagejquXJ7IVJM7fSFDUYoJe6htZ
 kw3xDKk+mB8aRPcxdPqYB4wDsSJp+N6Fa+XbVr25GlMmf1AAFNWBShPYVXLt5RDJWDpd
 Dr5I7t358ypHyF5GpNmlcpECLVh75POF/rO0BV4o2TYjmLYyMP+fxcJPaPKa2S8PqWBg
 QbvKpeUO2djv9iNqFU0Kz5FA9/ohPJjjGQdpK44nkRHM0gI3PytfhvsN97gCc7KXyEIO
 a0Vg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXDj987pzND1DacidICsQgvVSKRu/EZr5rRUuPEZHF0082Dnp1yYGUK5nGKZq6FyWCynA7qgz7iIO4=@buildroot.org
X-Gm-Message-State: AOJu0YzryNLA/5Krc7sqhy/rEE/lbibMekd+VkDWgz0uJq+NiIqLMKr3
 AlB/YMymCNhehhC7RblGAIoUoy8ty/fLgaLsQvxOpEjXqOLi3wRtgK1ctDplG8s=
X-Gm-Gg: ASbGncvVo804GZBq0oyCnsKWp6e05jy2z2zvSXEDqDipQpwjlXA85EP0SGCLb+iVp8w
 egp1O1RE+ZlWak3d14rDl9waWVFZssKmaC5c7kMJ0oHCap1Tkv78t2Pk5r4KQtXpblZ1/yKmNoM
 NU9MPf5BjHL+EB+TyVXKB6wTdMlN9qusztScpvtrH6h4zSA1OFkFgNgZrYCwV0aqwGysm19BOOz
 g0Ms7OO8YGt1WHi1XIdseRVixnkpqoyz2uzPmOv6mdpg3GO
X-Google-Smtp-Source: AGHT+IFewAxR2B6TFYCZuQqQN3p2Fjb5VyKK82jPRtU3tlcrfoakGC7D6v8xjTAbl/VFCAu04mMfAA==
X-Received: by 2002:a05:6512:ac7:b0:53d:e780:4004 with SMTP id
 2adb3069b0e04-53df00ff1d2mr13009263e87.36.1733156098693; 
 Mon, 02 Dec 2024 08:14:58 -0800 (PST)
Received: from draig.lan ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-434b0dbf95fsm155452675e9.15.2024.12.02.08.14.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Dec 2024 08:14:58 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id BFB7D5F767;
 Mon,  2 Dec 2024 16:14:56 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: "Andy Yan" <andyshrk@163.com>
Cc: "Bernd Kuhls" <bernd@kuhls.net>,  Eric Le Bihan
 <eric.le.bihan.dev@free.fr>,  Daniel Lang <dalang@gmx.at>,
 buildroot@buildroot.org,  Romain Naour <romain.naour@gmail.com>,  "Yann E
 . MORIN" <yann.morin.1998@free.fr>,  Valentin Korenblit
 <valentinkorenblit@gmail.com>
In-Reply-To: <c655577.1b64.192853c1be6.Coremail.andyshrk@163.com> (Andy Yan's
 message of "Sun, 13 Oct 2024 17:36:02 +0800 (CST)")
References: <20240922193751.862053-1-bernd@kuhls.net>
 <20240922193751.862053-5-bernd@kuhls.net>
 <c80de03.7818.1921db53aa2.Coremail.andyshrk@163.com>
 <c655577.1b64.192853c1be6.Coremail.andyshrk@163.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Mon, 02 Dec 2024 16:14:56 +0000
Message-ID: <87frn6dptr.fsf@draig.linaro.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733156099; x=1733760899; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=322bcIsQl+eOHICBE768vcz1SvD7M/P7vC5LGhQDJ6k=;
 b=Mx/dlsxqlAsDNWytXbI/jTA7kZ3tT2vNi/aA6wIFoG1Prg+aVlgc1WdSN0CRKmvcNW
 GpHF0dRewSaTspysSBuF9PiKBT3/PQL1GpdzdU+1wrMWUKjYG1MI6QAwy+RAM1f1qnlS
 jXpsxPIRaXoRL/+ScLFMwGcJuQpwggoHRceTqAsQ2/+LeLqWO+ciTLOch1F1U8Qubok8
 SyF0NHXOg2IR3KwVVCl2Sgjxw/LSFgGLodlo5ELDI/nqSKey0c4sP8bXEqyPeNFaumwY
 nXi+v6k9IyjE83jXWpE6cd9ame8dvF0SecNycqyR7YarGtx2OwUQfT3qgUfwaQWM0tbK
 hwHw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=linaro.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=Mx/dlsxq
Subject: Re: [Buildroot] [PATCH v2 5/6] package/{mesa3d,
 mesa3d-headers}: bump version to 24.2.3
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

IkFuZHkgWWFuIiA8YW5keXNocmtAMTYzLmNvbT4gd3JpdGVzOgoKPiBIZWxsb++8jAo+ICAgIENh
biB3ZSBnZXQgdGhpcyBzZXJpZXMgbWVyZ2Vk77yfCgpJJ3ZlIGdvdCBhIGJyYW5jaCB3aXRoIEJl
cm5kJ3MgcGF0Y2hlcyArIHRoZSBlbmFibGluZyBvZiBWaXJ0SU8gVmVudXMKYW5kIGFkZGluZyB2
a21hcmsgdG8gdGhlIGJ1aWxkLiBJZiBCZXJuZCdzIG9rIHdpdGggaXQgSSBjYW4gcG9zdCBpdCB0
bwp0aGUgbGlzdCB0b2RheS4KCi0tIApBbGV4IEJlbm7DqWUKVmlydHVhbGlzYXRpb24gVGVjaCBM
ZWFkIEAgTGluYXJvCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6
Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
