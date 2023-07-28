Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67E7FC001DE
	for <buildroot@archiver.kernel.org>; Fri, 28 Jul 2023 08:37:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 38176840C0;
	Fri, 28 Jul 2023 08:37:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 38176840C0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ss2y6sXdgZno; Fri, 28 Jul 2023 08:37:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 714BB84079;
	Fri, 28 Jul 2023 08:37:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 714BB84079
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9DA231BF385
 for <buildroot@lists.busybox.net>; Fri, 28 Jul 2023 08:37:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7512242028
 for <buildroot@lists.busybox.net>; Fri, 28 Jul 2023 08:37:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7512242028
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QcJI7_9f-HbD for <buildroot@lists.busybox.net>;
 Fri, 28 Jul 2023 08:37:48 +0000 (UTC)
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5CEFB42026
 for <buildroot@buildroot.org>; Fri, 28 Jul 2023 08:37:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5CEFB42026
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-3fbc244d384so19686955e9.0
 for <buildroot@buildroot.org>; Fri, 28 Jul 2023 01:37:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690533466; x=1691138266;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OoybO3FDoS9NATRnz4alpjSo3xCH+VaVcL3kXjRSPqU=;
 b=CAUhAR80snWeWyRF8qrFh2W4NrWCniPYytFdseF99n5hJ6+qeoe4gqNfGnJzXMxE+J
 Hydn724x4E3bSnA52+UrFyg/r9/6GzGSPSiwUOMrBirY6kKJTSUyaNI6hQry/zi+cTX4
 N8kz6IkYfpSnUVQeS8cqRdqO3PgEcfT1+7axzc6qgF2fWg2tlt6T4rcRqJ2u5MK5sdr1
 MLKtS5odAG9sfTM1mfYWI8/K/ydg9S3z6rIadtzyC7fiy4zrkstfAfvc30O/QO2jp8M9
 3u4VbWKWLp97aepBAtJIeSQDVdPy1pyHl9AhpW0CuT7l0zhyMI9FaGkLeg51u1jLWwJ1
 wLoQ==
X-Gm-Message-State: ABy/qLa8qgVe7fEKsDX2+4xAnbAlgHAQVI86Dmqlln1Ddlu+2DgVm2Gp
 zPS4QQ78HractFdBxS7ptRsM/Abvg3VOzIOMPok=
X-Google-Smtp-Source: APBJJlHGpkhoXOibZo1d6eSIT6XCJhMU2A3NEr0pysmTD/52HPq0lUIYfaqlJdrMh/zkFu+pnb/o5g==
X-Received: by 2002:a7b:c5c3:0:b0:3fb:ff57:1750 with SMTP id
 n3-20020a7bc5c3000000b003fbff571750mr1117071wmk.32.1690533466361; 
 Fri, 28 Jul 2023 01:37:46 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:945b:7e00:eeca:726b:991c:1980?
 (2a01cb05945b7e00eeca726b991c1980.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:eeca:726b:991c:1980])
 by smtp.gmail.com with ESMTPSA id
 z24-20020a7bc7d8000000b003fbc681c8d1sm6477160wmk.36.2023.07.28.01.37.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Jul 2023 01:37:46 -0700 (PDT)
Message-ID: <080e239b-113e-09e8-aef1-0fb39cc70bd1@smile.fr>
Date: Fri, 28 Jul 2023 10:37:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
To: Christian Stewart <christian@aperture.us>
References: <20230721213121.178783-1-romain.naour@gmail.com>
 <20230722232630.1c759813@windsurf>
 <CA+h8R2qhnFzK8WQOVQNi=etMhKyg=hFhyBcRHPu7NYg5S=kjWA@mail.gmail.com>
 <dbadbf67-797f-ad6f-d519-35567417a291@smile.fr>
 <CA+h8R2oZ=oEr8hrJbHqw1K6AnBb__w1u6PGPmDUSONVb0Q0f6g@mail.gmail.com>
 <CA+h8R2p0VrrNpSA=sMqs5C8bpe41L9sOfo_5z6E8X9z6T_m9-w@mail.gmail.com>
 <CA+h8R2qm2i94fcggkXvScyv9unAWa6S6pF8TwYWTQLPt=r9eDw@mail.gmail.com>
