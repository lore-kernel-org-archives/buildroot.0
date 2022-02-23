Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6199EC433EF
	for <buildroot@archiver.kernel.org>; Wed, 23 Feb 2022 17:17:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F345260FA0;
	Wed, 23 Feb 2022 17:17:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id p7cLC71hATY3; Wed, 23 Feb 2022 17:17:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2706760F96;
	Wed, 23 Feb 2022 17:17:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BAE971BF263
 for <buildroot@lists.busybox.net>; Wed, 23 Feb 2022 17:17:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A062E408E5
 for <buildroot@lists.busybox.net>; Wed, 23 Feb 2022 17:17:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zSds8iCekT-C for <buildroot@lists.busybox.net>;
 Wed, 23 Feb 2022 17:17:08 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd13146.aruba.it (smtpcmd13146.aruba.it [62.149.156.146])
 by smtp2.osuosl.org (Postfix) with ESMTP id D4B2C40142
 for <buildroot@buildroot.org>; Wed, 23 Feb 2022 17:17:07 +0000 (UTC)
Received: from smtpclient.apple ([146.241.188.82])
 by Aruba Outgoing Smtp  with ESMTPA
 id MvGDn3oN1iF0aMvGDnlZnp; Wed, 23 Feb 2022 18:17:05 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1645636625; bh=EQC9j46povWPpROY+DeBk+6HJVT//bwaPiyNJtZEXc0=;
 h=Content-Type:From:Mime-Version:Subject:Date:To;
 b=O2tasxLsjlI8vQKjFl8lPgDnQIYzLZ7crFEIIwfoPKGsn4oHDRs4sSkCBS5waPL0E
 Zgsrj5/HtDvt/yE1zz4BBL+G+5wIok2GKKokYcOuB0WxkhLl9IfQHEUoIw6FZU4nbx
 /oAUuglpxTb/bTiYImf5cymPvwvl6EyBOvLYJD3apL5xsb2ogb1uu5L5xL2OpIHDwC
 nWgylX837Sqx/Gi7C0DRkTiFiwffKExdp1pK0IjrtFUkrzBWZb5jtpIqHhfAztXPVC
 uXrVze0/nx7JX4InhnCEWAzrdHB4uvHHu5KtlCYtOkC2tDkw8w0OkkEwm37zeoIW9t
 OXtsjunqnrMhw==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Mime-Version: 1.0 (1.0)
Date: Wed, 23 Feb 2022 18:17:04 +0100
Message-Id: <60963250-0364-4F7B-9B0C-51265261991E@benettiengineering.com>
References: <3795ba01-3742-acce-9eeb-8c34a00bd941@lucaceresoli.net>
In-Reply-To: <3795ba01-3742-acce-9eeb-8c34a00bd941@lucaceresoli.net>
To: Luca Ceresoli <luca@lucaceresoli.net>
X-Mailer: iPhone Mail (19D52)
X-CMAE-Envelope: MS4wfBnSpW2Ri1Twd7hfp5mJTQl4KHZjWTc+zeMEowSrlAGepIQ9pm9j1NIjmRImecBi9boY57R/08ZWBmHmmy9nykUzESmB+U/mKPPPYIqqobrM8XOLjPF1
 4ak4IrxnEOyOB0Nx8IZ8cNrde5bFZwtzV5UIiQtlt2KDbDIoC0AmUC4zDgX7cRW9uqlf2jAssVLct8MLwp+7QLoFjmBNDGWdKDsEXGF9EkLE/xFhoRzw1tq5
 ydn6J+E9ohWLYRlh3f6TyVlMTU+AoAqyFdCo0PVtwQW8RWuz6aNVrEfnRSk1rJ/xn5F9oczV/slfroHk8/hMse0jpqFyatzK4FnErG2XTVg=
