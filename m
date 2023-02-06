Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C049C05027
	for <buildroot@archiver.kernel.org>; Mon,  6 Feb 2023 20:25:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DE99E60BF1;
	Mon,  6 Feb 2023 20:25:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DE99E60BF1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TqrwMy79hxlV; Mon,  6 Feb 2023 20:25:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1A8A160D56;
	Mon,  6 Feb 2023 20:25:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1A8A160D56
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4E99E1BF8A8
 for <buildroot@lists.busybox.net>; Mon,  6 Feb 2023 20:25:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 26C0F41743
 for <buildroot@lists.busybox.net>; Mon,  6 Feb 2023 20:25:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 26C0F41743
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SbsGqqj6gEZq for <buildroot@lists.busybox.net>;
 Mon,  6 Feb 2023 20:25:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 201704092F
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 201704092F
 for <buildroot@buildroot.org>; Mon,  6 Feb 2023 20:25:06 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 c4-20020a1c3504000000b003d9e2f72093so11736450wma.1
 for <buildroot@buildroot.org>; Mon, 06 Feb 2023 12:25:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2gkqeRPzgWORIPkCSuMQUe/CbxOlVUW7xEjA4hQ+Wgg=;
 b=XWL5pPpxabIaCgH1QwUzkhFM37dKaJ//pkIExG7/5d38v9Lsqnp1lXJVXDUbtWf3E7
 gLc5qST/wu4gt6wZcPWriY88Ir0Lel29fZjQqPnL3TineiEB0AbjdUKFyAzYSRFI90mA
 4L4rjt/EJE85L7xY+7etWaeeufFIvtusnmzFVsfusIR8dsn8J3S/qAgIs7g6bHGAIG2m
 /jd8cRfh09+bf5d8R1c+1J95ZDfLNSHroTG3B9IMuuESx1iWtflYH3tPF7BhAstdmrvr
 4gVJVulyuLHofKC2LGjTMXn9tW5CLHNBcm6UY4njyNyOdCe+8q35NrbqSoj+WzzwsqWF
 ZJtA==
X-Gm-Message-State: AO0yUKXSz72eIjqJVpj/BMpj1IEAi/Vg1Em0+Oe3Vsn8XKp2Mf7oOC+G
 BOkD6+V7z1UtkaC6bg0FtI50zg==
X-Google-Smtp-Source: AK7set8BusZU5oMYucFDfjCzokvS4/AWtp8PYqCfmbSsy+O+BZ5F/mxzHq8fo6hCF29gKyf9W+R9vQ==
X-Received: by 2002:a05:600c:35c6:b0:3df:9858:c034 with SMTP id
 r6-20020a05600c35c600b003df9858c034mr12390587wmq.9.1675715105147; 
 Mon, 06 Feb 2023 12:25:05 -0800 (PST)
Received: from ?IPV6:2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31?
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 l5-20020adfe585000000b002c3e3ee7d1asm4916081wrm.79.2023.02.06.12.25.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Feb 2023 12:25:04 -0800 (PST)
Message-ID: <5d683c3c-1229-70e6-1736-ca01dd1a7159@smile.fr>
Date: Mon, 6 Feb 2023 21:25:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: fr
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Robert Hancock <robert.hancock@calian.com>
References: <20221012215008.2918444-1-thomas.petazzoni@bootlin.com>
 <5eebf7dee2a585f50a4e986c214677a157bfd22c.camel@calian.com>
 <20221013163910.3c6d9c8f@windsurf>
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <20221013163910.3c6d9c8f@windsurf>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=2gkqeRPzgWORIPkCSuMQUe/CbxOlVUW7xEjA4hQ+Wgg=;
 b=nhPdsuGwoQStH/Pwroy/hf64XkDhoPcX/yk1SekwrM9TevSo95SdtSjG1uHlZVwb7O
 g/HtOH1lseGpmh15lhVgmrILtu8UoSmQNRNEBXH0EybgNHMvWZRjU9EWJzAKJisb8d7Q
 KCgwkxODBanVzdnzg7PtsweJafkQvyP+sN2VIAtAvHZVBTPzT3iOrs79wFk24BSiXSMQ
 tVVVAS6BeQtxXN/dR+cR2iFrWuZUhxWfyiMDcA4dHQnAUZ+4iqNrVJkD+Kb2YZF5Mxg6
 NRciqud7eHc/RdoztE6i2KaMvmYL7Z+W5sDzYhEl4BBA0RrT+ze3CW0Ht8OI37Q2qIvq
 4Axw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20210112.gappssmtp.com
 header.i=@smile-fr.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=nhPdsuGw
