Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B451BC433EF
	for <buildroot@archiver.kernel.org>; Thu,  6 Jan 2022 21:38:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 629D9400E5;
	Thu,  6 Jan 2022 21:38:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id chy9XTMEGa0V; Thu,  6 Jan 2022 21:38:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 356E240131;
	Thu,  6 Jan 2022 21:38:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C46EB1BF38A
 for <buildroot@lists.busybox.net>; Thu,  6 Jan 2022 21:37:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B1DD8831F5
 for <buildroot@lists.busybox.net>; Thu,  6 Jan 2022 21:37:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=smile-fr.20210112.gappssmtp.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4ijqWfmDXG_c for <buildroot@lists.busybox.net>;
 Thu,  6 Jan 2022 21:37:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 56487831EF
 for <buildroot@buildroot.org>; Thu,  6 Jan 2022 21:37:58 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id q8so7309902wra.12
 for <buildroot@buildroot.org>; Thu, 06 Jan 2022 13:37:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language
 :from:to:references:in-reply-to:content-transfer-encoding;
 bh=SdjNgONvtqTs/sCj/YNT05BFnbYfRbGFuu5ojc0Oc5A=;
 b=Qh0gW6lVYeIg098XJV1OiuGCIcO2x601QC2AGYsNQSJzbBNszG/6N8+A7a9FzlvT/C
 UKBmCsHPwZoGl0AN96GimlosJabQ2K1UJrsKTFCIhgxM/K9vKDVuvstXPrfWX5gpO15s
 Uy8d1HlWKG6bev2KiSnY7JDhq2BXbMiN7mCDcxHTibZ4YZBRUUXmw4MM02cJKdnr8/uH
 UNp9tgDRClFGhlZlQNwwVPok8J6Ug96kWHYPZ5XTnPLtDn3dE+EqbvyeD54wk29X17mS
 iBDQeDENOQM4gAu3DV9ucY9j7qkXbxCe3zvInEjoNhygWVXHtVIABulPczOPb8DvJJra
 g0yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:references:in-reply-to
 :content-transfer-encoding;
 bh=SdjNgONvtqTs/sCj/YNT05BFnbYfRbGFuu5ojc0Oc5A=;
 b=Tz5jeM+GJdt7Ef5xLJ926YfbENKs/F1xWx8RZslDtlpzCsU6x5lKRB/K1DmzLHn6tB
 r3fsk1JeU/wZkNRaXrWsf4nCKkpz2+nH54dluxbSvzJaDtn/Z1arRTtBPTa2HxsyQLSz
 QVKpBJIB18YTyWN759L4ZbVVVBFfCnUmbwne1cBCWzoGJSv/lLCIu+Q9iiJtaO87geLF
 xAxQyUC2m+yNVVanIFAVf5S4brH9f1aUdKWBOgbEJoG7S9ECHqo6YVaojthHtFh7RChk
 P7vDSd14nrYFsu2BoKokiC/P8K4gdsFArr7mZLKR4tJfkZXeOLYWN68u4Nadm85TkBW5
 ebDQ==
X-Gm-Message-State: AOAM532L/RSq6dwOUVSD6QTHZtWpgf2UzmRta4tAC3OzzkUoJxa42f6k
 rUNE7FxI4egGpaf54djcNkk7WdglaAdUPA==
X-Google-Smtp-Source: ABdhPJwf/dR2gN21jPRqfe/FsgBSjSEUoFuP4dSOfk9lpGPIzin5kbJqFIL6jww95E/01w+VarkMAQ==
X-Received: by 2002:a5d:4dc2:: with SMTP id f2mr51538081wru.156.1641505076468; 
 Thu, 06 Jan 2022 13:37:56 -0800 (PST)
Received: from ?IPV6:2a01:cb05:8f8a:1800:1c97:b8d1:b477:d53f?
 (2a01cb058f8a18001c97b8d1b477d53f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:1c97:b8d1:b477:d53f])
 by smtp.gmail.com with ESMTPSA id u10sm3151288wrs.28.2022.01.06.13.37.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Jan 2022 13:37:56 -0800 (PST)
Message-ID: <d0b10d7d-2d43-cbb9-8443-a9f06636add6@smile.fr>
Date: Thu, 6 Jan 2022 22:37:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: fr
From: Romain Naour <romain.naour@smile.fr>
To: Adam Duskett <aduskett@gmail.com>, buildroot@buildroot.org
References: <20220104200904.1422985-1-aduskett@gmail.com>
 <d88ad462-0e1e-be62-c0be-bbab22ed296d@smile.fr>
In-Reply-To: <d88ad462-0e1e-be62-c0be-bbab22ed296d@smile.fr>
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

