Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1486C77B73
	for <buildroot@archiver.kernel.org>; Wed, 31 May 2023 14:19:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5E31881F54;
	Wed, 31 May 2023 14:19:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5E31881F54
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id H3l47LEjRkls; Wed, 31 May 2023 14:19:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 898A181F4B;
	Wed, 31 May 2023 14:19:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 898A181F4B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9168B1BF5A6
 for <buildroot@lists.busybox.net>; Wed, 31 May 2023 14:19:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6AF2E81F45
 for <buildroot@lists.busybox.net>; Wed, 31 May 2023 14:19:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6AF2E81F45
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PN4e59MVQ1hg for <buildroot@lists.busybox.net>;
 Wed, 31 May 2023 14:19:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EE8F981F30
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EE8F981F30
 for <buildroot@buildroot.org>; Wed, 31 May 2023 14:19:05 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-3f6d38a140bso8636575e9.1
 for <buildroot@buildroot.org>; Wed, 31 May 2023 07:19:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685542744; x=1688134744;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pNT/G2J6E3qOsMcFvJv3fRUqJEuDyU8w8jR9Gg9DILc=;
 b=lBYSaNiZPQMx7OBDpsalDUfqbXCQHq8giyJ5rHpX+qZz/Sj3iKZuQcPTlw64LnaFfu
 V2GXIlScyOsRqqyZElmj1ALDECpozZkfFTB1hO0Hkgw5OB1L4sO/FMYFy3QADmxIGSkT
 mBY/uEspnrHpTlGBLf15iT6gU0rb8jNQHduM0uVOy1NbcWKEBMuU/F2BLYy90pi7ClxF
 7vQoWkDzjmchVwsz7m3Qcu2ddx9o4Bnq5IqOW7lsXRbmuaGJusGmLmGjvIKiCaAQWU6M
 72wxDQPKW3sD8SGo7hYjvnEGNd9RzFWfcHUaWMiFRAXv6UGNIWv5+chh7vrQ6S9HyZFR
 zFaQ==
X-Gm-Message-State: AC+VfDwUKDeI7PnMS6gA6j6KAaf5ADWvjtymn+FW0AqYkzqqWxlFWgIp
 xTsxdt6W+OXcQN5FA5sHoWeM7w==
X-Google-Smtp-Source: ACHHUZ6hqx+OO/LCstH0LO/dz/ZXMg4y4d5N1XoKbWK2NvSeT0qajuygyjsff95Aw3yHVlTQE6I8Tw==
X-Received: by 2002:a7b:c448:0:b0:3f4:27ff:7d4e with SMTP id
 l8-20020a7bc448000000b003f427ff7d4emr4558987wmi.9.1685542744151; 
 Wed, 31 May 2023 07:19:04 -0700 (PDT)
Received: from [10.5.3.217]
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 bg22-20020a05600c3c9600b003f4283f5c1bsm4254134wmb.2.2023.05.31.07.19.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 31 May 2023 07:19:03 -0700 (PDT)
Message-ID: <468bf7d8-5ea2-d367-b6dc-65d01beb775c@smile.fr>
Date: Wed, 31 May 2023 16:19:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-US
To: James Hilliard <james.hilliard1@gmail.com>
References: <20230109042648.2342444-1-james.hilliard1@gmail.com>
 <e7edff90-429c-06fb-8127-263f62e53ede@smile.fr>
 <CADvTj4o-0p0GLyp_LK_zciQACB9L5ZuTZyQU4My0ZcgwR0ym6w@mail.gmail.com>
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <CADvTj4o-0p0GLyp_LK_zciQACB9L5ZuTZyQU4My0ZcgwR0ym6w@mail.gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20221208.gappssmtp.com; s=20221208; t=1685542744; x=1688134744;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=pNT/G2J6E3qOsMcFvJv3fRUqJEuDyU8w8jR9Gg9DILc=;
 b=fiZKWnRmWunHGfEumx16CwWNpWtukfk8k7pmOVrljZ9Ok2/PPto7mBdGdloFZ7ttNc
 73sOmUASyFuSiPhhKhTtNUgfUinj6CjeO2XKMR7GUJIGVFGXI6yoq2SKAObcIJXkxKpW
 6pVry/Rpzkql6okvLTrw0nUs374bfhpVOaoUzSPgJf7+VJ6ibCO0ZL+LN9qNUh8FJrcS
 sb0CFiJ45uNJKM2McKFsHehI8uJwUvvpR79vji57tPjYyGcRl/P0JXM91g5qmOQbtcS3
 xGAvUa5OPWosG59cXd4FWihtA2UerWwwIZ0RBJi0IX04FEKX6rIhUOkxktUoAT13uQx3
 T52Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20221208.gappssmtp.com
 header.i=@smile-fr.20221208.gappssmtp.com header.a=rsa-sha256
 header.s=20221208 header.b=fiZKWnRm
