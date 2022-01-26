Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2496EC433EF
	for <buildroot@archiver.kernel.org>; Wed, 26 Jan 2022 22:49:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ADBD24182B;
	Wed, 26 Jan 2022 22:49:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dFdbopU-5bHe; Wed, 26 Jan 2022 22:49:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0491F41828;
	Wed, 26 Jan 2022 22:49:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A08221BF48B
 for <buildroot@lists.busybox.net>; Wed, 26 Jan 2022 22:49:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8871A40AD7
 for <buildroot@lists.busybox.net>; Wed, 26 Jan 2022 22:49:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=smile-fr.20210112.gappssmtp.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AGGr8eM6wr-f for <buildroot@lists.busybox.net>;
 Wed, 26 Jan 2022 22:49:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 39D4340AC6
 for <buildroot@buildroot.org>; Wed, 26 Jan 2022 22:49:33 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id l25so1425047wrb.13
 for <buildroot@buildroot.org>; Wed, 26 Jan 2022 14:49:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=DB9MMHFg4EPI51J7Sj4VYx43/aD/uMwOnmcyIsKfoeM=;
 b=F5F+Q1UlyClqL9KkCMOzhcqX35fJAoJguPypbhjUqWyZOf9MMUZpjIUApdqxVFQYUI
 dMT1UM4dE4Md48SqYnj0q/JmekTbjaONlMmWpnrn65hPifnyW0yzkX9O2OCDWmXr9PwK
 CjWloH6jlcp7Z6ZpJRzw32qxY6iA2hxyoyuy0EfMjzKnG8untv8DYtC5pEAUiNobBEC1
 zPw807R46pD0MWcXzYZ/wZPYNdSRWmpx7/4IQK1ENOp7GiNrJ6dfyD46o/3zmqPeDt7R
 Y/Btp2Bh0TZn6mRL/W3fBEvibTeMQhZUQ0WZatal0EaB6lZI7SPGw8Yr7ByAMyYXC2eH
 pQQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=DB9MMHFg4EPI51J7Sj4VYx43/aD/uMwOnmcyIsKfoeM=;
 b=rYHV/OQCEl/2ZrNBupZ5c0NyYy8T36HIyPrrd3R2hba5fRFyq4pFjTCxOkKbcBPk+Y
 Qd6qCv0gqemfnXr47ZH4xaS2xF9UiHmh1pM5dXjRSwwmQCUTCjs/1eCkjh5zHyGBvbaY
 LXZLR1EN+jkFwKVHQBuwoWfnIMZF6r8xRaMhM+PS787GLs4dgbMMdp3ww0GTwyjJCeUg
 /OEk+iMfcBqXrzygbql+F45j1NA4EiyQpHxSECWkRMmXAyo/HFvhr4Mf1J2n0i7X4yJa
 fcZKvjIIZO5MqoobKQNDtKN2l99IUOa3ZpoWwx2GR1B0f1Ubm035PZ3zPQav8qzswpOU
 dYSA==
X-Gm-Message-State: AOAM533tkSZLe7vaT7Z5FRfOiQDtentFwKaAisMosrrNwHXyAAkUj6rP
 KMUmufZP4nMdwR+gLqJpM/Qjlw==
X-Google-Smtp-Source: ABdhPJzHfew+I9xPXaUseT/SuCic/YF0KWKgUQgOswL/YYW2BHwjkKOy55Dicv3qrRzDSqD7PLVqyA==
X-Received: by 2002:a05:6000:108d:: with SMTP id
 y13mr549616wrw.525.1643237371270; 
 Wed, 26 Jan 2022 14:49:31 -0800 (PST)
Received: from ?IPV6:2a01:cb05:8f8a:1800:1c97:b8d1:b477:d53f?
 (2a01cb058f8a18001c97b8d1b477d53f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:1c97:b8d1:b477:d53f])
 by smtp.gmail.com with ESMTPSA id x4sm537596wrp.13.2022.01.26.14.49.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Jan 2022 14:49:30 -0800 (PST)
