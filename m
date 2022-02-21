Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AAE8C433F5
	for <buildroot@archiver.kernel.org>; Mon, 21 Feb 2022 22:38:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 168F560C29;
	Mon, 21 Feb 2022 22:38:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YfestWq-yodn; Mon, 21 Feb 2022 22:38:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 48CDC60BD3;
	Mon, 21 Feb 2022 22:38:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E77611BF3A7
 for <buildroot@lists.busybox.net>; Mon, 21 Feb 2022 22:38:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CEF71813E5
 for <buildroot@lists.busybox.net>; Mon, 21 Feb 2022 22:38:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ycAloLbOKI51 for <buildroot@lists.busybox.net>;
 Mon, 21 Feb 2022 22:38:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BAED6813DC
 for <buildroot@buildroot.org>; Mon, 21 Feb 2022 22:38:11 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id d28so1684006wra.4
 for <buildroot@buildroot.org>; Mon, 21 Feb 2022 14:38:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=rKWL4p85Br0ZN+p2ihX2d5B7Jumd4+btrIXjhcz16MY=;
 b=Ra19EcC6XYXsa+U4Al/r4ehYt3h4KrEu67r0ZUSR1nP+1Q/Fgm1TvAZK+ZmAxdayQ4
 HSMcNaGJ12se82eO16Lf/lyPpKQ3k/TCPIJlWry+b9cooklVDkdBLjyib2kPp57U3nGy
 eXIivwuUEg5rr+NFzUdPC8Z1UwANWpYtBjStMLQRX25rldDmG/+iOrkJa76qOruiitp+
 S4qa5JJMk4/UAezFuKriK6cqRK05Gbn+xgHIZCHs+drsJvt+m2sC74Mwqqm07SNYUnEn
 taZDoySy0uvRf2j4OSBwRCwZzxLB1spBuuDJf9fckJvrIephI/uF+qwq10CWQymT1mv6
 WP5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=rKWL4p85Br0ZN+p2ihX2d5B7Jumd4+btrIXjhcz16MY=;
 b=VDopnxTPz1gVtL0orWAOFHopwJbHxtYpTozSY2b6c/dVNUBg0x2DxiXdvD9UfUZYqv
 d7WIerlqWvxrJgUWnMUmmmFusjzNywOOtJMUrPDZR/OqmMhFqYBRJKDxezHDmsO+/Rdf
 sGaH2G82WFv4m9CJcr2FWn+7y4eE69MQumZomM3/CCkk6fLxhWj/K0fv2WOtNeADaP5T
 XRs0G08QzgLQVrPJ4W0UyEfp2pNyP6WDScZdWj5xzVIf/QD09oM9+owVKWFCtEtUskCm
 nCQY67rxN2Ui4nWBVqB+v+bEAwKq9UP+A5Q4JHasgIn5PrD/iLoZSHcl1nrH88VgE3T/
 JiQw==
X-Gm-Message-State: AOAM532SYvLx424go0+drO8sDDm5MkL1pLGpr1I+XH4zDMbtmbcJwUzD
 6zkFEey8AXTzat5e30bAFHInv+Jl5Ss=
X-Google-Smtp-Source: ABdhPJwx7VTexEQkA7+u7ZTjSaoDUYfdUQUL7zTsslj/xcrH6GNHO3gyuyJeLaUzv60/2vnK82h8NA==
X-Received: by 2002:a05:6000:178d:b0:1e8:310a:5a51 with SMTP id
 e13-20020a056000178d00b001e8310a5a51mr17211080wrg.642.1645483089977; 
 Mon, 21 Feb 2022 14:38:09 -0800 (PST)
Received: from ?IPV6:2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521?
 (2a01cb058f8a18003dbee9eed79eb521.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521])
 by smtp.gmail.com with ESMTPSA id r14sm26194082wrz.84.2022.02.21.14.38.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Feb 2022 14:38:09 -0800 (PST)
Message-ID: <150ef1b3-4d5e-37b3-881c-9a15e95a456b@gmail.com>
Date: Mon, 21 Feb 2022 23:38:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Peter Korsgaard <peter@korsgaard.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20220218105557.705926-1-fontaine.fabrice@gmail.com>
 <87fsod9szu.fsf@dell.be.48ers.dk>
From: Romain Naour <romain.naour@gmail.com>
In-Reply-To: <87fsod9szu.fsf@dell.be.48ers.dk>
Subject: Re: [Buildroot] [PATCH 1/1] package/python-twisted: security bump
 to version 22.1.0
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
Cc: Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

