Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B936CC7619A
	for <buildroot@archiver.kernel.org>; Wed, 12 Apr 2023 08:17:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4E62B61498;
	Wed, 12 Apr 2023 08:17:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4E62B61498
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nBiZSDPcq24P; Wed, 12 Apr 2023 08:17:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4EF1A614DC;
	Wed, 12 Apr 2023 08:17:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4EF1A614DC
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EAC9B1BF47D
 for <buildroot@lists.busybox.net>; Wed, 12 Apr 2023 08:17:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C180881E23
 for <buildroot@lists.busybox.net>; Wed, 12 Apr 2023 08:17:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C180881E23
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id r8Dcfdut93OL for <buildroot@lists.busybox.net>;
 Wed, 12 Apr 2023 08:17:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7D74481757
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7D74481757
 for <buildroot@buildroot.org>; Wed, 12 Apr 2023 08:17:27 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id be27so11139049ljb.12
 for <buildroot@buildroot.org>; Wed, 12 Apr 2023 01:17:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681287445;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NfxkluoZJX6+COmhw/j8eKzIT0XN6U32Z5NQwt/gKik=;
 b=ygDu7UOVIAuU6jQT7jQ4y/+G2PdahLkKjUA/y54LY/iPyyOue5yACHOZ7w7dXOm6Uf
 hFQ9wSnM27vYKVCMCWLK1Svv96MaE9Br+se9w2fBUoFVmN7DmrbtKkn6WMMKKJKWX/Oe
 9vFCopxr5ini4+gQYrE/JMRnzxSyUbI8DNTv1nkes8RtzSctdPtGo3cue3Tg2sdZ7yU3
 I2sGwvEI1pEe5TadvVDADCNUFXCANG3zJhiHmyi/8UETS1v9k/WFTE1NTBl+tP11Q2ma
 2ggjwpqJ/UugqJ9gDsTmnJCmgbUkOI5VT2DsFZiNU7N1fCj1TdRu62kWKGZd8h5fIJpu
 wVZw==
X-Gm-Message-State: AAQBX9cKkbLFixy6YK0KtRqHa2WMdJbAo99RmFxdYYxZZc3CQO7QqZtE
 0xJ4qXzKIDIlUU1hr8n4RdLM5hZlzpYDt1KnI+HqSA==
X-Google-Smtp-Source: AKy350ZUBHNLttVmtjCZEm8UmeTNfnd51rJTLq4q2MgqoYyuzS8tBJlE0TX8/7fJ9NgjxhhDthcdAngjEsYiJ783IOs=
X-Received: by 2002:a2e:9dc3:0:b0:298:b32c:e4f9 with SMTP id
 x3-20020a2e9dc3000000b00298b32ce4f9mr1726896ljj.3.1681287445396; Wed, 12 Apr
 2023 01:17:25 -0700 (PDT)
MIME-Version: 1.0
References: <20230329193028.775041-1-sebastian.weyer@smile.fr>
 <27991_1681212690_64354512_27991_146_1_20230411113128.GA483930@tl-lnx-nyma7486>
 <20230411203328.GR2819@scaer>
In-Reply-To: <20230411203328.GR2819@scaer>
From: Sebastian WEYER <sebastian.weyer@smile.fr>
Date: Wed, 12 Apr 2023 10:17:13 +0200
Message-ID: <CADSVbUu8YWDSgptn8zvbFz9nsvLcBuTfJ1Qfa9qAiWeWZe9dBg@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20210112.gappssmtp.com; s=20210112; t=1681287445;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NfxkluoZJX6+COmhw/j8eKzIT0XN6U32Z5NQwt/gKik=;
 b=j/OnOVaWIsGFtbuotn8Qiv4yo2NlDqI3LDmg3V9/lxHupoaqRaW7LXh0WAokcGpnKv
 R2mLgU1Ui5Qiui07UB5BcsmD3AphRtU89jyFTU5vWazHctXohPxexSvNOTSfCDyKSkFd
 gHOTH4yIQhK4fppGsnT1jTr/Yu+2IjavsqJv45i1K53Cxu2odbGA+p1nATQ33lNE9CB6
 YjC/XRkjHLn9sraHrdYZocZOJI6aoOYF8ro8IPdNCjFqc+urIg4OADnfWlOgApb5tLM1
 pFtvebu/YpPjo977AHUQnXD0GWkg84DM6CrIHzk/oGocsVCMA9i9hrDA5fMi3Mvz36Ms
 UHaw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20210112.gappssmtp.com
 header.i=@smile-fr.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=j/OnOVaW
Subject: Re: [Buildroot] [PATCH 1/1] package/glibc: bump to version 2.37
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
Cc: Romain Naour <romain.naour@gmail.com>, yann.morin@orange.com,
 Romain Naour <romain.naour@smile.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gWWFubiwKCgpPbiBUdWUsIEFwciAxMSwgMjAyMyBhdCAxMDozM+KAr1BNIFlhbm4gRS4g
