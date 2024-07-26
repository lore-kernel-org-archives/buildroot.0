Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5F50C3DA4A
	for <buildroot@archiver.kernel.org>; Fri, 26 Jul 2024 21:00:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 855FC40D57;
	Fri, 26 Jul 2024 21:00:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D3hSm0N2W7jH; Fri, 26 Jul 2024 21:00:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 34F3240D5B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 34F3240D5B;
	Fri, 26 Jul 2024 21:00:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 485821BF852
 for <buildroot@lists.busybox.net>; Fri, 26 Jul 2024 21:00:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 32F5940D5B
 for <buildroot@lists.busybox.net>; Fri, 26 Jul 2024 21:00:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VetqOMM6XM9y for <buildroot@lists.busybox.net>;
 Fri, 26 Jul 2024 21:00:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12c; helo=mail-lf1-x12c.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8773C40D57
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8773C40D57
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8773C40D57
 for <buildroot@buildroot.org>; Fri, 26 Jul 2024 21:00:07 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-52f01afa11cso2466434e87.0
 for <buildroot@buildroot.org>; Fri, 26 Jul 2024 14:00:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722027605; x=1722632405;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rEtHdCeCvi203RvWX8uIFfTzY3P4Qx+BnSES1IQnJZk=;
 b=caUH180fi78coJpfQAkfdF0aZWF5Nn90uevRxd/x6fDB54f2ltKOOvVF9B3G55Ev4j
 EVrta4F8HQ8U41NP7UurAKyoD5xBJCzgcsC6HVeeDS7WymtXvBpCKA1j3fc2IWFvC7Dj
 iS8xCMB4C6SvVPav+6TxiYAlqBZWfdAQxrZLFT+CGvPTVkTKkg9eY8t8eAX8zwWcxxbr
 hMOhpi2VIRfec1ulRwrVkwTnLkkVDooof+UAww7GWKZE6gxyqBV+OzuCZOux7qLqKi6f
 t2wcOazfe6rNT0R+FI8mRd2ldybzbE0fOoWFXn63/hI+CcdrDz3QIfCNLYaBA1CFUW0E
 MpkQ==
X-Gm-Message-State: AOJu0YyXEb2GrQ+lgr47Vd18IQL+0Jywx7pZf4B0XyFHOuXnfNN4FRm/
 67BKgqtAegfzAux+cdrgKXzM1SPd+P45i75MOLaHR1HdLBAIUu0v7ZgxK/nAvEZubC6XkErglEO
 k5UxKG7OMncmOSk4PhXrF3B1j6GBRScVW
X-Google-Smtp-Source: AGHT+IEQuX4Vd+JUJr21TVrg7YzgQ5Yl76wKzu4x/58ipJEXSmnIoyMqW6ouq43FozG92K719LAOSn3YZnPHO4EC9sA=
X-Received: by 2002:a05:6512:e99:b0:52d:6673:11da with SMTP id
 2adb3069b0e04-5309b2ce6c5mr587515e87.57.1722027604794; Fri, 26 Jul 2024
 14:00:04 -0700 (PDT)
MIME-Version: 1.0
References: <20240724115554.2270864-1-fontaine.fabrice@gmail.com>
 <ZqQLEUiTljvhKaWM@probook>
In-Reply-To: <ZqQLEUiTljvhKaWM@probook>
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri, 26 Jul 2024 22:59:53 +0200
Message-ID: <CAPi7W80oHhQmabKg64pUVffo3sRStOfF0w0teQHmGeB1NgGhfg@mail.gmail.com>
To: =?UTF-8?B?Si4gTmV1c2Now6RmZXI=?= <j.neuschaefer@gmx.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1722027605; x=1722632405; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rEtHdCeCvi203RvWX8uIFfTzY3P4Qx+BnSES1IQnJZk=;
 b=h0c7hbGemNV1971S2LqGIhZnPeIl5wL2+vp7eli3es3iQrtqkGZ/u6vS0R4RjqGrBd
 l/wKBR0lERIslq+T+FreAsczNf0TtWdizOwaoOVLFgiNq14caz4QmjxbbHYedux4knaX
 +dXqjLZywyAUKrxeecYvloOG+59yOemvT1hx1GalV6Js0OKWD5jbzHTJgYe4ipVib2Wu
 3ZcB9QUthrtjDgM7GoWc/EMAD8zXTGg3SyFlZuG3qofJFxpP4bkNVVRrcT1atmwGjW3D
 /qjgUBDN7VEC0Nk5HAIGcYm+0s1R9cgG5RAJdDaORNrVe8H2Wg7pDO9GtCWkIknp4fl3
 4/og==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=h0c7hbGe
Subject: Re: [Buildroot] [PATCH 1/1] package/tipidee: fix uclibc build
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