Subject: Re: [Buildroot] [PATCH 1/1] package/python-ipython: bump to version
 8.8.0
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
Cc: Philippe Proulx <eeppeliteloop@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gSmFtZXMsCgpMZSAyOS8wNS8yMDIzIMOgIDIyOjM5LCBKYW1lcyBIaWxsaWFyZCBhIMOp
Y3JpdMKgOgo+IAo+IAo+IE9uIFRodSwgTWF5IDI1LCAyMDIzIGF0IDM6NDTigK9QTSBSb21haW4g
TmFvdXIgPHJvbWFpbi5uYW91ckBzbWlsZS5mcgo+IDxtYWlsdG86cm9tYWluLm5hb3VyQHNtaWxl
LmZyPj4gd3JvdGU6Cj4gCj4gICAgIEhlbGxvIEphbWVzLAo+IAoKWy4uLl0KCj4gICAgID4gLVBZ
VEhPTl9JUFlUSE9OX1ZFUlNJT04gPSA4LjcuMAo+ICAgICA+ICtQWVRIT05fSVBZVEhPTl9WRVJT
SU9OID0gOC44LjAKPiAKPiAgICAgVGhlIHRlc3QgVGVzdElQeXRob25QeTMgZmFpbCBbMV0gc2lu
Y2UgaXQgd2FzIHVwZGF0ZWQgdG8gOC42LjAgcmVsZWFzZSBqdXN0Cj4gICAgIGFmdGVyIDIwMjIu
MTEuCj4gCj4gICAgIMKgIE1vZHVsZU5vdEZvdW5kRXJyb3I6IE5vIG1vZHVsZSBuYW1lZCAnc3Rh
Y2tfZGF0YScKPiAKPiAgICAgSW5kZWVkIHRoZXJlIGlzIG5vIHN1Y2ggcHl0aG9uMy1zdGFjay1k
YXRhIGluIEJ1aWxkcm9vdC4KPiAgICAgRm9yIGV4YW1wbGUsIEZlZG9yYSBwYWNrYWdpbmcgYWRk
ZWQgcHl0aG9uMy1zdGFjay1kYXRhIHdoaWxlIHVwZGF0aW5nIHRvIGlweXRob24KPiAgICAgOC4w
LjEuCj4gCj4gICAgIENhbiB5b3UgaGF2ZSBhIGxvb2sgcGxlYXNlPwo+IAo+IAo+IE9oLCBtdXN0
IGhhdmUgbWlzc2VkIHRoYXQgd2hlbiB1cGRhdGluZyBpcHl0aG9uIEkgc2VlIHlvdSBhbHJlYWR5
IHNlbnQgYSBzZXJpZXMKPiBmaXhpbmcgdGhpczoKPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9i
dWlsZHJvb3QvMjAyMzA1MjgxOTAxMTEuMjQzMDU4MC01LXJvbWFpbi5uYW91ckBnbWFpbC5jb20v
Cj4gPGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2J1aWxkcm9vdC8yMDIzMDUyODE5MDExMS4yNDMw
NTgwLTUtcm9tYWluLm5hb3VyQGdtYWlsLmNvbS8+Cj4gwqAKCkRvIHlvdSB0aGluayB3ZSBzaG91
bGQgcmV2ZXJ0IHRvIGlweXRob24gNy54IGZvciAyMDIzLjAyIGFuZCAyMDIzLjA1PyBJdCBpcyBz
YWZlCnRvIGRvIHNvPwppcHl0aG9uIDgueCByZXF1aXJlcyA0IG5ldyBwYWNrYWdlcywgSSdtIG5v
dCBzdXJlIGl0J3Mgc2FmZSB0byBhZGQgdGhlbSBmb3IKMjAyMy4wMiBhbmQgMjAyMy4wNS4KCkJl
c3QgcmVnYXJkcywKUm9tYWluCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcK
aHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
