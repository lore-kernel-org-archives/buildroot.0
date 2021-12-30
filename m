Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96471C433F5
	for <buildroot@archiver.kernel.org>; Thu, 30 Dec 2021 23:06:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 301B760C26;
	Thu, 30 Dec 2021 23:06:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pHwXxrqXcQuZ; Thu, 30 Dec 2021 23:06:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 88AB760C23;
	Thu, 30 Dec 2021 23:06:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 43E7A1BF35B
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 23:06:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2D0AC4099E
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 23:06:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PcB9cnsk5iun for <buildroot@lists.busybox.net>;
 Thu, 30 Dec 2021 23:06:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2C9DE40996
 for <buildroot@buildroot.org>; Thu, 30 Dec 2021 23:06:39 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id s1so53017505wra.6
 for <buildroot@buildroot.org>; Thu, 30 Dec 2021 15:06:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=9lg4+Oe2p8Ztu/A7dGlg9oCcQFEEZSep1piAeseOgmc=;
 b=YxJTiGuXZCMyHZmrLdyefAdHmkeb5fDaJKbrHC3+8rVsF83IysJHe9/hnixRqiEqV3
 ljus83noQMI7wnhfv4rGzOBR46RSzgQcqkGoaD5wir6b5LQOM/F/XLUXGlJZkuSFU2eT
 MsVBa7cqczn2WFg4U+UTty3G89cTE9WDNmXw7j37dKBUmGnyqcubHomcUXs/u6G7xTkA
 R5GAX122WlSRpzL/zqzJJywb9exQ0MIc+oq+RgFxdLT/yEO0dA1gDZYZkiPiei9bUkXV
 a+vX5QX6/QW6YQgdDel5Pnz1DHI4Omwm/b4jQyTMWYtAcysTScFapGKlblUCwk3wkAji
 ucRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=9lg4+Oe2p8Ztu/A7dGlg9oCcQFEEZSep1piAeseOgmc=;
 b=inhpYeFnWGgPEM6zvyJxC+cr/9F6pm50RMT8+UgIkvN9lwBB1WxLcUxSsFcO+vOKAO
 K8NXe6syM/st5I71k04WgRkq2wfeCFXWS2ASuXijQbIM5dVAx6CeB6q/UQFA+x8S3WMP
 Tmw7tSzw1ZLJvUfQexSQpH+bVhw/k8k+dW3+EckZG19GkT2ebZB9pSO29qCpOpbLwFU2
 UxheRvOfoW5RulonDoUEwMiTz80uLXi4u389Ju5KFktCROee1DShwbSqvN5qD280utWy
 yxx49U9nmjipcYTLxL/KAg7NMZ+Uub+BjW4UPn8TddbkOjdieqDqlqbJ2fMQf6CN2SSf
 jIdQ==
X-Gm-Message-State: AOAM532yEE7XwtBXuu0x1aw4jR42oTMO2A0+Cf+h0+F2Rvf9wTzwz9St
 UkV5SYsesvduiisR/EHtYGOjGz6b4fU=
X-Google-Smtp-Source: ABdhPJy1qWj3PO90K0W8iTAArutFiYBfOuSx+6WvAPb5jYum+iknxW7t7Y+EN3ZVfHd7aIoma7WyjQ==
X-Received: by 2002:a5d:488a:: with SMTP id g10mr13370781wrq.653.1640905597274; 
 Thu, 30 Dec 2021 15:06:37 -0800 (PST)
Received: from ?IPV6:2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521?
 (2a01cb058f8a18003dbee9eed79eb521.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521])
 by smtp.gmail.com with ESMTPSA id e1sm25809879wrc.74.2021.12.30.15.06.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Dec 2021 15:06:36 -0800 (PST)
Message-ID: <7c487fed-bd9a-d507-ec1d-2cae2e6b50df@gmail.com>
Date: Fri, 31 Dec 2021 00:06:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-US
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20211230221904.3064022-1-fontaine.fabrice@gmail.com>
From: Romain Naour <romain.naour@gmail.com>
In-Reply-To: <20211230221904.3064022-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/efl: handle input option
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

