Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72C3BC433F5
	for <buildroot@archiver.kernel.org>; Tue, 18 Jan 2022 19:57:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E6D2181A12;
	Tue, 18 Jan 2022 19:57:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZEkw8tzTUQYs; Tue, 18 Jan 2022 19:57:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 12F14813DF;
	Tue, 18 Jan 2022 19:57:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6EB2A1BF59B
 for <buildroot@lists.busybox.net>; Tue, 18 Jan 2022 19:57:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6B0E84096F
 for <buildroot@lists.busybox.net>; Tue, 18 Jan 2022 19:57:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Aj36KLhUJ7BL for <buildroot@lists.busybox.net>;
 Tue, 18 Jan 2022 19:57:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5BFDE4094C
 for <buildroot@buildroot.org>; Tue, 18 Jan 2022 19:57:50 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id o12so58558388lfu.12
 for <buildroot@buildroot.org>; Tue, 18 Jan 2022 11:57:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=+CRhBXezajMbes19hgSXiqB+qelGgsQ1ZeIrM2BHUx8=;
 b=gjJ7BlsX2RcWenocP/cbhihz9CjJBi241UETsYI0inkWFqB6RaSXpcW6bKXeBw0Hnp
 jAyvot4UnVgMi+PjYQ4rBtLk6YsS0kG+tx4uxcEIwjTwfd2ViIGlTGMWHx9A+AdwXkA8
 5f35XRQpZ8OFEQ0ZrH6teGgLallh4qoHHj7pkFVSYm/eWlrIgnglo68dcL+12WnUV3RT
 2EKBhbfvHIGwKO6d9/0LEL0sUAMkiovhVJLkdpIwgCQrsSdLKOTNoJl5k57tnvWFONrR
 MqIZqg16/i7o2ted3xWCfKaUfSjygp+ZyyNhID56AjINzHruPXW8R7KpnFFfulTpIrBl
 2ukw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=+CRhBXezajMbes19hgSXiqB+qelGgsQ1ZeIrM2BHUx8=;
 b=C+m6vWnGvqThkl3CqLEkMsalirFv/CvJdegW9HqLdKeqBkJDlWWQhPnv/yun9SNGP0
 2vgTJ+av6EI6zunFv0wB4KWOCijCzTnb/woNqnZAxms6ppbJqBmtmcFQSJVoLhsP6Sg3
 W0CqP60/NlIBRXG0UUk4zrMzDa5TbWeiMXVkQUPwJBW3329dQesoRrHtU/DrtBGmfKhM
 LPL0oZ0uokRm6N5R8ZLUaOhjSlTEgb/gVit9chkIoZ4ZVZjDc68doHe3CC8RycKhPB6w
 uW+N3+k8uWsEe4awK4je48JzYZcA4Kw+1d7t4U/xwJOUyEB0/hg3KefmOPCupUSI6IpH
 qakA==
X-Gm-Message-State: AOAM530sKCYsjQG+82vUyWHBBAkE7TpY5FKtyLebka8HdqdzWHcshJfd
 fc1fxen/Wgt1NnnKtICmOdq9twuF8ddOzM5yJqt2pI0+hx3l8A==
X-Google-Smtp-Source: ABdhPJxyYOyFoKiQ2kitoCMXHvTO95pFchYB4NKr2NOsmRaDgLwCjaanB1h/DqDJbYHr6euJm+aDOwx+Qgr27zsmLT0=
X-Received: by 2002:a2e:9b0b:: with SMTP id u11mr5323486lji.344.1642535868117; 
 Tue, 18 Jan 2022 11:57:48 -0800 (PST)
MIME-Version: 1.0
References: <20220114211525.2697606-1-heiko.thiery@gmail.com>
 <752cc85f-d3d6-950b-cb5c-fb39e5020bc3@benettiengineering.com>
 <20220118000448.32ea764d@windsurf>
 <f8cc20f4-dc4d-3751-8dc3-eaddbc3bbcbb@benettiengineering.com>
