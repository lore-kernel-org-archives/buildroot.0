Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D17B5C433F5
	for <buildroot@archiver.kernel.org>; Mon, 21 Feb 2022 22:05:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4D531408DF;
	Mon, 21 Feb 2022 22:05:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Jr9ahisnCf-p; Mon, 21 Feb 2022 22:05:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9C806408D7;
	Mon, 21 Feb 2022 22:05:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6BFDF1BF3A7
 for <buildroot@lists.busybox.net>; Mon, 21 Feb 2022 22:05:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5ABB960BE0
 for <buildroot@lists.busybox.net>; Mon, 21 Feb 2022 22:05:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3ddrHG4xgTUq for <buildroot@lists.busybox.net>;
 Mon, 21 Feb 2022 22:05:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oo1-xc2d.google.com (mail-oo1-xc2d.google.com
 [IPv6:2607:f8b0:4864:20::c2d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 17B0D6068F
 for <buildroot@buildroot.org>; Mon, 21 Feb 2022 22:05:09 +0000 (UTC)
Received: by mail-oo1-xc2d.google.com with SMTP id
 k13-20020a4a948d000000b003172f2f6bdfso14974292ooi.1
 for <buildroot@buildroot.org>; Mon, 21 Feb 2022 14:05:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=M/hb7ZdC5t8wwP/XobvFE9H9icGXKcGkO2i3RKKWRLI=;
 b=orDusXny3qOW8IJYEKjKhaV0eK1hAQ5K+QR8NRb6DCVPV36JKnS+L6gxeu8UdwgN3C
 cZG+n3PB06gGPzAUDIGMCqpPxai455izYaQpRiDQYmrPPjqzLM4nsVHjGuJo/xmWxK5J
 auCiH2dVdjDlILpvCLmNAo6q8cQJC+/cL59rnuj1u8dJN6hG4Y+92cJwZ4ZxJ8nmYhXy
 kE1VsYplrVc4a6NUcntxjymwRrWAHVPXyCU4daVZ0o9wkdmr1j5i6k3aZ2bnlOPR6Am8
 ofHnJtLzgENNXYEjnfb1zSdhj1QWZdXu+TmVhQiz6+7k5vmCtNzD8txHISJJVlrC74e5
 cXqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=M/hb7ZdC5t8wwP/XobvFE9H9icGXKcGkO2i3RKKWRLI=;
 b=F0T6u2FZrU/p2wNfGm8MA1ndcbmSH3PyvjWo8km3QispEBT4i06cfDydE42/+P7tf1
 +E8+bJqAR16dQCjQZuh3qrkEPwT28yrrBuQyLCF9oH92ugpCEeIU1TVg1IDq5DJMZUkO
 r3Pp1ie1Yl6zgqjPF/Jp88frplIHITa0GqeIW/Fly+HCqE9BQsMwvMIPkF0r8/552sXF
 XuEyxuZCUcSjiESJc9qXHm1r17gFRe9evQXwDnmoyfEVTqsUjFE5S8EkNp1aSMzM+2q5
 pgtI1c1PY2nmOiE0rgxVXfOMONmNF41cscdLxxuqbxA062uXUzXtdQxJ/0FTIe/QrFG3
 czYg==
X-Gm-Message-State: AOAM5305r0Qu/zH/kDCs9u89eT1BwEftXeOkraVcOMX+ZpYXfYUDymmW
 satP4JorO7S9DXGJa8MSPgJ4uCLvlf6aSAO9KUcvObnSXac=
X-Google-Smtp-Source: ABdhPJyK7+zlbSeeqdXNh1iE0jA+9/ixYwbvFh9wCQSCmfW4ftFbHvy9yJC/n7B7TOkPHQkWdQD6auZnTpkVTPfJr8E=
X-Received: by 2002:a05:6870:4410:b0:d3:1505:36c8 with SMTP id
 u16-20020a056870441000b000d3150536c8mr420717oah.300.1645481109062; Mon, 21
 Feb 2022 14:05:09 -0800 (PST)
MIME-Version: 1.0
References: <20220221172900.1937856-1-fontaine.fabrice@gmail.com>
 <20220221200044.GA2166282@scaer>
In-Reply-To: <20220221200044.GA2166282@scaer>
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 21 Feb 2022 23:05:02 +0100
Message-ID: <CAPi7W81diotLJ8DgiPtQgwQ0trhOmSSt806X-=XNjj5=cM8wWA@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Subject: Re: [Buildroot] [PATCH 1/1] package/re2: fix build with gcc <= 5
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
Cc: Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

WWFubiwKCkxlIGx1bi4gMjEgZsOpdnIuIDIwMjIgw6AgMjE6MDAsIFlhbm4gRS4gTU9SSU4gPHlh
bm4ubW9yaW4uMTk5OEBmcmVlLmZyPiBhIMOpY3JpdCA6Cj4KPiBGYWJyaWNlLCBBbGwsCj4KPiBP
biAyMDIyLTAyLTIxIDE4OjI5ICswMTAwLCBGYWJyaWNlIEZvbnRhaW5lIHNwYWtlIHRodXNseToK
PiA+IEZpeCB0aGUgZm9sbG93aW5nIGJ1aWxkIGZhaWx1cmUgd2l0aCBnY2MgPD0gNSByYWlzZWQg
c2luY2UgYnVtcCB0bwo+ID4gdmVyc2lvbiAyMDIyLTAyLTAxIGluIGNvbW1pdCBkMmNmOTFlMGM2
YTA4MjI2MWNjN2ViYjA2ZGZkYmQ3YmMyYzI5NTZmCj4gPiBhbmQKPiA+IGh0dHBzOi8vZ2l0aHVi
LmNvbS9nb29nbGUvcmUyL2NvbW1pdC9hMDIyY2MwYzU1YjA1MTk2MjlkNjRkNzc1ZTdhNTE5NWFm
MzRhNDc3Cj4gPgo+ID4gLi9yZTIvc3BhcnNlX2FycmF5Lmg6MjY2OjM3OiB3YXJuaW5nOiBkZWZh
dWx0ZWQgYW5kIGRlbGV0ZWQgZnVuY3Rpb25zIG9ubHkgYXZhaWxhYmxlIHdpdGggLXN0ZD1jKysx
MSBvciAtc3RkPWdudSsrMTEKPiA+ICBTcGFyc2VBcnJheTxWYWx1ZT46OlNwYXJzZUFycmF5KCkg
PSBkZWZhdWx0Owo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF4KPiA+
IC4vcmUyL3NwYXJzZV9hcnJheS5oOiBJbiBjb3B5IGNvbnN0cnVjdG9yICdyZTI6OlNwYXJzZUFy
cmF5PFZhbHVlPjo6U3BhcnNlQXJyYXkoY29uc3QgcmUyOjpTcGFyc2VBcnJheTxWYWx1ZT4mKSc6
Cj4gPiAuL3JlMi9zcGFyc2VfYXJyYXkuaDoyNzM6MzogZXJyb3I6ICdjb3B5X24nIGlzIG5vdCBh
IG1lbWJlciBvZiAnc3RkJwo+ID4gICAgc3RkOjpjb3B5X24oc3JjLnNwYXJzZV8uZGF0YSgpLCBz
cmMubWF4X3NpemUoKSwgc3BhcnNlXy5kYXRhKCkpOwo+ID4gICAgXgo+ID4KPiA+IEZpeGVzOgo+
ID4gIC0gaHR0cDovL2F1dG9idWlsZC5idWlsZHJvb3Qub3JnL3Jlc3VsdHMvOGViYmFjNjdmMzJm
ZTI0NDE2YTFmNzJhYWQwYWZkNDJiNTY3YjQwMwo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IEZhYnJp
Y2UgRm9udGFpbmUgPGZvbnRhaW5lLmZhYnJpY2VAZ21haWwuY29tPgo+ID4gLS0tCj4gPiAgcGFj
a2FnZS9yZTIvcmUyLm1rIHwgMTUgKysrKysrKysrKy0tLS0tCj4gPiAgMSBmaWxlIGNoYW5nZWQs
IDEwIGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBhL3Bh
Y2thZ2UvcmUyL3JlMi5tayBiL3BhY2thZ2UvcmUyL3JlMi5tawo+ID4gaW5kZXggNDEzOTJjYjE3
OS4uY2M1ZmVkNzFmYSAxMDA2NDQKPiA+IC0tLSBhL3BhY2thZ2UvcmUyL3JlMi5tawo+ID4gKysr
IGIvcGFja2FnZS9yZTIvcmUyLm1rCj4gPiBAQCAtMTAsMjAgKzEwLDI1IEBAIFJFMl9MSUNFTlNF
ID0gQlNELTMtQ2xhdXNlCj4gPiAgUkUyX0xJQ0VOU0VfRklMRVMgPSBMSUNFTlNFCj4gPiAgUkUy
X0lOU1RBTExfU1RBR0lORyA9IFlFUwo+ID4KPiA+ICtSRTJfTUFLRV9PUFRTID0gXAo+ID4gKyAg
ICAgJChUQVJHRVRfQ09ORklHVVJFX09QVFMpIFwKPiA+ICsgICAgIENYWEZMQUdTPSIkKFRBUkdF
VF9DWFhGTEFHUykgLXN0ZD1jKysxMSIgXAo+ID4gKyAgICAgcHJlZml4PS91c3IKPgo+IElzIHRo
ZXJlIGEgcmVhc29uIHRvIGhhdmUgJ3ByZWZpeCcgYmUgc2V0IGR1cmluZyB0aGUgYnVpbGQsIGlu
c3RlYWQgb2YKPiBqdXN0IHRoZSBpbnN0YWxsIHN0ZXBzPwpJIHRob3VnaHQgaXQgd2FzIGJldHRl
ciB0byBoYXZlIGl0IGluIGEgc2luZ2xlIHBsYWNlIGJ1dCBJJ2xsIHNlbmQgYSB2Mi4KPgo+IFJl
Z2FyZHMsCj4gWWFubiBFLiBNT1JJTi4KPgo+ID4gIGRlZmluZSBSRTJfQlVJTERfQ01EUwo+ID4g
LSAgICAgJChUQVJHRVRfTUFLRV9FTlYpICQoTUFLRSkgJChUQVJHRVRfQ09ORklHVVJFX09QVFMp
IFwKPiA+ICsgICAgICQoVEFSR0VUX01BS0VfRU5WKSAkKE1BS0UpICQoUkUyX01BS0VfT1BUUykg
XAo+ID4gICAgICAgICAgICAgICAtQyAkKEBEKSAkKGlmICQoQlIyX1NUQVRJQ19MSUJTKSxzdGF0
aWMpCj4gPiAgZW5kZWYKPiA+Cj4gPiAgZGVmaW5lIFJFMl9JTlNUQUxMX1NUQUdJTkdfQ01EUwo+
ID4gLSAgICAgJChUQVJHRVRfTUFLRV9FTlYpICQoTUFLRSkgJChUQVJHRVRfQ09ORklHVVJFX09Q
VFMpIFwKPiA+IC0gICAgICAgICAgICAgREVTVERJUj0iJChTVEFHSU5HX0RJUikiIHByZWZpeD0v
dXNyIC1DICQoQEQpIFwKPiA+ICsgICAgICQoVEFSR0VUX01BS0VfRU5WKSAkKE1BS0UpICQoUkUy
X01BS0VfT1BUUykgXAo+ID4gKyAgICAgICAgICAgICBERVNURElSPSIkKFNUQUdJTkdfRElSKSIg
LUMgJChARCkgXAo+ID4gICAgICAgICAgICAgICAkKGlmICQoQlIyX1NUQVRJQ19MSUJTKSxzdGF0
aWMtaW5zdGFsbCxpbnN0YWxsKQo+ID4gIGVuZGVmCj4gPgo+ID4gIGRlZmluZSBSRTJfSU5TVEFM
TF9UQVJHRVRfQ01EUwo+ID4gLSAgICAgJChUQVJHRVRfTUFLRV9FTlYpICQoTUFLRSkgJChUQVJH
RVRfQ09ORklHVVJFX09QVFMpIFwKPiA+IC0gICAgICAgICAgICAgREVTVERJUj0iJChUQVJHRVRf
RElSKSIgcHJlZml4PS91c3IgLUMgJChARCkgXAo+ID4gKyAgICAgJChUQVJHRVRfTUFLRV9FTlYp
ICQoTUFLRSkgJChSRTJfTUFLRV9PUFRTKSBcCj4gPiArICAgICAgICAgICAgIERFU1RESVI9IiQo
VEFSR0VUX0RJUikiIC1DICQoQEQpIFwKPiA+ICAgICAgICAgICAgICAgJChpZiAkKEJSMl9TVEFU
SUNfTElCUyksc3RhdGljLWluc3RhbGwsaW5zdGFsbCkKPiA+ICBlbmRlZgo+ID4KPiA+IC0tCj4g
PiAyLjM0LjEKPiA+Cj4gPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwo+ID4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+ID4gYnVpbGRyb290QGJ1aWxkcm9v
dC5vcmcKPiA+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1
aWxkcm9vdAo+Cj4gLS0KPiAuLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0u
LS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tLgo+IHwgIFlhbm4gRS4gTU9S
SU4gIHwgUmVhbC1UaW1lIEVtYmVkZGVkIHwgLyJcIEFTQ0lJIFJJQkJPTiB8IEVyaWNzJyBjb25z
cGlyYWN5OiB8Cj4gfCArMzMgNjYyIDM3NiAwNTYgfCBTb2Z0d2FyZSAgRGVzaWduZXIgfCBcIC8g
Q0FNUEFJR04gICAgIHwgIF9fXyAgICAgICAgICAgICAgIHwKPiB8ICszMyA1NjEgMDk5IDQyNyBg
LS0tLS0tLS0tLS0tLi0tLS0tLS06ICBYICBBR0FJTlNUICAgICAgfCAgXGUvICBUaGVyZSBpcyBu
byAgfAo+IHwgaHR0cDovL3ltb3Jpbi5pcy1hLWdlZWsub3JnLyB8IF8vKlxfIHwgLyBcIEhUTUwg
TUFJTCAgICB8ICAgdiAgIGNvbnNwaXJhY3kuICB8Cj4gJy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLV4tLS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS0tLScK
QmVzdCBSZWdhcmRzLAoKRmFicmljZQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qu
b3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9v
dAo=