TGUgdmVuLiAyNiBqdWlsLiAyMDI0IMOgIDIyOjQ2LCBKLiBOZXVzY2jDpGZlciA8ai5uZXVzY2hh
ZWZlckBnbXgubmV0PiBhIMOpY3JpdCA6Cj4KPiBPbiBXZWQsIEp1bCAyNCwgMjAyNCBhdCAwMTo1
NTo1NFBNICswMjAwLCBGYWJyaWNlIEZvbnRhaW5lIHdyb3RlOgo+ID4gU2V0IF9HTlVfU09VUkNF
IGluIENGTEFHUyB0byBmaXggdGhlIGZvbGxvd2luZyB1Y2xpYmMgYnVpbGQgZmFpbHVyZQo+ID4g
cmFpc2VkIHNpbmNlIHRoZSBhZGRpdGlvbiBvZiB0aGUgcGFja2FnZSBpbiBjb21taXQKPiA+IDE3
ZGVhZjYwZjY2ZmMwOGE3OTYyMzM5MjBhMTA0ZTUyMzNiNTAxZTA6Cj4gPgo+ID4gc3JjL2xpYnRp
cGlkZWUvdGlwaWRlZV9yZXNwb25zZV9oZWFkZXJfbGFzdG1vZGlmaWVkLmM6IEluIGZ1bmN0aW9u
ICd0aXBpZGVlX3Jlc3BvbnNlX2hlYWRlcl9sYXN0bW9kaWZpZWQnOgo+ID4gc3JjL2xpYnRpcGlk
ZWUvdGlwaWRlZV9yZXNwb25zZV9oZWFkZXJfbGFzdG1vZGlmaWVkLmM6MTc6MzY6IGVycm9yOiAn
Y29uc3Qgc3RydWN0IHN0YXQnIGhhcyBubyBtZW1iZXIgbmFtZWQgJ3N0X210aW0nOyBkaWQgeW91
IG1lYW4gJ3N0X210aW1lJz8KPiA+ICAgIDE3IHwgICBpZiAoIXRhaW5fZnJvbV90aW1lc3BlYygm
dCwgJnN0LT5zdF9tdGltKSkgcmV0dXJuIDAgOwo+ID4gICAgICAgfCAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIF5+fn5+fn4KPiA+ICAgICAgIHwgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBzdF9tdGltZQo+ID4KPiA+IEZpeGVzOiAxN2RlYWY2MGY2NmZjMDhh
Nzk2MjMzOTIwYTEwNGU1MjMzYjUwMWUwCj4gPiAgLSBodHRwOi8vYXV0b2J1aWxkLmJ1aWxkcm9v
dC5vcmcvcmVzdWx0cy9mMDdkNmQ2YWUyMzMxZjk5NzI5NzQwOTNjMDUwM2I5ZDNjNmI5MTRhCj4g
Pgo+ID4gU2lnbmVkLW9mZi1ieTogRmFicmljZSBGb250YWluZSA8Zm9udGFpbmUuZmFicmljZUBn
bWFpbC5jb20+Cj4gPiAtLS0KPiA+ICBwYWNrYWdlL3RpcGlkZWUvdGlwaWRlZS5tayB8IDEgKwo+
ID4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9w
YWNrYWdlL3RpcGlkZWUvdGlwaWRlZS5tayBiL3BhY2thZ2UvdGlwaWRlZS90aXBpZGVlLm1rCj4g
PiBpbmRleCA5MTViNGY4NGJkLi5jYjMzYjE1M2U2IDEwMDY0NAo+ID4gLS0tIGEvcGFja2FnZS90
aXBpZGVlL3RpcGlkZWUubWsKPiA+ICsrKyBiL3BhY2thZ2UvdGlwaWRlZS90aXBpZGVlLm1rCj4g
PiBAQCAtMTEsNiArMTEsNyBAQCBUSVBJREVFX0xJQ0VOU0VfRklMRVMgPSBDT1BZSU5HCj4gPiAg
VElQSURFRV9ERVBFTkRFTkNJRVMgPSBza2FsaWJzCj4gPgo+ID4gIFRJUElERUVfQ09ORl9PUFRT
ID0gXAo+ID4gKyAgICAgQ0ZMQUdTPSIkKFRBUkdFVF9DRkxBR1MpIC1EX0dOVV9TT1VSQ0UiIFwK
Pgo+IFRoaXMgc2VlbXMgZmluZSBhcyBhIHN0b3AtZ2FwIHNvbHV0aW9uLCBidXQgc2luY2UgdXBz
dHJlYW0gZG9jdW1lbnRzCj4gdGhhdCBpdCBvbmx5IG5lZWRzICJBIFBPU0lYLWNvbXBsaWFudCBz
eXN0ZW0gd2l0aCBhIHN0YW5kYXJkIEMKPiBkZXZlbG9wbWVudCBlbnZpcm9ubWVudCIsIGhhdmUg
eW91IGRpc2N1c3NlZCB0aGlzIGlzc3VlIHdpdGggdGhlCj4gdXBzdHJlYW0gYXV0aG9yPwoKTm9w
ZSwgSSBkaWRuJ3QgZGlzY3VzcyBpdCB3aXRoIHRoZSB1cHN0cmVhbSBhdXRob3IuClRob21hcyBk
b2Vzbid0IGxpa2UgdGhpcyBwYXRjaCBhbHNvOgpodHRwczovL3BhdGNod29yay5vemxhYnMub3Jn
L3Byb2plY3QvYnVpbGRyb290L3BhdGNoLzIwMjQwNzI1MTMyNjQxLjMzMzIxOS0xLWRhcmlvLmJp
bmFjY2hpQGFtYXJ1bGFzb2x1dGlvbnMuY29tLwoKQXMgeW91J3JlIHRoZSBvZmZpY2lhbCBtYWlu
dGFpbmVyIG9mIHRpcGlkZWUgaW4gYnVpbGRyb290LCBJJ2xsIGxldAp5b3UgZGVmaW5lIHRoZSBi
ZXN0IHNvbHV0aW9uIGFuZCBzZW5kIHRoZSBhcHByb3ByaWF0ZSBwYXRjaCB0byB0aGUKYnVpbGRy
b290IG1haWxpbmcgbGlzdC4KCj4KPgo+IEJlc3QgcmVnYXJkcywKPiAtLSBqbgoKQmVzdCBSZWdh
cmRzLAoKRmFicmljZQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBz
Oi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
