Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5387CC433F5
	for <buildroot@archiver.kernel.org>; Sun,  9 Jan 2022 11:50:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D81F74051F;
	Sun,  9 Jan 2022 11:50:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9dPL97flWx3z; Sun,  9 Jan 2022 11:50:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CC0D740527;
	Sun,  9 Jan 2022 11:50:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 003751BF3AF
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 11:50:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DDACA81947
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 11:50:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=smile-fr.20210112.gappssmtp.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hgocokgKS2sW for <buildroot@lists.busybox.net>;
 Sun,  9 Jan 2022 11:50:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D943681934
 for <buildroot@buildroot.org>; Sun,  9 Jan 2022 11:50:02 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id e9so19782513wra.2
 for <buildroot@buildroot.org>; Sun, 09 Jan 2022 03:50:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=OM1ddLjFRxXrEFmxX2gyIvVfTXCarS2Hh8mnuicizzA=;
 b=PqRZlGbnS75Jx+48od1NOeqvtEtIiSNpvz/qkDCRiBuSxGJm3GuJOvcYww0qpnbTe7
 AP7xWeJKSeez5RPgvrNTnajiCjKwVLepJQez1H0bxauaWOf22M/44+l3ykPjAY6+2Me2
 dqMS61LX6y31w+62n6aHAB1bkmLGP4Ir97JS8MDoJ4c5oQVLaShv3gYcEyOAJB0Eq2t8
 D3OZ8ZzSTvJcQkxJfSCutT2MoWFiWxwApcvA2RNuhQ4mjsOwuI9IKwkJ9oFq8rqQdD+K
 Odlh8ZjSEPuSoVheOpV8kb90fYDSUZ7UWK6n2Kqll3YcXHRi7jo1UPSa1Oaf8uJM6QyT
 L29Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=OM1ddLjFRxXrEFmxX2gyIvVfTXCarS2Hh8mnuicizzA=;
 b=UqhhLICMkTiuJoElsuWJ6jku5Cj6+fcv1r57X+L+FR9p5nWYqbsOQ8mZ/TwRft4P7M
 9QZ0rhiwy4Oj+DE5ocDaRXQ7fLy/RkHppT3gRtGYswGecTSu03fARm8jwj2lgtHXeGHK
 8MEp55y1IiKBZefhPWOpdahvtNLG20NvcWu1DDOhtIGl3G9AZHhjiDSi40WCx9SdA5eD
 fLbkNLFB36OnSZBiud/B1iiJiM0YsBYdYP6dbOQpgTSY+WD/bfuwAVkN3Ohqdfjawc9r
 AhbkucrSNNEVwq91kHJzaYJ7qBIqmnSZkoUTV6TjsDaC0prRwmrVn5dk1nsh5HdHLxoM
 aC7A==
X-Gm-Message-State: AOAM533b3fYNHfUrodWQMhSFN24dFHwDVWypXMQ0xoCmlmw8H/+FpCz+
 afVL8A2pKpy/tcBpGVXifrqgX9CIe63EbQ==
X-Google-Smtp-Source: ABdhPJzx5fq7VJF54YFB8ggGDTxDIDh7SWDmtEME9OgIblJSkUeLnuUIZUWb+LE4Y8KwJ11RZVF8xw==
X-Received: by 2002:a05:6000:148:: with SMTP id
 r8mr61373250wrx.333.1641729000903; 
 Sun, 09 Jan 2022 03:50:00 -0800 (PST)
Received: from ?IPV6:2a01:cb05:8f8a:1800:1c97:b8d1:b477:d53f?
 (2a01cb058f8a18001c97b8d1b477d53f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:1c97:b8d1:b477:d53f])
 by smtp.gmail.com with ESMTPSA id k8sm1447601wmi.13.2022.01.09.03.49.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 09 Jan 2022 03:50:00 -0800 (PST)
Message-ID: <92584bdf-0c5c-2d32-45af-01f80a584189@smile.fr>
Date: Sun, 9 Jan 2022 12:49:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-US
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Christian Stewart <christian@paral.in>,
 Buildroot List <buildroot@buildroot.org>,
 Matt Weber <Matthew.Weber@rockwellcollins.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20220106210000.397694-1-thomas.petazzoni@bootlin.com>
 <20220106210000.397694-5-thomas.petazzoni@bootlin.com>
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <20220106210000.397694-5-thomas.petazzoni@bootlin.com>
Subject: Re: [Buildroot] [PATCH v3 04/11] package/pkg-golang.mk: implement
 Go vendoring support
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
Cc: Patrick Havelange <patrick.havelange@essensium.com>,
 Anisse Astier <anisse@astier.eu>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gVGhvbWFzLAoKTGUgMDYvMDEvMjAyMiDDoCAyMTo1OSwgVGhvbWFzIFBldGF6em9uaSBh
