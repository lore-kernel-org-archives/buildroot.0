Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B685EB64DD
	for <buildroot@archiver.kernel.org>; Thu, 27 Jul 2023 20:47:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 222B4613CD;
	Thu, 27 Jul 2023 20:47:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 222B4613CD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UyzNjBVTpuS3; Thu, 27 Jul 2023 20:47:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5CC8B613C2;
	Thu, 27 Jul 2023 20:47:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5CC8B613C2
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7A9D21BF3CE
 for <buildroot@lists.busybox.net>; Thu, 27 Jul 2023 20:47:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 544B18142A
 for <buildroot@lists.busybox.net>; Thu, 27 Jul 2023 20:47:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 544B18142A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HwHkfbyEWfOD for <buildroot@lists.busybox.net>;
 Thu, 27 Jul 2023 20:47:12 +0000 (UTC)
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 687D481377
 for <buildroot@buildroot.org>; Thu, 27 Jul 2023 20:47:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 687D481377
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-317786befa2so1419143f8f.3
 for <buildroot@buildroot.org>; Thu, 27 Jul 2023 13:47:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690490830; x=1691095630;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3QnyM/q9B8VQvUYU15UZFBc6RzaUtZA0YG0X56vRpZ0=;
 b=I95wxyPl5M+v6dQgDuwlzI2NLn9M/6RHrbJUnBeN6HqTPLyviEJo2mWlPqNeMv4riE
 e2yv5/q3olBpCuwxgAFpSmQUEgP5B4WRDfnrQiT2sYeDrQX1CnjxIeHdHN0ZyQoghCOm
 Cn2NEEzqyMJOTXJfe7wFcl3ybrFwXvs8zq2jGl9cZba6H+EizLfUa+4ScbpdOkqXLpCI
 mqLbP3UBpyQz4oI/8RH0kf3EBfub2EzKWrzUwF764g3L2kfyqyzPKBKBR39lt/IaWkUS
 7IXt/2ZpOnZhzAO+MTNjGJIksEl/VHS51y4EV6FbXyZsmoqXfRAGtl2hCJm5amf9yM15
 M2vg==
X-Gm-Message-State: ABy/qLY9xnBhWYDQIzWxJBWaM2bY28hp4mNO/gL/o4UBZdLVXUiS+Aa4
 z6atL9lsJXMMqzSiJyrbt5qkJFyZ3HG7MOZe8Z0=
X-Google-Smtp-Source: APBJJlHMbm86ZZ6BAaYN6kAhVxWoFS8nPnpb/BY5wOeUPyQhCli66rsUNsgzppvvl2xqV+0wZu7uXg==
X-Received: by 2002:adf:de09:0:b0:317:63d0:39b7 with SMTP id
 b9-20020adfde09000000b0031763d039b7mr166985wrm.59.1690490830446; 
 Thu, 27 Jul 2023 13:47:10 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:945b:7e00:eeca:726b:991c:1980?
 (2a01cb05945b7e00eeca726b991c1980.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:eeca:726b:991c:1980])
 by smtp.gmail.com with ESMTPSA id
 l10-20020a5d410a000000b00317495f88fasm2920289wrp.112.2023.07.27.13.47.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Jul 2023 13:47:10 -0700 (PDT)
Message-ID: <dbadbf67-797f-ad6f-d519-35567417a291@smile.fr>
Date: Thu, 27 Jul 2023 22:47:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: fr, en-US
To: Christian Stewart <christian@aperture.us>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20230721213121.178783-1-romain.naour@gmail.com>
 <20230722232630.1c759813@windsurf>
 <CA+h8R2qhnFzK8WQOVQNi=etMhKyg=hFhyBcRHPu7NYg5S=kjWA@mail.gmail.com>
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <CA+h8R2qhnFzK8WQOVQNi=etMhKyg=hFhyBcRHPu7NYg5S=kjWA@mail.gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20221208.gappssmtp.com; s=20221208; t=1690490830; x=1691095630;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=3QnyM/q9B8VQvUYU15UZFBc6RzaUtZA0YG0X56vRpZ0=;
 b=X0Kbmi7pnFjHRFXv2Y5QIqQrCRWybeELXAyv7zdXecjsjFHuqRskEkzkXrJff/1PVi
 t3VX5PZucmMyXWJE9fSH4R+R9OPDku+7kJuiFinnQqd0F8b3CI2P1LHD4EhLGoPyRsy3
 LJsLUxgv2hyCFMbS5eANHymfUzYPwPSInIykj+PB9smmyIbDfIc8vK5nj/F9CBj0hKke
 +KEjsiepNsFhfzVpm7DzneX5/m1cTqW85tt3gvzHKkDXqvWaEQ1GdGNvQnPp0vxRueAQ
 ExLT3quYf+IvGy8AFUTJADnBqJttSKzswGI7e9NX21wOHqUeYll3QPLEqA0sEeHCCbJr
 m8Hg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20221208.gappssmtp.com
 header.i=@smile-fr.20221208.gappssmtp.com header.a=rsa-sha256
 header.s=20221208 header.b=X0Kbmi7p