Content-Language: fr, en-US
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <CA+h8R2qm2i94fcggkXvScyv9unAWa6S6pF8TwYWTQLPt=r9eDw@mail.gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20221208.gappssmtp.com; s=20221208; t=1690533466; x=1691138266;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=OoybO3FDoS9NATRnz4alpjSo3xCH+VaVcL3kXjRSPqU=;
 b=B8/t9xr8sPiDq+3HKzeLuLfs/5DoqZjOBklWkLNoby9ZftqO5m3K0MLwIyddgqEDzF
 9FfTSNpcRw9XdTwUqUqRb7vi+2lq/r0ErfFl8vzexi45WNcI2pXsED6MAxGS8xR4qKi7
 shbPGVBpyHuw8TrYLYDe5JeE4dH/K5wLvHwsGvrM5iqOhHjWFz+UuOSMz0BiQH/AIN3J
 Z7IGdCewlng/VCRKOkbpw0l5DzJejhczU2lAesurovlnVXaztU5G7pi0RYiviRZra+Op
 0iz2CkjxdD8ozZpL2JPklhdj3ZI/3Y6Lx2CkIvoh5uos3sq1HVTPweNvQR2a02wnuRgf
 M/7w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20221208.gappssmtp.com
 header.i=@smile-fr.20221208.gappssmtp.com header.a=rsa-sha256
 header.s=20221208 header.b=B8/t9xr8
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gQ2hyaXN0aWFuLAoKTGUgMjgvMDcvMjAyMyDDoCAwNjoyNCwgQ2hyaXN0aWFuIFN0ZXdh
cnQgYSDDqWNyaXTCoDoKPiBSb21haW4sCj4gCj4gT24gVGh1LCBKdWwgMjcsIDIwMjMgYXQgMjoz
M+KAr1BNIENocmlzdGlhbiBTdGV3YXJ0IDxjaHJpc3RpYW5AYXBlcnR1cmUudXM+IHdyb3RlOgo+
PiBPbiBUaHUsIEp1bCAyNywgMjAyMyBhdCAyOjIw4oCvUE0gQ2hyaXN0aWFuIFN0ZXdhcnQgPGNo
cmlzdGlhbkBhcGVydHVyZS51cz4gd3JvdGU6Cj4+PiBPbiBUaHUsIEp1bCAyNywgMjAyMyBhdCAx
OjQ34oCvUE0gUm9tYWluIE5hb3VyIDxyb21haW4ubmFvdXJAc21pbGUuZnI+IHdyb3RlOgo+Pj4+
IEl0IHNlZW1zIHRoZSBnbyBib290c3RyYXAgZG9lc24ndCB3b3JrIGV2ZW4gYWZ0ZXIgR28gMS4y
MC54IG1lcmdlLAo+Pj4+IHNlZSBbMV0KPiAKPj4+IFdpbGwgY2hlY2sgaW50byB3aHkgdGhpcyBD
SSBqb2IgZmFpbGVkIHJpZ2h0IGF3YXkuCj4gCj4+Pgo+Pj4+Pj4+IGhvc3QtZ28gMS4yMC42IEJ1
aWxkaW5nCj4+Pj4gLi4uCj4+Pj4gQnVpbGRpbmcgR28gdG9vbGNoYWluMSB1c2luZyBbLi4uXXRl
c3Qtb3V0cHV0L1Rlc3RNZW5kZXIvaG9zdC9saWIvZ28tMS4xOS4xMC4KPj4+PiBlcnJvciBvYnRh
aW5pbmcgVkNTIHN0YXR1czogZXhpdCBzdGF0dXMgMTI4Cj4+Pj4gICAgICAgICBVc2UgLWJ1aWxk
dmNzPWZhbHNlIHRvIGRpc2FibGUgVkNTIHN0YW1waW5nLgo+Pj4+Cj4+Pj4gWzFdIGh0dHBzOi8v
Z2l0bGFiLmNvbS9idWlsZHJvb3Qub3JnL2J1aWxkcm9vdC8tL2pvYnMvNDcyNTE4NjUyNQo+IAo+
IEl0IHRvb2sgbWUgYSBsb25nIHRpbWUgdG8gZmluZCBhIHJlcHJvZHVjdGlvbiBmb3IgdGhpcyBp
c3N1ZSwKCk1heWJlIGp1c3QgcnVuIHV0aWxzL2RvY2tlci1ydW4gd2l0aCBzdXBwb3J0L3Rlc3Rp
bmcvcnVuLXRlc3RzIHRvIHJlcHJvZHVjZSB0aGUKaXNzdWUgd2l0aCB0aGUgc2FtZSBlbnZpcm9u
bWVudCBhcyB0aGUgZ2l0bGFiLWNpIGpvYiA/Cgo+IAo+IEkgZmluYWxseSB0cmFjZWQgaXQ6IGlm
IHRoZXJlIGlzIGFuIGludmFsaWQgLmdpdCBpbiBhbnkgcGFyZW50Cj4gZGlyZWN0b3J5IG9mIHRo
ZSBHT1JPT1RfQk9PVFNUUkFQLCB0aGUgYnVpbGQgd2lsbCBmYWlsLiBSZXByb2R1Y3Rpb246Cj4g
Cj4gYGBgCj4gIyBUaGlzIHJlcHJvZHVjdGlvbiBzZXRzIHVwIGEgZGlyZWN0b3J5IHN0cnVjdHVy
ZSB0aGF0IGJyZWFrcyBHbyBtYWtlLmJhc2guCj4gIyBtYWtlLmJhc2ggc2hvdWxkIG5vdCBicmVh
ayBkdWUgdG8gLmdpdCBmaWxlcyBvdXRzaWRlIG9mIHRoZSBHbyBzb3VyY2VzLgo+ICMKPiAjIFRo
ZSBlcnJvciBzcGVjaWZpY2FsbHkgb2NjdXJzIHdoZW4gYW4gaW52YWxpZCAuZ2l0IGlzIHByZXNl
bnQgaW4gYSBwYXJlbnQgZ2l0Cj4gIyBkaXJlY3Rvcnkgb2YgdGhlIEdPUk9PVF9CT09UU1RSQVAu
IEdvIGlzc3VlICM2MTYyMAo+IG1rZGlyIGdvLWlzc3VlLTYxNjIwCj4gY2QgLi9nby1pc3N1ZS02
MTYyMAo+IHdnZXQgaHR0cHM6Ly9nby5kZXYvZGwvZ28xLjE5LjExLnNyYy50YXIuZ3oKPiBta2Rp
ciBnby1ib290c3RyYXAKPiB0YXIgLXhmIGdvMS4xOS4xMS5zcmMudGFyLmd6IC1DIC4vZ28tYm9v
dHN0cmFwIC0tc3RyaXAtY29tcG9uZW50cz0xCj4gY2QgLi9nby1ib290c3RyYXAvc3JjLwo+IGJh
c2ggbWFrZS5iYXNoCj4gY2QgLi4vLi4vCj4gd2dldCBodHRwczovL2dvLmRldi9kbC9nbzEuMjAu
Ni5zcmMudGFyLmd6Cj4gbWtkaXIgZ28KPiB0YXIgLXhmIGdvMS4yMC42LnNyYy50YXIuZ3ogLUMg
Li9nby8gLS1zdHJpcC1jb21wb25lbnRzPTEKPiBwcmludGYgImdpdGRpcjogLi4vLi4vZG9lcy9u
b3QvZXhpc3QvLmdpdCIgPiAuLy5naXQKPiBjZCAuL2dvL3NyYy8KPiBHT1JPT1RfQk9PVFNUUkFQ
PSQocHdkKS8uLi8uLi9nby1ib290c3RyYXAvIGJhc2ggbWFrZS5iYXNoCj4gIyBCdWlsZCBmYWls
cyB1c2luZyAtYnVpbGR2Y3M9ZmFsc2UgZXJyb3JzLgo+IGBgYAo+IAo+IFN1Ym1pdHRlZCB0byB0
aGUgZ28gaXNzdWUgdHJhY2tlcjogaHR0cHM6Ly9naXRodWIuY29tL2dvbGFuZy9nby9pc3N1ZXMv
NjE2MjAKCk5pY2UhCgpCZXN0IHJlZ2FyZHMsClJvbWFpbgoKCj4gCj4gQmVzdCByZWdhcmRzLAo+
IENocmlzdGlhbiBTdGV3YXJ0CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3Jn
Cmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
