Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12408C433EF
	for <buildroot@archiver.kernel.org>; Sat, 12 Feb 2022 20:39:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BD1C160B43;
	Sat, 12 Feb 2022 20:39:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qapRBPimeV6t; Sat, 12 Feb 2022 20:39:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0D33B60C03;
	Sat, 12 Feb 2022 20:39:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BECCE1BF577
 for <buildroot@lists.busybox.net>; Sat, 12 Feb 2022 20:39:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BA0D860B43
 for <buildroot@lists.busybox.net>; Sat, 12 Feb 2022 20:39:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id I6mNzaY-su0v for <buildroot@lists.busybox.net>;
 Sat, 12 Feb 2022 20:39:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 48F54606F9
 for <buildroot@buildroot.org>; Sat, 12 Feb 2022 20:39:11 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id cf2so21294943edb.9
 for <buildroot@buildroot.org>; Sat, 12 Feb 2022 12:39:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=6UkJ+4HrPdAdI8ztQdz4o6ErSHi0EpF5ib9UEw+pzIE=;
 b=UZgFWtgD8keJFTnL9irdvmYR++XmIp6pFflJVbzL9PatbzsXJ1TYwsB6wguJE2820X
 ubDUvqjK6QuLQqUy3ADv3zQoLp2cOnIlKYGwGYzfQQ/36GZEwUBWS5iVagPK9gAt4tEv
 gITTdkRIedO/oCLyHJ3wpt8pQAolsxoDQ7TpHjWoPM3rkNrJAzZeo3PZ+SSHlYCGwsAC
 F3MUZJXwTBpL1byMyG7Mg4RnQigmIbbu8iL5brQEv2aTpqpYbmgAUnpTo3+BKrDzC+k0
 klkzGPryg8jYF2AgFJrZLxCXxW9y/53gKi6ebddkYvXniQLxgBBaVHBu8eudLiuWuXYS
 UvVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=6UkJ+4HrPdAdI8ztQdz4o6ErSHi0EpF5ib9UEw+pzIE=;
 b=nhwhVIHuBE0sABrmBoQc1QR7J9+DQVo1aldxoRXM4hjT473stkTn8sa/Fbos0JGKz1
 dBH6DqKcO8BRWK1NPk3erZGruHGqspEMPHruiJ6PaV1DPSiEUL3z2k6uG3RzMuqMa8F7
 9BJ/3ds0DEDfn+hpUWUfnMTNwIEu1oqHEuqezhe+wulOsJyLAkPMDJxDgSYCsTMHGaaw
 KgU+sFzg9Zcywl//Nc/USr42sLiCxbw/aCWFaKjT+eUYV44Mn1bk/AF9qXswe5MLuRNP
 lDMUvMHlduQ1YRpEwFyNFzHI6HMWrcTZ/B2mUXghK7EdTWk9HPY5GN4esfOJowd7tEz9
 6SOw==
X-Gm-Message-State: AOAM533I7+lCRBH7o6LvzbZhjwmef89Pj7u59PZ1DJflKdUYx+NZbQVO
 oe0IIwLqGFMR58fTlSe2jTxlzYmfQeqgtQ==
X-Google-Smtp-Source: ABdhPJzIcGTOk9hvXOvzqdf7ChXWbaPqC3/p2J8gEha039bWSa2hpYfj/+oOMN9MYmZtaVsudDR4EA==
X-Received: by 2002:a05:6402:348b:: with SMTP id
 v11mr7975410edc.353.1644698349483; 
 Sat, 12 Feb 2022 12:39:09 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id de24sm5908083ejc.112.2022.02.12.12.39.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 12 Feb 2022 12:39:08 -0800 (PST)
Message-ID: <ffc8f602-19a3-b6e0-e459-b0efbae4d65f@mind.be>
Date: Sat, 12 Feb 2022 21:39:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-GB
To: =?UTF-8?Q?J=c3=b6rg_Krause?= <joerg.krause@embedded.rocks>,
 buildroot@buildroot.org
References: <20220131202151.937124-1-joerg.krause@embedded.rocks>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220131202151.937124-1-joerg.krause@embedded.rocks>
Subject: Re: [Buildroot] [PATCH 1/1] linux: build after wireless-regdb if
 enabled for early loading support
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAzMS8wMS8yMDIyIDIxOjIxLCBKw7ZyZyBLcmF1c2Ugd3JvdGU6Cj4gVG8gc3VwcG9ydCBi
dWlsZGluZyBpbiB0aGUgd2lyZWxlc3MgcmVndWxhdG9yeSBkYXRhYmFzZSBmaWxlcyAocmVndWxh
dG9yeS5kYiopCj4gaW50byB0aGUga2VybmVsIHVzaW5nIHRoZSBDT05GSUdfRVhUUkFfRklSTVdB
UkUgb3B0aW9uLCB3ZSBuZWVkIHRvIGVuc3VyZSB0aGF0Cj4gdGhlIGRhdGFiYXNlIGZpbGVzIGFy
ZSBpbnN0YWxsZWQgYmVmb3JlIHRoZSBMaW51eCBrZXJuZWwgaXMgYnVpbHQuCj4gCj4gU2lnbmVk
LW9mZi1ieTogSsO2cmcgS3JhdXNlIDxqb2VyZy5rcmF1c2VAZW1iZWRkZWQucm9ja3M+CgogIEFw
cGxpZWQgdG8gbWFzdGVyLCB0aGFua3MuCgogIFJlZ2FyZHMsCiAgQXJub3V0Cgo+IC0tLQo+ICAg
bGludXgvbGludXgubWsgfCAzICsrLQo+ICAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygr
KSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS9saW51eC9saW51eC5tayBiL2xpbnV4
L2xpbnV4Lm1rCj4gaW5kZXggZGQyZWViZDQ0Ni4uZmZlMDYwNjkzMCAxMDA2NDQKPiAtLS0gYS9s
aW51eC9saW51eC5tawo+ICsrKyBiL2xpbnV4L2xpbnV4Lm1rCj4gQEAgLTcyLDcgKzcyLDggQEAg
TElOVVhfTUFLRV9FTlYgPSBcCj4gICBMSU5VWF9JTlNUQUxMX0lNQUdFUyA9IFlFUwo+ICAgTElO
VVhfREVQRU5ERU5DSUVTID0gaG9zdC1rbW9kIFwKPiAgIAkkKGlmICQoQlIyX1BBQ0tBR0VfSU5U
RUxfTUlDUk9DT0RFKSxpbnRlbC1taWNyb2NvZGUpIFwKPiAtCSQoaWYgJChCUjJfUEFDS0FHRV9M
SU5VWF9GSVJNV0FSRSksbGludXgtZmlybXdhcmUpCj4gKwkkKGlmICQoQlIyX1BBQ0tBR0VfTElO
VVhfRklSTVdBUkUpLGxpbnV4LWZpcm13YXJlKSBcCj4gKwkkKGlmICQoQlIyX1BBQ0tBR0VfV0lS
RUxFU1NfUkVHREIpLHdpcmVsZXNzLXJlZ2RiKQo+ICAgCj4gICAjIFN0YXJ0aW5nIHdpdGggNC4x
NiwgdGhlIGdlbmVyYXRlZCBrY29uZmlnIHBhc2VyIGNvZGUgaXMgbm8gbG9uZ2VyCj4gICAjIHNo
aXBwZWQgd2l0aCB0aGUga2VybmVsIHNvdXJjZXMsIHNvIHdlIG5lZWQgZmxleCBhbmQgYmlzb24s
IGJ1dApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWls
ZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMu
YnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
