Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90F7CC433F5
	for <buildroot@archiver.kernel.org>; Fri,  7 Jan 2022 11:03:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2CC5540554;
	Fri,  7 Jan 2022 11:03:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JMBATerY1v9H; Fri,  7 Jan 2022 11:03:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 62257402E8;
	Fri,  7 Jan 2022 11:03:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E89071BF2EC
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 11:03:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D5C72832FF
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 11:03:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=smile-fr.20210112.gappssmtp.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mTbBBIFnQMx8 for <buildroot@lists.busybox.net>;
 Fri,  7 Jan 2022 11:03:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EEF0A832DC
 for <buildroot@buildroot.org>; Fri,  7 Jan 2022 11:03:42 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id r9so8588675wrg.0
 for <buildroot@buildroot.org>; Fri, 07 Jan 2022 03:03:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=8Q6xrmrCoqlozVQRAoMnDZ2AQaOoH5lvgazo3acNzX0=;
 b=wCHt5M/c+kee1M2xalC9US0s91YY62w4SRmhSmR7st5jENcP7ifP+xzlhtkTDk2Z6/
 2R6GqA0sWK4fcIy9xWgZZIeXUoi1DGc/jUmtwqUVOzUhK1Dm7Ks7dcCd+GZhTn4DWeZy
 IDX0aq38hLb79Wnj3HkFaHcOcGqsUZNJxCUQUPioJtQbTiahnaFvQkuhXr3WVTs0guk/
 MPUuZNG41EG7XNYnlRCrp7lvcUBHww6hpuFIE4c8X28y6P1DjKLIL8cA7viqJ1DDorAF
 A6YU0AKrh/+2zG37kBK2nV0kr0F+lPKETbomIYodIwPEgXCoQg8mrEKv6ujLkoKuQmoL
 hpAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=8Q6xrmrCoqlozVQRAoMnDZ2AQaOoH5lvgazo3acNzX0=;
 b=Gdtm21smwyK/xkiYgkoR1q05j9YM7SYMY52j0ZAVKN/PsDHIbOexFIxF4qMKPaF7IU
 2NQNleNNPQs/eKog6AxYeuhzk5lxuNtXbGaPI4/P/w1LJCHL18dyKMfbcG5UkfxDl4Ma
 iUOVB0Y2f3tCjTtbZ0Rt5BLbI4IFFxHRvzKGdSp6VCncESPpkFyWPF9YjfnneP53TavY
 k5AAu0wUEVeJkxGhBw3xgY6Sy0lj55asb573LlSd59P4akAoKtYWcWHuGcN7u8g0Ru5+
 6Yf38jjChziWOvShhtGo5P8yPWU9HJq+xx/K5+VflHLB1dXfd4I+W+UIZrFc9FRHx+u0
 O3cg==
X-Gm-Message-State: AOAM532LVZ6Jp9W8UXJ6nlaHxSIPcAxobWXyjaUAtwo3XU8wTRh8Q4Uo
 L4Zb1YeAtI31pGvcWoj4tQogZa2+ZpYa/A==
X-Google-Smtp-Source: ABdhPJxwrOV7mpVT/1RRd8ArDoIrHeLHXYW2c3W5yWaOS/Nh3OrWbXcPBldYerGAXdCrVE23u62g3w==
X-Received: by 2002:a5d:4d11:: with SMTP id z17mr9010546wrt.182.1641553421298; 
 Fri, 07 Jan 2022 03:03:41 -0800 (PST)
Received: from ?IPV6:2a01:cb05:8f8a:1800:1c97:b8d1:b477:d53f?
 (2a01cb058f8a18001c97b8d1b477d53f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:1c97:b8d1:b477:d53f])
 by smtp.gmail.com with ESMTPSA id q3sm4553824wrr.55.2022.01.07.03.03.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Jan 2022 03:03:40 -0800 (PST)
