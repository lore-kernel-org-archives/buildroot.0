Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDB30CD13CF
	for <buildroot@archiver.kernel.org>; Mon,  2 Sep 2024 16:44:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A599860622;
	Mon,  2 Sep 2024 16:44:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e49dHDxDf6Pd; Mon,  2 Sep 2024 16:44:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A20FF6063D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A20FF6063D;
	Mon,  2 Sep 2024 16:44:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2AF3F1BF8B4
 for <buildroot@lists.busybox.net>; Mon,  2 Sep 2024 16:44:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 080BB80D85
 for <buildroot@lists.busybox.net>; Mon,  2 Sep 2024 16:44:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tlZG_jOOL7aY for <buildroot@lists.busybox.net>;
 Mon,  2 Sep 2024 16:44:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::131; helo=mail-lf1-x131.google.com;
 envelope-from=michael@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C0A3280F18
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C0A3280F18
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C0A3280F18
 for <buildroot@buildroot.org>; Mon,  2 Sep 2024 16:44:02 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-53346132348so5475459e87.2
 for <buildroot@buildroot.org>; Mon, 02 Sep 2024 09:44:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725295440; x=1725900240;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uTdACHQqWk7Kja+NXPysQ6MlfKbw+mIJKkQmhSTFoGA=;
 b=YhmtMsy5h8NTtbDM6Fp76J5ue7f/U5/HpZL8jfWfKV7JXbu1/NaoFqfVRInx0E3c4k
 VBl/IMkjgD66hlVXs6dUBkV8ud8dePwsC+Nwpq/H+K9CFPDeD6QN30M/TpfKuXJCU43/
 raVDGvoCtvdBir3ntkQ3C5ViT9zL2WovODjA5xymdRUJixuv6g+sCL6GmPn4aa0MFMYx
 FfkdGvF+EzAPrAj3jyUREe0x8O/6Ymoab7quMXJy+NHPdryDDUOb1I4z1QUoeSW301N9
 JSE3kGu4jNOt7m50OevHBV4Rj065IoeBCtmfVLKDPx2bL0a6ZiF7WQ86yjcrqL2GoQId
 7h3A==
X-Gm-Message-State: AOJu0YwBT8w6T6cX5bRaiHvgL4gO+XuBGgVYJ6mkiwaPkKdjCTMZCBlY
 gTUIRtY8n3HZZ94lsyo0Gz5F7eo7OJTy/1d+naWfE0WZCNIXRw9kfgnX+fQaENYRumeuJ5pv8e6
 Nj14NKoUQP56Ildm2fPAc8uJlU0EKs1zoKTpQFw==
X-Google-Smtp-Source: AGHT+IHIR9QqOBsrfp4qnMZ5v0Bl7C4pr6g7k7+KmRiCLeY+fyjMSJ8F9+f7bWAvsOf2X+RXb0zoQt/TOruFoBabGJM=
X-Received: by 2002:a05:6512:2345:b0:52f:c833:861a with SMTP id
 2adb3069b0e04-53546bb06dfmr7385884e87.51.1725295439565; Mon, 02 Sep 2024
 09:43:59 -0700 (PDT)
MIME-Version: 1.0
References: <20240902074109.50173-1-michael@amarulasolutions.com>
 <ZtXqSMVTSbe12Td3@landeda>
In-Reply-To: <ZtXqSMVTSbe12Td3@landeda>
From: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
Date: Mon, 2 Sep 2024 18:43:48 +0200
Message-ID: <CAOf5uwkEq-2vojxqxv_AF7hFw8JXfpSFY-UX7+QGwj1BhDPJ4A@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1725295440; x=1725900240;
 darn=buildroot.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uTdACHQqWk7Kja+NXPysQ6MlfKbw+mIJKkQmhSTFoGA=;
 b=h+1WKAnfhZISVEJ+h/ObUJgslnK4eKWVhaqPv3pU5XxDPomghk92rW3ZAQJ4KaEgxh
 NQvq9bHsdgwQbPpoaag7Vvd9YyXT3rUzb8cZ1ng0jqA+0EqdT/L8Hv/BV6QKF65KQ+ZN
 6OMwbHh9qRCuzb1lfQKUgAaCuv2CNsLZEUw1U=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=h+1WKAnf