TGUgMDYvMDEvMjAyMiDDoCAyMjoxMCwgUm9tYWluIE5hb3VyIGEgw6ljcml0wqA6Cj4gSGVsbG8g
QWRhbSwKPiAKPiBMZSAwNC8wMS8yMDIyIMOgIDIxOjA5LCBBZGFtIER1c2tldHQgYSDDqWNyaXTC
oDoKPj4gQWNjb3JkaW5nIHRvIHRoZSBHREIgOS4yIGNoYW5nZWxvZywgcHl0aG9uMyBoYXMgYmVl
biBzdXBwb3J0ZWQgc2luY2UgYXQgbGVhc3QKPj4gMjAxOS4KCkFjdHVhbGx5IHB5dGhvbjMgc3Vw
cG9ydCBpcyBhdmFpbGFibGUgc2luY2UgZ2RiIDcuOCBmb3IgTGludXg6CgpodHRwczovL3NvdXJj
ZXdhcmUub3JnL2dpdC8/cD1iaW51dGlscy1nZGIuZ2l0O2E9Y29tbWl0ZGlmZjtoPTlhMjdmMmM2
MGQ3NjBhOTVhMjdlMzM2NzUwZjI2ZjY5ZjkxZGQxNTYKCkl0J3MgZ2RiIHB5dGhvbjMgc3VwcG9y
dCBmb3Igd2luZG93cyB0aGF0IGlzIGF2YWlsYWJsZSBzaW5jZSB2ZXJzaW9uIDkuMi4KCkJlc3Qg
cmVnYXJkcywKUm9tYWluCgo+Pgo+PiAtIFJlbW92ZSBCUjJfUEFDS0FHRV9IT1NUX0dEQl9QWVRI
T04gaW4gcGFja2FnZS9nZGIvQ29uZmlnLmluLmhvc3QKPj4KPj4gLSBBZGQgQlIyX1BBQ0tBR0Vf
SE9TVF9HREJfUFlUSE9OIHRvIENvbmZpZy5pbi5sZWdhY3kKPj4KPj4gLSBDaGFuZ2UgZGVwZW5k
cyBvbiBCUjJfUEFDS0FHRV9QWVRIT04gfHwgQlIyX1BBQ0tBR0VfUFlUSE9OMyB0bwo+PiAgIGRl
cGVuZHMgb24gQlIyX1BBQ0tBR0VfUFlUSE9OMyBpbiBwYWNrYWdlL2dkYi9Db25maWcuaW4KPiAK
PiBBZ3JlZSBvbiB0aGUgcHJpbmNpcGxlIGJ1dCBpdCBzZWVtcyB0aGF0IHRoZSBnZGIgZm9yIGNz
a3kgaXMgc3RpbGwgYmFzZWQgb24gZ2RiCj4gNy4xMi4KPiAKPiBodHRwczovL2dpdGh1Yi5jb20v
Yy1za3kvYmludXRpbHMtZ2RiL2Jsb2IvNGVjYjk4ZmJjMmY5NGRiZTAxYjY5Mzg0YWZiYzUxNTEw
N2RlNzNkZi9nZGIvdmVyc2lvbi5pbgo+IAo+IEJ1dCBzaW5jZSBjc2t5IHRvb2xjaGFpbiBoYXMg
YmVlbiByZW1vdmVkIHJlY2VudGx5LCBJIGd1ZXNzIHdlIGNhbiByZW1vdmUgdGhlCj4gYmVmb3Jl
IGFwcGx5aW5nIHlvdXIgcGF0Y2guCj4gCj4gRm9yIEFSQywgZ2RiIGlzIGJhc2VkIG9uIDEwLngK
PiAKPiBodHRwczovL2dpdGh1Yi5jb20vZm9zcy1mb3Itc3lub3BzeXMtZHdjLWFyYy1wcm9jZXNz
b3JzL2JpbnV0aWxzLWdkYi9ibG9iL2FyYy0yMDIwLjA5LXJlbGVhc2UtZ2RiL2dkYi92ZXJzaW9u
LmluCj4gCj4gQmVzdCByZWdhcmRzLAo+IFJvbWFpbgo+IAo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBB
ZGFtIER1c2tldHQgPGFkdXNrZXR0QGdtYWlsLmNvbT4KPj4gLS0tCj4+ICBDb25maWcuaW4ubGVn
YWN5ICAgICAgICAgICB8ICA3ICsrKysrKysKPj4gIHBhY2thZ2UvZ2RiL0NvbmZpZy5pbiAgICAg
IHwgIDIgKy0KPj4gIHBhY2thZ2UvZ2RiL0NvbmZpZy5pbi5ob3N0IHwgIDUgLS0tLS0KPj4gIHBh
Y2thZ2UvZ2RiL2dkYi5tayAgICAgICAgIHwgMTAgKy0tLS0tLS0tLQo+PiAgNCBmaWxlcyBjaGFu
Z2VkLCA5IGluc2VydGlvbnMoKyksIDE1IGRlbGV0aW9ucygtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEv
Q29uZmlnLmluLmxlZ2FjeSBiL0NvbmZpZy5pbi5sZWdhY3kKPj4gaW5kZXggNTk5NGQ5NDQ4Ny4u
YTEyNmQ1NjA1MiAxMDA2NDQKPj4gLS0tIGEvQ29uZmlnLmluLmxlZ2FjeQo+PiArKysgYi9Db25m
aWcuaW4ubGVnYWN5Cj4+IEBAIC0xNDYsNiArMTQ2LDEzIEBAIGVuZGlmCj4+ICAKPj4gIGNvbW1l
bnQgIkxlZ2FjeSBvcHRpb25zIHJlbW92ZWQgaW4gMjAyMi4wMiIKPj4gIAo+PiArY29uZmlnIEJS
Ml9QQUNLQUdFX0hPU1RfR0RCX1BZVEhPTgo+PiArCWJvb2wgIkdEQiBQeXRob24yIHN1cHBvcnQg
cmVtb3ZlZCIKPj4gKwlzZWxlY3QgQlIyX0xFR0FDWQo+PiArCWhlbHAKPj4gKwkgIFB5dGhvbjIg
aXMgZGVwcmVjYXRlZCBhbmQgbm8gbG9uZ2VyIHN1cHBvcnRlZC4KPj4gKwkgIFBsZWFzZSBtaWdy
YXRlIHRvIFB5dGhvbjMuCj4+ICsKPj4gIGNvbmZpZyBCUjJfVE9PTENIQUlOX0VYVEVSTkFMX0JP
T1RMSU5fUklTQ1Y2NF9HTElCQ19CTEVFRElOR19FREdFCj4+ICAJYm9vbCAiQm9vdGxpbiByaXNj
djY0IGdsaWJjIGJsZWVkaW5nLWVkZ2UgdG9vbGNoYWluIHJlbW92ZWQiCj4+ICAJc2VsZWN0IEJS
Ml9MRUdBQ1kKPj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvZ2RiL0NvbmZpZy5pbiBiL3BhY2thZ2Uv
Z2RiL0NvbmZpZy5pbgo+PiBpbmRleCA2ZjFhODgzZGU3Li5kYWFkNmM5MTBkIDEwMDY0NAo+PiAt
LS0gYS9wYWNrYWdlL2dkYi9Db25maWcuaW4KPj4gKysrIGIvcGFja2FnZS9nZGIvQ29uZmlnLmlu
Cj4+IEBAIC03Nyw3ICs3Nyw3IEBAIGNvbmZpZyBCUjJfUEFDS0FHRV9HREJfVFVJCj4+ICAKPj4g
IGNvbmZpZyBCUjJfUEFDS0FHRV9HREJfUFlUSE9OCj4+ICAJYm9vbCAiUHl0aG9uIHN1cHBvcnQi
Cj4+IC0JZGVwZW5kcyBvbiBCUjJfUEFDS0FHRV9QWVRIT04gfHwgQlIyX1BBQ0tBR0VfUFlUSE9O
Mwo+PiArCWRlcGVuZHMgb24gQlIyX1BBQ0tBR0VfUFlUSE9OMwo+PiAgCWhlbHAKPj4gIAkgIFRo
aXMgb3B0aW9uIGVuYWJsZXMgUHl0aG9uIHN1cHBvcnQgaW4gdGhlIHRhcmdldCBnZGIuCj4+ICAK
Pj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvZ2RiL0NvbmZpZy5pbi5ob3N0IGIvcGFja2FnZS9nZGIv
Q29uZmlnLmluLmhvc3QKPj4gaW5kZXggYTZlMWQ3ZjUzYy4uMmM2Yzc4ZjIwYSAxMDA2NDQKPj4g
LS0tIGEvcGFja2FnZS9nZGIvQ29uZmlnLmluLmhvc3QKPj4gKysrIGIvcGFja2FnZS9nZGIvQ29u
ZmlnLmluLmhvc3QKPj4gQEAgLTQxLDExICs0MSw2IEBAIGNvbmZpZyBCUjJfUEFDS0FHRV9IT1NU
X0dEQl9OT1BZVEhPTgo+PiAgCWhlbHAKPj4gIAkgIFRoaXMgb3B0aW9uIGRpc2FibGVzIFB5dGhv
biBzdXBwb3J0IGluIHRoZSBjcm9zcyBnZGIuCj4+ICAKPj4gLWNvbmZpZyBCUjJfUEFDS0FHRV9I
T1NUX0dEQl9QWVRIT04KPj4gLQlib29sICJQeXRob24gMiIKPj4gLQloZWxwCj4+IC0JICBUaGlz
IG9wdGlvbiBlbmFibGVzIHRoZSBQeXRob24gMiBzdXBwb3J0IGluIHRoZSBjcm9zcyBnZGIuCj4+
IC0KPj4gIGNvbmZpZyBCUjJfUEFDS0FHRV9IT1NUX0dEQl9QWVRIT04zCj4+ICAJYm9vbCAiUHl0
aG9uIDMiCj4+ICAJaGVscAo+PiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9nZGIvZ2RiLm1rIGIvcGFj
a2FnZS9nZGIvZ2RiLm1rCj4+IGluZGV4IDRmZjQ5ODIzMGEuLjI5MjllYWYwNTggMTAwNjQ0Cj4+
IC0tLSBhL3BhY2thZ2UvZ2RiL2dkYi5tawo+PiArKysgYi9wYWNrYWdlL2dkYi9nZGIubWsKPj4g
QEAgLTIwNiwxMSArMjA2LDYgQEAgaWZlcSAoJChCUjJfUEFDS0FHRV9QWVRIT04zKSx5KQo+PiAg
R0RCX0NPTkZfRU5WICs9IEJSX1BZVEhPTl9WRVJTSU9OPSQoUFlUSE9OM19WRVJTSU9OX01BSk9S
KQo+PiAgR0RCX01BS0VfRU5WICs9IEJSX1BZVEhPTl9WRVJTSU9OPSQoUFlUSE9OM19WRVJTSU9O
X01BSk9SKQo+PiAgR0RCX0RFUEVOREVOQ0lFUyArPSBweXRob24zCj4+IC1lbHNlCj4+IC0jIENP
TkZfRU5WOiBmb3IgdG9wLWxldmVsIGNvbmZpZ3VyZTsgTUFLRV9FTlY6IGZvciBzdWItcHJvamVj
dHMnIGNvbmZpZ3VyZS4KPj4gLUdEQl9DT05GX0VOViArPSBCUl9QWVRIT05fVkVSU0lPTj0kKFBZ
VEhPTl9WRVJTSU9OX01BSk9SKQo+PiAtR0RCX01BS0VfRU5WICs9IEJSX1BZVEhPTl9WRVJTSU9O
PSQoUFlUSE9OX1ZFUlNJT05fTUFKT1IpCj4+IC1HREJfREVQRU5ERU5DSUVTICs9IHB5dGhvbgo+
PiAgZW5kaWYKPj4gIEdEQl9DT05GX09QVFMgKz0gLS13aXRoLXB5dGhvbj0kKFRPUERJUikvcGFj
a2FnZS9nZGIvZ2RiLXB5dGhvbi1jb25maWcKPj4gIGVsc2UKPj4gQEAgLTI4NywxMCArMjgyLDcg
QEAgZWxzZQo+PiAgSE9TVF9HREJfQ09ORl9PUFRTICs9IC0tZGlzYWJsZS10dWkKPj4gIGVuZGlm
Cj4+ICAKPj4gLWlmZXEgKCQoQlIyX1BBQ0tBR0VfSE9TVF9HREJfUFlUSE9OKSx5KQo+PiAtSE9T
VF9HREJfQ09ORl9PUFRTICs9IC0td2l0aC1weXRob249JChIT1NUX0RJUikvYmluL3B5dGhvbjIK
Pj4gLUhPU1RfR0RCX0RFUEVOREVOQ0lFUyArPSBob3N0LXB5dGhvbgo+PiAtZWxzZSBpZmVxICgk
KEJSMl9QQUNLQUdFX0hPU1RfR0RCX1BZVEhPTjMpLHkpCj4+ICtpZmVxICgkKEJSMl9QQUNLQUdF
X0hPU1RfR0RCX1BZVEhPTjMpLHkpCj4+ICBIT1NUX0dEQl9DT05GX09QVFMgKz0gLS13aXRoLXB5
dGhvbj0kKEhPU1RfRElSKS9iaW4vcHl0aG9uMwo+PiAgSE9TVF9HREJfREVQRU5ERU5DSUVTICs9
IGhvc3QtcHl0aG9uMwo+PiAgZWxzZQo+Pgo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVp
bGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9i
dWlsZHJvb3QK
