Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81229C433EF
	for <buildroot@archiver.kernel.org>; Wed, 12 Jan 2022 14:15:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2D31384B8D;
	Wed, 12 Jan 2022 14:15:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pLJOpOErUrmQ; Wed, 12 Jan 2022 14:15:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 513F984B8B;
	Wed, 12 Jan 2022 14:15:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6AC921BF2F6
 for <buildroot@lists.busybox.net>; Wed, 12 Jan 2022 14:15:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 682B841626
 for <buildroot@lists.busybox.net>; Wed, 12 Jan 2022 14:15:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=unikie-com.20210112.gappssmtp.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hyaZqE63H0E1 for <buildroot@lists.busybox.net>;
 Wed, 12 Jan 2022 14:15:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4DD7B41620
 for <buildroot@buildroot.org>; Wed, 12 Jan 2022 14:15:54 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id t24so10509704edi.8
 for <buildroot@buildroot.org>; Wed, 12 Jan 2022 06:15:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=unikie-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=bSsmkJg5c6k1tT5w6wQwMJtZiq6TD45r0VYurZ3UQVw=;
 b=gUF36yM0ILGxOaWgCLIvJHzkh3SPJgCsFoFYFfO4tQ4ojmCsaHtILXOxVbjdqT0I9o
 Guychl1Xaql1JFn6zz9gzWyu7YHPMbzViOOjCUIQw3Kx+Onmxyof/K+69rYtw03PIUBn
 c9axlhO5HQFr08O/P5+Vl6JymBs/Pl/NEMNYDGC2LRdMEJKHofBw9+n3Ys0FgM8lRGqo
 RuZpYGOhHSH2mzRe7TQweSVOSDuMvb1NL/xAZRF6FLlUkwnZXm4XF3gVHyOjPJKqg0JF
 MKqjnrQ/KpJ7J11RRKpIp4apLUODYYyHo2Qtm5hu4BUJGvUBThoDG7hwpdPgyC9yHpMj
 KVBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=bSsmkJg5c6k1tT5w6wQwMJtZiq6TD45r0VYurZ3UQVw=;
 b=PVbP6Nn379oxpOnKQ7WOOaZ0mATqA8cwcCnk0Zdygdig7oOo1tdTc9/Qx/mfbuhtYZ
 ce9nRIe0FkzYPAHZCS3cRPCFiX0rlTgxYXwpKGeMSIovhDoXv/JHlg/ci8HeBAn9sdbj
 Ul7MPAH8g5BzmueQOes6VLVkSsHT2iUlOJcHpJYbk6GyIRn3QXam5oTvDngqg+ePPwmc
 zb/tvyAYu1RSETIJxhJVqYliiFBQiWP8l/jRBN/cnFsXZQKLfHKQV20pdESo/UIMhZSc
 IZL+ZCRsPo3H89kGWnDPETCo1UTqDndE3Zuqn7yVi3Ssulihw1U8Wxf7XzFa2M2U75oQ
 QRdA==
X-Gm-Message-State: AOAM533Qy4dubPmbJnu99yotvykYDqAZiZ0mW3g2RjNN9jZNquAZGp1R
 SP/09Iqx6YI76Y4zVXeBAf//wjE0ZobLIi7wTszl5nhCNVPMro6Aaio=
X-Google-Smtp-Source: ABdhPJxT1FktQkjV0Nmd0QpBrMS7CbF781qN5rrEQu0nylGaPHG4wZ8Vkt6lfYz+jkeaAWB0k+kMY3xmnwd12FgBRvM=
X-Received: by 2002:a17:906:b353:: with SMTP id
 cd19mr7741793ejb.8.1641996952405; 
 Wed, 12 Jan 2022 06:15:52 -0800 (PST)
MIME-Version: 1.0
References: <20211210141209.1812043-1-jose.pekkarinen@unikie.com>
 <20211210141209.1812043-2-jose.pekkarinen@unikie.com>
 <20220105214129.2f5fffae@windsurf>
