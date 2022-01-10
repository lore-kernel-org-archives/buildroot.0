Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48764C433F5
	for <buildroot@archiver.kernel.org>; Mon, 10 Jan 2022 05:36:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BFBA860A8D;
	Mon, 10 Jan 2022 05:36:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7tDDBXMzT5dX; Mon, 10 Jan 2022 05:36:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id F120160A97;
	Mon, 10 Jan 2022 05:36:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0CF381BF421
 for <buildroot@lists.busybox.net>; Mon, 10 Jan 2022 05:36:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EFAA660A97
 for <buildroot@lists.busybox.net>; Mon, 10 Jan 2022 05:36:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3l-TCzP8KesO for <buildroot@lists.busybox.net>;
 Mon, 10 Jan 2022 05:36:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E5F6360A8D
 for <buildroot@buildroot.org>; Mon, 10 Jan 2022 05:36:40 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id b7so19837339edj.9
 for <buildroot@buildroot.org>; Sun, 09 Jan 2022 21:36:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=unikie-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=4hJX+OQpfo6sXfCqOUD0KLwUv8337k+4K0nlGgLOSFE=;
 b=YnWAxZ6j5j2/xVAWBY436ypEYLck8mb3pkYO5tSknwO4nScBhN3hPBJfac2PqKZbR6
 CRGP6H9YRE0ti8cc+4UPX+yibIQPGtc6NMUAVhfP96CAfHnS9lHAzeruKhF0lp1YurVk
 2CofTfub5CMucrtzInmytT6vvCpVUKvzaWBI3FC6vZ1E9ln0WgokTGrFdLdHQn4Miy2e
 CGgw/diQ+1YzOEW001umMb5F7W78OrIo/dQ22InUc3ionhaaupghcpCkyztb3U1KqKNV
 ewGqbFgm/Rcq0KpUYGM2yADCL4iGLaWUx/7KYo7/rM1SfiyxkprD2Q2XiiaCU2jdSKk8
 x89w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=4hJX+OQpfo6sXfCqOUD0KLwUv8337k+4K0nlGgLOSFE=;
 b=uls4hAq01xZVk2m+blO+uCZikOS36cuXJEzHNSIjYG44/+e7jiupf209m60lFYwsI3
 l5kgQjtYzMpowllO980r4VXO4JzcKXNU2bb0N8Ch/J6LKQuj9h6rEMsM7JON/05cinZQ
 N/3uZV487M0OKldLhLKyJh3WSO1pex+qLH/hfeSN3fICcUrMHCiP5sTyGp5TS/GhxWJz
 3C3iBBEUpFQxJQdsBIVlAOBo4g+K/E6Ek7VA5X1N+v4KUPJ/0omm7Czs02NjvTfmYlY4
 7GTX6GJwhwOZ9dcrpdKMQGxnuYsiOkw2mXlrZA3q44qTDVsIlgUN7SR86LxgSE8oLtBT
 L09w==
X-Gm-Message-State: AOAM531EKIhQ5+YsZW38tjDbotaDU50rxZy8LeQ6bnUBCDyDAQT9BclD
 +m/khc+hjzWp3uJ1P2po9w5T4wnc+aoTr41jSvkcow==
X-Google-Smtp-Source: ABdhPJzFg1UCUgeNHGpQeAGIhFt/rWY2BK/PMyLNLCXCBfoiFbX5dBsMynyxEYwH0sIVLeqD1SE73h78VKLo4WnGnTY=
X-Received: by 2002:a17:906:e211:: with SMTP id
 gf17mr11802898ejb.462.1641792999129; 
 Sun, 09 Jan 2022 21:36:39 -0800 (PST)
MIME-Version: 1.0
References: <20211210141209.1812043-1-jose.pekkarinen@unikie.com>
 <20211210141209.1812043-3-jose.pekkarinen@unikie.com>
 <20220105232348.68986536@windsurf>
In-Reply-To: <20220105232348.68986536@windsurf>
From: =?UTF-8?Q?Jos=C3=A9_Pekkarinen?= <jose.pekkarinen@unikie.com>
Date: Mon, 10 Jan 2022 07:36:03 +0200
Message-ID: <CAJPV9Mqm9UibxUR+1H=yTy4Ntb-_ErjB0pm8XKusm7knv57NRQ@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [Buildroot] [PATCH 3/7] package/bmx7: new package
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
Cc: buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gVGh1LCBKYW4gNiwgMjAyMiBhdCAxMjoyMyBBTSBUaG9tYXMgUGV0YXp6b25pCjx0aG9tYXMu
cGV0YXp6b25pQGJvb3RsaW4uY29tPiB3cm90ZToKPgo+IEhlbGxvIEpvc8OpLAo+Cj4gT24gRnJp
LCAxMCBEZWMgMjAyMSAxNjoxMjowNSArMDIwMAo+IEpvc8OpIFBla2thcmluZW4gPGpvc2UucGVr
a2FyaW5lbkB1bmlraWUuY29tPiB3cm90ZToKPgo+ID4gVGhpcyBwYXRjaCB3aWxsIHByb3ZpZGUg
YW4gaW5pdGlhbCBwYWNrYWdlCj4gPiBmb3IgYm14NyBwcm9qZWN0Lgo+ID4KPiA+IFNpZ25lZC1v
ZmYtYnk6IEpvc8OpIFBla2thcmluZW4gPGpvc2UucGVra2FyaW5lbkB1bmlraWUuY29tPgo+Cj4g
SSBoYXZlIGFwcGxpZWQgdGhpcyBwYXRjaCwgd2l0aCBhIGZldyBjaGFuZ2VzIChzZWUgYmVsb3cp
LiBCdXQgSSBtdXN0Cj4gc2F5IEkgaGVzaXRhdGVkLiBEbyB5b3UgcmVhbGx5IHVzZSB0aGlzPyBU
aGlzIHByb2plY3QgaGFzIG5vdCBzZWVuIGFueQo+IHVwZGF0ZXMgc2luY2UgSnVseSAyMDE5LCB0
aGVyZSBpcyBhIHNpbXBsZSBwdWxsIHJlcXVlc3QgZml4aW5nIHRoZQo+IFNJT0NHU1RBTVAgaXNz
dWUgdGhhdCBoYXMgbmV2ZXIgYmVlbiBsb29rZWQgYXQsIGFuZCB0aGVyZSBhcmUKPiBhbHRlcm5h
dGl2ZXMgc3VjaCBhcyBvbHNyIGFuZCBiYXRtYW4tYWR2IHdoaWNoIGFyZSBhY3RpdmVseSBtYWlu
dGFpbmVkLgoKICAgIEhpLAoKICAgIFRoYW5rcyEgSSB0b29rIHNvbWUgdGltZSB0byBhc2sgdGhl
IHByb2plY3QgcGFydGljaXBhbnRzCnRvIGNvbmZpcm0gdGhleSB1c2UgdGhlc2UgcGFja2FnZXMg
YmVmb3JlIHN0YXJ0aW5nIHRoZQp1cHN0cmVhbWluZyBwcm9jZXNzLiBBcHBhcmVudGx5IHRoaXMg
bWF5IGJlIG9mIHVzZSBpbgpjb21tdW5pY2F0aW9ucyBvdmVyIHdpZmkgbWVzaCBuZXR3b3Jrcy4K
CiAgICBCZXN0IHJlZ2FyZHMuCgogICAgSm9zw6kuCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1
aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8v
YnVpbGRyb290Cg==