Message-ID: <fbd161c8-919a-eb08-d24b-2909029ee984@smile.fr>
Date: Wed, 26 Jan 2022 23:49:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-US
To: Peter Korsgaard <peter@korsgaard.com>,
 Romain Naour <romain.naour@gmail.com>
References: <20211230135621.2255847-1-romain.naour@gmail.com>
 <20211230135621.2255847-7-romain.naour@gmail.com>
 <87lez2it1f.fsf@dell.be.48ers.dk>
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <87lez2it1f.fsf@dell.be.48ers.dk>
Subject: Re: [Buildroot] [PATCH 7/7] package/x11r7/xdriver_xf86-video-ati:
 Guard local variable priv only used with glamor
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

UGV0ZXIsCgpMZSAyNi8wMS8yMDIyIMOgIDEzOjI0LCBQZXRlciBLb3JzZ2FhcmQgYSDDqWNyaXTC
oDoKPj4+Pj4+ICJSb21haW4iID09IFJvbWFpbiBOYW91ciA8cm9tYWluLm5hb3VyQGdtYWlsLmNv
bT4gd3JpdGVzOgo+IAo+ICA+IEZpeGVzOgo+ICA+IHJhZGVvbl9wcmVzZW50LmM6IEluIGZ1bmN0
aW9uIOKAmHJhZGVvbl9wcmVzZW50X2NoZWNrX2ZsaXDigJk6Cj4gID4gcmFkZW9uX3ByZXNlbnQu
YzoyODE6MjE6IGVycm9yOiBpbnZhbGlkIHVzZSBvZiB1bmRlZmluZWQgdHlwZSDigJhzdHJ1Y3Qg
cmFkZW9uX3BpeG1hcOKAmQo+ICA+ICAgMjgxIHwgICAgIGlmIChwcml2ICYmIHByaXYtPmZiX2Zh
aWxlZCkKPiAgPiAgICAgICB8ICAgICAgICAgICAgICAgICAgICAgXn4KPiAKPiAgPiBTaWduZWQt
b2ZmLWJ5OiBSb21haW4gTmFvdXIgPHJvbWFpbi5uYW91ckBnbWFpbC5jb20+Cj4gID4gQ2M6IEJl
cm5kIEt1aGxzIDxiZXJuZC5rdWhsc0B0LW9ubGluZS5kZT4KPiAKPiBJcyB0aGlzIG9ubHkgbmVl
ZGVkIGZvciB4c2VydmVyIDIxLnggb3IgZG9lcyBpdCBhbHNvIG5lZWQgdG8gYmUKPiBiYWNrcG9y
dGVkIHRvIDIwMjEuMDIueCAvIDIwMjEuMTEueD8KPiAKCkkgaGF2ZW4ndCB0cmllZCB3aXRoIHBy
ZXZpb3VzIHhzZXJ2ZXIgcmVsZWFzZSBidXQgSSBkb24ndCB0aGluayBpdCdzIHJlbGF0ZWQgdG8K
dGhlIHhzZXJ2ZXIgdmVyc2lvbi4KClRoZSBpc3N1ZSBoYXMgYmVlbiBpbnRyb2R1Y2VkIHdpdGgg
eGY4Ni12aWRlby1hdGktMTkuMS4wIFsxXSB3aGljaCBpcyBhdmFpbGFibGUKaW4gQnVpbGRyb290
IHNpbmNlIDIwMTkuMTEuCgpbMV0KaHR0cHM6Ly9jZ2l0LmZyZWVkZXNrdG9wLm9yZy94b3JnL2Ry
aXZlci94Zjg2LXZpZGVvLWF0aS9jb21taXQvP2lkPTMzODAzYzg1Zjc2MWQzNDNhYTczMDAzMTFi
OGU5NDg5YjFhODk0OTUKCkJlc3QgcmVnYXJkcywKUm9tYWluCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRy
b290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlz
dGluZm8vYnVpbGRyb290Cg==