TGUgMjAvMDIvMjAyMiDDoCAyMTozNSwgUGV0ZXIgS29yc2dhYXJkIGEgw6ljcml0wqA6Cj4+Pj4+
PiAiRmFicmljZSIgPT0gRmFicmljZSBGb250YWluZSA8Zm9udGFpbmUuZmFicmljZUBnbWFpbC5j
b20+IHdyaXRlczoKPiAKPiAgPiBGaXggQ1ZFLTIwMjItMjE3MTI6IHR3aXN0ZWQgaXMgYW4gZXZl
bnQtZHJpdmVuIG5ldHdvcmtpbmcgZW5naW5lIHdyaXR0ZW4KPiAgPiBpbiBQeXRob24uIEluIGFm
ZmVjdGVkIHZlcnNpb25zIHR3aXN0ZWQgZXhwb3NlcyBjb29raWVzIGFuZAo+ICA+IGF1dGhvcml6
YXRpb24gaGVhZGVycyB3aGVuIGZvbGxvd2luZyBjcm9zcy1vcmlnaW4gcmVkaXJlY3RzLiBUaGlz
IGlzc3VlCj4gID4gaXMgcHJlc2VudCBpbiB0aGUgYHR3aXRlZC53ZWIuUmVkaXJlY3RBZ2VudGAg
YW5kIGB0d2lzdGVkLndlYi4KPiAgPiBCcm93c2VyTGlrZVJlZGlyZWN0QWdlbnRgIGZ1bmN0aW9u
cy4gVXNlcnMgYXJlIGFkdmlzZWQgdG8gdXBncmFkZS4gVGhlcmUKPiAgPiBhcmUgbm8ga25vd24g
d29ya2Fyb3VuZHMuCj4gCj4gID4gVXBkYXRlIGhhc2ggb2YgbGljZW5zZSBmaWxlIChhdXRob3Ig
YWRkZWQgYW5kIHVwZGF0ZSBpbiB5ZWFyOgo+ICA+IGh0dHBzOi8vZ2l0aHViLmNvbS90d2lzdGVk
L3R3aXN0ZWQvY29tbWl0LzEzYWE1OTc0NmE3Mzc2OWIwNWE1MWMyMTk4YjI4ZjU2MDJkZDM4MmYK
PiAgPiBodHRwczovL2dpdGh1Yi5jb20vdHdpc3RlZC90d2lzdGVkL2NvbW1pdC9hZGZkZjIzNDc3
YWJmY2QwOWE4NjczNDc5OTNmYzFkMjA3Y2ZiNGRkCj4gID4gaHR0cHM6Ly9naXRodWIuY29tL3R3
aXN0ZWQvdHdpc3RlZC9jb21taXQvN2U2NWZiZWVkM2Q3NGE0ZWIxYzQwZDdhNmRmNTY1MTc4MmJl
Y2JjOCkKPiAKPiAgPiBodHRwczovL2dpdGh1Yi5jb20vdHdpc3RlZC90d2lzdGVkL3NlY3VyaXR5
L2Fkdmlzb3JpZXMvR0hTQS05MngyLWp3N3cteHZ2eAo+ICA+IGh0dHBzOi8vZ2l0aHViLmNvbS90
d2lzdGVkL3R3aXN0ZWQvcmVsZWFzZXMvdGFnL3R3aXN0ZWQtMjIuMS4wCj4gCj4gID4gU2lnbmVk
LW9mZi1ieTogRmFicmljZSBGb250YWluZSA8Zm9udGFpbmUuZmFicmljZUBnbWFpbC5jb20+Cj4g
Cj4gQ29tbWl0dGVkLCB0aGFua3MuCj4gCgpJJ20gbm90IGZhbWlsaWFyIHdpdGggcHl0aG9uLXR3
aXN0ZWQgYnV0IGl0IHNlZW1zIHRoYXQgcHl0aG9uLXR3aXN0ZWQgYW5kCnB5dGhvbi10cmVxIG11
c3QgdXNlIHRoZSBzYW1lIHZlcnNpb24gYmVjYXVzZSBpdHMgdGhlIHNhbWUgcHJvamVjdDoKCmh0
dHBzOi8vZ2l0aHViLmNvbS90d2lzdGVkL3R3aXN0ZWQKaHR0cHM6Ly9naXRodWIuY29tL3R3aXN0
ZWQvdHJlcQoKV2UgaGF2ZSB0byB1cGRhdGUgcHl0aG9uLXRyZXEgdG8gdmVyc2lvbiAyMi4yLjAg
WzFdIG90aGVyd2lzZSB3ZSBoYXZlIGEgcnVudGltZQppc3N1ZToKCiMgcHl0aG9uIHNhbXBsZV9w
eXRob25fdHJlcS5weQpUcmFjZWJhY2sgKG1vc3QgcmVjZW50IGNhbGwgbGFzdCk6CiAgRmlsZSAi
L3Jvb3Qvc2FtcGxlX3B5dGhvbl90cmVxLnB5IiwgbGluZSAyLCBpbiA8bW9kdWxlPgogICAgaW1w
b3J0IHRyZXEKICBGaWxlICIvdXNyL2xpYi9weXRob24zLjEwL3NpdGUtcGFja2FnZXMvdHJlcS9f
X2luaXRfXy5weSIsIGxpbmUgNSwgaW4gPG1vZHVsZT4KICBGaWxlICIvdXNyL2xpYi9weXRob24z
LjEwL3NpdGUtcGFja2FnZXMvdHJlcS9hcGkucHkiLCBsaW5lIDUsIGluIDxtb2R1bGU+CiAgRmls
ZSAiL3Vzci9saWIvcHl0aG9uMy4xMC9zaXRlLXBhY2thZ2VzL3RyZXEvY2xpZW50LnB5IiwgbGlu
ZSAxMSwgaW4gPG1vZHVsZT4KSW1wb3J0RXJyb3I6IGNhbm5vdCBpbXBvcnQgbmFtZSAnX1BZMycg
ZnJvbSAndHdpc3RlZC5weXRob24uY29tcGF0JyAodW5rbm93bgpsb2NhdGlvbikKCmh0dHBzOi8v
Z2l0aHViLmNvbS90d2lzdGVkL3RyZXEvcmVsZWFzZXMvdGFnL3JlbGVhc2UtMjIuMi4wCgpCZXN0
IHJlZ2FyZHMsClJvbWFpbgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0
dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
