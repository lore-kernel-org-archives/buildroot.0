Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D84EC433EF
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 18:43:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F412981404;
	Sat,  8 Jan 2022 18:43:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id h7p7BsyfBCdf; Sat,  8 Jan 2022 18:43:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 67D69813EA;
	Sat,  8 Jan 2022 18:43:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0EC141BF593
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 18:43:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E8C8E40136
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 18:43:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nd53LJo8VItR for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 18:43:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A11FC400E3
 for <buildroot@buildroot.org>; Sat,  8 Jan 2022 18:43:10 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id k18so17949567wrg.11
 for <buildroot@buildroot.org>; Sat, 08 Jan 2022 10:43:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language
 :from:to:cc:references:organization:in-reply-to
 :content-transfer-encoding;
 bh=utCl70RWMla60g1/A7/gbNpAL96d8/KdOm6mYT37IgY=;
 b=F49ZaEkDCHTn5HzzH1YvQVHgz0ySlUNczzA+9keahdHwPgC0dUUOl0T37izsb3nCx8
 7Y2oirTagzJk1nV9fqtr/G3K/p/ATgRztHe10KPNXfRLb8ojWDVz9ELtr4LChsM0/zd6
 TMekAcQcqAFgYAPwVVKkbRdVL1vBYZ83n3rxuXylstEDOKM2ndO1TIKlAEO+kegJKjdc
 DkcU/Rf4L/zTu2M4PSg7EL+hJNu6bXBOpsQHWd//7LAK1+lN4PwVEZWdZEFn/ol3LoxJ
 4qUv1IIAopM3WB3v9nSmiWENni/fRgFrAQ/diX1CoOmVH3f9p4dEqiO+4EV88KQhZ6v5
 ORdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:organization:in-reply-to
 :content-transfer-encoding;
 bh=utCl70RWMla60g1/A7/gbNpAL96d8/KdOm6mYT37IgY=;
 b=Ij6TyEY+9ZVaFz4mBLcyTKFHeT1Wxzu3DBEBolhFPNAEfgIO4zsDZuDPQF8AMOsQjA
 5BDAQY26jUzPxK01qlR9XDfEGpniLYLecFarVKbYtrh7SkrgZWWyPUAmZTZXh2gL+d+V
 az8G6Lo/ggIyVa/TbYays/W2R75Fs0Sk+R+Wacg4MRbvpKtuMv6Mfio7EWBD9Kghq93i
 AVIZkp0nzzpMTrxT9YKzRKP/V4FSuzUOyW1R4OPEA3Q+LCDY9A+H7HQAwAcihVvpR0tr
 Sw0nFqC5femDx4sXVJMZogPWfPbrU0jhWbZ4ZwsK5P9wCUuHh67Rtv21TADieUSRtGRr
 CHyQ==
X-Gm-Message-State: AOAM532eJVKHWIQkQ38G1rJgKDLpJVgxrfipFvezKL1ETPmuPmHBFWV5
 72aowbPkNwqL5vQyI8SW1UiJvg==
X-Google-Smtp-Source: ABdhPJy6oBdvUpsOAiXkAVQ7qqyOyftX9KhyYoySS6rIYVE5Qd/TTKfZ6yJLyZYiIK3YGjo1Okv5aA==
X-Received: by 2002:a5d:598a:: with SMTP id n10mr59215679wri.252.1641667388828; 
 Sat, 08 Jan 2022 10:43:08 -0800 (PST)
Received: from ?IPV6:2a01:cb19:8b51:cb00:8a68:e76b:e0e9:90a1?
 ([2a01:cb19:8b51:cb00:8a68:e76b:e0e9:90a1])
 by smtp.gmail.com with ESMTPSA id u3sm2810664wrs.0.2022.01.08.10.43.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 08 Jan 2022 10:43:08 -0800 (PST)
Message-ID: <4ef1b31c-9d29-1c05-5ce4-fbe6457bfc95@mind.be>
Date: Sat, 8 Jan 2022 19:43:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
From: Arnout Vandecappelle <arnout@mind.be>
To: Norbert Lange <nolange79@gmail.com>, buildroot@buildroot.org
References: <20200726202449.7108-1-nolange79@gmail.com>
 <8c4e865d-62e3-7e33-87f2-36547df54a1c@mind.be>
Organization: Essensium/Mind
In-Reply-To: <8c4e865d-62e3-7e33-87f2-36547df54a1c@mind.be>
Subject: Re: [Buildroot] [PATCH v2 1/1] package/systemd: pre-create
 directories for services
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Adam Duskett <aduskett@gmail.com>,
 Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Ck9uIDA4LzAxLzIwMjIgMTk6MjgsIEFybm91dCBWYW5kZWNhcHBlbGxlIHdyb3RlOgo+Cj4KPiBP
biAyNi8wNy8yMDIwIDIyOjI0LCBOb3JiZXJ0IExhbmdlIHdyb3RlOgo+PiB2YXJpb3VzIHNlcnZp
Y2VzIG5lZWQgZGlyZWN0b3JpZXMgaW4gL3ZhciB3aGVuIHRoZXkgYXJlIHN0YXJ0ZWQsCj4+IGFu
ZCBjcmVhdGUgdGhlbSBpZiBuZWNlc3NhcnkuIENyZWF0aW5nIHRob3NlIGJlZm9yZSwgYWxsb3dz
Cj4+IHRob3NlIHNlcnZpY2VzIHRvIHN0YXJ0IGV2ZW4gaWYgL3ZhciBpcyByZWFkLW9ubHkuCj4+
Cj4+IFNpZ25lZC1vZmYtYnk6IE5vcmJlcnQgTGFuZ2UgPG5vbGFuZ2U3OUBnbWFpbC5jb20+Cj4K
PiDCoEkgaW4gdGhlIGVuZCBhcHBsaWVkIHRoaXMgdG8gbWFzdGVyLCBidXQgSSB0aGluayB3ZSBz
aG91bGQgaW5zdGVhZCBmb2xsb3cgCj4gSmVyZW15J3Mgc3VnZ2VzdGlvbiwgYXMgSSdsbCBleHBs
YWluIGluIHRoZSB2MSB0aHJlYWQuCgogwqBOZXZlciBtaW5kLCBhZnRlciByZWFkaW5nIHlvdXIg
cmVwbHkgdG8gSmVyZW15IGluIGZ1bGwsIEkgdGhpbmsgeW91IGhhdmUgdGhlIApncmVhdGVyIGF1
dGhvcml0eSB0aGVyZSBzbyBJIGJlbGlldmUgeW91IGlmIHlvdSBzYXkgdGhpcyBpcyB0aGUgcHJv
cGVyIGFwcHJvYWNoLgoKCiDCoFJlZ2FyZHMsCiDCoEFybm91dAoKW3NuaXBdCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcg
bGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcv
bWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
