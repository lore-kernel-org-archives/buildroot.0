Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 206A6C433F5
	for <buildroot@archiver.kernel.org>; Wed, 27 Apr 2022 17:11:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B579560783;
	Wed, 27 Apr 2022 17:11:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0KnVfKDkYYoz; Wed, 27 Apr 2022 17:11:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A37EF60B2F;
	Wed, 27 Apr 2022 17:11:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 73A221BF420
 for <buildroot@lists.busybox.net>; Wed, 27 Apr 2022 17:11:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6264082AC6
 for <buildroot@lists.busybox.net>; Wed, 27 Apr 2022 17:11:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KrshIU4oqCKx for <buildroot@lists.busybox.net>;
 Wed, 27 Apr 2022 17:11:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0312D8266D
 for <buildroot@buildroot.org>; Wed, 27 Apr 2022 17:11:16 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id i27so4684666ejd.9
 for <buildroot@buildroot.org>; Wed, 27 Apr 2022 10:11:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=2hUCM6Yn+6Qz5rmeY855c9me9FqfY5IZhhvGNCoVzz0=;
 b=dzONAcEKDOCDcRhZ3I2Mbx37nxrQeb8lKbE6gSusfKDrp9tEiEYQW4m3Xe1Waw1fjl
 5DW+U2C0aqIoPmeViiUHjBWnDDgl8G9ItZhbUSlHdLSb9VKJpW0CmGUuLSB2AoX5qjmt
 UPIri+MnAwg9fNrT3le5k+yD48Jw61TS1UQ974YqZhUS5Ynbbsi3CY2AGN7BURjDOwYR
 VmO25ejjDYD9EYKkuuWfyfQyiWQlQhdZgcJKw/51wWnyKXwSn80peGuxcY7Qy5zevijV
 bHIBGSK4rEjmEb1Iq62Z8qoe9zcUnLVfIQGXn1oGLqK/6n9C0nEd9EUK2PqjpfmfJRJS
 LlhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=2hUCM6Yn+6Qz5rmeY855c9me9FqfY5IZhhvGNCoVzz0=;
 b=lUmU/yW38oc52ZG6A8xm/4PUrAHwzCdzmtEpFIqlIfs1VTICiB286CTzt9Wg9UZHKR
 NDl4/hcYbMn4CuGZVxenpPKvIiPoKqfzox7vkh66XmPubgbrF6V5AmVxtqzTR2Lq0LHd
 8MNOgHLzH31Rw+uKpdcagRGzn7L+eMvFw94E5JX58Pfj9h1pc5xrtqTkZaoqYoKZ42CT
 Z/g7ykYajelnuBAcpigxtFA31dfFu672D+VYkCLg3b14IXySNBpvioLjNDCE+9uQkq0Y
 tW25gUmas7g9wSLHWdX3TNR4nUc/BATkig1/BpUBFAX1MazwUIcop6xFnzvZrSeMAtFT
 M3ww==
X-Gm-Message-State: AOAM53238/7zWdCssciLbqgcdjPfuFTcLyPsv4rsq8LmamPvyGag29Al
 V151wiDf7L8NigUGWN3mRH8R5QUJf4JVnQ==
X-Google-Smtp-Source: ABdhPJwGUur0pLKBX7OCugFfwbSQlJ+Hudd58pPF0WysKS4187nSUWFiHhyR4B/w4a5PLQ5MvPPJWg==
X-Received: by 2002:a17:906:57c1:b0:6d6:da73:e9c0 with SMTP id
 u1-20020a17090657c100b006d6da73e9c0mr28319230ejr.45.1651079474883; 
 Wed, 27 Apr 2022 10:11:14 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 u26-20020a170906b11a00b006f3c3a382b8sm1664960ejy.3.2022.04.27.10.11.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Apr 2022 10:11:14 -0700 (PDT)
Message-ID: <b35928bf-609f-9822-5be8-da77ec5e6a74@mind.be>
Date: Wed, 27 Apr 2022 19:11:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: =?UTF-8?B?0JvQtdC+0L3QuNC0INCu0YDRjNC10LIgKExlb25pZCBZdXJpZXYp?=
 <leo@yuriev.ru>, buildroot@buildroot.org
References: <20220424235618.471682-1-leo@yuriev.ru>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220424235618.471682-1-leo@yuriev.ru>
Subject: Re: [Buildroot] [PATCH 1/1] package/libmdbx: bump version to 0.11.7
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

