Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03713C433F5
	for <buildroot@archiver.kernel.org>; Tue, 17 May 2022 21:31:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5D2C360B51;
	Tue, 17 May 2022 21:31:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5_oZKUGPKg7I; Tue, 17 May 2022 21:31:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6D4E460B2B;
	Tue, 17 May 2022 21:31:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4C7781BF28E
 for <buildroot@lists.busybox.net>; Tue, 17 May 2022 21:31:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3AFA160B2B
 for <buildroot@lists.busybox.net>; Tue, 17 May 2022 21:31:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KwdiQYKNPugQ for <buildroot@lists.busybox.net>;
 Tue, 17 May 2022 21:31:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 251E660615
 for <buildroot@buildroot.org>; Tue, 17 May 2022 21:31:52 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 l38-20020a05600c1d2600b00395b809dfbaso48008wms.2
 for <buildroot@buildroot.org>; Tue, 17 May 2022 14:31:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=tiz+kdTx6bI4CcvifeufqQtRSOtPaGPosQw3Butf0ew=;
 b=NER+lw1O84qKJukj6YtJOxsHWyVDDd/rH1CFvMxCuU3w6cYCWHKs4m/5sv3wnhdRNm
 Xd7xIWLRhgo5FjzUKsEzbqyROFwkSt6KgMCuPTMO2qc2es+LlK/t3rZ9rRCCyF/7YYA6
 o+dbcWfYpB5b3snlVNoaPFGJuzR1jf4CvQosi57dicosz+ElxXysvlJ3LjMTtzakl/iE
 6jrhiQIVfK4AdOTZxRfmCN83M+2kA3p+I7GHg/jLWbNfe/0zQHzcl6RyJYsFxVTwBsix
 n2u8ElQp2xcCZJ16af3t/bzVqV1A7x+p3NtvAG1LSxtFUK8T+vG7Eu+PsNHquJ5PGfs7
 0pQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=tiz+kdTx6bI4CcvifeufqQtRSOtPaGPosQw3Butf0ew=;
 b=MIoNRh/ulzpuJjsaHe1CcnaWjjkisZdV+DH+JjTLNa6l22rEq24xmyj7Gzc0PvALMR
 +j3A6/2q6KUMy6mWbjPjpXvc+A491ojvlmr/oKRkJNPGJ1eq8guD8fo56zcUJbnrXwT8
 IMqBCoshYnrOsY9S13OUEaPMkf/emlN2W80UAtXNqkujTr1BgJI31suQb1/1fyuhhFI5
 EcdOR0uD6dlTrJAsi01XFtK9dFetL9/V+r7OksQ82g29KJY9P5am0AyYeO4BN1Hcmccn
 K6/2v16XJauO5wAu813XPzOmmyyfw2jTAv2RoEd+S1w7nfli6JuEkgNhCCzi57NuQfQL
 DmWQ==
X-Gm-Message-State: AOAM532+At7srL1TUNsNbPUOpuLnDBvOfOEWduZNn95tTwMCDYsjq0Q7
 wHrFTfh4Q1k8txoKujx5AUs=
X-Google-Smtp-Source: ABdhPJz8eZwzdEdBq5lJvio7iQ49tafVS5LqiaRowYemdVUIQ36wFIBJ7DwBm80RtlPLnhBKCZZR3Q==
X-Received: by 2002:a05:600c:3647:b0:393:fb6b:e778 with SMTP id
 y7-20020a05600c364700b00393fb6be778mr33486850wmq.71.1652823110080; 
 Tue, 17 May 2022 14:31:50 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521?
 (2a01cb058f8a18003dbee9eed79eb521.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521])
 by smtp.gmail.com with ESMTPSA id
 d28-20020adfa41c000000b0020e5b4ebaecsm154159wra.4.2022.05.17.14.31.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 May 2022 14:31:49 -0700 (PDT)
Message-ID: <ba130602-e9e2-dfec-4613-277774467dbb@gmail.com>
Date: Tue, 17 May 2022 23:31:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, buildroot@buildroot.org
References: <20220514055312.2038383-1-clg@kaod.org>
 <e2817957-ded6-1873-c027-c912af2e45e0@gmail.com>
 <29a0e27f-8af8-73ee-7fef-fcdac814587f@kaod.org>
 <6b9b558c-cbb0-50e9-3775-a868ce87c9c7@gmail.com>
 <830f5cb0-afd9-de48-57f0-6fb9af3cf6ea@kaod.org>
