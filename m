Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D3E4C433F5
	for <buildroot@archiver.kernel.org>; Sat, 23 Apr 2022 16:51:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1D3F960BE2;
	Sat, 23 Apr 2022 16:51:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id u3FXJY-gfDhf; Sat, 23 Apr 2022 16:51:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0713B60B47;
	Sat, 23 Apr 2022 16:51:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6771E1BF5DF
 for <buildroot@lists.busybox.net>; Sat, 23 Apr 2022 16:51:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6370960B47
 for <buildroot@lists.busybox.net>; Sat, 23 Apr 2022 16:51:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id frFEK2lDyVbU for <buildroot@lists.busybox.net>;
 Sat, 23 Apr 2022 16:51:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com
 [IPv6:2607:f8b0:4864:20::229])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6A3B760AF6
 for <buildroot@buildroot.org>; Sat, 23 Apr 2022 16:51:29 +0000 (UTC)
Received: by mail-oi1-x229.google.com with SMTP id r8so12466128oib.5
 for <buildroot@buildroot.org>; Sat, 23 Apr 2022 09:51:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=0NF2pj3UW/GGadZHiUPHexaxgujkeID2CqpM32NxQwE=;
 b=kavLCX48SeeNk0dFJ2LPehf4o5g3i127h0cBL/+oQeeVaNxWB9xbku83+M+PRngSng
 V40Wt3KjR9pYn7p4FdnkZuiXvl4mszY2JV8JLGxRNR8Wp+4phFHdnAP9iTwrdktlwHN1
 oHjtl1HWIGvLmXryVnNGjkxtIZSDm7POgHoSKzBWm+AV9l1t80n2aacFzfJlOo9udke3
 DFOez1yHQgqSCz9NOfHJ9yjcre5soZH89D37lLBfpB45veHV80I0Ej2s8EQsB2VRU+HK
 1GLWkLAnnUlvVXnMma87UqVDCUHZTHejEM7k7WrERFuKUkqYQ51v1+NZ7Pjpsj+IYdMm
 v0eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=0NF2pj3UW/GGadZHiUPHexaxgujkeID2CqpM32NxQwE=;
 b=qeBDa5YA1EnaGqv39teyJkhAyviRSLWH5VKFDNE6XWN+tTYLPG2gw4DulZl2Wgk6Iv
 taWn5YiRM97sE2t6zBl9oF2MxQsENY9b55Gi7QsiymmWQXC2H0ddKBIGK8soimJNuMDh
 YJYiiIZB+dvEEO/uQYN+xbK55QVs54MB0cI7N2dGY3TKlF/AKDmKaP/aNnLx/CBDb12O
 2LGroxqu6ZXTON4CUSNvRtlMjkWUpxQfQklp3WzMd+wsibdNIUK7Y+QBakD6eoe8xBVV
 6e37TyVOeRmJ15bdD0/kb36AAMViJYIXCydOeh+4N2Fgix7vgSqBsOlU8W7uPR6hUHTq
 TzAg==
X-Gm-Message-State: AOAM533DB4G+CZyb2gi1UkmIEIvThKfRAuUacBazpLeKzaRYPRQitIsv
 6HAE8tTPJSW22QokLaaWwrfp3DNEMMDGa+eC7ljsSy4qduA=
X-Google-Smtp-Source: ABdhPJzVdSP9yXL3oz+4v83M7SP1Jcd6PKx4xxEAuWqtoHbcUN4/9PJ82IQKUopx/4bL1+K/uUM0B69wKnAMwVHSJrA=
X-Received: by 2002:aca:f1d5:0:b0:2ec:eaab:eb9b with SMTP id
 p204-20020acaf1d5000000b002eceaabeb9bmr4714065oih.228.1650732688114; Sat, 23
 Apr 2022 09:51:28 -0700 (PDT)
MIME-Version: 1.0
References: <20220416211323.3200669-1-fontaine.fabrice@gmail.com>
 <8e85d9ce-f8d9-6f76-37f2-664b9c0db08a@mind.be>
In-Reply-To: <8e85d9ce-f8d9-6f76-37f2-664b9c0db08a@mind.be>
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 23 Apr 2022 18:49:23 +0200
Message-ID: <CAPi7W83CD7gBa+ZY5vTBOfeq7MMhZPqkrYLY6=dpqcP9_ikMmA@mail.gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>
Subject: Re: [Buildroot] [PATCH 1/1] package/pkgconf: fix
 BR2_SHARED_STATIC_LIBS build
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

