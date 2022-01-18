Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70E5CC433EF
	for <buildroot@archiver.kernel.org>; Tue, 18 Jan 2022 11:51:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D6B1B4019D;
	Tue, 18 Jan 2022 11:51:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JFsj4xSvoEdg; Tue, 18 Jan 2022 11:51:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 23A774014A;
	Tue, 18 Jan 2022 11:51:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8A2591BF990
 for <buildroot@lists.busybox.net>; Tue, 18 Jan 2022 11:51:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 78AC880DAD
 for <buildroot@lists.busybox.net>; Tue, 18 Jan 2022 11:51:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RvTehXDDKHTP for <buildroot@lists.busybox.net>;
 Tue, 18 Jan 2022 11:51:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8FF2580C80
 for <buildroot@buildroot.org>; Tue, 18 Jan 2022 11:51:46 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 l12-20020a7bc34c000000b003467c58cbdfso5153571wmj.2
 for <buildroot@buildroot.org>; Tue, 18 Jan 2022 03:51:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=5klmzXs0qbM/uLFHfG40INV8iCY80e5c4YQg1D9jntA=;
 b=OSwAPb2bs11Y3UT+iaqBIrocEl69fXU+W0flIQyrdIR0qfOAZwkHknX/xyessu4hPx
 M4m/9T72xwwMVy4iWFqkYfQiq8gYUhszv22uaZt/ZjASK5bNpM55oIk4eyEMiFyIWXOH
 6i5cu4U9jg7FDC5AKqukQwqipgIYMizCSjhoI7j00+BLOOLBlBYmvTRh5advgmvQhWVc
 AuCXOR0EtbnXYH6DQCDvhZTqZApfn51vIBFUaQR+lzgE3543c+qvDeiuw8acqULZEMKP
 tWJjksx1b4Ji6t2u9PqqYmcZlcQG/doORxh90kt9B9nNk4jnSr2zCF4lM7WNc56RHGi2
 TNyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=5klmzXs0qbM/uLFHfG40INV8iCY80e5c4YQg1D9jntA=;
 b=YI4CK8k+tn1x+fT+HssaTr0jq0vVikLjQJGt3OGa/QnRnIjUm/h7NOmVBWqdbEgaLm
 GQ4WFPY+BvhoDjc3gdKLPUx4OfcJ7BugOwhKQsYzoZ+8RkijOumIpI34EXWG4rwIgkbn
 3Ab4cAMGUddcSYmrAgpGUhd1+drUQOYCLrywBFvi8DXBrydNTLKJDQaCrVzqMATXhnpn
 NcJYNu8UP4W1MFiDVDdVToM7Aca1FzZqT2KPd8aw/ax3yTjREy2AeDKzWIjnJgX5R2TS
 ybYer74q81/Gh8Am0dXMjpDAvekOhAyoLRBTxJxYS8VkyzuFLFKuyuVOM+DUUi1vgf66
 1Sew==
X-Gm-Message-State: AOAM533XQc0grd00KrdbFgVUjuShD09gHxMT2aeLLCTbXgnPQD6HUOFY
 nVAmL6myQh/OVVTMTrNUqQI=
X-Google-Smtp-Source: ABdhPJxEePrPLibvsjjwsA8faKrh+5zmecGipaof/L6Sho0F60vVUwVLvIRa0UIQM3u+3sn2JzxSUw==
X-Received: by 2002:adf:ec8a:: with SMTP id z10mr226034wrn.296.1642506704902; 
 Tue, 18 Jan 2022 03:51:44 -0800 (PST)
Received: from [192.168.1.43]
 (amontpellier-158-1-160-63.w92-145.abo.wanadoo.fr. [92.145.131.63])
 by smtp.gmail.com with ESMTPSA id v13sm19005158wro.90.2022.01.18.03.51.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Jan 2022 03:51:44 -0800 (PST)
Message-ID: <13491b39-7995-1aa7-a2cb-5af43467bb95@gmail.com>
Date: Tue, 18 Jan 2022 12:51:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-US
To: Thomas De Schampheleire <patrickdepinguin@gmail.com>,
 buildroot <buildroot@buildroot.org>
References: <20220115200306.14037-1-patrickdepinguin@gmail.com>
 <20220115200306.14037-7-patrickdepinguin@gmail.com>
 <CAAXf6LU949oVpaUvM=q8t8jZzTNXHWoLDu0gB3BdTEudK+6G7Q@mail.gmail.com>