In-Reply-To: <f8cc20f4-dc4d-3751-8dc3-eaddbc3bbcbb@benettiengineering.com>
From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Tue, 18 Jan 2022 20:57:36 +0100
Message-ID: <CAEyMn7aOFtdpXrmU3bLe03jgkmiVLrYCQvePkbLLv_+5ZOiN4Q@mail.gmail.com>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [Buildroot] [PATCH v2] configs/kontron_bl_imx8mm_defconfig: new
 defconfig
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
Cc: Michael Walle <michael@walle.cc>, Fabio Estevam <festevam@gmail.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Frieder Schrempf <frieder.schrempf@kontron.de>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgR2l1bGlvLCBIaSBUaG9tYXMsCgoKQW0gRGkuLCAxOC4gSmFuLiAyMDIyIHVtIDA3OjU4IFVo
ciBzY2hyaWViIEdpdWxpbyBCZW5ldHRpCjxnaXVsaW8uYmVuZXR0aUBiZW5ldHRpZW5naW5lZXJp
bmcuY29tPjoKPgo+IEhpIFRob21hcywKPgo+IE9uIDE4LzAxLzIyIDAwOjA0LCBUaG9tYXMgUGV0
YXp6b25pIHdyb3RlOgo+ID4gT24gTW9uLCAxNyBKYW4gMjAyMiAyMDo1ODo1MiArMDEwMAo+ID4g
R2l1bGlvIEJlbmV0dGkgPGdpdWxpby5iZW5ldHRpQGJlbmV0dGllbmdpbmVlcmluZy5jb20+IHdy
b3RlOgo+ID4KPiA+Pj4gZGlmZiAtLWdpdCBhL2NvbmZpZ3Mva29udHJvbl9ibF9pbXg4bW1fZGVm
Y29uZmlnIGIvY29uZmlncy9rb250cm9uX2JsX2lteDhtbV9kZWZjb25maWcKPiA+Pj4gbmV3IGZp
bGUgbW9kZSAxMDA2NDQKPiA+Pj4gaW5kZXggMDAwMDAwMDAwMC4uNWI1NjQ4Y2MxNAo+ID4+PiAt
LS0gL2Rldi9udWxsCj4gPj4+ICsrKyBiL2NvbmZpZ3Mva29udHJvbl9ibF9pbXg4bW1fZGVmY29u
ZmlnCj4gPj4+IEBAIC0wLDAgKzEsNTkgQEAKPiA+Pj4gKyMgQXJjaGl0ZWN0dXJlCj4gPj4+ICtC
UjJfYWFyY2g2ND15Cj4gPj4+ICtCUjJfQVJNX0ZQVV9WRlBWMz15Cj4gPj4KPiA+PiBpLk1YOE1N
IHN1cHBvcnRzIFZGUHY0LUQxNiwgc28gSSB3b3VsZCBzdWJzdGl0dXRlIHRoaXMgXl5eIHdpdGg6
Cj4gPj4gQlIyX0FSTV9GUFVfVkZQVjREMTYKPiA+Pgo+ID4+IFRoaXMgaXMgdG8gYWNoaWV2ZSB0
aGUgbWF4aW11bSBwZXJmb3JtYW5jZS4KPiA+Cj4gPiBOb3BlLCB0aGF0J3Mgbm90IHJlYWxseSBo
b3cgaXQgd29ya3MuIFZGUHYzIGlzIGJldHRlciB0aGFuIFZGUHYzLUQxNi4KPiA+IEluZGVlZCBW
RlB2MyBtZWFucyB0aGF0IHRoZSB0aGUgRlBVIGhhcyAzMiBkb3VibGUgcHJlY2lzaW9uIHJlZ2lz
dGVycywKPiA+IHdoaWxlIFZGUHYzLUQxNiBtZWFucyB0aGF0IGl0IGhhcyAib25seSIgMTYgZG91
YmxlIHByZWNpc2lvbiByZWdpc3RlcnMuCj4KPiBJJ20gYSBiaXQgY29uZnVzZWQuIFRoZSBkYXRh
c2hlZXRbMV0gc3RhdGVzIGF0IDEuNC4xOgo+IGBgYAo+IOKAoiBNZWRpYSBQcm9jZXNzaW5nIEVu
Z2luZSAoTVBFKSB3aXRoIE5FT04gdGVjaG5vbG9neSBzdXBwb3J0aW5nIHRoZQo+IEFkdmFuY2Vk
IFNpbmdsZSBJbnN0cnVjdGlvbiBNdWx0aXBsZSBEYXRhIGFyY2hpdGVjdHVyZQo+IOKAoiBGbG9h
dGluZyBQb2ludCBVbml0IChGUFUpIHdpdGggc3VwcG9ydCBvZiB0aGUgVkZQdjQtRDE2IGFyY2hp
dGVjdHVyZQo+IGBgYAo+IFsxXTogaHR0cHM6Ly93d3cubnhwLmNvbS9kb2NzL2VuL2RhdGEtc2hl
ZXQvSU1YOE1NQ0VDLnBkZgo+Cj4gU28gSSBleHBlY3QgaXQgdG8gb25seSBoYXZlIFZGUHY0LUQx
Ni4gQW5kIGFsc28gTkVPTiwgYnV0IHdlIGNhbid0IG1peAo+IHRoZW0gdXAgaW4gQWFyY2g2NCBh
cyBJIGtub3cuCj4KPiA+IFNvLCBpZiB0aGUgaS5NWDhNTSBoYXMgb25seSB0aGUgVkZQdjMtRDE2
LCB0aGVuIGluZGVlZCBpdCBzaG91bGQgYmUKPiA+IGNob3NlbiwgYmVjYXVzZSBjb2RlIGNvbXBp
bGVkIHdpdGggVkZQdjMgbWF5IG5vdCB3b3JrLCBhcyBpdCBtaWdodCB1c2UKPiA+IHRvbyBtYW55
IGRvdWJsZSBwcmVjaXNpb24gcmVnaXN0ZXJzLgo+ID4KPiA+IE9uIHRoZSBvdGhlciBoYW5kLCBp
ZiB0aGUgaS5NWDhNTSBoYXMgdGhlIGZ1bGwgVkZQdjMsIHRoZW4KPiA+IEJSMl9BUk1fRlBVX1ZG
UFYzPXkgc2hvdWxkIGJlIHVzZWQuCj4KPiBJdCBvbmx5IGhhcyBWRlB2NC1EMTYuIEkgdGhpbmsg
SSd2ZSBleHBsYWluZWQgbXlzZWxmIGJhZC4gVGhpcyBpcyBub3QgdG8KPiBhY2hpZXZlIG1heGlt
dW0gcGVyZm9ybWFuY2UsIHNpbXBseSBkYXRhc2hlZXQgc3RhdGVzIGl0IG9ubHkgc3VwcG9ydHMK
PiBWRlB2NC1EMTZbMV0gYW5kIGp1ZGdpbmcgZnJvbSB0aGlzOgo+IGh0dHBzOi8vZGV2ZWxvcGVy
LmFybS5jb20vZG9jdW1lbnRhdGlvbi9kdWkwNDcyL2gvQ0pBRERDSUYjOn46dGV4dD1WRlB2MyUy
MGhhcyUyMDMyJTIwZG91YmxlJTJEcHJlY2lzaW9uLFZGUHYzJTIwd2l0aCUyMGhhbGYlMkRwcmVj
aXNpb24lMjBleHRlbnNpb25zLiZ0ZXh0PVZGUHY0JTIwaGFzJTIwMzIlMjBkb3VibGUlMkRwcmVj
aXNpb24sdG8lMjB0aGUlMjBmZWF0dXJlcyUyMG9mJTIwVkZQdjMuCj4KPiBWRlB2NCBpcyByZXRy
by1jb21wYXRpYmxlIHdpdGggVkZQdjMsIGFuZCBJJ2QgZXhwZWN0IFZGUDR2NC1EMTYgdG8gYmUK
PiBsaWtlIHRoYXQgdG9vLiBJcyBpdCBwb3NzaWJsZSB0aGF0IGF0IHRoZSBtb21lbnQsIGJ5IG1p
c3Rha2UsIGl0IHdvcmtlZAo+IHdpdGhvdXQgdXNpbmcgbW9yZSB0aGFuIDE2IHJlZ2lzdGVycyBh
cyBWRlB2MyB0aGF0IGlzIHJldHJvLWNvbXBhdGlibGUKPiB3aXRoIFZGUHY0LUQxNihtYXliZT8p
Lgo+Cj4gPiBUaGF0IGJlaW5nIHNhaWQsIHRoZSBnY2MgbWFuIHBhZ2Ugb25seSBkb2N1bWVudHMg
dmZwdjMsIHZmcHYzLWQxNi1mcDE2LAo+ID4gdmZwdjMtZnAxNiBhcyBleHRlbnNpb24gZm9yIGFy
bXY3LWEuIEludGVyZXN0aW5nLCB3b3VsZCBuZWVkIHRvIGxvb2sKPiA+IGludG8gdGhpcy4KPgo+
IFllcywgYnV0IGkuTVg4TU0gaXMgYSBjb3J0ZXgtQTUzLCBzbyBhcm12OC1hOgo+IGh0dHBzOi8v
ZGV2ZWxvcGVyLmFybS5jb20vaXAtcHJvZHVjdHMvcHJvY2Vzc29ycy9jb3J0ZXgtYS9jb3J0ZXgt
YTUzCj4KPiB0aGF0IHRoZW4gaXMgcmV0cm8tY29tcGF0aWJsZSB0byBhcm12Ny1hIGlmIGluIEFh
cmNoMzIuCj4gQnV0IGhlcmUgd2UgdXNlIGl0IGFzIEJSMl9hYXJjaDY0LCBzbyBhcm12OC1hOgo+
IGh0dHBzOi8vZ2NjLmdudS5vcmcvb25saW5lZG9jcy9nY2MvQVJNLU9wdGlvbnMuaHRtbAo+Cj4g
YW5kIGl0IGxpc3RzOgo+IGBgYAo+IC1tZnB1PW5hbWUKPiBUaGlzIHNwZWNpZmllcyB3aGF0IGZs
b2F0aW5nLXBvaW50IGhhcmR3YXJlIChvciBoYXJkd2FyZSBlbXVsYXRpb24pIGlzCj4gYXZhaWxh
YmxlIG9uIHRoZSB0YXJnZXQuIFBlcm1pc3NpYmxlIG5hbWVzIGFyZTog4oCYYXV0b+KAmSwg4oCY
dmZwdjLigJksCj4g4oCYdmZwdjPigJksIOKAmHZmcHYzLWZwMTbigJksIOKAmHZmcHYzLWQxNuKA
mSwg4oCYdmZwdjMtZDE2LWZwMTbigJksIOKAmHZmcHYzeGTigJksCj4g4oCYdmZwdjN4ZC1mcDE2
4oCZLCDigJhuZW9uLXZmcHYz4oCZLCDigJhuZW9uLWZwMTbigJksIOKAmHZmcHY04oCZLCDigJh2
ZnB2NC1kMTbigJksCj4g4oCYZnB2NC1zcC1kMTbigJksIOKAmG5lb24tdmZwdjTigJksIOKAmGZw
djUtZDE24oCZLCDigJhmcHY1LXNwLWQxNuKAmSwg4oCYZnAtYXJtdjjigJksCj4g4oCYbmVvbi1m
cC1hcm12OOKAmSBhbmQg4oCYY3J5cHRvLW5lb24tZnAtYXJtdjjigJkuIE5vdGUgdGhhdCDigJhu
ZW9u4oCZIGlzIGFuIGFsaWFzCj4gZm9yIOKAmG5lb24tdmZwdjPigJkgYW5kIOKAmHZmcOKAmSBp
cyBhbiBhbGlhcyBmb3Ig4oCYdmZwdjLigJkuCj4gYGBgCj4KPiBTbyAidmZwdjQtZDE2IiBpcyBw
b3NzaWJsZS4KPgo+IEhlcmUgSSB0aGluayB3ZSBuZWVkIHZmcHY0LWQxNiBhbmQgbm90IHZmcHYz
IGJlY2F1c2Ugb2YgYm90aCBEUyBhbmQgUk0KPiBvZiBpLk1YOE1NLgo+Cj4gRG9lcyBpdCBzb3Vu
ZCBnb29kIHRvIHlvdT8KCkFmdGVyIGZvbGxvd2luZyB0aGUgZGlzY3Vzc2lvbiBpbiBJUkMgYmV0
d2VlbiBZYW5uIGFuZCBNaWNoYWVsIEkgYW0Kc3VyZSB0aGF0IHRoaXMgc2V0dGluZyBjYW5ub3Qg
YmUgdXNlZCBmb3IgdGhlIGFhcmNoNjQvY29ydGV4LUE1MyBDUFUuClRoZSBzZXR0aW5ncyBCUjJf
QVJNX0NQVV9IQVNfRlBVLCBCUjJfQVJNX0NQVV9IQVNfVkZQVjIsCkJSMl9BUk1fQ1BVX0hBU19W
RlBWMywgQlIyX0FSTV9DUFVfSEFTX1ZGUFY0IGFuZApCUjJfQVJNX0NQVV9IQVNfRlBfQVJNVjgg
YXJlIHNldCBpbXBsaWNpdGx5LgoKSSBwcm9iYWJseSB0b29rIHRoZSBzZXR0aW5nIGZyb20gdGhl
IGZyZWVzY2FsZV9pbXg4bW1ldmtfZGVmY29uZmlnLAp3aGljaCBpcyB0aGVuIGFsc28gbm90IGNv
cnJlY3QuCgpJIHRoZW4gbG9va2VkIGZ1cnRoZXIgYXQgdGhlIG90aGVyIGFhcmNoNjQgZGVmY29u
ZmlncyBhbmQgc2F3IHRoYXQKdGhlcmUgYXJlIG1vcmUgdGhhdCBzZXQgdGhlIEZQVSBzZXR0aW5n
cy4KCiAgIyAgZ3JlcCBhYXJjaDY0IC1BNTAgY29uZmlncy8qIHwgZ3JlcCBGUFUgfCB3YyAtbAog
IDI4CgpJIHdpbGwgcmVtb3ZlIHRoaXMgc2V0dGluZyBmcm9tIHRoZSBkZWZjb25maWcgaW4gdGhp
cyBwYXRjaCBhbmQgYWxzbwpmb3IgdGhlIG90aGVyIGtvbnRyb24gZGVmY29uZmlnLgoKLS0gCkhl
aWtvCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxk
cm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5i
dWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