TU9SSU4gPHlhbm4ubW9yaW4uMTk5OEBmcmVlLmZyPiB3cm90ZToKPgo+IFlhbm4sIFNlYmFzdGlh
biwgUm9tYWluLCBBbGwsCj4KPiBPbiAyMDIzLTA0LTExIDEzOjMxICswMjAwLCB5YW5uLm1vcmlu
QG9yYW5nZS5jb20gc3Bha2UgdGh1c2x5Ogo+ID4gT24gMjAyMy0wMy0yOSAyMTozMCArMDIwMCwg
U2ViYXN0aWFuIFdleWVyIHNwYWtlIHRodXNseToKPiA+ID4gRnJvbTogUm9tYWluIE5hb3VyIDxy
b21haW4ubmFvdXJAc21pbGUuZnI+Cj4gPiA+Cj4gPiA+IFNlZToKPiA+ID4gaHR0cHM6Ly9zb3Vy
Y2V3YXJlLm9yZy9nbGliYy93aWtpL1JlbGVhc2UvMi4zNwo+ID4gPiBodHRwczovL2xpc3RzLmdu
dS5vcmcvYXJjaGl2ZS9odG1sL2luZm8tZ251LzIwMjMtMDIvbXNnMDAwMDAuaHRtbAo+ID4gVGhv
cyBidW1wIGJyZWFrcyB0aGUgYnVpbGQgb2YgaG9zdC1sb2NhbGVkZWYsIGFzIGEgcGF0Y2ggY2Fu
J3QgYmUKPiA+IGFwcGxpZWQ6Cj4gPiAgICAgPj4+IGhvc3QtbG9jYWxlZGVmIDIuMzctMi1nOWY4
NTEzZGM2NDExOWE0MjRiMzEyZGI5N2NlZjVkODdkMzc2ZGVmYSBQYXRjaGluZwo+ID4gICAgIEFw
cGx5aW5nIDAwMDEtSEFDSy1vbmx5LWJ1aWxkLWFuZC1pbnN0YWxsLWxvY2FsZWRlZi5wYXRjaCB1
c2luZyBwYXRjaDoKPiA+ICAgICBwYXRjaGluZyBmaWxlIFJ1bGVzCj4gPiAgICAgSHVuayAjMSBz
dWNjZWVkZWQgYXQgMjI0IChvZmZzZXQgOCBsaW5lcykuCj4gPiAgICAgcGF0Y2hpbmcgZmlsZSBs
b2NhbGUvTWFrZWZpbGUKPiA+Cj4gPiAgICAgQXBwbHlpbmcgMDAwMi1yZWxheC1kZXBlbmRlbmN5
LW9uLUdDQy10by00LjgtYW5kLWJpbnV0aWxzLXRvLTIuMjQucGF0Y2ggdXNpbmcgcGF0Y2g6Cj4g
PiAgICAgcGF0Y2hpbmcgZmlsZSBjb25maWd1cmUKPiA+ICAgICBIdW5rICMxIHN1Y2NlZWRlZCBh
dCA0MTc4IHdpdGggZnV6eiAxIChvZmZzZXQgLTQ3MyBsaW5lcykuCj4gPiAgICAgSHVuayAjMiBG
QUlMRUQgYXQgNDc4MS4KPiA+ICAgICBIdW5rICMzIHN1Y2NlZWRlZCBhdCA0NTg5IChvZmZzZXQg
LTYwMCBsaW5lcykuCj4gPiAgICAgMSBvdXQgb2YgMyBodW5rcyBGQUlMRUQgLS0gc2F2aW5nIHJl
amVjdHMgdG8gZmlsZSBjb25maWd1cmUucmVqCj4KPiBUaGFua3MgZm9yIHRoZSByZXBvcnQsIEkn
dmUgc2VudCBhIHBhdGNoOgo+ICAgICBodHRwczovL3BhdGNod29yay5vemxhYnMub3JnL3Byb2pl
Y3QvYnVpbGRyb290L3BhdGNoLzIwMjMwNDExMjAzMTEzLjE1NzM3ODctMS15YW5uLm1vcmluLjE5
OThAZnJlZS5mci8KPgo+IENhcmUgdG8gdGVzdCB0aGF0LCBwbGVhc2U/Cj4KPiBSZWdhcmRzLAo+
IFlhbm4gRS4gTU9SSU4uCj4KPiAtLQo+IC4tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0t
LS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0uCj4gfCAgWWFu
biBFLiBNT1JJTiAgfCBSZWFsLVRpbWUgRW1iZWRkZWQgfCAvIlwgQVNDSUkgUklCQk9OIHwgRXJp
Y3MnIGNvbnNwaXJhY3k6IHwKPiB8ICszMyA2NjIgMzc2IDA1NiB8IFNvZnR3YXJlICBEZXNpZ25l
ciB8IFwgLyBDQU1QQUlHTiAgICAgfCAgX19fICAgICAgICAgICAgICAgfAo+IHwgKzMzIDU2MSAw
OTkgNDI3IGAtLS0tLS0tLS0tLS0uLS0tLS0tLTogIFggIEFHQUlOU1QgICAgICB8ICBcZS8gIFRo
ZXJlIGlzIG5vICB8Cj4gfCBodHRwOi8veW1vcmluLmlzLWEtZ2Vlay5vcmcvIHwgXy8qXF8gfCAv
IFwgSFRNTCBNQUlMICAgIHwgICB2ICAgY29uc3BpcmFjeS4gIHwKPiAnLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tXi0tLS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0tLS0tLS0tLS0t
LS0tLS0tJwoKSSBjYW1lIHRvIHRoZSBzYW1lIGNvbmNsdXNpb24gYW5kIGFwcGxpZWQgdGhlIHNh
bWUgY2hhbmdlcyBhcyB5b3UgYnV0Cndhc24ndCBzdXJlIGhvdyB0byBoYW5kbGUgdGhpcyBpbiBh
IGJ1aWxkcm9vdCBjb250ZXh0IGFuZCB0aGVuIEkgc2F3CnlvdSBhbHJlYWR5IHNlbnQgdGhlIHBh
dGNoIGxhc3QgbmlnaHQuCkkgcmVwbGllZCB0byB5b3VyIHBhdGNoLgoKQmVzdCByZWdhcmRzLApT
ZWJhc3RpYW4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
YnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xp
c3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