TGUgMzAvMTIvMjAyMSDDoCAyMzoxOSwgRmFicmljZSBGb250YWluZSBhIMOpY3JpdMKgOgo+IENv
bW1pdCAyZDdhM2U0OGM1NzRjMDUzNDZiNjZmNzljZGI3NWVjZGZhN2YwNzRlIGZvcmdvdCB0byBt
YW5hZ2UgaW5wdXQKPiBvcHRpb24gb24gdGFyZ2V0IHdoaWNoIHdhcyBhZGRlZCAoYW5kIGVuYWJs
ZWQgYnkgZGVmYXVsdCkgYnkKPiBodHRwczovL2dpdC5lbmxpZ2h0ZW5tZW50Lm9yZy9jb3JlL2Vm
bC5naXQvY29tbWl0Lz9pZD0wYzJjZjdlMWJmN2NhNTQ3NjU1ZDI1YWFlYTMwZDA4MTEwMWI0MmJl
Cj4gcmVzdWx0aW5nIGluIHRoZSBmb2xsb3dpbmcgYnVpbGQgZmFpbHVyZSB3aGVuIGVlemUgaXMg
ZGlzYWJsZWQ6Cj4gCj4gLi4vb3V0cHV0LTEvYnVpbGQvZWZsLTEuMjYuMC9zcmMvbGliL2VscHV0
L21lc29uLmJ1aWxkOjE6MDogRVJST1I6IFVua25vd24gdmFyaWFibGUgImVlemUiLgo+IAo+IEZp
eGVzOgo+ICAtIGh0dHA6Ly9hdXRvYnVpbGQuYnVpbGRyb290Lm9yZy9yZXN1bHRzLzRhODQwYzU0
YmFkOTc0OGI1NzQ4NzM4Mzc4YTAzNTJkMDJkZTFmN2UKPiAKPiBTaWduZWQtb2ZmLWJ5OiBGYWJy
aWNlIEZvbnRhaW5lIDxmb250YWluZS5mYWJyaWNlQGdtYWlsLmNvbT4KPiAtLS0KPiAgcGFja2Fn
ZS9lZmwvQ29uZmlnLmluIHwgMTMgKysrKysrKysrKysrKwo+ICBwYWNrYWdlL2VmbC9lZmwubWsg
ICAgfCAgNyArKysrKysrCj4gIDIgZmlsZXMgY2hhbmdlZCwgMjAgaW5zZXJ0aW9ucygrKQo+IAo+
IGRpZmYgLS1naXQgYS9wYWNrYWdlL2VmbC9Db25maWcuaW4gYi9wYWNrYWdlL2VmbC9Db25maWcu
aW4KPiBpbmRleCAwNWRlZDcyY2Y3Li5kODczYzc3YWM2IDEwMDY0NAo+IC0tLSBhL3BhY2thZ2Uv
ZWZsL0NvbmZpZy5pbgo+ICsrKyBiL3BhY2thZ2UvZWZsL0NvbmZpZy5pbgo+IEBAIC04NSw2ICs4
NSwxOSBAQCBjb25maWcgQlIyX1BBQ0tBR0VfRUZMX0xJQkZSSUJJREkKPiAgCSAgc28geW91IG1h
eSBhbHNvIHRyaWdnZXIgY29kZSBwYXRocyB3aXRoIGJ1Z3MgdGhhdCBhcmUgbmV2ZXIKPiAgCSAg
bm9ybWFsbHkgdXNlZC4KPiAgCj4gK2NvbmZpZyBCUjJfUEFDS0FHRV9FRkxfTElCSU5QVVQKPiAr
CWJvb2wgIkVuYWJsZSBsaWJpbnB1dCBzdXBwb3J0IChyZWNvbW1lbmRlZCkiCj4gKwlkZWZhdWx0
IHkKPiArCWRlcGVuZHMgb24gQlIyX1BBQ0tBR0VfSEFTX1VERVYgIyBsaWJpbnB1dAo+ICsJc2Vs
ZWN0IEJSMl9QQUNLQUdFX0VGTF9FRVpFCj4gKwlzZWxlY3QgQlIyX1BBQ0tBR0VfTElCSU5QVVQK
PiArCXNlbGVjdCBCUjJfUEFDS0FHRV9MSUJYS0JDT01NT04KPiArCWhlbHAKPiArCSAgTGliaW5w
dXQgaXMgdXNlZCB0byBzdXBwb3J0IGdlc3R1cmUgcmVjb2duaXRpb24uCj4gKwo+ICtjb21tZW50
ICJsaWJpbnB1dCBuZWVkcyB1ZGV2IC9kZXYgbWFuYWdlbWVudCIKPiArCWRlcGVuZHMgb24gIUJS
Ml9QQUNLQUdFX0hBU19VREVWCj4gKwoKTWF5YmUgd2UgY2FuIGltcHJvdmUgQlIyX1BBQ0tBR0Vf
RUZMX0RSTSBvcHRpb246Cgpjb25maWcgQlIyX1BBQ0tBR0VfRUZMX0RSTQoJYm9vbCAiRXZhcyBE
Uk0gRW5naW5lIgoJZGVwZW5kcyBvbiBCUjJfUEFDS0FHRV9FRkxfRUVaRQoJZGVwZW5kcyBvbiBC
UjJfVE9PTENIQUlOX0hBU19USFJFQURTICMgbGliZHJtCglkZXBlbmRzIG9uIEJSMl9QQUNLQUdF
X01FU0EzRF9PUEVOR0xfRUdMICMgcmVxdWlyZSBsaWJnYm0gZnJvbSBtZXNhM2QKCXNlbGVjdCBC
UjJfUEFDS0FHRV9MSUJEUk0KCXNlbGVjdCBCUjJfUEFDS0FHRV9MSUJJTlBVVCAjIEZvciBlbHB1
dAoJc2VsZWN0IEJSMl9QQUNLQUdFX0xJQlhLQkNPTU1PTgoJaGVscAoJICBUaGlzIG9wdGlvbiBl
bmFibGUgYnVpbGRpbmcgc3VwcG9ydCBmb3IgdGhlIEV2YXMgRFJNIEVuZ2luZS4KCgkgIFNpbmNl
IGVmbCAxLjIzLngsIHRoZSBkcm0gb3B0aW9uIGVuYWJsZSB0aGUgZWxwdXQgbGlicmFyeQoJICB3
aGljaCBpcyBhbiBlZmwgYWJzdHJhY3Rpb24gZm9yIHRoZSBsaWJpbnB1dCBsaWJyYXJ5IHdoaWNo
CgkgIGNhbiBiZSB1c2VkIGJ5IHZhcmlvdXMgb3RoZXIgc3Vic3lzdGVtcyAoZWNvcmVfZmIsIGVj
b3JlX2RybSwKCSAgZXRjKSB0byBoYW5kbGUgaW50ZXJmYWNpbmcgd2l0aCBsaWJpbnB1dCB3aXRo
b3V0IGhhdmluZyB0bwoJICBkdXBsaWNhdGUgdGhlIGNvZGUgaW4gZWFjaCBzdWJzeXN0ZW0uCgo+
ICBjb25maWcgQlIyX1BBQ0tBR0VfRUZMX0xJQlNOREZJTEUKPiAgCWJvb2wgIkVuYWJsZSBsaWJz
bmRmaWxlIHN1cHBvcnQgKHJlY29tbWVuZGVkKSIKPiAgCWRlZmF1bHQgeQo+IGRpZmYgLS1naXQg
YS9wYWNrYWdlL2VmbC9lZmwubWsgYi9wYWNrYWdlL2VmbC9lZmwubWsKPiBpbmRleCA0NmJjZTI5
MzA1Li42NDJiMzdhNDM0IDEwMDY0NAo+IC0tLSBhL3BhY2thZ2UvZWZsL2VmbC5tawo+ICsrKyBi
L3BhY2thZ2UvZWZsL2VmbC5tawo+IEBAIC02Nyw2ICs2NywxMyBAQCBlbHNlCj4gIEVGTF9DT05G
X09QVFMgKz0gLURlZXplPWZhbHNlCj4gIGVuZGlmCj4gIAo+ICtpZmVxICgkKEJSMl9QQUNLQUdF
X0VGTF9MSUJJTlBVVCkseSkKPiArRUZMX0RFUEVOREVOQ0lFUyArPSBsaWJpbnB1dCBsaWJ4a2Jj
b21tb24KCmxpYnhrYmNvbW1vbiBpcyBhZGRlZCBieToKCkVGTF9ERVBFTkRFTkNJRVMgKz0gJChp
ZiAkKEJSMl9QQUNLQUdFX0xJQlhLQkNPTU1PTiksbGlieGtiY29tbW9uKQoKKHRoaXMgbGluZSBj
b3VsZCBiZSByZWZhY3RvcmVkKQoKQmVzdCByZWdhcmRzLApSb21haW4KCgo+ICtFRkxfQ09ORl9P
UFRTICs9IC1EaW5wdXQ9dHJ1ZQo+ICtlbHNlCj4gK0VGTF9DT05GX09QVFMgKz0gLURpbnB1dD1m
YWxzZQo+ICtlbmRpZgo+ICsKPiAgaWZlcSAoJChCUjJfUEFDS0FHRV9FRkxfVVRJTF9MSU5VWF9M
SUJNT1VOVCkseSkKPiAgRUZMX0RFUEVOREVOQ0lFUyArPSB1dGlsLWxpbnV4Cj4gIEVGTF9DT05G
X09QVFMgKz0gLURsaWJtb3VudD10cnVlCj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWls
ZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1
aWxkcm9vdAo=