Subject: Re: [Buildroot] [PATCH] Config.in: introduce BR2_TIME_BITS_64
 option for Y2038 compatibility
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
Cc: "yann.morin.1998@free.fr" <yann.morin.1998@free.fr>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gVGhvbWFzLAoKTGUgMTMvMTAvMjAyMiDDoCAxNjozOSwgVGhvbWFzIFBldGF6em9uaSB2
aWEgYnVpbGRyb290IGEgw6ljcml0wqA6Cj4gT24gV2VkLCAxMiBPY3QgMjAyMiAyMzo0OTozNyAr
MDAwMAo+IFJvYmVydCBIYW5jb2NrIDxyb2JlcnQuaGFuY29ja0BjYWxpYW4uY29tPiB3cm90ZToK
PiAKPj4gVGhlcmUncyBzb21lIGNoYW5jZSBvZiBzb2Z0d2FyZSBiZWluZyBicm9rZW4gYnkgZW5h
YmxpbmcgdGhpcywgd2l0aAo+PiBlaXRoZXIgYSBjb21waWxlIG9yIHJ1bnRpbWUgZmFpbHVyZS4g
Rm9yIGV4YW1wbGUsIGFwcGxpY2F0aW9ucyB0aGF0Cj4+IGFzc3VtZSBzaXplb2YodGltZV90KSA9
PSBzaXplb2YobG9uZykgd291bGQgd29yayBvbiAzMi1iaXQgcGxhdGZvcm1zCj4+IHdpdGggYSAz
Mi1iaXQgdGltZSBhbmQgNjQtYml0IHBsYXRmb3JtcyB3aXRoIGEgNjQtYml0IHRpbWUsIGJ1dCBm
YWlsCj4+IHdpdGggYSA2NC1iaXQgdGltZSBvbiAzMi1iaXQuIEkgYmVsaWV2ZSBJJ3ZlIHNlZW4g
dGhpcyB3aGVuIHRyeWluZyB0bwo+PiBidWlsZCBzb2Z0d2FyZSB3aXRoIHRoYXQgb3B0aW9uLCBz
byB0dXJuaW5nIHRoaXMgb24gdW5jb25kaXRpb25hbGx5Cj4+IG1pZ2h0IGJlIHVud2lzZSwgdW5s
ZXNzICBzb21lIGJ1aWxkIHRlc3RzIG9mIHRoZSBzdXBwb3J0ZWQgcGFja2FnZXMKPj4gaGF2ZSBi
ZWVuIGRvbmUuLgo+IAo+IFRoZXJlIHdpbGwgZGVmaW5pdGVseSBiZSBidWlsZCB0ZXN0aW5nOiBv
dXIgYXV0b2J1aWxkZXJzIGFyZSB0ZXN0aW5nCj4gMjQvNyByYW5kb20gY29uZmlndXJhdGlvbnMg
b2YgQnVpbGRyb290LiBTbyBhcyBzb29uIGFzIHdlIGludHJvZHVjZQo+IHRoaXMgb3B0aW9uLCB0
aGVyZSB3b3VsZCBiZSBidWlsZHMgd2l0aCBCUjJfVElNRV9CSVRTXzY0PXkgZW5hYmxlZCwKPiB3
aGljaCB3b3VsZCByYWlzZSBidWlsZCBpc3N1ZXMgaWYgdGhlcmUncyBhbnkuCj4gCj4gT2YgY291
cnNlLCB0aGUgbW9yZSB0cmlja3kgcGFydCBhcmUgcnVudGltZSBpc3N1ZXMsIHdoaWNoIGFyZQo+
IGVzc2VudGlhbGx5IGltcG9zc2libGUgdG8gZGV0ZWN0IHVudGlsIHNvbWVvbmUgcnVucyBpbnRv
IHRoZSBwcm9ibGVtLgoKV2UgYWxyZWFkeSB0cmllZCB0byBlbmFibGUgQlIyX1RJTUVfQklUU182
NCBiYWNrIGluIE1hcmNoIDIwMjIgYnV0IHdlIGhhZCB0bwpyZXZlcnQgaXQgZHVlIHRvIGJ1aWxk
IGlzc3VlcyB3aXRoIHBhY2thZ2VzIGxpa2UgZ2xpYmM6CgpTZWU6Cmh0dHA6Ly9saXN0cy5idXN5
Ym94Lm5ldC9waXBlcm1haWwvYnVpbGRyb290LzIwMjItTWFyY2gvNjM4MTA1Lmh0bWwKCmh0dHBz
Oi8vZ2l0LmJ1aWxkcm9vdC5uZXQvYnVpbGRyb290L2NvbW1pdC8/aWQ9ZGQxNzBmMGNiYWQ3Mjlk
YmE0MTkzYjJiMjBlM2RlMGE3MDEwZDQ4NQoKSSdsbCB0cnkgdG8gbG9vayBhZ2Fpbi4KCkJlc3Qg
cmVnYXJkcywKUm9tYWluCgoKPiAKPiBCZXN0IHJlZ2FyZHMsCj4gCj4gVGhvbWFzCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGlu
ZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
