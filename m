Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EDF3C433EF
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 14:23:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B4C7660AA4;
	Sat,  8 Jan 2022 14:23:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id k5p4TarcLZih; Sat,  8 Jan 2022 14:23:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2B5AC60ABE;
	Sat,  8 Jan 2022 14:23:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 82FF61BF2FA
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 14:23:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7876B60ABE
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 14:23:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ntfC44nqpj2S for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 14:23:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C76C560A89
 for <buildroot@buildroot.org>; Sat,  8 Jan 2022 14:23:15 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id l10so16953655wrh.7
 for <buildroot@buildroot.org>; Sat, 08 Jan 2022 06:23:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=62hFXhXNecyIN3kiNiW3UAoKM6UPKK4S3kneiqVFqr0=;
 b=g4EtQ8qzgBZAvaxUKC/ZSHVytuusRVdRQL3KFBkjzw2Sr+MVeuoAF5SHfF+aSgp8vc
 fDSrvWphEI5Yb6T+Y+uA9wYVP6EZdu5a+I+893HEmmTse/YzwtjBVYx+YjNs5qq01ASp
 XsVwQyjD5yc3Of1cNj+wyqujg8Cn2QdiP8DZV2ShPrHnIgmSsaoBDQlrPtK+q7/wo7h7
 N9Gl4OR6yFbpxHHm8ECFfg5DigX+ldWTKbdFWuiVOLSLtyV183+ram37rIrFt1LmI/Nh
 fIvhXcWczTOYDrvdFkB9sll9JqsOr0pYwa0+qxD7kqi1QyhkWzPT8uaCpzrMo77y2nLa
 73gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=62hFXhXNecyIN3kiNiW3UAoKM6UPKK4S3kneiqVFqr0=;
 b=pQsT0P3ziUl9OeCIIl5umhtYt/VtunlJGWABnBvNYv2gWyoD8TbVDQgujphg/fE9GJ
 bH/lFqwjHvYdbaLzj2MbTnpRyx4103T2t3EKO5tmV4uqHAfdM2V0NhMpycsdmbWiSqgg
 tFCsz+dYArXZnXXe/KwpQkUmSvqo9+BGLpaYbMhSRATVm3LNmaaAvCXRZ9ITXGPwzc24
 ulVsgWme3S0TsXgUXCEthEKmFXnRcN3bQZMW3IJHIUlUmcXE6ATSDkydHmXrPsCZ7Vwo
 Byn4a4ErMUWg50SXYAljL3Tzo4YnfPOPbrBXVIQjkAaOuG53nf3Qj/fBawXz/bYdsqmg
 nMTQ==
X-Gm-Message-State: AOAM533wGneIQt0vAKJ8sb7Wd9UMTYEX936wnmZQnF/Q3yybZkAvHgMc
 L75mnh4vKxjIwin24rJKabAzpQ==
X-Google-Smtp-Source: ABdhPJzcvYDTkJYV5IqnBlZjjQRDfvmNi6QKuVzcapTIunaK+eUZ2y9FbZbyNsqeZOgMZaylN/Dwrw==
X-Received: by 2002:a05:6000:1846:: with SMTP id
 c6mr9529058wri.658.1641651793928; 
 Sat, 08 Jan 2022 06:23:13 -0800 (PST)
Received: from ?IPV6:2a01:cb19:8b51:cb00:8a68:e76b:e0e9:90a1?
 ([2a01:cb19:8b51:cb00:8a68:e76b:e0e9:90a1])
 by smtp.gmail.com with ESMTPSA id h20sm1598568wmq.38.2022.01.08.06.23.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 08 Jan 2022 06:23:13 -0800 (PST)
Message-ID: <dbda2409-cd3f-325f-f586-55ce6986845f@mind.be>
Date: Sat, 8 Jan 2022 15:23:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: Romain Naour <romain.naour@smile.fr>, Norbert Lange
 <nolange79@gmail.com>, buildroot@buildroot.org
References: <20201126152832.1115350-1-nolange79@gmail.com>
 <49065289-1e01-f807-3e4f-d5e6303de5b5@smile.fr>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <49065289-1e01-f807-3e4f-d5e6303de5b5@smile.fr>
Subject: Re: [Buildroot] [PATCH 1/1] package/systemd: Allow extra config
 options
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
 Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAwOC8wMS8yMDIyIDEyOjA0LCBSb21haW4gTmFvdXIgd3JvdGU6Cj4gSGVsbG8gTm9yYmVy
dCwKPiAKPiBMZSAyNi8xMS8yMDIwIMOgIDE2OjI4LCBOb3JiZXJ0IExhbmdlIGEgw6ljcml0wqA6
Cj4+IFN5c3RlbWQgaGFzIHZlcnkgbWFueSBvcHRpb25zLCBhZGRpbmcgYSB3YXkgZm9yIHRoZSB1
c2VyCj4+IHRvIHNldCBjdXN0b20gb3B0aW9ucyBjYW4gaGVscCBjdXN0b21pemF0aW9ucwo+PiB3
aXRob3V0IGNoYW5naW5nIGJ1aWxkcm9vdCBmaWxlcy4KPiAKPiBUaGlzIGlzIGFsc28gdHJ1ZSBv
ZiBhbnkgcGFja2FnZSBpbiBCdWlsZHJvb3QuIFVzZXJzIG1heSB3YW50IHRvIHByb3ZpZGUgYQo+
IGN1c3RvbSBvcHRpb24gdGhhdCBpcyBub3QgaGFuZGxlZCB5ZXQgYnkgQnVpbGRyb290Lgo+IAo+
IFdoYXQgaWYgdGhlIG9wdGlvbiBwcm92aWRlZCBpbiBCUjJfUEFDS0FHRV9TWVNURU1EX0VYVFJB
X0NPTkZJRyByZXF1aXJlcyBhIGJ1aWxkCj4gZGVwZW5kZW5jeSA/CgpBbHNvLCBJIHRoaW5rIGl0
J3MgcG9zc2libGUgdG8gZG8gdGhpcyBpbiBhIGJyMi1leHRlcm5hbC4gU29tZXRoaW5nIGxpa2U6
CgpzeXN0ZW1kLW92ZXJyaWRlcy5tazoKCmlmZXEgKCQoQlIyX1BBQ0tBR0VfU1lTVEVNRF9PVkVS
UklERVMpLHkpClNZU1RFTURfQ09ORl9PUFRTICs9IC1EZm9vIC1EYmFyClNZU1RFTURfREVQRU5E
RU5DSUVTID0gZm9vYmFyCmVuZGlmCgogIFJlZ2FyZHMsCiAgQXJub3V0Cl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QK
YnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxt
YW4vbGlzdGluZm8vYnVpbGRyb290Cg==
