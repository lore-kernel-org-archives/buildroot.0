Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B00CFC433EF
	for <buildroot@archiver.kernel.org>; Mon, 31 Jan 2022 11:37:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 467B7410B5;
	Mon, 31 Jan 2022 11:37:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DVaI84jEYuZ6; Mon, 31 Jan 2022 11:37:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 524264049C;
	Mon, 31 Jan 2022 11:37:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9B9D61BF322
 for <buildroot@lists.busybox.net>; Mon, 31 Jan 2022 11:37:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8899C4049C
 for <buildroot@lists.busybox.net>; Mon, 31 Jan 2022 11:37:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xTfvCG7P1Sh0 for <buildroot@lists.busybox.net>;
 Mon, 31 Jan 2022 11:36:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 39286403C7
 for <buildroot@buildroot.org>; Mon, 31 Jan 2022 11:36:58 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id v13so24748578wrv.10
 for <buildroot@buildroot.org>; Mon, 31 Jan 2022 03:36:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=FF2NhiZ/o5Mgsw4jxEP6hpdH87CuKh7kHziFSB3x5XY=;
 b=0sMefb91DW19zFDmeUuV4KCmp8iXLNuvcztEyEZ/3/xnk3aKYVJH9ay1KL2w1+xbnD
 ALhPIwfr8pLHPj2nKYXWpyhbEzeZ9qUKC7mxV8JJYc/V6lDrLSNf55UwuKFDdrTYEYWV
 X/fmA5LwabAhognGXNWcTIC/GsrpsVtkbYvnjzAa8voQFEwtnFpqURuqdsXNWrPk5nht
 EcRqYwgrjlZt/kzYSRUJHxyhSyfZHyxXklML0mLoZRi3wM0qiha5o55ugWBGg2ShuFK0
 5ANNOkh8JlZYny2YmOhh6pOFV3WPFgUwT6UTcq6XcqafNofJmJQ1zKZIu1c7h0Q/XuAF
 jsXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=FF2NhiZ/o5Mgsw4jxEP6hpdH87CuKh7kHziFSB3x5XY=;
 b=fnsIPxKRE0cQShp704YskCgKE1SGs78Ciglu/Cytgn+WF4MKIuTgwHY1f4N6Z9t4cZ
 RHiLKv8Me+jqiaaN7cmGoAysExyG6qRHfXiBqyqRazRMLDGUZmUdVNboGzz6ZRacIcOM
 nZwaikUAeRbF/ADMZBOtfWIAWyvW+IK0eGlrcJAlX/L58+EMzMkmf5bG+DBCi97+TPz/
 7HI4VXfsdJPlV5PVdOtMygqJHW9C1qWch8gvDABDgI092BN7o7ec6s//hYFpI42281oy
 BbXZU9D5wL2ZA5NhZLhT7XxCuoWcFtQz02ZqH2yHc6ThLIdKtUdoNQ0ywZJkBznqc9nj
 vIKA==
X-Gm-Message-State: AOAM5315KcCr+1ULYIpAF+jwtGHg/fB/dmSiA6TxuFQEu70Tdk8mqR/8
 aEIxb7BGe10ti2zBpzCzUWpC8g==
X-Google-Smtp-Source: ABdhPJxM4phiZ5piHut85GA947+HBcbsN0ho3sB70o98h5hToC1Bgx8kdMWph4lKYx54pTfpwJBI/w==
X-Received: by 2002:a05:6000:1b81:: with SMTP id
 r1mr16867733wru.609.1643629017326; 
 Mon, 31 Jan 2022 03:36:57 -0800 (PST)
Received: from ?IPV6:2a01:cb05:8f8a:1800:1c97:b8d1:b477:d53f?
 (2a01cb058f8a18001c97b8d1b477d53f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:1c97:b8d1:b477:d53f])
 by smtp.gmail.com with ESMTPSA id k20sm5471815wmi.36.2022.01.31.03.36.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Jan 2022 03:36:56 -0800 (PST)
Message-ID: <731c2ec5-e693-f2d4-5f48-0eaf376c57d1@smile.fr>
Date: Mon, 31 Jan 2022 12:36:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 James Hilliard <james.hilliard1@gmail.com>
References: <20220131015937.4113728-1-james.hilliard1@gmail.com>
 <20220131104553.715b97ce@windsurf>
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <20220131104553.715b97ce@windsurf>
Subject: Re: [Buildroot] [PATCH 1/1] package:{clang, lld,
 llvm}: bump to version 11.1.0
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 Romain Naour <romain.naour@gmail.com>, buildroot@buildroot.org,
 Matthew Weber <matthew.weber@collins.com>,
 Valentin Korenblit <valentinkorenblit@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gSmFtZXMsIFRob21hcywgQWxsLAoKTGUgMzEvMDEvMjAyMiDDoCAxMDo0NSwgVGhvbWFz
IFBldGF6em9uaSB2aWEgYnVpbGRyb290IGEgw6ljcml0wqA6Cj4gT24gU3VuLCAzMCBKYW4gMjAy
MiAxODo1OTozNyAtMDcwMAo+IEphbWVzIEhpbGxpYXJkIDxqYW1lcy5oaWxsaWFyZDFAZ21haWwu
Y29tPiB3cm90ZToKPiAKPj4gVGhpcyBhcHBlYXJzIHRvIGJlIHRoZSBsYXRlc3QgdmVyc2lvbiB0
aGF0IGhhcyBhIHdvcmtpbmcgbGxkIGJ1aWxkLgo+Pgo+PiBWZXJzaW9uIDEyLjAuMCBhbmQgbmV3
ZXIgaGF2ZSBicm9rZW4gbGxkIHN0YW5kLWFsb25lIGJ1aWxkczoKPj4gaHR0cHM6Ly9idWdzLmxs
dm0ub3JnL3Nob3dfYnVnLmNnaT9pZD00OTIyOAo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBKYW1lcyBI
aWxsaWFyZCA8amFtZXMuaGlsbGlhcmQxQGdtYWlsLmNvbT4KPiAKPiBJcyB0aGlzIHJlYWxseSBl
bm91Z2g/IEkgcmVtZW1iZXIgc2VlaW5nIHBhdGNoZXMgYSBsb25nIHRpbWUgYWdvIGRvaW5nCj4g
YnVtcHMgb24gTExWTS9DbGFuZyBhbmQgdGhhdCB3YXMgbXVjaCBtb3JlIGludm9sdmVkLCB3aGlj
aCBJIHRoaW5rCj4gZXhwbGFpbnMgd2h5IHdlJ3JlIHN0aWxsIGF0IHZlcnNpb24gOS54Lgo+IAo+
IFJvbWFpbiwgYW55IGNvbW1lbnRzIG9uIHRoaXM/CgpBZGRpbmcgTWF0dCBpbiBDYzoKCklJUkMs
IHRoZXJlIGlzIGFuIGlzc3VlIHdpdGggbGliY2xjIHBhY2thZ2Ugd2hpY2ggaXMgcGFydCBvZiB0
aGUgbGx2bSBwcm9qZWN0LgoKRHVlIHRvIHRoZSBnYXAgYmV0d2VlbiB0aGUgdHdvIHZlcnNpb24s
IGFsbCBDTWFrZSBvcHRpb25zIG11c3QgYmUgcmV2aWV3ZWQgKGxvbmcKYW5kIGJvcmluZyB0YXNr
IEkgYWdyZWUpLgoKQmVzdCByZWdhcmRzLApSb21haW4KCj4gCj4gVGhvbWFzCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBs
aXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