From: Romain Naour <romain.naour@gmail.com>
In-Reply-To: <830f5cb0-afd9-de48-57f0-6fb9af3cf6ea@kaod.org>
Subject: Re: [Buildroot] [PATCH] configs/qemu_ppc64le_powernv8: use linux
 kernel 5.17.7 and binutils 2.36.1
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
Cc: Gerome Burlats <gerome.burlats@smile.fr>, Joel Stanley <joel@jms.id.au>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gQ8OpZHJpYywKCkxlIDE0LzA1LzIwMjIgw6AgMTg6NDksIEPDqWRyaWMgTGUgR29hdGVy
IGEgw6ljcml0wqA6Cj4gSGVsbG8gUm9tYWluLAo+IAo+Pj4+IEhhdmUgeW91IGNvbnNpZGVyZWQg
YWRkaW5nIHRoZSBwYXRjaCBpbiBib2FyZC9xZW11L3BwYzY0LSovcGF0Y2hlcy9saW51eAo+Pj4+
IGluc3RlYWQKPj4+PiBvZiBkb3duZ3JhZGluZyBiaW51dGlscyB2ZXJzaW9uPwo+Pj4KPj4+IHll
cywgSSB0cmllZCBidXQgdGhlIHNlY29uZCBwYXRjaCBmYWlsZWQgdG8gYXBwbHkuIEkgY2FuIGJh
Y2twb3J0Cj4+PiBpZiB0aGlzIGlzIGEgcHJlZmVycmVkIG9wdGlvbiwgYW5kIHNlbmQgYSB2Mi4K
Pj4KPj4gSXQgZmFpbCB0byBhcHBseSBvbiB0aGUga2VybmVsIDUuMTUgb3IgdGhlIDUuMTc/Cj4g
Cj4gb24gNS4xNy4KPiAKPj4gSSBndWVzcyB5b3UgdHJpZWQgdG8gYmFja3BvcnQgdGhlIHBhdGNo
IG9uIHRoZSA1LjE3IGFuZCB5b3UgaGFkIHNvbWUgY29uZmxpY3RzLgo+IAo+IFRoZXkgYXJlIGlu
IHRoZSBmdHJhY2Ugc3Vic3lzdGVtIDoKPiAKPiDCoCBodHRwczovL2xvcmUua2VybmVsLm9yZy9s
a21sLzIwMjIwNDI4MTg0MjEyLjE4ZmJmNDM4QGdhbmRhbGYubG9jYWwuaG9tZS9ULwo+IAo+IHBh
dGNoIDEgYXBwbGllcyBidXQgcGF0Y2ggMiBuZWVkcyBzb21lIGNhcmUuIFRoZXNlIGhhdmUgbm90
IGJlZW4gbWVyZ2VkIHlldAo+IGFuZCB0aGF0J3MgYW5vdGhlciByZWFzb24gdG8gYmUgY2FyZWZ1
bC4KPiAKPj4gU2luY2UgSXQncyBub3QgYSBlYXN5IGJhY2twb3J0LCBJJ20gb2sgdG8gZml4IHRo
ZSBiaW51dGlscyB2ZXJzaW9uIGZvciBwcGM2NAo+PiBkZWZjb25maWdzIHVudGlsIGl0J3MgZml4
ZWQgaW4gdXBjb21pbmcga2VybmVscy4KPiAKPiBUaGF0IG1pZ2h0IGJlIHRoZSBzYWZlc3Qgc29s
dXRpb24gZm9yIG5vdy4KCk9rIHdpdGggdGhpcyBzb2x1dGlvbi4KCkl0IHNlZW1zIHlvdSBhcmUg
bm90IHN1YnNjcmliZWQgdG8gdGhlIEJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QuIFlvdXIgcGF0Y2hl
cwpkb2Vzbid0IGFwcGVhciBpbiBwYXRjaHdvcmsgWzFdCgpQbGVhc2UsIHN1YnNjcmliZSBhbmQg
cmVzZW5kIHlvdXIgcGF0Y2guCgpbMV0gaHR0cDovL3BhdGNod29yay5vemxhYnMub3JnL3Byb2pl
Y3QvYnVpbGRyb290L2xpc3QKCkJlc3QgcmVnYXJkcywKUm9tYWluCgo+IAo+IFRoYW5rcywKPiAK
PiBDLgo+IMKgCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8v
bGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