Subject: Re: [Buildroot] [PATCH v1 1/1] configs/zynqmp_zcu10x: fix U-Boot
 dts config
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
Cc: Michal Simek <michals@xilinx.com>, Neal Frager <nealf@xilinx.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgTmVhbCwgTHVjYSwKCj4gSWwgZ2lvcm5vIDIzIGZlYiAyMDIyLCBhbGxlIG9yZSAxODowNCwg
THVjYSBDZXJlc29saSA8bHVjYUBsdWNhY2VyZXNvbGkubmV0PiBoYSBzY3JpdHRvOgo+IAo+IO+7
v0hpIE5lYWwsCj4gCj4+IE9uIDIzLzAyLzIyIDE1OjMwLCBOZWFsIEZyYWdlciB3cm90ZToKPj4g
SGkgUGV0ZXIsCj4+IAo+PiArKysgYi9ib2FyZC96eW5xbXAvemN1MTA2L3Vib290LWZyYWdtZW50
LmNvbmZpZwo+PiBAQCAtMCwwICsxLDIgQEAKPj4gK0NPTkZJR19ERUZBVUxUX0RFVklDRV9UUkVF
PSJ6eW5xbXAtemN1MTA2LXJldkEiCj4+ICsKPj4gCj4+IEkgdHJpZWQgeW91ciBtZXRob2Qgb2Yg
Y3JlYXRpbmcgYSB1Ym9vdCBmcmFnbWVudCBjb25maWcgdGhhdCBqdXN0IG1vZGlmaWVzIHRoZSBD
T05GSUdfREVGQVVMVF9ERVZJQ0VfVFJFRS4KPj4gCj4+IEhvd2V2ZXIsIHdoZW4gSSBidWlsZCwg
SSBnZXQgdGhlIGZvbGxvd2luZyBlcnJvcjoKPj4gCj4+IERldmljZSBUcmVlIFNvdXJjZSAoYXJj
aC9hcm0vZHRzL3Vuc2V0LmR0YikgaXMgbm90IGNvcnJlY3RseSBzcGVjaWZpZWQuCj4+IFBsZWFz
ZSBkZWZpbmUgJ0NPTkZJR19ERUZBVUxUX0RFVklDRV9UUkVFJwo+PiBvciBidWlsZCB3aXRoICdE
RVZJQ0VfVFJFRT08ZGV2aWNlX3RyZWU+JyBhcmd1bWVudAo+IAo+IFN0cmFuZ2UsIEkganVzdCBy
dW4gYSBidWlsZCB3aXRoIGN1cnJlbnQgbWFzdGVyICsgeW91ciBwYXRjaCBhbmQgaXQKPiBzdWNj
ZWVkZWQuCj4gCj4+IEkgY2FuIHNlZSB0aGF0IHRoZSBVLUJvb3QgLmNvbmZpZyBpcyBjb3JyZWN0
bHkgbW9kaWZpZWQgd2l0aAo+PiBDT05GSUdfREVGQVVMVF9ERVZJQ0VfVFJFRT0ienlucW1wLXpj
dTEwNi1yZXZBIgo+IAo+IEhlcmUgdG9vLgo+IAo+IE1heWJlIHRyeSBhIGNvbXBsZXRlbHkgY2xl
YW4gYnVpbGQuIFdoYXQgSSB1c3VhbGx5IGRvIGlzCj4gCj4gZ2l0IGNsZWFuIC14ZGYgIyBzaW1p
bGFyIHRvICdtYWtlIGNsZWFuJyBidXQgZmFzdGVyCj4gbWFrZSB6eW5xbXBfemN1MTA2X2RlZmNv
bmZpZwo+IG1ha2UKPiAKPiBBbmQgd2h5IG5vdCwgZG8gaXQgaW4gZG9ja2VyLgoKWW91IGNhbiBh
bHNvIGRvOgokIG1ha2UgTz0uLi9vdXRwdXQtenlucW1wLXpjdTEwNgokIGNkIC4uL291dHB1dC16
eW5xbXAtemN1MTA2CiQgbWFrZQoKVGhpcyB3YXkgeW91IGtlZXAgdGhlIGJ1aWxkIGZvbGRlciBz
ZXBhcmF0ZWQgZnJvbSB0aGUgYnVpbGRyb290IHNvdXJjZSBjb2RlLgpJIGFsd2F5cyBkbyB0aGF0
IHdheSBiZWNhdXNlIGl04oCZcyBlYXNpZXIgdG8gc2VhcmNoIGluIGJ1aWxkcm9vdCBmb2xkZXIg
dGhlbiB3aXRob3V0IHRoZSBuZWVkIHRvIGZpbHRlciBvdXQgdGhlIG91dHB1dCBkaXJlY3Rvcnku
CgpNYXliZSB3ZSBzaG91bGQgaW1wbGVtZW50IHRoaXMgaW4gdXRpbHMvZG9ja2VyLXJ1biBieSBw
YXNzaW5nIGFuIGFyZ3VtZW50LApzbyB3ZSBkb27igJl0IHBvbGx1dGUgYnVpbGRyb290IGZvbGRl
ci4KV2hhdCBhYm91dCB0aGF0IEx1Y2EgYW5kIEFsbD8KCkJlc3QgcmVnYXJkcwpHaXVsaW8KCj4g
Cj4gLS0gCj4gTHVjYQo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCj4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3Jn
Cj4gaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJv
b3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVp
bGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
