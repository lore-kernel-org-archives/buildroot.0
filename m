Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A42AC433F5
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 18:45:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 31B38607B5;
	Sat,  8 Jan 2022 18:45:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Kkg-xXFAgj3l; Sat,  8 Jan 2022 18:45:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4A69960A73;
	Sat,  8 Jan 2022 18:45:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C22DA1BF593
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 18:45:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B162B40898
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 18:45:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WA3kVhDI7Nt5 for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 18:45:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 543E440886
 for <buildroot@buildroot.org>; Sat,  8 Jan 2022 18:45:41 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 f189-20020a1c1fc6000000b00347ac5ccf6cso2763114wmf.3
 for <buildroot@buildroot.org>; Sat, 08 Jan 2022 10:45:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=g78SBmtM3Y4jxoASugf2Cj48DYEMUm5wE4CdnmbnaRg=;
 b=fQyZBnuuKN8SWWXtZ73mFlvdH3W2RvV6qv3mKLCY0ljVoHDpynycfXiDjEUTV5mH2F
 Tf+y+fhY4mzysJ24s1/vlNuAAEIsL2qpdMDvVC3UDvUDIus89d6k5HFZO+0av+14rzEq
 KdQeYrC83Kr/tVMx6AR7DzQLeXoPIPnYwenNvSKQrSI5vGQcwfsgxV74SN1c4slsezc7
 VpP2NJaz0OM5NJ52T5DYZJ8gpKYkpeXir59pRzRVXpZXtB/t503xydHmwaAILNYgPmyR
 7hhH/Rr7IIt1DFaVSwg+1pPYPYjxgXLyOXZ0Z0beDYBVyNF94C/gNXP6/qpvB8ySEp9f
 uMYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=g78SBmtM3Y4jxoASugf2Cj48DYEMUm5wE4CdnmbnaRg=;
 b=hkFKP+AzWuadjA4mmQdPSrsYBd0mZ7CW5Oocuqetd7NyGFACo8cfa98j2jq4Bhff43
 8DYDF3m+Ii0sYkv3ssXTwLpogNX59bmQs7KbyPCQ+5PicZE5ca0unG4ZoPAbde2rzCD0
 PWecRtKLtUhyTr9tgWx1BzTJorufTP10O0+C73i9CHwsyBsXhf7gIlvWdoNMrugMU3FB
 lmgxU7q1/+b2zKB5Ty7Ki6mlTU4IWMHfhonGSRGtTEHjJ05DJRqbhxfskyisy1G58WdU
 HGyNLDasR/U+XX57UXz7WOluD6W8Y/29PJlavyTa12Kvh3cvk6n/uHP24pHfj+cARY0S
 CINw==
X-Gm-Message-State: AOAM532KNLrffFEZcay+d0EESBSwLNpTRdmYV4jwKg8+jrwCje7eLXNo
 7C2MiABDr93KFyj8uzgc5/Qujg==
X-Google-Smtp-Source: ABdhPJxQG1aznU92SPgYeOAjkqZgVDOcslo0CjikuSlI40QH1ICLeuLReBv+t1DxWC5L6UiNeEcAog==
X-Received: by 2002:a1c:a9d0:: with SMTP id s199mr5450202wme.76.1641667539428; 
 Sat, 08 Jan 2022 10:45:39 -0800 (PST)
Received: from ?IPV6:2a01:cb19:8b51:cb00:8a68:e76b:e0e9:90a1?
 ([2a01:cb19:8b51:cb00:8a68:e76b:e0e9:90a1])
 by smtp.gmail.com with ESMTPSA id y8sm2451402wrd.10.2022.01.08.10.45.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 08 Jan 2022 10:45:39 -0800 (PST)
