Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E496C433F5
	for <buildroot@archiver.kernel.org>; Thu,  6 Jan 2022 21:10:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 521FF6FC06;
	Thu,  6 Jan 2022 21:10:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ciAqu2JCxr_u; Thu,  6 Jan 2022 21:10:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9098C6FB82;
	Thu,  6 Jan 2022 21:10:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CEFC41BF38A
 for <buildroot@lists.busybox.net>; Thu,  6 Jan 2022 21:10:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BB25040B9C
 for <buildroot@lists.busybox.net>; Thu,  6 Jan 2022 21:10:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=smile-fr.20210112.gappssmtp.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JfF3cbh4M01P for <buildroot@lists.busybox.net>;
 Thu,  6 Jan 2022 21:10:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 63B81404BD
 for <buildroot@buildroot.org>; Thu,  6 Jan 2022 21:10:20 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 o203-20020a1ca5d4000000b003477d032384so251927wme.2
 for <buildroot@buildroot.org>; Thu, 06 Jan 2022 13:10:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=lr/2l7SvgZ7SVQcp+yDhy7NoRB3QqiDQ0g9bkudEJm8=;
 b=UNqd5m+Vq1VorJNvP0kc2+fpC0wN63+tgIQ8TEgSfM4ZW2AbR1xkLQdgSZB4WIO2kc
 H1p9hqYXgIw8AZ1H0vUa/MZIQu5eyFsUC29xKl7RwxmHCQvCZ4xaqpwuyI96BZx7PcmL
 Pnw8Xqfr71KzII11Lqlgplpnv8nBbG2pQcsC+bH4K1RxnIB80yHrJKWqGH8oxoYyzMd2
 z9vFMOUBJ8rjELv8oLwPeW2MN+eHJZqOfjMZD/S/A+EM9wyVYwlbrAoLTEblq3YEShII
 KW6m3fdsl8v7n0EcsRkRTo6SUZyAypl5ddbY1O1+d/RCZqg56hqKlsSTAIIBpxDlhvd6
 OiHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=lr/2l7SvgZ7SVQcp+yDhy7NoRB3QqiDQ0g9bkudEJm8=;
 b=dPvFw8Vr+g1bSrMZiyingk29et+RgtZH1cH0Hbdyu9BZX8uj1BlJb8iDTPuJVyYZsG
 NBxJsROdNeBLzueMcK3/9zkg6y32OAf7WC0YDXYd0e/mcZlMX9M+GT1lmbH0AnCJTVGF
 NxxNyZlCDLGH31i/YxKpUZ0VkYxoFrTzTtZ4Bp/5U7Hdel7rOBJKVhZa0Kpjx/7i+GnL
 z07lhBMiNY96K8X2Hmcq+q7eVW7WBJy9MbFfUbG1seQ5lUP3kiv44E9zFvvQcfjTKuy1
 K0oubPZkkCDrcxRyutpnWGbcwsiw9gbtDETU/yl9r3t0UuM/YPDgKQ1Ur3MLdTvCZt6m
 ifng==
X-Gm-Message-State: AOAM533q61wCF0dIigALKA2cQfYw7sYcw+iJ1fGx9wGZkaFIC7tbS1Dt
 mrEAx/Du6th4mbQp+1wjQYJtBQ==
X-Google-Smtp-Source: ABdhPJzCyg5sBB6Ul7a/o1MWO/mnvFanxjUJ6LnkbRwH1WaC2o46+z6YLSLDexh71eNvDHOVjyNHdA==
X-Received: by 2002:a05:600c:3ac5:: with SMTP id
 d5mr8548518wms.32.1641503418910; 
 Thu, 06 Jan 2022 13:10:18 -0800 (PST)
Received: from ?IPV6:2a01:cb05:8f8a:1800:1c97:b8d1:b477:d53f?
 (2a01cb058f8a18001c97b8d1b477d53f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:1c97:b8d1:b477:d53f])
 by smtp.gmail.com with ESMTPSA id j13sm6840280wmq.11.2022.01.06.13.10.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Jan 2022 13:10:18 -0800 (PST)