Subject: Re: [Buildroot] [PATCH] package/util-linux: bump version to 2.39.1
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
Cc: Romain Naour <romain.naour@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gQ2hyaXN0aWFuLAoKTGUgMjQvMDcvMjAyMyDDoCAwMzowNCwgQ2hyaXN0aWFuIFN0ZXdh
cnQgdmlhIGJ1aWxkcm9vdCBhIMOpY3JpdMKgOgo+IFRob21hcywgUm9tYWluLAo+IAo+IAo+IE9u
IFNhdCwgSnVsIDIyLCAyMDIzIGF0IDI6MjbigK9QTSBUaG9tYXMgUGV0YXp6b25pCj4gPHRob21h
cy5wZXRhenpvbmlAYm9vdGxpbi5jb20+IHdyb3RlOgo+Pj4gUmV2ZXJ0aW5nIDQ5MDg4MmFkYTk0
Y2Y5OGRhMTQ1ZmViNGU3ZTQ3MzAyYWEzMTEwNGYgYWxsb3dzIHRvIHBhc3MgVGVzdERvY2tlckNv
bXBvc2UuCj4+Cj4+IENocmlzdGlhbiwgY291bGQgeW91IGhhdmUgYSBsb29rIGF0IHRoaXMgaXNz
dWU/Cj4+Cj4+IEluIHRoZSBtZWFuIHRpbWUsIEkgaGF2ZSBhcHBsaWVkIFJvbWFpbidzIHBhdGNo
LCB3aGljaCBpcyBuZWVkZWQgKGJ1dAo+PiBub3Qgc3VmZmljaWVudCkgdG8gZml4IFRlc3REb2Nr
ZXJDb21wb3NlLgo+IAo+IFRoZSBUZXN0RG9ja2VyQ29tcG9zZSB0ZXN0IG5vdyBjb21wbGV0ZXMg
c3VjY2Vzc2Z1bGx5IGZvbGxvd2luZyB0aGUKPiBtZXJnZSBvZiBHbyAxLjIwLngKClRoYW5rcyBm
b3IgdGFraW5nIGNhcmUgb2YgZ28gcGFja2FnZXMhCgpJdCBzZWVtcyB0aGUgZ28gYm9vdHN0cmFw
IGRvZXNuJ3Qgd29yayBldmVuIGFmdGVyIEdvIDEuMjAueCBtZXJnZSwKc2VlIFsxXQoKPj4+IGhv
c3QtZ28gMS4yMC42IEJ1aWxkaW5nCi4uLgpCdWlsZGluZyBHbyB0b29sY2hhaW4xIHVzaW5nIFsu
Li5ddGVzdC1vdXRwdXQvVGVzdE1lbmRlci9ob3N0L2xpYi9nby0xLjE5LjEwLgplcnJvciBvYnRh
aW5pbmcgVkNTIHN0YXR1czogZXhpdCBzdGF0dXMgMTI4CglVc2UgLWJ1aWxkdmNzPWZhbHNlIHRv
IGRpc2FibGUgVkNTIHN0YW1waW5nLgoKWzFdIGh0dHBzOi8vZ2l0bGFiLmNvbS9idWlsZHJvb3Qu
b3JnL2J1aWxkcm9vdC8tL2pvYnMvNDcyNTE4NjUyNQoKQmVzdCByZWdhcmRzLApSb21haW4KCgo+
IAo+IFRoYW5rcywKPiBDaHJpc3RpYW4KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwo+IGJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKPiBidWlsZHJvb3RAYnVp
bGRyb290Lm9yZwo+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2J1aWxkcm9vdAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczov
L2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