ICBIaSBMZW9uaWQsCgpPbiAyNS8wNC8yMDIyIDAxOjU2LCDQm9C10L7QvdC40LQg0K7RgNGM0LXQ
siAoTGVvbmlkIFl1cmlldikgd3JvdGU6Cj4gVGhpcyBpcyBzdGFibGUgYnVnZml4IHJlbGVhc2Ug
b2YgbGlibWRieC4gU28gaXQgaXMgcmVhc29uYWJsZSB0byBiYWNrcG9ydAo+IHRoaXMgcGF0Y2gg
dG8gYWxsIGFwcGxpY2FibGUgcmVsZWFzZXMvYnJhbmNoZXMgb2YgYnVpbGRyb290Lgo+IAoKICBJ
IGFkZGVkIHRvIHRoZSBjb21taXQgbWVzc2FnZSBhIG5vdGUgdGhhdCB0aGUgcHJvamVjdCBoYXMg
YmVlbiByZW1vdmVkIGZyb20gCmdpdGh1Yiwgd2l0aCBhIHJlZmVyZW5jZSB0byBhIG5ld3Mgc2l0
ZSBbMV0uCgogIEl0IGhlbHBzIGlmIHlvdSBjbGFyaWZ5IHRoYXQgeW91IHlvdXJzZWxmIGFyZSB0
aGUgdXBzdHJlYW0gZm9yIHRoaXMgcHJvamVjdCA6LSkKCj4gUmVsZWFzZSBub3RlcyBmb3IgdjAu
MTEuNyBodHRwczovL2dpdGZsaWMucnUvcHJvamVjdC9lcnRoaW5rL2xpYm1kYngvcmVsZWFzZS85
MGVjOTk4NS1jZDYwLTRkOWEtOGM5OC04NDE3NTA2ZmQyNmQKPiAKPiBUaGUgY29tcGxldGUgQ2hh
bmdlTG9nOiBodHRwczovL2dpdGZsaWMucnUvcHJvamVjdC9lcnRoaW5rL2xpYm1kYngvYmxvYj9m
aWxlPUNoYW5nZUxvZy5tZAo+IAo+IFNpZ25lZC1vZmYtYnk6INCb0LXQvtC90LjQtCDQrtGA0YzQ
tdCyIChMZW9uaWQgWXVyaWV2KSA8bGVvQHl1cmlldi5ydT4KPiAtLS0KPiAgIHBhY2thZ2UvbGli
bWRieC9Db25maWcuaW4gICAgfCAyICstCj4gICBwYWNrYWdlL2xpYm1kYngvbGlibWRieC5oYXNo
IHwgNCArKy0tCj4gICBwYWNrYWdlL2xpYm1kYngvbGlibWRieC5tayAgIHwgNiArKystLS0KPiAg
IDMgZmlsZXMgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQo+IAo+IGRp
ZmYgLS1naXQgYS9wYWNrYWdlL2xpYm1kYngvQ29uZmlnLmluIGIvcGFja2FnZS9saWJtZGJ4L0Nv
bmZpZy5pbgo+IGluZGV4IGQxM2Y3MzkzOGYuLjJjZGU3ZWQ1ZTkgMTAwNjQ0Cj4gLS0tIGEvcGFj
a2FnZS9saWJtZGJ4L0NvbmZpZy5pbgo+ICsrKyBiL3BhY2thZ2UvbGlibWRieC9Db25maWcuaW4K
PiBAQCAtMTMsNyArMTMsNyBAQCBjb25maWcgQlIyX1BBQ0tBR0VfTElCTURCWAo+ICAgCSAgbGli
bWRieCBzdXJwYXNzZXMgdGhlIGxlZ2VuZGFyeSBMTURCIGluIHRlcm1zIG9mCj4gICAJICByZWxp
YWJpbGl0eSwgZmVhdHVyZXMgYW5kIHBlcmZvcm1hbmNlLgo+ICAgCj4gLQkgIGh0dHBzOi8vZ2l0
aHViLmNvbS9lcnRoaW5rL2xpYm1kYngKPiArCSAgaHR0cHM6Ly9naXRmbGljLnJ1L3Byb2plY3Qv
ZXJ0aGluay9saWJtZGJ4CgogIEkndmUgY2hhbmdlZCB0aGlzIHRvIHRoZSBwcm9qZWN0J3MgZG9j
dW1lbnRhdGlvbiB3ZWJzaXRlIFsyXS4KCj4gICAKPiAgIGlmIEJSMl9QQUNLQUdFX0xJQk1EQlgK
PiAgIAo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL2xpYm1kYngvbGlibWRieC5oYXNoIGIvcGFja2Fn
ZS9saWJtZGJ4L2xpYm1kYnguaGFzaAo+IGluZGV4IDI0ODNkMTRkZDEuLjdkNjYzYjNkYTAgMTAw
NjQ0Cj4gLS0tIGEvcGFja2FnZS9saWJtZGJ4L2xpYm1kYnguaGFzaAo+ICsrKyBiL3BhY2thZ2Uv
bGlibWRieC9saWJtZGJ4Lmhhc2gKPiBAQCAtMSw1ICsxLDUgQEAKPiAtIyBIYXNoZXMgZnJvbTog
aHR0cHM6Ly9naXRodWIuY29tL2VydGhpbmsvbGlibWRieC9yZWxlYXNlcy8KPiAtc2hhMjU2ICA4
ODRkZTUyOGY1YzJhYmFiMjE4N2I3YzRjODRiNzY5ZDI1NTFlMWE3NDhjYmZkZjBhZTRjMGY1Yzlm
OGRiZDI3ICBsaWJtZGJ4LWFtYWxnYW1hdGVkLTAuMTEuNC50YXIuZ3oKPiArIyBIYXNoZXMgZnJv
bTogaHR0cHM6Ly9saWJtZGJ4LndlYnNpdGUueWFuZGV4Y2xvdWQubmV0L3JlbGVhc2UvU0hBMjU2
U1VNUwo+ICtzaGEyNTYgIDNhOWZiNmE0Y2Q5NDFlNjQ2NTk3MjM1NTE4NzE0MzczZmRhMWNhNmQ0
YzVlMjM2NjlhZmU3MGVhODdjMjA5NDAgIGxpYm1kYngtYW1hbGdhbWF0ZWQtMC4xMS43LnRhci54
ego+ICAgCj4gICAjIExvY2FsbHkgY2FsY3VsYXRlZAo+ICAgc2hhMjU2ICAzMTBmZTI1Yzg1OGE5
NTE1ZmM4YzhkN2QxZjI0YTY3Yzk0OTZmODRhOTFlMGEwZTQxZWE5OTc1YjEzNzFlNTY5ICBMSUNF
TlNFCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvbGlibWRieC9saWJtZGJ4Lm1rIGIvcGFja2FnZS9s
aWJtZGJ4L2xpYm1kYngubWsKPiBpbmRleCAxYWZmOGZiYjRkLi5hNzA1NmIyODUwIDEwMDY0NAo+
IC0tLSBhL3BhY2thZ2UvbGlibWRieC9saWJtZGJ4Lm1rCj4gKysrIGIvcGFja2FnZS9saWJtZGJ4
L2xpYm1kYngubWsKPiBAQCAtNCw5ICs0LDkgQEAKPiAgICMKPiAgICMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjCj4gICAKPiAtTElCTURCWF9WRVJTSU9OID0gMC4xMS40Cj4gLUxJQk1EQlhfU09VUkNF
ID0gbGlibWRieC1hbWFsZ2FtYXRlZC0kKExJQk1EQlhfVkVSU0lPTikudGFyLmd6Cj4gLUxJQk1E
QlhfU0lURSA9IGh0dHBzOi8vZ2l0aHViLmNvbS9lcnRoaW5rL2xpYm1kYngvcmVsZWFzZXMvZG93
bmxvYWQvdiQoTElCTURCWF9WRVJTSU9OKQo+ICtMSUJNREJYX1ZFUlNJT04gPSAwLjExLjcKPiAr
TElCTURCWF9TT1VSQ0UgPSBsaWJtZGJ4LWFtYWxnYW1hdGVkLSQoTElCTURCWF9WRVJTSU9OKS50
YXIueHoKPiArTElCTURCWF9TSVRFID0gaHR0cHM6Ly9saWJtZGJ4LndlYnNpdGUueWFuZGV4Y2xv
dWQubmV0L3JlbGVhc2UKCiAgSSB3YXMgd29uZGVyaW5nIHdoeSB5b3UgZG9uJ3QgdXNlIHRoZSBV
UkxzIGZyb20gZ2l0ZmxpYywgYnV0IEkgZ3Vlc3MgdGhlIApvZmZpY2lhbCB3ZWJzaXRlIGlzIGlu
ZGVlZCBiZXR0ZXIuCgogIEFwcGxpZWQgdG8gbWFzdGVyIHdpdGggdGhvc2UgY2hhbmdlcywgdGhh
bmtzLgoKICBSZWdhcmRzLAogIEFybm91dAoKWzFdIApodHRwczovL2Jsb2cuZGVzZGVsaW51eC5u
ZXQvZW4vbGlibWRieC0wLTExLTctYXJyaXZlcy13aXRoLXByb2plY3QtbWlncmF0aW9uLXRvLWdp
dGZsaWMtYnVnLWZpeGVzLWFuZC1tb3JlLwpbMl0gaHR0cHM6Ly9saWJtZGJ4LndlYnNpdGUueWFu
ZGV4Y2xvdWQubmV0LwoKPiAgIExJQk1EQlhfU1VQUE9SVFNfSU5fU09VUkNFX0JVSUxEID0gTk8K
PiAgIExJQk1EQlhfTElDRU5TRSA9IE9MREFQLTIuOAo+ICAgTElCTURCWF9MSUNFTlNFX0ZJTEVT
ID0gTElDRU5TRQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8v
bGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
