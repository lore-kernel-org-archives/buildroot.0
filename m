Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AB9CC4321E
	for <buildroot@archiver.kernel.org>; Thu,  1 Dec 2022 21:14:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3625581E02;
	Thu,  1 Dec 2022 21:14:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3625581E02
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ev9iskg868dH; Thu,  1 Dec 2022 21:14:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7FE4D81D34;
	Thu,  1 Dec 2022 21:14:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7FE4D81D34
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A28721BF2C5
 for <buildroot@lists.busybox.net>; Thu,  1 Dec 2022 21:14:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8448941750
 for <buildroot@lists.busybox.net>; Thu,  1 Dec 2022 21:14:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8448941750
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id e1n1NIKagn4m for <buildroot@lists.busybox.net>;
 Thu,  1 Dec 2022 21:14:17 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BD6FF417A1
Received: from forward500j.mail.yandex.net (forward500j.mail.yandex.net
 [IPv6:2a02:6b8:0:801:2::110])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BD6FF417A1
 for <buildroot@buildroot.org>; Thu,  1 Dec 2022 21:14:15 +0000 (UTC)
Received: from sas8-92ddc00f49ef.qloud-c.yandex.net
 (sas8-92ddc00f49ef.qloud-c.yandex.net
 [IPv6:2a02:6b8:c1b:2988:0:640:92dd:c00f])
 by forward500j.mail.yandex.net (Yandex) with ESMTP id 50C7C6CB64AB;
 Fri,  2 Dec 2022 00:08:47 +0300 (MSK)
Received: by sas8-92ddc00f49ef.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA
 id j8ajCXFYliE1-T4NVOji3; Fri, 02 Dec 2022 00:08:46 +0300
X-Yandex-Fwd: 1
Message-ID: <1e6ba066-a525-2f51-053d-025fd824aaf2@yuriev.ru>
Date: Fri, 2 Dec 2022 00:08:45 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Content-Language: en-US, ru-RU
To: Peter Korsgaard <peter@korsgaard.com>,
 Thomas Petazzoni via buildroot <buildroot@buildroot.org>
References: <20221201104313.25K7I8a6@myt5-1a3effcffc39.qloud-c.yandex.net>
 <3b7ef091-b01c-59d3-d31b-8b28e59bf1df@yuriev.ru>
 <20221201165150.4746c32e@windsurf>
 <a89a5a97-317a-b634-65ad-5fa11e526bc0@yuriev.ru>
 <20221201174145.5e70863c@windsurf> <87edtic02y.fsf@dell.be.48ers.dk>
From: Leonid Yuriev <leo@yuriev.ru>
In-Reply-To: <87edtic02y.fsf@dell.be.48ers.dk>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=yuriev.ru; s=mail; t=1669928926; 
 bh=H2u9GAaPUu1+OFhJDw/04IlV6ymBBJWBWMigbVfz9HQ=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=ZDPxZD525qxtCCZWrya9kqWNqz2GvEiBEWbW1qfKyhj0jJw4Dx3VYPQBlhW3gf/zj
 VbF2pQ9i6oG5+HGBJ6knGTDER+jeAOKltQAanc5B7/q1Kuz8LffLZLPyXXHLNssTVn
 NIEckdNYeRxLVzxP03e4k8QZdp3FNCM6DQ/NeNSk=
X-Mailman-Original-Authentication-Results: sas8-92ddc00f49ef.qloud-c.yandex.net; dkim=pass header.i=@yuriev.ru
Subject: Re: [Buildroot] [autobuild.buildroot.net] Your daily results for
 2022-11-30
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CjAxLjEyLjIwMjIgMjM6NTksIFBldGVyIEtvcnNnYWFyZCDQv9C40YjQtdGCOgo+Pj4+Pj4gIlRo
b21hcyIgPT0gVGhvbWFzIFBldGF6em9uaSB2aWEgYnVpbGRyb290IDxidWlsZHJvb3RAYnVpbGRy
b290Lm9yZz4gd3JpdGVzOgo+ICAgPiBPbiBUaHUsIDEgRGVjIDIwMjIgMTk6MDE6NTUgKzAzMDAK
PiAgID4gTGVvbmlkIFl1cmlldiA8bGVvQHl1cmlldi5ydT4gd3JvdGU6Cj4KPiAgID4+IENvbW1p
dCBmNTRiZjNlY2M2MzhiNjIxNjJhNDNmOGMyNzY0MDdhZDFmZmEwZGQ0Cj4KPiAgID4gVGhhbmtz
LCBidXQgcGxlYXNlIGtlZXAgdGhlIEJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QgaW4gQ2Mgd2hlbiBy
ZXBseWluZwo+ICAgPiA6LSkKPgo+IEFyZSB5b3Ugc3VyZSBhYm91dCB0aGF0IGNvbW1pdD8gV2Ug
ZG9uJ3Qgc2VlbSB0byBzdWNoIGEgY29tbWl0IGluCj4gYnVpbGRyb290LCBhbmQgYXMgZmFyIGFz
IEkgY2FuIHNlZSBvbgo+IGh0dHBzOi8vZ2l0ZmxpYy5ydS9wcm9qZWN0L2VydGhpbmsvbGlibWRi
eC9jb21taXQvZjU0YmYzZWNjNjM4YjYyMTYyYTQzZjhjMjc2NDA3YWQxZmZhMGRkNCwKPiBuZWl0
aGVyIGRvZXMgdXBzdHJlYW0gbGlibWRieD8KCk9vcHMsIGl0IG15IG1pc3Rha2UuCmh0dHBzOi8v
Z2l0LmJ1c3lib3gubmV0L2J1aWxkcm9vdC9jb21taXQvP2lkPWNkMjU4MDhkN2QzYjI5MmY2MTA0
M2Q2MTJjMmUzNGFhYjVhNDIyZmQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5v
cmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290
Cg==
