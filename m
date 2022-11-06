Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68A8DC4332F
	for <buildroot@archiver.kernel.org>; Sun,  6 Nov 2022 15:56:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id ED08681363;
	Sun,  6 Nov 2022 15:56:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ED08681363
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id svL1JqWcDBev; Sun,  6 Nov 2022 15:56:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0643881351;
	Sun,  6 Nov 2022 15:56:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0643881351
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 462C81BF287
 for <buildroot@lists.busybox.net>; Sun,  6 Nov 2022 15:56:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 20ACB40321
 for <buildroot@lists.busybox.net>; Sun,  6 Nov 2022 15:56:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 20ACB40321
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wQThMrCq3_4c for <buildroot@lists.busybox.net>;
 Sun,  6 Nov 2022 15:56:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B28BA402EF
Received: from mail-qv1-xf2c.google.com (mail-qv1-xf2c.google.com
 [IPv6:2607:f8b0:4864:20::f2c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B28BA402EF
 for <buildroot@buildroot.org>; Sun,  6 Nov 2022 15:56:13 +0000 (UTC)
Received: by mail-qv1-xf2c.google.com with SMTP id x13so6635492qvn.6
 for <buildroot@buildroot.org>; Sun, 06 Nov 2022 07:56:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wSaO6yUgdycEVOd4h/QA+Tsm6+I8GEIrT7tlgeZunmo=;
 b=KX7Hri0M34rzL5NtIlwTWjzRbRag4gobNRv6/W/I4rGPVaU2GI96ZbBY+VuvWzFOeC
 6JQTynKW8jUA6nhs8vuGW30EuWNmZNesovEjfeX47L7jpCYxdgPwMXtpFT82dy/wHDep
 Q7kRRy8uGXOMFYYJ3WDFa+LKvRmbLGw8i9siK38wP89GGj35+3L1T3yifv2Vy3fUUHa3
 sZmA2Z7QFXtwZwOEXrmS4KZBM8yr5KOwHkxaS6+bXbBIdqogQ8/9nKWov4O0N7Kh0Ze6
 7wmeEuE4m65UkWmqJ8XfOws6wuDYcUsik9W2YWiH39dlZ9Ysp+BcVRnnLzCRjU5TKHKn
 4xkg==
X-Gm-Message-State: ACrzQf0cUa7DDpf3BlFT8mGH2rQwPzp5UUrjHXS8fHOTFDBs1hljzENW
 J6vQq7vRgP5JjMI2EDAc9piR1GOkR4jB/+q7snk=
X-Google-Smtp-Source: AMsMyM6MHaxOX4rbSXHtq7iVIPfg4+MTSGq42rTEvmDYs6Dc/lPRsmisDr5tob0xt/wueFdQQGG+Hr8nUYQEIbrQTII=
X-Received: by 2002:ad4:5c47:0:b0:4c4:9b7d:ddd9 with SMTP id
 a7-20020ad45c47000000b004c49b7dddd9mr6505361qva.43.1667750172474; Sun, 06 Nov
 2022 07:56:12 -0800 (PST)
MIME-Version: 1.0
References: <cover.1666122184.git.yann.morin@orange.com>
 <27491_1666122194_634F01D2_27491_495_1_cf89a104edc507c063e6f4716cc859891b489d27.1666122184.git.yann.morin@orange.com>
In-Reply-To: <27491_1666122194_634F01D2_27491_495_1_cf89a104edc507c063e6f4716cc859891b489d27.1666122184.git.yann.morin@orange.com>
From: Norbert Lange <nolange79@gmail.com>
Date: Sun, 6 Nov 2022 16:56:01 +0100
Message-ID: <CADYdroNgbAUMPUj9O5g=aq_bzBxm-wYbiQ266ZO3Por=oJU1uw@mail.gmail.com>
To: yann.morin@orange.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wSaO6yUgdycEVOd4h/QA+Tsm6+I8GEIrT7tlgeZunmo=;
 b=haj1kKUylWlTnBEb3fyEYBDNtyYdyAKAE5lAz/A1p/sfuckmzmMOqyjiFBPgJedtaE
 N8unwvZA2nxcJzYGqjC8Jl8P3iWxhSyOUu7tqcptbZEGa583CXwAMB873LwsmzPP9xLV
 XFfEAi4MZIexjH8JK439qzfOq0EpIWSm0bo32ur0WrjqgxidJhtWIH6HtqFdK6UJ+wpb
 eXVneUttX98uIqnKi7+ZUkCHNWMT09bXAMZ7n7ZqRCpk3ZQLW7UlL/VCURKkQ/HUUqv9
 nh6I+sSQh3nIRyZuFKq8XVW2RsqVAw9zTJU3oaJbA4barAKJUSOReTO9x7x2uc2U6l0h
 KEsQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=haj1kKUy
Subject: Re: [Buildroot] [PATCH 2/6 v3] package/skeleton-systemd:
 systemd-ify mounting /var tmpfs with ro rootfs
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
Cc: Romain Naour <romain.naour@smile.fr>,
 =?UTF-8?B?SmXMgXJlzIFteSBSb3Nlbg==?= <jeremy.rosen@smile.fr>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QW0gRGkuLCAxOC4gT2t0LiAyMDIyIHVtIDIxOjQzIFVociBzY2hyaWViIDx5YW5uLm1vcmluQG9y
YW5nZS5jb20+Ogo+Cj4gVG8gbW91bnQgb3VyIC92YXIgdG1wZnMgd2hlbiB0aGUgcm9vdGZzIGlz
IG1vdW50ZWQgcmVhZC1vbmx5IChyZWFsbHksCj4gbm90IHJlbW91bnRlZCByZXFkLXdyaXRlKSwg
d2UgdXNlIGFuIGVudHJ5IGluIGZzdGFiLgo+Cj4gSG93ZXZlciwgL2V0YyBjb3VsZCBhbHNvIGJl
IGEgdG1wZnMgKGZvciBmdWxsIHN0YXRlLWxlc3Mgc3lzdGVtcywgb3IKPiBlYXN5IGZhY3Rvcnkt
cmVzZXQsIHNlZSBbMF0pLiBJdCBhbHNvIHByZXZlbnRzIGVhc2lseSBvcmRldGluZyBvdGhlcgo+
IHN5c3RlbWQgdW5pdHMgdW50aWwgYWZ0ZXIgL3ZhciBpcyBtb3VudGVkIDVub3QgaW1wb3NzaWJs
ZSwgYnV0IGxlc3MKPiBlYXN5KS4KPgo+IFNvLCB3ZSByZWdpc3RlciAvdmFyIGFzIGEgc3lzdGVt
ZCBtb3VudCB1bml0LCBzbyB0aGF0IHdlIGNhbiBhbHNvIGhhdmUKPiB0aGUgL3ZhciBmYWN0b3J5
IHBvcHVsYXRlZCBhbmQgZnVuY3Rpb25hbCBldmVuIHdoZW4gL2V0YyBpcyBlbXB0eS4gVGhlCj4g
dmFyLm1vdW50IHVuaXQgaXMgaGVhdmlseSBtb2RlbGxlZCBhZnRlciBzeXN0ZW1kJ3Mgb3duIHRt
cC5tb3VudCBvbmUsIHNvCj4gd2UgY2FycnkgdGhlIHNhbWUgbGljZW5zZSBmb3IgdGhhdCBmaWxl
IChpbiBjYXNlIHRoYXQgbWF5IGFwcGx5KS4gV2UgYWRkCj4gYW4gZXhwbGljaXQgcmV2ZXJzZSBk
ZXBlbmRlbmN5IHRvIHN5c3RlbWQtdG1wZmlsZXMtc2V0dXAuc2VydmljZSwgdG8KPiBlbnN1cmUg
L3ZhciBpcyBtb3VudGVkIGJlZm9yZSB3ZSB0cnkgdG8gcG9wdWxhdGUgaXQuCj4KPiBUaGlzIGhh
cyB0d28gc2lkZSBlZmZlY3RzOgo+ICAgLSBhcyBoaW50ZWQgcHJldmlvdXNseSwgaXQgc2ltcGxp
ZmllcyB3cml0aW5nIG90aGVyIHN5c3RlbWQgdW5pdHMgdG8KPiAgICAgb3JkZXIgdGhlbSBhZnRl
ciAvdmFyIGlzIG1vdW50ZWQKPiAgIC0gcmVwbGFjZSBpdCB3aXRoIHRoZWlyIG93biwgd2hpY2gg
bW91bnRzIGFuIGFjdHVhbCBmaWxlc3lzdGVtCj4KPiBbMF0gaHR0cDovLzBwb2ludGVyLmRlL2Js
b2cvcHJvamVjdHMvc3RhdGVsZXNzLmh0bWwKPgo+IFNpZ25lZC1vZmYtYnk6IFlhbm4gRS4gTU9S
SU4gPHlhbm4ubW9yaW5Ab3JhbmdlLmNvbT4KPiBDYzogTm9yYmVydCBMYW5nZSA8bm9sYW5nZTc5
QGdtYWlsLmNvbT4KPiBDYzogUm9tYWluIE5hb3VyIDxyb21haW4ubmFvdXJAc21pbGUuZnI+Cj4g
Q2M6IEplzIFyZcyBbXkgUm9zZW4gPGplcmVteS5yb3NlbkBzbWlsZS5mcj4KPiBbeWFubi5tb3Jp
bi4xOTk4QGZyZWUuZnI6Cj4gICAtIHNwbGl0IG9yaWdpbmFsIHBhdGNoIGluIHR3bwo+ICAgLSB0
aGlzIG9uZSBvbmx5IGhhbmRsZXMgY29udmVydGluZyAvdmFyIG1vdW50aW5nIGludG8gYSBzeXN0
ZW1kIHVuaXQKPiAgIC0gYWRhcHQgY29tbWl0IGxvZyBhY2NvcmRpbmdseQo+IF0KPiBTaWduZWQt
b2ZmLWJ5OiBZYW5uIEUuIE1PUklOIDx5YW5uLm1vcmluLjE5OThAZnJlZS5mcj4KPiAtLS0KPiAg
Li4uL3NrZWxldG9uLWluaXQtc3lzdGVtZC5tayAgICAgICAgICAgICAgICAgICB8ICAzICsrLQo+
ICBwYWNrYWdlL3NrZWxldG9uLWluaXQtc3lzdGVtZC92YXIubW91bnQgICAgICAgIHwgMTggKysr
KysrKysrKysrKysrKysrCj4gIDIgZmlsZXMgY2hhbmdlZCwgMjAgaW5zZXJ0aW9ucygrKSwgMSBk
ZWxldGlvbigtKQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9za2VsZXRvbi1pbml0LXN5
c3RlbWQvdmFyLm1vdW50Cj4KPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9za2VsZXRvbi1pbml0LXN5
c3RlbWQvc2tlbGV0b24taW5pdC1zeXN0ZW1kLm1rIGIvcGFja2FnZS9za2VsZXRvbi1pbml0LXN5
c3RlbWQvc2tlbGV0b24taW5pdC1zeXN0ZW1kLm1rCj4gaW5kZXggN2I2NjczMmVmNC4uOTcwOTUx
ZDU1MyAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL3NrZWxldG9uLWluaXQtc3lzdGVtZC9za2VsZXRv
bi1pbml0LXN5c3RlbWQubWsKPiArKysgYi9wYWNrYWdlL3NrZWxldG9uLWluaXQtc3lzdGVtZC9z
a2VsZXRvbi1pbml0LXN5c3RlbWQubWsKPiBAQCAtMzAsNyArMzAsNiBAQCBlbHNlCj4gICMgYmFj
ayB0aGVyZSBieSB0aGUgdG1wZmlsZXMuZCBtZWNoYW5pc20uCj4gIGRlZmluZSBTS0VMRVRPTl9J
TklUX1NZU1RFTURfUk9PVF9ST19PUl9SVwo+ICAgICAgICAgZWNobyAiL2Rldi9yb290IC8gYXV0
byBybyAwIDEiID4kKFRBUkdFVF9ESVIpL2V0Yy9mc3RhYgo+IC0gICAgICAgZWNobyAidG1wZnMg
L3ZhciB0bXBmcyBtb2RlPTE3NzcgMCAwIiA+PiQoVEFSR0VUX0RJUikvZXRjL2ZzdGFiCj4gIGVu
ZGVmCj4KPiAgZGVmaW5lIFNLRUxFVE9OX0lOSVRfU1lTVEVNRF9QUkVfUk9PVEZTX1ZBUgo+IEBA
IC01Miw2ICs1MSw4IEBAIGRlZmluZSBTS0VMRVRPTl9JTklUX1NZU1RFTURfUFJFX1JPT1RGU19W
QVIKPiAgICAgICAgICAgICAgICAgICAgICAgICB8fCBleGl0IDE7IFwKPiAgICAgICAgICAgICAg
ICAgZmk7IFwKPiAgICAgICAgIGRvbmUgPiQoVEFSR0VUX0RJUikvdXNyL2xpYi90bXBmaWxlcy5k
L2J1aWxkcm9vdC1mYWN0b3J5LmNvbmYKPiArICAgICAgICQoSU5TVEFMTCkgLUQgLW0gMDY0NCAk
KFNLRUxFVE9OX0lOSVRfU1lTVEVNRF9QS0dESVIpL3Zhci5tb3VudCBcCj4gKyAgICAgICAgICAg
ICAgICQoVEFSR0VUX0RJUikvdXNyL2xpYi9zeXN0ZW1kL3N5c3RlbS92YXIubW91bnQKPiAgZW5k
ZWYKPiAgU0tFTEVUT05fSU5JVF9TWVNURU1EX1JPT1RGU19QUkVfQ01EX0hPT0tTICs9IFNLRUxF
VE9OX0lOSVRfU1lTVEVNRF9QUkVfUk9PVEZTX1ZBUgo+Cj4gZGlmZiAtLWdpdCBhL3BhY2thZ2Uv
c2tlbGV0b24taW5pdC1zeXN0ZW1kL3Zhci5tb3VudCBiL3BhY2thZ2Uvc2tlbGV0b24taW5pdC1z
eXN0ZW1kL3Zhci5tb3VudAo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAw
MC4uNmIxNjVkZmY2ZAo+IC0tLSAvZGV2L251bGwKPiArKysgYi9wYWNrYWdlL3NrZWxldG9uLWlu
aXQtc3lzdGVtZC92YXIubW91bnQKPiBAQCAtMCwwICsxLDE4IEBACj4gKyMgU1BEWC1MaWNlbnNl
LUlkZW50aWZpZXI6IExHUEwtMi4xLW9yLWxhdGVyCj4gKyMgTW9kZWxsZWQgYWZ0ZXIgc3lzdGVt
ZCdzIHRtcC5tb3VudAo+ICsKPiArW1VuaXRdCj4gK0Rlc2NyaXB0aW9uPUJ1aWxkcm9vdCAvdmFy
IHRtcGZzCj4gK0RlZmF1bHREZXBlbmRlbmNpZXM9bm8KPiArQ29uZmxpY3RzPXVtb3VudC50YXJn
ZXQKPiArQmVmb3JlPWJhc2ljLnRhcmdldCBsb2NhbC1mcy50YXJnZXQgdW1vdW50LnRhcmdldCBz
eXN0ZW1kLXRtcGZpbGVzLXNldHVwLnNlcnZpY2UKCkNoYW5nZSBpdCB0bwpCZWZvcmU9bG9jYWwt
ZnMudGFyZ2V0IHVtb3VudC50YXJnZXQKCkFsbCBvdGhlciBkZXBlbmRlbmNpZXMgYXJlIGltcGxp
Y2l0Cgo+ICtBZnRlcj1zd2FwLnRhcmdldAo+ICsKPiArW01vdW50XQo+ICtXaGF0PXRtcGZzCj4g
K1doZXJlPS92YXIKPiArVHlwZT10bXBmcwo+ICtPcHRpb25zPW1vZGU9MTc3NyxzdHJpY3RhdGlt
ZSxub3N1aWQsbm9kZXYsc2l6ZT01MCUlLG5yX2lub2Rlcz0xbQo+ICsKPiArW0luc3RhbGxdCj4g
K1dhbnRlZEJ5PWJhc2ljLnRhcmdldAoKRHJvcCB0aGUgaW5zdGFsbCBzZWN0aW9uLgoKV2hpbGUg
dGVzdGluZyBzb21lIG90aGVyIG92ZXJsYXkgc29sdXRpb25zIEkgZm91bmQgb3V0IHRoYXQKYSAv
dmFyIG1vdW50IGNhbnQgYmUgcmVhc29uYWJseSBkaXNhYmxlZC4KV2hhdCBoYXBwZW5zIGlzIHRo
YXQgYmFzaWMudGFyZ2V0IHdpbGwgcHVsbCBpbiB2YXIubW91bnQsCnRoZSBvbmx5IG9wdGlvbiB0
byBkaXNhYmxlIGl0IHdvdWxkIGJlIG1hc2tpbmcgdmFyLm1vdW50CgoKPiAtLQo+IDIuMjUuMQo+
Cj4KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCj4KPiBDZSBtZXNzYWdlIGV0IHNlcyBwaWVjZXMgam9pbnRlcyBwZXV2ZW50
IGNvbnRlbmlyIGRlcyBpbmZvcm1hdGlvbnMgY29uZmlkZW50aWVsbGVzIG91IHByaXZpbGVnaWVl
cyBldCBuZSBkb2l2ZW50IGRvbmMKPiBwYXMgZXRyZSBkaWZmdXNlcywgZXhwbG9pdGVzIG91IGNv
cGllcyBzYW5zIGF1dG9yaXNhdGlvbi4gU2kgdm91cyBhdmV6IHJlY3UgY2UgbWVzc2FnZSBwYXIg
ZXJyZXVyLCB2ZXVpbGxleiBsZSBzaWduYWxlcgo+IGEgbCdleHBlZGl0ZXVyIGV0IGxlIGRldHJ1
aXJlIGFpbnNpIHF1ZSBsZXMgcGllY2VzIGpvaW50ZXMuIExlcyBtZXNzYWdlcyBlbGVjdHJvbmlx
dWVzIGV0YW50IHN1c2NlcHRpYmxlcyBkJ2FsdGVyYXRpb24sCj4gT3JhbmdlIGRlY2xpbmUgdG91
dGUgcmVzcG9uc2FiaWxpdGUgc2kgY2UgbWVzc2FnZSBhIGV0ZSBhbHRlcmUsIGRlZm9ybWUgb3Ug
ZmFsc2lmaWUuIE1lcmNpLgo+Cj4gVGhpcyBtZXNzYWdlIGFuZCBpdHMgYXR0YWNobWVudHMgbWF5
IGNvbnRhaW4gY29uZmlkZW50aWFsIG9yIHByaXZpbGVnZWQgaW5mb3JtYXRpb24gdGhhdCBtYXkg
YmUgcHJvdGVjdGVkIGJ5IGxhdzsKPiB0aGV5IHNob3VsZCBub3QgYmUgZGlzdHJpYnV0ZWQsIHVz
ZWQgb3IgY29waWVkIHdpdGhvdXQgYXV0aG9yaXNhdGlvbi4KPiBJZiB5b3UgaGF2ZSByZWNlaXZl
ZCB0aGlzIGVtYWlsIGluIGVycm9yLCBwbGVhc2Ugbm90aWZ5IHRoZSBzZW5kZXIgYW5kIGRlbGV0
ZSB0aGlzIG1lc3NhZ2UgYW5kIGl0cyBhdHRhY2htZW50cy4KPiBBcyBlbWFpbHMgbWF5IGJlIGFs
dGVyZWQsIE9yYW5nZSBpcyBub3QgbGlhYmxlIGZvciBtZXNzYWdlcyB0aGF0IGhhdmUgYmVlbiBt
b2RpZmllZCwgY2hhbmdlZCBvciBmYWxzaWZpZWQuCj4gVGhhbmsgeW91Lgo+CgpHdWVzcyBpIGNh
bnQgYWNrIGl0IGNvbmRpdGlvbmFsbHksIHNvIGZhcjoKClJldmlld2VkLWJ5OiBOb3JiZXJ0IExh
bmdlIDxub2xhbmdlNzlAZ21haWwuY29tPgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJv
b3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxk
cm9vdAo=