Message-ID: <d88ad462-0e1e-be62-c0be-bbab22ed296d@smile.fr>
Date: Thu, 6 Jan 2022 22:10:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-US
To: Adam Duskett <aduskett@gmail.com>, buildroot@buildroot.org
References: <20220104200904.1422985-1-aduskett@gmail.com>
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <20220104200904.1422985-1-aduskett@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/gdb: remove python2 support
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

SGVsbG8gQWRhbSwKCkxlIDA0LzAxLzIwMjIgw6AgMjE6MDksIEFkYW0gRHVza2V0dCBhIMOpY3Jp
dMKgOgo+IEFjY29yZGluZyB0byB0aGUgR0RCIDkuMiBjaGFuZ2Vsb2csIHB5dGhvbjMgaGFzIGJl
ZW4gc3VwcG9ydGVkIHNpbmNlIGF0IGxlYXN0Cj4gMjAxOS4KPiAKPiAtIFJlbW92ZSBCUjJfUEFD
S0FHRV9IT1NUX0dEQl9QWVRIT04gaW4gcGFja2FnZS9nZGIvQ29uZmlnLmluLmhvc3QKPiAKPiAt
IEFkZCBCUjJfUEFDS0FHRV9IT1NUX0dEQl9QWVRIT04gdG8gQ29uZmlnLmluLmxlZ2FjeQo+IAo+
IC0gQ2hhbmdlIGRlcGVuZHMgb24gQlIyX1BBQ0tBR0VfUFlUSE9OIHx8IEJSMl9QQUNLQUdFX1BZ
VEhPTjMgdG8KPiAgIGRlcGVuZHMgb24gQlIyX1BBQ0tBR0VfUFlUSE9OMyBpbiBwYWNrYWdlL2dk
Yi9Db25maWcuaW4KCkFncmVlIG9uIHRoZSBwcmluY2lwbGUgYnV0IGl0IHNlZW1zIHRoYXQgdGhl
IGdkYiBmb3IgY3NreSBpcyBzdGlsbCBiYXNlZCBvbiBnZGIKNy4xMi4KCmh0dHBzOi8vZ2l0aHVi
LmNvbS9jLXNreS9iaW51dGlscy1nZGIvYmxvYi80ZWNiOThmYmMyZjk0ZGJlMDFiNjkzODRhZmJj
NTE1MTA3ZGU3M2RmL2dkYi92ZXJzaW9uLmluCgpCdXQgc2luY2UgY3NreSB0b29sY2hhaW4gaGFz
IGJlZW4gcmVtb3ZlZCByZWNlbnRseSwgSSBndWVzcyB3ZSBjYW4gcmVtb3ZlIHRoZQpiZWZvcmUg
YXBwbHlpbmcgeW91ciBwYXRjaC4KCkZvciBBUkMsIGdkYiBpcyBiYXNlZCBvbiAxMC54CgpodHRw
czovL2dpdGh1Yi5jb20vZm9zcy1mb3Itc3lub3BzeXMtZHdjLWFyYy1wcm9jZXNzb3JzL2JpbnV0
aWxzLWdkYi9ibG9iL2FyYy0yMDIwLjA5LXJlbGVhc2UtZ2RiL2dkYi92ZXJzaW9uLmluCgpCZXN0
IHJlZ2FyZHMsClJvbWFpbgoKPiAKPiBTaWduZWQtb2ZmLWJ5OiBBZGFtIER1c2tldHQgPGFkdXNr
ZXR0QGdtYWlsLmNvbT4KPiAtLS0KPiAgQ29uZmlnLmluLmxlZ2FjeSAgICAgICAgICAgfCAgNyAr
KysrKysrCj4gIHBhY2thZ2UvZ2RiL0NvbmZpZy5pbiAgICAgIHwgIDIgKy0KPiAgcGFja2FnZS9n
ZGIvQ29uZmlnLmluLmhvc3QgfCAgNSAtLS0tLQo+ICBwYWNrYWdlL2dkYi9nZGIubWsgICAgICAg
ICB8IDEwICstLS0tLS0tLS0KPiAgNCBmaWxlcyBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKyksIDE1
IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9Db25maWcuaW4ubGVnYWN5IGIvQ29uZmln
LmluLmxlZ2FjeQo+IGluZGV4IDU5OTRkOTQ0ODcuLmExMjZkNTYwNTIgMTAwNjQ0Cj4gLS0tIGEv
Q29uZmlnLmluLmxlZ2FjeQo+ICsrKyBiL0NvbmZpZy5pbi5sZWdhY3kKPiBAQCAtMTQ2LDYgKzE0
NiwxMyBAQCBlbmRpZgo+ICAKPiAgY29tbWVudCAiTGVnYWN5IG9wdGlvbnMgcmVtb3ZlZCBpbiAy
MDIyLjAyIgo+ICAKPiArY29uZmlnIEJSMl9QQUNLQUdFX0hPU1RfR0RCX1BZVEhPTgo+ICsJYm9v
bCAiR0RCIFB5dGhvbjIgc3VwcG9ydCByZW1vdmVkIgo+ICsJc2VsZWN0IEJSMl9MRUdBQ1kKPiAr
CWhlbHAKPiArCSAgUHl0aG9uMiBpcyBkZXByZWNhdGVkIGFuZCBubyBsb25nZXIgc3VwcG9ydGVk
Lgo+ICsJICBQbGVhc2UgbWlncmF0ZSB0byBQeXRob24zLgo+ICsKPiAgY29uZmlnIEJSMl9UT09M
Q0hBSU5fRVhURVJOQUxfQk9PVExJTl9SSVNDVjY0X0dMSUJDX0JMRUVESU5HX0VER0UKPiAgCWJv
b2wgIkJvb3RsaW4gcmlzY3Y2NCBnbGliYyBibGVlZGluZy1lZGdlIHRvb2xjaGFpbiByZW1vdmVk
Igo+ICAJc2VsZWN0IEJSMl9MRUdBQ1kKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9nZGIvQ29uZmln
LmluIGIvcGFja2FnZS9nZGIvQ29uZmlnLmluCj4gaW5kZXggNmYxYTg4M2RlNy4uZGFhZDZjOTEw
ZCAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL2dkYi9Db25maWcuaW4KPiArKysgYi9wYWNrYWdlL2dk
Yi9Db25maWcuaW4KPiBAQCAtNzcsNyArNzcsNyBAQCBjb25maWcgQlIyX1BBQ0tBR0VfR0RCX1RV
SQo+ICAKPiAgY29uZmlnIEJSMl9QQUNLQUdFX0dEQl9QWVRIT04KPiAgCWJvb2wgIlB5dGhvbiBz
dXBwb3J0Igo+IC0JZGVwZW5kcyBvbiBCUjJfUEFDS0FHRV9QWVRIT04gfHwgQlIyX1BBQ0tBR0Vf
UFlUSE9OMwo+ICsJZGVwZW5kcyBvbiBCUjJfUEFDS0FHRV9QWVRIT04zCj4gIAloZWxwCj4gIAkg
IFRoaXMgb3B0aW9uIGVuYWJsZXMgUHl0aG9uIHN1cHBvcnQgaW4gdGhlIHRhcmdldCBnZGIuCj4g
IAo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL2dkYi9Db25maWcuaW4uaG9zdCBiL3BhY2thZ2UvZ2Ri
L0NvbmZpZy5pbi5ob3N0Cj4gaW5kZXggYTZlMWQ3ZjUzYy4uMmM2Yzc4ZjIwYSAxMDA2NDQKPiAt
LS0gYS9wYWNrYWdlL2dkYi9Db25maWcuaW4uaG9zdAo+ICsrKyBiL3BhY2thZ2UvZ2RiL0NvbmZp
Zy5pbi5ob3N0Cj4gQEAgLTQxLDExICs0MSw2IEBAIGNvbmZpZyBCUjJfUEFDS0FHRV9IT1NUX0dE
Ql9OT1BZVEhPTgo+ICAJaGVscAo+ICAJICBUaGlzIG9wdGlvbiBkaXNhYmxlcyBQeXRob24gc3Vw
cG9ydCBpbiB0aGUgY3Jvc3MgZ2RiLgo+ICAKPiAtY29uZmlnIEJSMl9QQUNLQUdFX0hPU1RfR0RC
X1BZVEhPTgo+IC0JYm9vbCAiUHl0aG9uIDIiCj4gLQloZWxwCj4gLQkgIFRoaXMgb3B0aW9uIGVu
YWJsZXMgdGhlIFB5dGhvbiAyIHN1cHBvcnQgaW4gdGhlIGNyb3NzIGdkYi4KPiAtCj4gIGNvbmZp
ZyBCUjJfUEFDS0FHRV9IT1NUX0dEQl9QWVRIT04zCj4gIAlib29sICJQeXRob24gMyIKPiAgCWhl
bHAKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9nZGIvZ2RiLm1rIGIvcGFja2FnZS9nZGIvZ2RiLm1r
Cj4gaW5kZXggNGZmNDk4MjMwYS4uMjkyOWVhZjA1OCAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL2dk
Yi9nZGIubWsKPiArKysgYi9wYWNrYWdlL2dkYi9nZGIubWsKPiBAQCAtMjA2LDExICsyMDYsNiBA
QCBpZmVxICgkKEJSMl9QQUNLQUdFX1BZVEhPTjMpLHkpCj4gIEdEQl9DT05GX0VOViArPSBCUl9Q
WVRIT05fVkVSU0lPTj0kKFBZVEhPTjNfVkVSU0lPTl9NQUpPUikKPiAgR0RCX01BS0VfRU5WICs9
IEJSX1BZVEhPTl9WRVJTSU9OPSQoUFlUSE9OM19WRVJTSU9OX01BSk9SKQo+ICBHREJfREVQRU5E
RU5DSUVTICs9IHB5dGhvbjMKPiAtZWxzZQo+IC0jIENPTkZfRU5WOiBmb3IgdG9wLWxldmVsIGNv
bmZpZ3VyZTsgTUFLRV9FTlY6IGZvciBzdWItcHJvamVjdHMnIGNvbmZpZ3VyZS4KPiAtR0RCX0NP
TkZfRU5WICs9IEJSX1BZVEhPTl9WRVJTSU9OPSQoUFlUSE9OX1ZFUlNJT05fTUFKT1IpCj4gLUdE
Ql9NQUtFX0VOViArPSBCUl9QWVRIT05fVkVSU0lPTj0kKFBZVEhPTl9WRVJTSU9OX01BSk9SKQo+
IC1HREJfREVQRU5ERU5DSUVTICs9IHB5dGhvbgo+ICBlbmRpZgo+ICBHREJfQ09ORl9PUFRTICs9
IC0td2l0aC1weXRob249JChUT1BESVIpL3BhY2thZ2UvZ2RiL2dkYi1weXRob24tY29uZmlnCj4g
IGVsc2UKPiBAQCAtMjg3LDEwICsyODIsNyBAQCBlbHNlCj4gIEhPU1RfR0RCX0NPTkZfT1BUUyAr
PSAtLWRpc2FibGUtdHVpCj4gIGVuZGlmCj4gIAo+IC1pZmVxICgkKEJSMl9QQUNLQUdFX0hPU1Rf
R0RCX1BZVEhPTikseSkKPiAtSE9TVF9HREJfQ09ORl9PUFRTICs9IC0td2l0aC1weXRob249JChI
T1NUX0RJUikvYmluL3B5dGhvbjIKPiAtSE9TVF9HREJfREVQRU5ERU5DSUVTICs9IGhvc3QtcHl0
aG9uCj4gLWVsc2UgaWZlcSAoJChCUjJfUEFDS0FHRV9IT1NUX0dEQl9QWVRIT04zKSx5KQo+ICtp
ZmVxICgkKEJSMl9QQUNLQUdFX0hPU1RfR0RCX1BZVEhPTjMpLHkpCj4gIEhPU1RfR0RCX0NPTkZf
T1BUUyArPSAtLXdpdGgtcHl0aG9uPSQoSE9TVF9ESVIpL2Jpbi9weXRob24zCj4gIEhPU1RfR0RC
X0RFUEVOREVOQ0lFUyArPSBob3N0LXB5dGhvbjMKPiAgZWxzZQo+IAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApi
dWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1h
bi9saXN0aW5mby9idWlsZHJvb3QK