Message-ID: <b086db29-aff5-d4ef-12fb-630d2abed102@smile.fr>
Date: Fri, 7 Jan 2022 12:03:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-US
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20220106210000.397694-1-thomas.petazzoni@bootlin.com>
 <20220106210000.397694-6-thomas.petazzoni@bootlin.com>
 <d30edd2f-9e9f-b4e7-216c-fad53c6f90f4@smile.fr>
 <20220107104459.GD1268635@scaer>
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <20220107104459.GD1268635@scaer>
Subject: Re: [Buildroot] [PATCH v3 05/11] package/pkg-cargo.mk: introduce
 the cargo package infrastructure
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
Cc: Matt Weber <Matthew.Weber@rockwellcollins.com>,
 Patrick Havelange <patrick.havelange@essensium.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Buildroot List <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

TGUgMDcvMDEvMjAyMiDDoCAxMTo0NCwgWWFubiBFLiBNT1JJTiBhIMOpY3JpdMKgOgo+IFJvbWFp
biwgQWxsLAo+IAo+IE9uIDIwMjItMDEtMDcgMTE6MjYgKzAxMDAsIFJvbWFpbiBOYW91ciBzcGFr
ZSB0aHVzbHk6Cj4+IExlIDA2LzAxLzIwMjIgw6AgMjE6NTksIFRob21hcyBQZXRhenpvbmkgYSDD
qWNyaXTCoDoKPj4+IEZyb206IFBhdHJpY2sgSGF2ZWxhbmdlIDxwYXRyaWNrLmhhdmVsYW5nZUBl
c3NlbnNpdW0uY29tPgo+Pj4gSW4gb3JkZXIgdG8gYmUgcGFja2FnZSBhZ25vc3RpYywgdGhlIGlu
c3RhbGwgcGhhc2UgaXMgbm93IHVzaW5nIGNhcmdvCj4+PiBpbnN0ZWFkIG9mIGluc3RhbGwuIFRB
UkdFVF9DT05GSUdVUkVfT1BUUyBpcyBub3cgYWxzbyBzZXQgd2hlbiBydW5uaW5nCj4+PiBjYXJn
byBpbiBvcmRlciB0byBzdXBwb3J0IGNyb3NzIGNvbXBpbGluZyBDIGNvZGUgd2l0aGluIGNhcmdv
Lgo+Pj4KPj4+IFRoaXMgY29tbWl0IGFsc28gYWRkcyBzdXBwb3J0L2Rvd25sb2FkL2NhcmdvLXBv
c3QtcHJvY2VzcyB0byBwZXJmb3JtCj4+PiB0aGUgdmVuZG9yaW5nIG9uIENhcmdvIHBhY2thZ2Vz
Lgo+Pgo+PiBEb3dubG9hZCBwb3N0LXByb2Nlc3NpbmcgZG9lcyd0IHdvcmsgd2hlbiB3ZSB1c2Ug
X09WRVJSSURFX1NSQ0RJUi4KPiAKPiBUaGlzIGlzIGluZGVlZCBleHBlY3RlZDogX09WRVJSSURF
X1NSQ0RJUiBpcyBza2lwcGluZyBhbGwgdGhlIGRvd25sb2FkLAo+IGV4dHJhY3QgYW5kIHBhdGNo
IHN0ZXBzLgo+IAo+IERldmVsb3BlcnMgdGhhdCBhcmUgdXNpbmcgYW4gX09WRVJSSURFX1NSQ0RJ
UiBhcmUgcmVzcG9uc2libGUgZm9yCj4gcHJvdmlkaW5nIGFuIHNvdXJjZSB0cmVlIHRoYXQgaXMg
cmVhZHkgdG8gYmUgY29uZmlndXJlZC4KPiAKPiBTbywgdGhpcyBpcyBwcm9iYWJseSBzb21ldGhp
bmcgdGhhdCBzaG91bGQgYmUgYWRkZWQgdG8gdGhlIG1hbnVhbCwgaWYgaXQKPiBpcyBub3QgYWxy
ZWFkeSB0aGVyZSwgb3IgdG8gZW1waGFzaXNlIGl0IGlmIGFscmVhZHkgdGhlcmU6Cj4gCj4gICAg
IFdoZW4geW91IGFyZSB1c2luZyBPVkVSUklERV9TUkNESVIsIHlvdSBhcmUgcmVzcG9uc2libGUg
Zm9yCj4gICAgIHByb3ZpZGluZyBhIHNvdXJjZSB0cmVlIHRoYXQgaXMgcmVhZHkgdG8gYmUgY29u
ZmlndXJlZC4KCkkgZGlkIGEgdHJ5LCBJdCdzIG5vdCBqdXN0IGFkZGluZyB2ZW5kb3Igc291cmNl
cyBpbnRvIHBhY2thZ2Ugc291cmNlcyAoaW4gbXkKY2FzZSAiYmF0IiBwYWNrYWdlKS4KCldlIGhh
dmUgdG8gZXhlY3V0ZSAiY2FyZ28gdmVuZG9yIiBmcm9tICJiYXQiIHNvdXJjZXMgYW5kIHVzZSBD
QVJHT19IT01FIHVzZWQgYnkKQnVpbGRyb290OgoKQ0FSR09fSE9NRT0kSE9TVF9ESVIvc2hhcmUv
Y2FyZ28gY2FyZ28gdmVuZG9yCgpEbyB3ZSB3YW50IHRvIGRvY3VtZW50IHRoaXMgbWV0aG9kID8K
CkJlc3QgcmVnYXJkcywKUm9tYWluCgo+IAo+IENhcmUgdG8gc2VuZCBhIHBhdGNoLCBwbGVhc2U/
Cj4gCj4gUmVnYXJkcywKPiBZYW5uIEUuIE1PUklOLgo+IAo+PiBNYXliZSB3ZSBoYXZlIHRvIG1h
a2Ugc3VyZSB0aGF0IGFsbCBkb3dubG9hZCBvZiB2ZW5kb3IgbW9kdWxlcyBhcmUgYWxyZWFkeQo+
PiBwcmVzZW50IGluIHRoZSBzb3VyY2UgZGlyZWN0b3J5IHVzZWQgYnkgX09WRVJSSURFX1NSQ0RJ
Ui4KPj4KPj4gQmVzdCByZWdhcmRzLAo+PiBSb21haW4KPj4KPj4+Cj4+PiBUaGUgPHBrZz5fTElD
RU5TRSB2YXJpYWJsZSBvZiBjYXJnbyBwYWNrYWdlcyBpcyBleHBhbmRlZCB3aXRoICIsCj4+PiB2
ZW5kb3JlZCBkZXBlbmRlbmNpZXMgbGljZW5zZXMgcHJvYmFibHkgbm90IGxpc3RlZCIgYXMgY3Vy
cmVudGx5IGZvcgo+Pj4gYWxsIHBhY2thZ2VzLCB0aGUgbGljZW5zZXMgb2YgdGhlIHZlbmRvcmVk
IGRlcGVuZGVuY2llcyBhcmUgbm90IHRha2VuCj4+PiBpbnRvIGFjY291bnQuCj4+Pgo+Pj4gU2ln
bmVkLW9mZi1ieTogUGF0cmljayBIYXZlbGFuZ2UgPHBhdHJpY2suaGF2ZWxhbmdlQGVzc2Vuc2l1
bS5jb20+Cj4+PiBbVGhvbWFzOiBhZGQgc3VwcG9ydCBmb3IgaG9zdC1jYXJnby1wYWNrYWdlIGFu
ZCB2ZW5kb3JpbmddCj4+PiBTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgUGV0YXp6b25pIDx0aG9tYXMu
cGV0YXp6b25pQGJvb3RsaW4uY29tPgo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRy
b290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWls
ZHJvb3QK