Subject: Re: [Buildroot] [PATCH 1/2] scripts/cve: Avoid to do a complete
 clone of cve git repository
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SEkgWWFubgoKT24gTW9uLCBTZXAgMiwgMjAyNCBhdCA2OjM54oCvUE0gWWFubiBFLiBNT1JJTiA8
eWFubi5tb3Jpbi4xOTk4QGZyZWUuZnI+IHdyb3RlOgo+Cj4gTWljaGFlbCwgQWxsLAo+Cj4gT24g
MjAyNC0wOS0wMiAwOTo0MSArMDIwMCwgTWljaGFlbCBUcmltYXJjaGkgc3Bha2UgdGh1c2x5Ogo+
ID4gSnVzdCBhIHNpbXBsZSBjbG9uZSAtLWRlcHRoIDEgc2hvdWxkIGJlIGVub3VnaCB0byBwYXJz
ZSB0aGUKPiA+IGN2ZSBhbmQgZ2VuZXJhdGUgdGhlIHBrZy1zdGF0cyByZXBvcnQuIFRoZSBzcGFj
ZSBub3cgZG9lcwo+ID4gbm90IHRha2UgaW4gYWNjb3VudCBvZiB0aGUgZnVsbCBoaXN0b3J5IGFu
ZCBvbmx5IHVzZSAyLjJHYgo+Cj4gSSBqdXN0IGRpZCBib3RoIGEgZnVsbCBjbG9uZSBhbmQgYSBk
ZXB0aC0xIGNsb25lLCBhbmQgdGhlIHNpemUgZGVsdGEgaXMKPiBub3QgdGhhdCBtdWNoOiAyLjlH
aUIgdnMuIDIuMkdpQiwgc28gd2UncmUgc3RpbGwgaW4gdGhlIHNhbWUgbGVhZ3VlLgo+Cj4gU3Rp
bGwsIHRoZSBkb3dubG9hZCBzaXplIGRvZXMgY2hhbmdlOiBmcm9tIDk4My41NU1pQiBkb3duIHRv
IDI3MC43OE1pQjsKPiB0aGUgcmVtb3RlIGhhcyB0byBjb21wcmVzcyBvYmplY3RzIHNwZWNpZmlj
YWxseSBmb3IgdGhlIGRlcHRoLTEgY2xvbmUsCj4gd2hpY2ggdGFrZXMgYSBiaXQgb2YgdGltZSwg
YnV0IHRoZXJlIGxlc3MgZGVsdGFzIHRvIHJlc29sdmUgbG9jYWxseSwgc28KPiBpdCdzIGEgbmV0
IHRpbWUgd2luIHRvbzogMm0xN3MgdnMgMW1pbjdzIChvbiBhIDEwME1icHMgbGluaykuCj4KCklm
IHlvdSBoYXZlIGEgZHNsIGFuZCBkb3dubG9hZCBsaW5rIG9mIDEwTWJwcyB0aGlzIG1ha2VzIHJl
YWxseSBzZW5zZQphbmQgdGhpcyBqdXN0IHRlbmQKdG8gaW5jcmVhc2UgaW4gc2l6ZS4gIFlvdSAx
IG1pbnV0ZXMgY2FuIGJlIHRlbiAxMCBtaW51dGVzIG9uIG5ldHdvcmsgY29uZ2VzdGlvbgoKTWlj
aGFlbAoKPiBJcyBpdCBldmVudHVhbGx5IHdvcnRoIGl0PyBJIGxpa2UgdGhpbmdzIHRvIGJlIHNp
bXBsZSByYXRoZXIgdGhhbiBoYXZlCj4gY29tcGxleCBoZXVyaXN0aWNzLCBhbmQgc3RvcmFnZSBu
b3dhZGF5cyBpcyBjaGVhcCwgYW5kIGJhbmR3aWR0aCBpcyBvbmx5Cj4gcmVhbGx5IHBhaWQgb24g
dGhlIGZpcnN0IGNsb25lLCBzaW5jZSB0aGUgZm9sbG93aW5nIGNhbGxzIHdvdWxkIG9ubHkKPiBw
dWxsIHdoYXQncyBtaXNzaW5nLCB3aGljaCB3aWxsIGV2ZW50dWFsbHkgY2F1c2UgdGhlIGxvY2Fs
IGNsb25lIHRvIGdyb3cKPiB0byBhIHNpemUgdGhhdCB3b3VsZCBub3QgZGlmZmVyIGJ5IG11Y2gg
aWYgdGhlIGZpcnN0IGNsb25lIGhhZCBiZWVuIGEKPiBmdWxsIG9uZS4KPgo+IFNvLCBJICdtIGEg
Yml0IGNvbW5maWN0ZWQgYWJvdXQgdGhhdCBvbmUsIGJ1dCB3b3VsZCB0ZW5kIHRvIHNheSBuby4u
Lgo+IExlYXZpbmcgcGVuZGluZyBmb3Igb3RoZXIgbWFpbnRhaW5lcnMgdG8gY2hpbWUgaW4uCj4K
PiBSZWdhcmRzLAo+IFlhbm4gRS4gTU9SSU4uCj4KPiA+IFNpZ25lZC1vZmYtYnk6IE1pY2hhZWwg
VHJpbWFyY2hpIDxtaWNoYWVsQGFtYXJ1bGFzb2x1dGlvbnMuY29tPgo+ID4gLS0tCj4gPiAgc3Vw
cG9ydC9zY3JpcHRzL2N2ZS5weSB8IDIgKy0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRp
b24oKyksIDEgZGVsZXRpb24oLSkKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvc3VwcG9ydC9zY3JpcHRz
L2N2ZS5weSBiL3N1cHBvcnQvc2NyaXB0cy9jdmUucHkKPiA+IGluZGV4IGUyNTgyNTU4MWUuLjdk
MTE1YTI4YjUgMTAwNzU1Cj4gPiAtLS0gYS9zdXBwb3J0L3NjcmlwdHMvY3ZlLnB5Cj4gPiArKysg
Yi9zdXBwb3J0L3NjcmlwdHMvY3ZlLnB5Cj4gPiBAQCAtODIsNyArODIsNyBAQCBjbGFzcyBDVkU6
Cj4gPiAgICAgICAgICAgICAgIyBoYXBwaWx5IGNsb25lcyBpbnRvIGFuIGVtcHR5IGRpcmVjdG9y
eS4KPiA+ICAgICAgICAgICAgICBvcy5tYWtlZGlycyhudmRfZ2l0X2RpcikKPiA+ICAgICAgICAg
ICAgICBzdWJwcm9jZXNzLmNoZWNrX2NhbGwoCj4gPiAtICAgICAgICAgICAgICAgIFsiZ2l0Iiwg
ImNsb25lIiwgTlZEX0JBU0VfVVJMLCBudmRfZ2l0X2Rpcl0sCj4gPiArICAgICAgICAgICAgICAg
IFsiZ2l0IiwgImNsb25lIiwgIi0tZGVwdGgiLCAiMSIsIE5WRF9CQVNFX1VSTCwgbnZkX2dpdF9k
aXJdLAo+ID4gICAgICAgICAgICAgICAgICBzdGRvdXQ9c3VicHJvY2Vzcy5ERVZOVUxMLAo+ID4g
ICAgICAgICAgICAgICAgICBzdGRlcnI9c3VicHJvY2Vzcy5ERVZOVUxMLAo+ID4gICAgICAgICAg
ICAgICkKPiA+IC0tCj4gPiAyLjQzLjAKPiA+Cj4gPiBfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwo+ID4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+ID4gYnVp
bGRyb290QGJ1aWxkcm9vdC5vcmcKPiA+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo+Cj4gLS0KPiAuLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0t
LS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tLgo+
IHwgIFlhbm4gRS4gTU9SSU4gIHwgUmVhbC1UaW1lIEVtYmVkZGVkIHwgLyJcIEFTQ0lJIFJJQkJP
TiB8IEVyaWNzJyBjb25zcGlyYWN5OiB8Cj4gfCArMzMgNjYyIDM3NiAwNTYgfCBTb2Z0d2FyZSAg
RGVzaWduZXIgfCBcIC8gQ0FNUEFJR04gICAgIHwgIF9fXyAgICAgICAgICAgICAgIHwKPiB8ICsz
MyA1NjEgMDk5IDQyNyBgLS0tLS0tLS0tLS0tLi0tLS0tLS06ICBYICBBR0FJTlNUICAgICAgfCAg
XGUvICBUaGVyZSBpcyBubyAgfAo+IHwgaHR0cDovL3ltb3Jpbi5pcy1hLWdlZWsub3JnLyB8IF8v
KlxfIHwgLyBcIEhUTUwgTUFJTCAgICB8ICAgdiAgIGNvbnNwaXJhY3kuICB8Cj4gJy0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0t
LS0tLS0tLS0tLS0tLScKCgoKLS0gCk1pY2hhZWwgTmF6emFyZW5vIFRyaW1hcmNoaQpDby1Gb3Vu
ZGVyICYgQ2hpZWYgRXhlY3V0aXZlIE9mZmljZXIKTS4gKzM5IDM0NyA5MTMgMjE3MAptaWNoYWVs
QGFtYXJ1bGFzb2x1dGlvbnMuY29tCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
CkFtYXJ1bGEgU29sdXRpb25zIEJWCkpvb3AgR2Vlc2lua3dlZyAxMjUsIDExMTQgQUIsIEFtc3Rl
cmRhbSwgTkwKVC4gKzMxICgwKTg1IDExMSA5MTcyCmluZm9AYW1hcnVsYXNvbHV0aW9ucy5jb20K
d3d3LmFtYXJ1bGFzb2x1dGlvbnMuY29tCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9v
dC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRy
b290Cg==