IMOpY3JpdMKgOgo+IFRoaXMgY29tbWl0IGludHJvZHVjZXMgdGhlIGRvd25sb2FkIHBvc3QtcHJv
Y2VzcyBzY3JpcHQKPiBzdXBwb3J0L2Rvd25sb2FkL2dvLXBvc3QtcHJvY2VzcywgYW5kIGhvb2tz
IGl0IGludG8gdGhlIEdvIHBhY2thZ2UKPiBpbmZyYXN0cnVjdHVyZS4KPiAKPiBUaGUgLW1vZGNh
Y2hlcncgZmxhZyBpcyBhZGRlZCB0byBlbnN1cmUgdGhhdCB0aGUgR28gY2FjaGUgaXMKPiByZWFk
L3dyaXRlLCBhbmQgY2FuIGJlIGRlbGV0ZWQgcHJvcGVybHkgdXBvbiAibWFrZSBjbGVhbiIuCj4g
Cj4gVGhlIDxwa2c+X0xJQ0VOU0UgdmFyaWFibGUgb2YgZ29sYW5nIHBhY2thZ2VzIGlzIGV4cGFu
ZGVkIHdpdGggIiwKPiB2ZW5kb3JlZCBkZXBlbmRlbmNpZXMgbGljZW5zZXMgcHJvYmFibHkgbm90
IGxpc3RlZCIgYXMgY3VycmVudGx5IGZvcgo+IGFsbCBwYWNrYWdlcywgdGhlIGxpY2Vuc2VzIG9m
IHRoZSB2ZW5kb3JlZCBkZXBlbmRlbmNpZXMgYXJlIG5vdCB0YWtlbgo+IGludG8gYWNjb3VudC4K
PiAKPiBTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgUGV0YXp6b25pIDx0aG9tYXMucGV0YXp6b25pQGJv
b3RsaW4uY29tPgo+IC0tLQoKSSdtIHRlc3RpbmcgdGhlIGdvbGFuZyBpbmZyYSB3aXRoIHRlbGVn
cmFmIHBhY2thZ2UgYW5kIEkgZ290IGFuIGVycm9yIHdoaWxlCmRvd25sb2FkaW5nIGdvIG1vZHVs
ZXM6CgoidmVyaWZ5aW5nIGNvbGxlY3RkLm9yZ0B2MC41LjA6IGNoZWNrc3VtIG1pc21hdGNoCglk
b3dubG9hZGVkOiBoMTptUlRMZGxqdnhKTlhQTU1POVJTeGYwUEFOREFxdS9UeitJNkR0Nk9qQjI4
PQoJZ28uc3VtOiAgICAgaDE6eTR1RlNBdU9tZVZoRzNHQ1JhMy9vSCt5c2VQZk8vK2VHSk5mZDBR
YTNkOD0KClNFQ1VSSVRZIEVSUk9SClRoaXMgZG93bmxvYWQgZG9lcyBOT1QgbWF0Y2ggYW4gZWFy
bGllciBkb3dubG9hZCByZWNvcmRlZCBpbiBnby5zdW0uClRoZSBiaXRzIG1heSBoYXZlIGJlZW4g
cmVwbGFjZWQgb24gdGhlIG9yaWdpbiBzZXJ2ZXIsIG9yIGFuIGF0dGFja2VyIG1heQpoYXZlIGlu
dGVyY2VwdGVkIHRoZSBkb3dubG9hZCBhdHRlbXB0LgoKRm9yIG1vcmUgaW5mb3JtYXRpb24sIHNl
ZSAnZ28gaGVscCBtb2R1bGUtYXV0aCcuIgoKSXQgc2VlbXMgdGhlcmUgaXMgc29tZXRoaW5nIHdy
b25nIGluIGdvLnN1bSBmaWxlIGZyb20gdGVsZWdyYWYuLi4gYnV0IHdlIGFyZSBpbgpkb3dubG9h
ZCBzdGVwIG5vdCBpbiBwYXRjaCBzdGVwLiBJdCBzZWVtcyB0aGVyZSBpcyBubyB3YXkgdG8gZml4
IGxvY2FsbHkgKGJ5CnBhdGNoaW5nKSB0aGlzIHByb2JsZW0uCgpUaGlzIGlzIG5vdCB0aGUgZmly
c3QgdGltZSB0aGF0IGluZmx1ZGIvdGVsZWdyYWYgcmVsZWFzZXMgYXJlIGJyb2tlbiBkdWUgdG8K
Y2hhbmdlIGluIGdpdCByZXBvIGxpc3RlZCBpbiBnby5zdW0uCgpCZXN0IHJlZ2FyZHMsClJvbWFp
bgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJv
b3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVp
bGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