TGUgc2FtLiAyMyBhdnIuIDIwMjIgw6AgMTY6NDAsIEFybm91dCBWYW5kZWNhcHBlbGxlIDxhcm5v
dXRAbWluZC5iZT4gYSDDqWNyaXQgOgo+Cj4KPgo+IE9uIDE2LzA0LzIwMjIgMjM6MTMsIEZhYnJp
Y2UgRm9udGFpbmUgd3JvdGU6Cj4gPiBBZGQgLS1zdGF0aWMgd2hlbiBjYWxsaW5nIHBrZy1jb25m
aWcgd2l0aCBCUjJfU0hBUkVEX1NUQVRJQ19MSUJTIHRvCj4gPiBhdm9pZCB0aGUgZm9sbG93aW5n
IGJ1aWxkIGZhaWx1cmUgaWYgYSBwYWNrYWdlIChlLmcuIGRhc2ggb3IgemFiYml4KQo+ID4gZGVj
aWRlIHRvIHVzZSB0aGUgc3RhdGljIGxpYnJhcnkgb2Ygb2YgaXRzIGRlcGVuZGVuY3kgaW5zdGVh
ZCBvZiB0aGUKPiA+IHNoYXJlZCBsaWJyYXJ5IChlLmcuIGVkaXQgb3Igb3BlbnNzbCkgcmVzdWx0
aW5nIGluIHRoZSBmb2xsb3dpbmcgYnVpbGQKPiA+IGZhaWx1cmVzOgo+ID4KPiA+IC9ob21lL2F1
dG9idWlsZC9hdXRvYnVpbGQvaW5zdGFuY2UtMy9vdXRwdXQtMS9ob3N0L2xpYi9nY2MvcG93ZXJw
YzY0LWJ1aWxkcm9vdC1saW51eC1nbnUvMTAuMy4wLy4uLy4uLy4uLy4uL3Bvd2VycGM2NC1idWls
ZHJvb3QtbGludXgtZ251L2Jpbi9sZDogL2hvbWUvYXV0b2J1aWxkL2F1dG9idWlsZC9pbnN0YW5j
ZS0zL291dHB1dC0xL2hvc3QvYmluLy4uL3Bvd2VycGM2NC1idWlsZHJvb3QtbGludXgtZ251L3N5
c3Jvb3QvdXNyL2xpYi9saWJlZGl0LmEodGVybWluYWwubyk6IGluIGZ1bmN0aW9uIGB0ZXJtaW5h
bF90cHV0cyc6Cj4gPiB0ZXJtaW5hbC5jOigudGV4dCsweDFkNCk6IHVuZGVmaW5lZCByZWZlcmVu
Y2UgdG8gYHRwdXRzJwo+ID4KPiA+IC9udm1lZGF0YS9hdXRvYnVpbGQvaW5zdGFuY2UtMjgvb3V0
cHV0LTEvaG9zdC9saWIvZ2NjL3Bvd2VycGM2NGxlLWJ1aWxkcm9vdC1saW51eC1nbnUvMTAuMy4w
Ly4uLy4uLy4uLy4uL3Bvd2VycGM2NGxlLWJ1aWxkcm9vdC1saW51eC1nbnUvYmluL2xkOiAvbnZt
ZWRhdGEvYXV0b2J1aWxkL2luc3RhbmNlLTI4L291dHB1dC0xL2hvc3QvcG93ZXJwYzY0bGUtYnVp
bGRyb290LWxpbnV4LWdudS9zeXNyb290L3Vzci9saWIvbGliY3J5cHRvLmEoZHNvX2RsZmNuLm8p
OiBpbiBmdW5jdGlvbiBgZGxmY25fZ2xvYmFsbG9va3VwJzoKPiA+IGRzb19kbGZjbi5jOigudGV4
dCsweDI4KTogd2FybmluZzogVXNpbmcgJ2Rsb3BlbicgaW4gc3RhdGljYWxseSBsaW5rZWQgYXBw
bGljYXRpb25zIHJlcXVpcmVzIGF0IHJ1bnRpbWUgdGhlIHNoYXJlZCBsaWJyYXJpZXMgZnJvbSB0
aGUgZ2xpYmMgdmVyc2lvbiB1c2VkIGZvciBsaW5raW5nCj4gPgo+ID4gRml4ZXM6Cj4gPiAgIC0g
aHR0cDovL2F1dG9idWlsZC5idWlsZHJvb3Qub3JnL3Jlc3VsdHMvMjAzMmQ2YjEyMzNjZTVjNzlh
MGM5NDIxMDUyYWIxYjkxODRjNWI4OQo+ID4gICAtIGh0dHA6Ly9hdXRvYnVpbGQuYnVpbGRyb290
Lm9yZy9yZXN1bHRzL2IwZTFiZDE5ZjA2MTJhMGU5MGQ4OWFkOGZlOWUyOTRmNTc4NzFmNmIKPiA+
Cj4gPiBTaWduZWQtb2ZmLWJ5OiBGYWJyaWNlIEZvbnRhaW5lIDxmb250YWluZS5mYWJyaWNlQGdt
YWlsLmNvbT4KPiA+IC0tLQo+ID4gICBwYWNrYWdlL3BrZ2NvbmYvcGtnY29uZi5tayB8IDYgKysr
LS0tCj4gPiAgIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0p
Cj4gPgo+ID4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvcGtnY29uZi9wa2djb25mLm1rIGIvcGFja2Fn
ZS9wa2djb25mL3BrZ2NvbmYubWsKPiA+IGluZGV4IDVkNjVmNjljMTAuLmM0MGM4Yjk0MzMgMTAw
NjQ0Cj4gPiAtLS0gYS9wYWNrYWdlL3BrZ2NvbmYvcGtnY29uZi5tawo+ID4gKysrIGIvcGFja2Fn
ZS9wa2djb25mL3BrZ2NvbmYubWsKPiA+IEBAIC0zNSwxMCArMzUsMTAgQEAgZW5kZWYKPiA+ICAg
UEtHQ09ORl9QT1NUX0lOU1RBTExfVEFSR0VUX0hPT0tTICs9IFBLR0NPTkZfTElOS19QS0dDT05G
SUcKPiA+ICAgSE9TVF9QS0dDT05GX1BPU1RfSU5TVEFMTF9IT09LUyArPSBIT1NUX1BLR0NPTkZf
SU5TVEFMTF9XUkFQUEVSCj4gPgo+ID4gLWlmZXEgKCQoQlIyX1NUQVRJQ19MSUJTKSx5KQo+ID4g
LUhPU1RfUEtHQ09ORl9QT1NUX0lOU1RBTExfSE9PS1MgKz0gSE9TVF9QS0dDT05GX1NUQVRJQwo+
ID4gLWVsc2UKPiA+ICtpZmVxICgkKEJSMl9TSEFSRURfTElCUykseSkKPiA+ICAgSE9TVF9QS0dD
T05GX1BPU1RfSU5TVEFMTF9IT09LUyArPSBIT1NUX1BLR0NPTkZfU0hBUkVECj4gPiArZWxzZQo+
ID4gK0hPU1RfUEtHQ09ORl9QT1NUX0lOU1RBTExfSE9PS1MgKz0gSE9TVF9QS0dDT05GX1NUQVRJ
Qwo+Cj4gICBFcnIsIHNvIHRoaXMgd291bGQgbWVhbiB0aGF0IHdlIGFsbW9zdCBhbHdheXMgbGlu
ayBzdGF0aWNhbGx5IGluIHRoZQo+IFNIQVJFRF9TVEFUSUMgY2FzZT8gSSBkb24ndCB0aGluayB0
aGF0IHRoYXQncyB3aGF0IHdlIHdhbnQsIHJlYWxseS4uLgo+Cj4gICBJZiBhIHBhY2thZ2Ugd2Fu
dHMgdG8gbGluayBzdGF0aWNhbGx5IGFuZCBpcyB1c2luZyBwa2ctY29uZmlnLCB3aHkgaXMgbm90
Cj4gY2FsbGluZyBwa2ctY29uZmlnIHdpdGggLS1zdGF0aWM/IFNvbWV0aGluZyBzZWVtcyB0byBi
ZSByZWFsbHkgb2ZmIGhlcmUuLi4KClRvIG15IGtub3dsZWRnZSBtb3N0IHBhY2thZ2VzIGFyZSBu
b3QgYWRkaW5nIC0tc3RhdGljIHdoZW4gY2FsbGluZyBwa2ctY29uZmlnLgotLXN0YXRpYyBpcyBh
ZGRlZCBieSBidWlsZHJvb3QgdGhyb3VnaCBIT1NUX1BLR0NPTkZfUE9TVF9JTlNUQUxMX0hPT0tT
LgoKZGFzaCBmYWlscyB0byBidWlsZCBiZWNhdXNlIC1zdGF0aWMgaXMgcGFzc2VkIHRvIGdjYy4K
LXN0YXRpYyBpcyBwYXNzZWQgdG8gZ2NjIGJlY2F1c2UgcGFja2FnZS9NYWtlZmlsZS5pbiBpcyBz
ZXR0aW5nCi0tZW5hYmxlLXN0YXRpYyAoYW5kIC0tZW5hYmxlLXNoYXJlZCk6CgovaG9tZS9mYWJy
aWNlL2J1aWxkcm9vdC9vdXRwdXQvaG9zdC9iaW4vcG93ZXJwYzY0LWJ1aWxkcm9vdC1saW51eC1n
bnUtZ2NjCi1XYWxsIC1EX0xBUkdFRklMRV9TT1VSQ0UgLURfTEFSR0VGSUxFNjRfU09VUkNFIC1E
X0ZJTEVfT0ZGU0VUX0JJVFM9NjQKIC1PMSAtZzAgLURfRk9SVElGWV9TT1VSQ0U9MSAgLXN0YXRp
YyAtV2wsLS1mYXRhbC13YXJuaW5ncyAtbyBkYXNoCmFsaWFzLm8gYXJpdGhfeWFjYy5vIGFyaXRo
X3l5bGV4Lm8gY2QubyBlcnJvci5vIGV2YWwubyBleGVjLm8gZXhwYW5kLm8KaGlzdGVkaXQubyBp
bnB1dC5vIGpvYnMubyBtYWlsLm8gbWFpbi5vIG1lbWFsbG9jLm8gbWlzY2JsdGluLm8KbXlzdHJp
bmcubyBvcHRpb25zLm8gcGFyc2VyLm8gcmVkaXIubyBzaG93Lm8gdHJhcC5vIG91dHB1dC5vCmJs
dGluL3ByaW50Zi5vIHN5c3RlbS5vIGJsdGluL3Rlc3QubyBibHRpbi90aW1lcy5vIHZhci5vIGJ1
aWx0aW5zLm8KaW5pdC5vIG5vZGVzLm8gc2lnbmFtZXMubyBzeW50YXgubyAtbGVkaXQKL2hvbWUv
ZmFicmljZS9idWlsZHJvb3Qvb3V0cHV0L2hvc3QvbGliL2djYy9wb3dlcnBjNjQtYnVpbGRyb290
LWxpbnV4LWdudS8xMC4zLjAvLi4vLi4vLi4vLi4vcG93ZXJwYzY0LWJ1aWxkcm9vdC1saW51eC1n
bnUvYmluL2xkOgovaG9tZS9mYWJyaWNlL2J1aWxkcm9vdC9vdXRwdXQvaG9zdC9wb3dlcnBjNjQt
YnVpbGRyb290LWxpbnV4LWdudS9zeXNyb290L3Vzci9saWIvLi4vbGliNjQvbGliZWRpdC5hKHRl
cm1pbmFsLm8pOgppbiBmdW5jdGlvbiBgdGVybWluYWxfdHB1dHMnOgp0ZXJtaW5hbC5jOigudGV4
dCsweDFkNCk6IHVuZGVmaW5lZCByZWZlcmVuY2UgdG8gYHRwdXRzJwoKZGFzaCBkb2Vzbid0IG5v
dCBoYW5kbGUgLS1lbmFibGUtc2hhcmVkLgpJdCBhZGRzIC1zdGF0aWMgdG8gZ2NjIGNhbGwgZGVw
ZW5kaW5nIG9uIC0te2VuLGRpc31hYmxlLXN0YXRpYy4KClNvLCB0aGUgJ29ubHl5JyBvdGhlciBv
cHRpb24gd291bGQgYmUgdG8gYWRkCkRBU0hfQ09ORl9PUFRTICs9IC0tZGlzYWJsZS1zdGF0aWMK
dG8gb3ZlcnJpZGUgd2hhdCBpcyBzZXQgYnkgcGFja2FnZS9NYWtlZmlsZS5pbgoKSSBjYW4gc2Vu
ZCBhIHYyIGlmIHlvdSB0aGluayB0aGF0IHRoaXMgc29sdXRpb24gaXMgYmV0dGVyLgpIb3dldmVy
LCBpdCdsbCBoYXZlIHRvIGJlIGFwcGxpZWQgdG8gZGFzaCBhbmQgemFiYml4IGJ1dCBwZXJoYXBz
IHRvIGEKbGFyZ2UgbnVtYmVyIG9mICJhcHBsaWNhdGlvbiIgcGFja2FnZXMgLi4uCgoKPgo+ICAg
UmVnYXJkcywKPiAgIEFybm91dAo+Cj4KPiA+ICAgZW5kaWYKPiA+Cj4gPiAgICQoZXZhbCAkKGF1
dG90b29scy1wYWNrYWdlKSkKCkJlc3QgUmVnYXJkcywKCkZhYnJpY2UKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApi
dWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1h
bi9saXN0aW5mby9idWlsZHJvb3QK