In-Reply-To: <20220105214129.2f5fffae@windsurf>
From: =?UTF-8?Q?Jos=C3=A9_Pekkarinen?= <jose.pekkarinen@unikie.com>
Date: Wed, 12 Jan 2022 16:15:16 +0200
Message-ID: <CAJPV9MpzSPFyj-AMO+_iCNZ-PVp+DcKaH1yrMHvO2TawoUPa1g@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [Buildroot] [PATCH 2/7] package/minijail: new package
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
Cc: buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gV2VkLCBKYW4gNSwgMjAyMiBhdCAxMDo0MSBQTSBUaG9tYXMgUGV0YXp6b25pCjx0aG9tYXMu
cGV0YXp6b25pQGJvb3RsaW4uY29tPiB3cm90ZToKPgo+IEhlbGxvIEpvc8OpLAo+Cj4gT24gRnJp
LCAxMCBEZWMgMjAyMSAxNjoxMjowNCArMDIwMAo+IEpvc8OpIFBla2thcmluZW4gPGpvc2UucGVr
a2FyaW5lbkB1bmlraWUuY29tPiB3cm90ZToKPgo+ID4gVGhpcyBwYXRjaCBhZGRzIGEgbmV3IHBh
Y2thZ2UgZm9yIG1pbmlqYWlsLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IEpvc8OpIFBla2thcmlu
ZW4gPGpvc2UucGVra2FyaW5lbkB1bmlraWUuY29tPgo+Cj4gSSB3YW50ZWQgdG8gYXBwbHkgYWZ0
ZXIgZml4aW5nIHRoZSBpc3N1ZXMgcG9pbnRlZCBieSBvdGhlcnMsIGJ1dCB0aGVyZQo+IGFyZSBp
biBmYWN0IG90aGVyIGlzc3Vlcywgd2hpY2ggSSBjYW5ub3QgcmVzb2x2ZSBkaXJlY3RseS4gU2Vl
IGJlbG93Lgo+Cj4gPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9taW5pamFpbC8wMDAxLUZpeC1wcmxp
bWl0LWNhbGwucGF0Y2ggYi9wYWNrYWdlL21pbmlqYWlsLzAwMDEtRml4LXBybGltaXQtY2FsbC5w
YXRjaAo+ID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiA+IGluZGV4IDAwMDAwMDAwMDAuLjlmNjkw
MmVkNDMKPiA+IC0tLSAvZGV2L251bGwKPiA+ICsrKyBiL3BhY2thZ2UvbWluaWphaWwvMDAwMS1G
aXgtcHJsaW1pdC1jYWxsLnBhdGNoCj4gPiBAQCAtMCwwICsxLDI5IEBACj4gPiArRnJvbSAwOTM0
OGYwNjEwNGJmODEwMWEyNGEwYmNlMjM1YTc1YTIxNGUxMzgwIE1vbiBTZXAgMTcgMDA6MDA6MDAg
MjAwMQo+ID4gK0Zyb206ID0/VVRGLTg/cT9Kb3M9QzM9QTk9MjBQZWtrYXJpbmVuPz0gPGpvc2Uu
cGVra2FyaW5lbkB1bmlraWUuY29tPgo+ID4gK0RhdGU6IEZyaSwgMTAgRGVjIDIwMjEgMTQ6MjA6
MzAgKzAyMDAKPiA+ICtTdWJqZWN0OiBbUEFUQ0hdIEZpeCBwcmxpbWl0IGNhbGwKPgo+IFdoYXQg
YXJlIHlvdSAiZml4aW5nIj8gWW91J3JlIHJlcGxhY2luZyBhIHBybGltaXQoKSBjYWxsIGJ5IGJ5
Cj4gc2V0cmxpbWl0KCksIGJ1dCB3aHk/IFdoYXQgcHJvYmxlbSBkb2VzIGl0IHNvbHZlPyBXaHkg
aXMgaXQgY29ycmVjdCB0bwo+IGRvIHRoYXQ/CgogICAgVGhlIHByb2JsZW0gaXMgc2hvd24gZnJv
bSBhcyB0aGlzOgoKL2hvbWUvcGVra2FyaS9ici10ZXN0LXBrZy9ib290bGluLWFybXY1LXVjbGli
Yy9idWlsZC9taW5pamFpbC1saW51eC12MTcvbGlibWluaWphaWwuYzoKSW4gZnVuY3Rpb24g4oCY
c2V0X3JsaW1pdHNfb3JfZGll4oCZOgovaG9tZS9wZWtrYXJpL2JyLXRlc3QtcGtnL2Jvb3RsaW4t
YXJtdjUtdWNsaWJjL2J1aWxkL21pbmlqYWlsLWxpbnV4LXYxNy9saWJtaW5pamFpbC5jOjE5MTE6
NzoKZXJyb3I6IGltcGxpY2l0IGRlY2xhcmF0aW9uIG9mIGZ1bmN0aW9uIOKAmHBybGltaXTigJk7
IGRpZCB5b3UgbWVhbgrigJhzZXRybGltaXTigJk/IFstV2Vycm9yPWltcGxpY2l0LWZ1bmN0aW9u
LWRlY2xhcmF0aW9uXQoxOTExIHwgICBpZiAocHJsaW1pdChqLT5pbml0cGlkLCBqLT5ybGltaXRz
W2ldLnR5cGUsICZsaW1pdCwgTlVMTCkpCiAgICAgfCAgICAgICBefn5+fn5+CiAgICAgfCAgICAg
ICBzZXRybGltaXQKCiAgICBTbyBJIGZvbGxvd2VkIHRoZSBzdWdnZXN0aW9uLCBubyBtb3JlLCBu
byBsZXNzLgoKPiA+IGRpZmYgLS1naXQgYS9wYWNrYWdlL21pbmlqYWlsLzAwMDItRml4LXN0YXRp
Yy1hc3NlcnQucGF0Y2ggYi9wYWNrYWdlL21pbmlqYWlsLzAwMDItRml4LXN0YXRpYy1hc3NlcnQu
cGF0Y2gKPiA+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gPiBpbmRleCAwMDAwMDAwMDAwLi40ODEz
OWU4YmFhCj4gPiAtLS0gL2Rldi9udWxsCj4gPiArKysgYi9wYWNrYWdlL21pbmlqYWlsLzAwMDIt
Rml4LXN0YXRpYy1hc3NlcnQucGF0Y2gKPiA+IEBAIC0wLDAgKzEsMzAgQEAKPiA+ICtGcm9tIGI1
ZDkxYjc5Mzk0Mjc0N2U1MTI2ZTc1YWJjYTJlZWJhZDYwYWI0NzggTW9uIFNlcCAxNyAwMDowMDow
MCAyMDAxCj4gPiArRnJvbTogPT9VVEYtOD9xP0pvcz1DMz1BOT0yMFBla2thcmluZW4/PSA8am9z
ZS5wZWtrYXJpbmVuQHVuaWtpZS5jb20+Cj4gPiArRGF0ZTogRnJpLCAxMCBEZWMgMjAyMSAxNDoy
MTozOCArMDIwMAo+ID4gK1N1YmplY3Q6IFtQQVRDSF0gRml4IHN0YXRpYyBhc3NlcnQKPiA+ICtN
SU1FLVZlcnNpb246IDEuMAo+ID4gK0NvbnRlbnQtVHlwZTogdGV4dC9wbGFpbjsgY2hhcnNldD1V
VEYtOAo+ID4gK0NvbnRlbnQtVHJhbnNmZXItRW5jb2Rpbmc6IDhiaXQKPiA+ICsKPiA+ICtTaWdu
ZWQtb2ZmLWJ5OiBKb3PDqSBQZWtrYXJpbmVuIDxqb3NlLnBla2thcmluZW5AdW5pa2llLmNvbT4K
PiA+ICstLS0KPiA+ICsgbGlibWluaWphaWwuYyB8IDMgLS0tCj4gPiArIDEgZmlsZSBjaGFuZ2Vk
LCAzIGRlbGV0aW9ucygtKQo+ID4gKwo+ID4gK2RpZmYgLS1naXQgYS9saWJtaW5pamFpbC5jIGIv
bGlibWluaWphaWwuYwo+ID4gK2luZGV4IDQ1ZjEzM2UuLjgzMjM3NDIgMTAwNjQ0Cj4gPiArLS0t
IGEvbGlibWluaWphaWwuYwo+ID4gKysrKyBiL2xpYm1pbmlqYWlsLmMKPiA+ICtAQCAtMjYyMCw5
ICsyNjIwLDYgQEAgc3RhdGljIGludCBmZF9pc19vcGVuKGludCBmZCkKPiA+ICsgICAgIHJldHVy
biBmY250bChmZCwgRl9HRVRGRCkgIT0gLTEgfHwgZXJybm8gIT0gRUJBREY7Cj4gPiArIH0KPiA+
ICsKPiA+ICstc3RhdGljX2Fzc2VydChGRF9TRVRTSVpFID49IE1BWF9QUkVTRVJWRURfRkRTICog
MiAtIDEsCj4gPiArLSAgICAgICAgICAiSWYgdHJ1ZSwgZW5zdXJlX25vX2ZkX2NvbmZsaWN0IHdp
bGwgYWx3YXlzIGZpbmQgYW4gdW51c2VkIGZkLiIpOwo+Cj4gWW91J3JlIG5vdCBmaXhpbmcgdGhl
IHN0YXRpY19hc3NlcnQoKSBoZXJlIGJ1dCBzaW1wbHkgZHJvcHBpbmcgaXQuIFdoeT8KPiBXaGVu
IGRvZXMgaXQgZmFpbD8gV2hhdCBpcyB0aGUgcHJvYmxlbSB3aXRoIGl0PyBXaHkgaXMgaXQgc2Fm
ZSB0byBkcm9wCj4gaXQ/CgogICAgSXQgZmFpbHMgbGlrZSB0aGlzOgoKL2hvbWUvcGVra2FyaS9i
ci10ZXN0LXBrZy9ib290bGluLWFybXY1LXVjbGliYy9idWlsZC9taW5pamFpbC1saW51eC12MTcv
bGlibWluaWphaWwuYzoyNjIzOjE1OgplcnJvcjogZXhwZWN0ZWQgZGVjbGFyYXRpb24gc3BlY2lm
aWVycyBvciDigJguLi7igJkgYmVmb3JlIG51bWVyaWMKY29uc3RhbnQKMjYyMyB8IHN0YXRpY19h
c3NlcnQoRkRfU0VUU0laRSA+PSBNQVhfUFJFU0VSVkVEX0ZEUyAqIDIgLSAxLAogICAgIHwgICAg
ICAgICAgICAgICBefn5+fn5+fn5+Ci9ob21lL3Bla2thcmkvYnItdGVzdC1wa2cvYm9vdGxpbi1h
cm12NS11Y2xpYmMvYnVpbGQvbWluaWphaWwtbGludXgtdjE3L2xpYm1pbmlqYWlsLmM6MjYyNDo4
OgplcnJvcjogZXhwZWN0ZWQgZGVjbGFyYXRpb24gc3BlY2lmaWVycyBvciDigJguLi7igJkgYmVm
b3JlIHN0cmluZyBjb25zdGFudAoyNjI0IHwgICAgICAgICJJZiB0cnVlLCBlbnN1cmVfbm9fZmRf
Y29uZmxpY3Qgd2lsbCBhbHdheXMgZmluZCBhbiB1bnVzZWQgZmQuIik7CiAgICAgfCAgICAgICAg
Xn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+
fn5+fn5+CgogICAgU28gbXkgdW5kZXJzdGFuZGluZyBpcyB0aGF0IHRoaXMgcGxhdGZvcm0gbWF5
CmRlZmluZSBzdGF0aWNfYXNzZXJ0IGluIGEgZGlmZmVyZW50IG1hbm5lciwgYW5kIEkKZmluZCBu
byB0cmFjZXMgb2YgdGhlIHB1cnBvc2Ugb2YgdGhhdCBpc29sYXRlZCBhc3NlcnQsCnNvIHRoZSBl
YXNpZXIgd2F5IHRvIGdldCBhcm91bmQgdGhpcyB3YXMgcmVtb3ZpbmcgaXQuCgogICAgQmVzdCBy
ZWdhcmRzCgogICAgSm9zw6kuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcK
aHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