Message-ID: <50ba83a8-df9d-0146-ad7b-acc27545d1ef@mind.be>
Date: Sat, 8 Jan 2022 19:45:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20220108164646.2737567-1-fontaine.fabrice@gmail.com>
 <20220108181037.GC1881783@scaer> <20220108181251.GD1881783@scaer>
 <CAPi7W81QeeiFHOoP_W6S5gCDmSfirPfPNbTG0GUMjseAnAfVvA@mail.gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <CAPi7W81QeeiFHOoP_W6S5gCDmSfirPfPNbTG0GUMjseAnAfVvA@mail.gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] drop .defconfig
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAwOC8wMS8yMDIyIDE5OjE5LCBGYWJyaWNlIEZvbnRhaW5lIHdyb3RlOgo+IFlhbm4sCj4g
Cj4gTGUgc2FtLiA4IGphbnYuIDIwMjIgw6AgMTk6MTIsIFlhbm4gRS4gTU9SSU4gPHlhbm4ubW9y
aW4uMTk5OEBmcmVlLmZyPiBhIMOpY3JpdCA6Cj4+Cj4+IEZhYnJpY2UsIEFsbCwKPj4KPj4gT24g
MjAyMi0wMS0wOCAxOToxMCArMDEwMCwgWWFubiBFLiBNT1JJTiBzcGFrZSB0aHVzbHk6Cj4+PiBG
YWJyaWNlLCBBbGwsCj4+Pgo+Pj4gT24gMjAyMi0wMS0wOCAxNzo0NiArMDEwMCwgRmFicmljZSBG
b250YWluZSBzcGFrZSB0aHVzbHk6Cj4+Pj4gLmRlZmNvbmZpZyBoYXMgbm90IGJlZW4gdXBkYXRl
ZCBzaW5jZSAyMDE2IHdpdGggY29tbWl0Cj4+Pj4gNDMzOGEzMTliNzI1NzBlNDMzZmQ3NDg0Zjhh
OTVlMWUwZTk3ODk0MSBzbyBkcm9wIHRoaXMgZmlsZSB3aGljaCBkb2Vzbid0Cj4+Pj4gc2VlbSB0
byBiZSB1c2VkCj4+PiBUaGlzIGJyZWFrcyBvdXQtb2YtdHJlZSBidWlsZHM6Cj4+Cj4+IFdlbGws
IHRoaXMgaXMgYWxzbyBicm9rZW4gZm9yIGluLXRyZWUgYnVpbGRzOgo+Pgo+PiAgICAgICQgZ2l0
IGNsZWFuIC1kWAo+PiAgICAgICQgbWFrZSBkZWZjb25maWcKPj4gICAgICBbLi4uXQo+PiAgICAg
ICoqKgo+PiAgICAgICoqKiBDYW4ndCBmaW5kIGRlZmF1bHQgY29uZmlndXJhdGlvbiAiLmRlZmNv
bmZpZyIhCj4+ICAgICAgKioqCj4+ICAgICAgbWFrZVsxXTogKioqIFtNYWtlZmlsZToxMDI0OiBk
ZWZjb25maWddIEVycm9yIDEKPj4gICAgICBtYWtlOiAqKiogW01ha2VmaWxlOjg0OiBfYWxsXSBF
cnJvciAyCj4+Cj4+IFNvLCBtZWguLi4KPiBPSyBzbyB0aGlzIGZpbGUgaXMgbmVlZGVkIGZvciAi
bWFrZSBkZWZjb25maWciLgo+IEknbSBhbHdheXMgcnVubmluZyAibWFrZSB4eHhfZGVmY29uZmln
IiBhbmQgIm1ha2UgbWVudWNvbmZpZyIKPiBIb3dldmVyLCBwZXJoYXBzIGl0IHdvdWxkIGJlIGJl
dHRlciB0byB1c2UgYSBzeW1saW5rIGZvciAuZGVmY29uZmlnPwo+IFdlIGNvdWxkIHN5bWxpbmsg
aXQgdG8gcmFzcGJlcnJ5cGk0X2RlZmNvbmZpZyBvciBhbnkgb3RoZXIgY29uZmlnLgo+IEkgZm91
bmQgaXQgc3RyYW5nZSB0aGF0IHRoaXMgZmlsZSB3YXNuJ3QgdXBkYXRlZCBmb3Igc28gbG9uZy4K
Pj4KPj4gVGhpcyBmaWxlIHNob3VsZCBpbmRlZWQgbm90IGJlIG5lZWRlZC4uLgoKICBBcHBhcmVu
dGx5IHRoZSBmaWxlIGlzIG5lZWRlZCBidXQgdGhlIGNvbnRlbnRzIGRvZXNuJ3QgbWF0dGVyLCBz
byBtYXliZSAKcmVwbGFjZSBpdCB3aXRoIGp1c3QKCiMgVGhpcyBmaWxlIGlzIG5lZWRlZCB0byBt
YWtlICdtYWtlIGRlZmNvbmZpZycgd29yay4KCiAgUmVnYXJkcywKICBBcm5vdXQKCj4+Cj4+IFJl
Z2FyZHMsCj4+IFlhbm4gRS4gTU9SSU4uCj4+Cj4+PiBSZWdhcmRzLAo+Pj4gWWFubiBFLiBNT1JJ
Ti4KPj4+Cj4+Pj4gU2lnbmVkLW9mZi1ieTogRmFicmljZSBGb250YWluZSA8Zm9udGFpbmUuZmFi
cmljZUBnbWFpbC5jb20+Cj4+Pj4gLS0tCj4+Pj4gICAuZGVmY29uZmlnIHwgNTEgLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4+Pj4gICAxIGZpbGUg
Y2hhbmdlZCwgNTEgZGVsZXRpb25zKC0pCj4+Pj4gICBkZWxldGUgbW9kZSAxMDA2NDQgLmRlZmNv
bmZpZwo+Pj4+Cj4+Pj4gZGlmZiAtLWdpdCBhLy5kZWZjb25maWcgYi8uZGVmY29uZmlnCj4+Pj4g
ZGVsZXRlZCBmaWxlIG1vZGUgMTAwNjQ0Cj4+Pj4gaW5kZXggN2FiMGMzZmJmMC4uMDAwMDAwMDAw
MAo+Pj4+IC0tLSBhLy5kZWZjb25maWcKPj4+PiArKysgL2Rldi9udWxsCj4+Pj4gQEAgLTEsNTEg
KzAsMCBAQAo+Pj4+IC0jCj4+Pj4gLSMgQXV0b21hdGljYWxseSBnZW5lcmF0ZWQgbWFrZSBjb25m
aWc6IGRvbid0IGVkaXQKPj4+PiAtIyBNb24gRmViIDE4IDA5OjExOjU2IDIwMDgKPj4+PiAtIwo+
Pj4+IC1CUjJfSEFWRV9ET1RfQ09ORklHPXkKPj4+PiAtIyBCUjJfYWxwaGEgaXMgbm90IHNldAo+
Pj4+IC0jIEJSMl9hcm0gaXMgbm90IHNldAo+Pj4+IC0jIEJSMl9hcm1lYiBpcyBub3Qgc2V0Cj4+
Pj4gLSMgQlIyX2NyaXMgaXMgbm90IHNldAo+Pj4+IC0jIEJSMl9pYTY0IGlzIG5vdCBzZXQKPj4+
PiAtQlIyX2kzODY9eQo+Pj4+IC0jIEJSMl9tNjhrIGlzIG5vdCBzZXQKPj4+PiAtIyBCUjJfbWlw
cyBpcyBub3Qgc2V0Cj4+Pj4gLSMgQlIyX21pcHNlbCBpcyBub3Qgc2V0Cj4+Pj4gLSMgQlIyX25p
b3MyIGlzIG5vdCBzZXQKPj4+PiAtIyBCUjJfcG93ZXJwYyBpcyBub3Qgc2V0Cj4+Pj4gLSMgQlIy
X3NoIGlzIG5vdCBzZXQKPj4+PiAtIyBCUjJfc3BhcmMgaXMgbm90IHNldAo+Pj4+IC0jIEJSMl9z
cGFyYzY0IGlzIG5vdCBzZXQKPj4+PiAtIyBCUjJfeDg2XzY0IGlzIG5vdCBzZXQKPj4+PiAtIyBC
UjJfeDg2X2k0ODYgaXMgbm90IHNldAo+Pj4+IC0jIEJSMl94ODZfaTU4NiBpcyBub3Qgc2V0Cj4+
Pj4gLUJSMl94ODZfaTY4Nj15Cj4+Pj4gLSMgQlIyX3g4Nl9wZW50aXVtcHJvIGlzIG5vdCBzZXQK
Pj4+PiAtIyBCUjJfeDg2X3BlbnRpdW1fbW14IGlzIG5vdCBzZXQKPj4+PiAtIyBCUjJfeDg2X3Bl
bnRpdW1fbSBpcyBub3Qgc2V0Cj4+Pj4gLSMgQlIyX3g4Nl9wZW50aXVtMiBpcyBub3Qgc2V0Cj4+
Pj4gLSMgQlIyX3g4Nl9wZW50aXVtMyBpcyBub3Qgc2V0Cj4+Pj4gLSMgQlIyX3g4Nl9wZW50aXVt
NCBpcyBub3Qgc2V0Cj4+Pj4gLSMgQlIyX3g4Nl9wcmVzY290dCBpcyBub3Qgc2V0Cj4+Pj4gLSMg
QlIyX3g4Nl9ub2NvbmEgaXMgbm90IHNldAo+Pj4+IC0jIEJSMl94ODZfY29yZTIgaXMgbm90IHNl
dAo+Pj4+IC0jIEJSMl94ODZfazYgaXMgbm90IHNldAo+Pj4+IC0jIEJSMl94ODZfazZfMiBpcyBu
b3Qgc2V0Cj4+Pj4gLSMgQlIyX3g4Nl9hdGhsb24gaXMgbm90IHNldAo+Pj4+IC0jIEJSMl94ODZf
YXRobG9uXzQgaXMgbm90IHNldAo+Pj4+IC0jIEJSMl94ODZfb3B0ZXJvbiBpcyBub3Qgc2V0Cj4+
Pj4gLSMgQlIyX3g4Nl9vcHRlcm9uX3NzZTMgaXMgbm90IHNldAo+Pj4+IC0jIEJSMl94ODZfYmFy
Y2Vsb25hIGlzIG5vdCBzZXQKPj4+PiAtIyBCUjJfeDg2X2dlb2RlIGlzIG5vdCBzZXQKPj4+PiAt
IyBCUjJfeDg2X2MzIGlzIG5vdCBzZXQKPj4+PiAtIyBCUjJfeDg2X3dpbmNoaXBfYzYgaXMgbm90
IHNldAo+Pj4+IC0jIEJSMl94ODZfd2luY2hpcDIgaXMgbm90IHNldAo+Pj4+IC1CUjJfQVJDSD0i
aTY4NiIKPj4+PiAtQlIyX0VORElBTj0iTElUVExFIgo+Pj4+IC1CUjJfR0NDX1RBUkdFVF9UVU5F
PSJpNjg2Igo+Pj4+IC1CUjJfR0NDX1RBUkdFVF9BUkNIPSJpNjg2Igo+Pj4+IC0KPj4+PiAtIwo+
Pj4+IC0jIFRhcmdldCBvcHRpb25zCj4+Pj4gLSMKPj4+PiAtLQo+Pj4+IDIuMzQuMQo+Pj4+Cj4+
Pj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPj4+PiBi
dWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4+Pj4gYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKPj4+PiBo
dHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QKPj4+
Cj4+PiAtLQo+Pj4gLi0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0t
LS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4KPj4+IHwgIFlhbm4gRS4gTU9SSU4g
IHwgUmVhbC1UaW1lIEVtYmVkZGVkIHwgLyJcIEFTQ0lJIFJJQkJPTiB8IEVyaWNzJyBjb25zcGly
YWN5OiB8Cj4+PiB8ICszMyA2NjIgMzc2IDA1NiB8IFNvZnR3YXJlICBEZXNpZ25lciB8IFwgLyBD
QU1QQUlHTiAgICAgfCAgX19fICAgICAgICAgICAgICAgfAo+Pj4gfCArMzMgNTYxIDA5OSA0Mjcg
YC0tLS0tLS0tLS0tLS4tLS0tLS0tOiAgWCAgQUdBSU5TVCAgICAgIHwgIFxlLyAgVGhlcmUgaXMg
bm8gIHwKPj4+IHwgaHR0cDovL3ltb3Jpbi5pcy1hLWdlZWsub3JnLyB8IF8vKlxfIHwgLyBcIEhU
TUwgTUFJTCAgICB8ICAgdiAgIGNvbnNwaXJhY3kuICB8Cj4+PiAnLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tXi0tLS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0t
LS0tJwo+Pj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
Pj4+IGJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKPj4+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4+
PiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
Pj4KPj4gLS0KPj4gLi0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0t
LS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4KPj4gfCAgWWFubiBFLiBNT1JJTiAg
fCBSZWFsLVRpbWUgRW1iZWRkZWQgfCAvIlwgQVNDSUkgUklCQk9OIHwgRXJpY3MnIGNvbnNwaXJh
Y3k6IHwKPj4gfCArMzMgNjYyIDM3NiAwNTYgfCBTb2Z0d2FyZSAgRGVzaWduZXIgfCBcIC8gQ0FN
UEFJR04gICAgIHwgIF9fXyAgICAgICAgICAgICAgIHwKPj4gfCArMzMgNTYxIDA5OSA0MjcgYC0t
LS0tLS0tLS0tLS4tLS0tLS0tOiAgWCAgQUdBSU5TVCAgICAgIHwgIFxlLyAgVGhlcmUgaXMgbm8g
IHwKPj4gfCBodHRwOi8veW1vcmluLmlzLWEtZ2Vlay5vcmcvIHwgXy8qXF8gfCAvIFwgSFRNTCBN
QUlMICAgIHwgICB2ICAgY29uc3BpcmFjeS4gIHwKPj4gJy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLV4tLS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS0tLScK
PiBCZXN0IFJlZ2FyZHMsCj4gCj4gRmFicmljZQo+IF9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCj4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+IGJ1aWxkcm9v
dEBidWlsZHJvb3Qub3JnCj4gaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlz
dGluZm8vYnVpbGRyb290Cj4gCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcK
aHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