From: Romain Naour <romain.naour@gmail.com>
In-Reply-To: <CAAXf6LU949oVpaUvM=q8t8jZzTNXHWoLDu0gB3BdTEudK+6G7Q@mail.gmail.com>
Subject: Re: [Buildroot] [PATCHv2 6/7] configs: add new qemu defconfig
 'x86_multilib'
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
Cc: Gerome Burlats <gerome.burlats@smile.fr>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gVGhvbWFzLAoKTGUgMTgvMDEvMjAyMiDDoCAxMjoxOSwgVGhvbWFzIERlIFNjaGFtcGhl
bGVpcmUgYSDDqWNyaXTCoDoKPiBIaSwKPiAKPiBFbCBzw6FiLCAxNSBlbmUgMjAyMiBhIGxhcyAy
MTowMywgVGhvbWFzIERlIFNjaGFtcGhlbGVpcmUKPiAoPHBhdHJpY2tkZXBpbmd1aW5AZ21haWwu
Y29tPikgZXNjcmliacOzOgo+Pgo+PiBGcm9tOiBUaG9tYXMgRGUgU2NoYW1waGVsZWlyZSA8dGhv
bWFzLmRlX3NjaGFtcGhlbGVpcmVAbm9raWEuY29tPgo+Pgo+PiBBZGQgYSBuZXcgcWVtdSBkZWZj
b25maWcgZm9yIGFuIHg4Nl82NCB0YXJnZXQgdGhhdCB3aWxsIHJ1biBhbiB4ODZfNjQga2VybmVs
Cj4+IGJ1dCB1c2Vyc3BhY2UgaW4gMzItYml0ICh4ODYpIG1vZGUsIHVzaW5nIEJSMl9LRVJORUxf
QVJDSF9PVkVSUklERS4KPj4KPj4gU2lnbmVkLW9mZi1ieTogVGhvbWFzIERlIFNjaGFtcGhlbGVp
cmUgPHRob21hcy5kZV9zY2hhbXBoZWxlaXJlQG5va2lhLmNvbT4KPj4gLS0tCj4+Cj4+IE5vdGUg
dGhhdCB0aGUgZGVmY29uZmlnIHJlZmVycyB0byBhIHRvb2xjaGFpbiBhdAo+PiBhdXRvYnVpbGQu
YnVpbGRyb290Lm9yZywgYnV0IGlzIG5vdCB5ZXQgcHJlc2VudCBhdCB0aGF0IGxvY2F0aW9uLgo+
PiBJIHVwbG9hZGVkIHRoZSB0b29sY2hhaW4gdGVtcG9yYXJpbHkgdG86Cj4+IGh0dHA6Ly9wYXRy
aWNrZGVwaW5ndWluLmNvbS9jdG5nLTY3MzdjZmFhOGNlNi14ODZfbXVsdGlsaWItZ2xpYmMtZ2Nj
MTEudGFyLnh6Cj4+IG1kNXN1bTpiMDg1YzBkOGYxMzdjMDc4ZjhmMDlkMTE2ZDgzNjRmOAo+PiBz
aGEyNTZzdW0gMmE1MjQxZDkyNzQyMzk1MzJlNDRkMzdjNjU1MDk5MzFmYmMxMjBkYjU5OTE0MTJm
OTQ2ZWIzODE3NmRiNGRjMgo+Pgo+Pgo+IAo+IFJvbWFpbiBOYW91ciBub3RpZmllZCBtZSB0aGF0
IHRoaXMgdG9vbGNoYWluIGRvZXMgbm90IHJ1biBvbiB0aGUgR0NDCj4gRmFybSAoSWxsZWdhbCBp
bnN0cnVjdGlvbikgc28gSSBtYWRlIGEgbmV3IHZlcnNpb24sIGN1cnJlbnRseSB1cGxvYWRlZAo+
IGF0Ogo+IGh0dHA6Ly9wYXRyaWNrZGVwaW5ndWluLmNvbS9jdG5nLTY3MzdjZmFhOGNlNi14ODZf
bXVsdGlsaWItZ2xpYmMtZ2NjMTEtMi50YXIueHoKPiBtZDVzdW06ICAzY2VlNjRmODI2NzU0NDZh
ZDI1NWY2YzE2NTc4NmViNQo+IHNoYTI1NnN1bTogNjcxNWJmYmMxOTU1ODhiNjQ4M2QzOWU5ZWM2
ZDcwNjExY2FjM2I5OWJmMmRkMzRmZWRiZWQwZDRlNmM3ZWRjMQoKVGhpcyB0b29sY2hhaW4gZG9l
c24ndCB3b3JrIGVpdGhlci4KCkRpZCB5b3UgdHJpZWQgd2l0aCBDVF9FWFRSQV9DRkxBR1NfRk9S
X0JVSUxEPSItbWFyY2g9eDg2LTY0IiA/CldpdGggQ1RfRVhUUkFfQ1hYRkxBR1NfRk9SX0JVSUxE
IG1heWJlIG9yIGJvdGguCgpBbHNvLCBidWlsZGluZyB3aXRoIGEgRGViaWFuIGplc3NpZSBkb2Nr
ZXIgY29udGFpbmVyIHdvdWxkIGFsbG93IHRvIHJ1biB0aGUKdG9vbGNoYWluIHdpdGggb2xkIEds
aWJjLgoKQmVzdCByZWdhcmRzLApSb21haW4KCgo+IAo+IEJlc3QgcmVnYXJkcywKPiBUaG9tYXMK
PiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxk
cm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5i
dWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
