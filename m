Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80267C433F5
	for <buildroot@archiver.kernel.org>; Sat, 11 Dec 2021 09:55:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EFE3F61CA0;
	Sat, 11 Dec 2021 09:55:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jkli2EN3Ca6a; Sat, 11 Dec 2021 09:55:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 442F061C4B;
	Sat, 11 Dec 2021 09:55:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 945291BF363
 for <buildroot@lists.busybox.net>; Sat, 11 Dec 2021 09:55:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7BDCE61C4B
 for <buildroot@lists.busybox.net>; Sat, 11 Dec 2021 09:55:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ts_Xu3JVFl2R for <buildroot@lists.busybox.net>;
 Sat, 11 Dec 2021 09:55:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1F7B361C3F
 for <buildroot@buildroot.org>; Sat, 11 Dec 2021 09:55:25 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id o20so37512381eds.10
 for <buildroot@buildroot.org>; Sat, 11 Dec 2021 01:55:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language
 :from:to:cc:references:organization:in-reply-to
 :content-transfer-encoding;
 bh=qTaUBx+MQbIq1T6tS26hy6Cf+eaBhyhhnU8EyL9T4/8=;
 b=ANzuP5EXFr4y3wCxvJUBwp/1rdiGFL60smkaTDAzLcoDspxvFUWb+l5Wj7RiAXHRTS
 TomVmhMGvDi8YODwe7gPVBZtVoZVVFpNL4FL9I/qmAtNBdVs0gFwzAr4fuLekukC2vt1
 f0yAkLzdWxAXGWxjbyLJBHiw5kC0daAQS0BuskQeEz3+FQSVt0mfVYUJ0fEvVjyVF8ge
 84MBd+GsnJZJSe5BnJeLorjBdzkoL/NtdiEIbUzlOESOi5/r26mg39o5Iy+8twRoqIJn
 CthU88QUk2xLwzn7H3TSEjURATjviJwQXDjHGwKyMYnuEAjn1t2k5aJjwEfau748+5Bv
 qScw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:organization:in-reply-to
 :content-transfer-encoding;
 bh=qTaUBx+MQbIq1T6tS26hy6Cf+eaBhyhhnU8EyL9T4/8=;
 b=jtfSeT/UvW6FGWWSzeeROhTPMLPtDwxPztmPn4cExz9E7tLd7h2w/6SGBxtTmF+mta
 oK5sj9PgzMj/fu5wICrInAVuj5ILVghG4v1nW/AO8PjKmqruaqPFLDEgvtl7oBvlXeew
 R0uLZLoAWTA7JpRx/Ha71rU4vsOtJ+3NrAZuoLnjVj4JSs/pQAYGOoWfyCtNnkedlRc6
 J6virM1iifEAvfDIfnYUqYK6UGWhSpxIiZZvGayLvFKmhhvbHqozWYEQyU2CN3Bwk8wK
 pL1l8xf3LC4HHjMrP8rSfXuUsdrSFI7G9q0ewU5RCiTMgxCFyhvH+Pct8OuOpIe0Xq2z
 FRgw==
X-Gm-Message-State: AOAM533K2fO4SJW+b/BB3MrmskqTtWpN52l2my4qbM9OwpTzkExvWbw8
 S907vbV67Oa8/S+kdH+ix41KGdYgSvaiWh00ZBA=
X-Google-Smtp-Source: ABdhPJzJurgonasqqEO2HMmmH7/gvLIn30uJAN5EehaS5XLMO0QIO4eppR6cAqCxFlhOCAM/rowMEg==
X-Received: by 2002:a05:6402:26cd:: with SMTP id
 x13mr46812054edd.11.1639216524146; 
 Sat, 11 Dec 2021 01:55:24 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id g1sm2687404eje.105.2021.12.11.01.55.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 11 Dec 2021 01:55:23 -0800 (PST)
Message-ID: <1935f55e-e2a5-1a4e-6bc2-135d8c8931cf@mind.be>
Date: Sat, 11 Dec 2021 10:55:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-GB
From: Arnout Vandecappelle <arnout@mind.be>
To: Kory Maincent <kory.maincent@bootlin.com>, buildroot@buildroot.org
References: <20211116104534.18868-1-kory.maincent@bootlin.com>
 <4122452e-38c1-7044-398f-81c965bce9f9@mind.be>
Organization: Essensium/Mind
In-Reply-To: <4122452e-38c1-7044-398f-81c965bce9f9@mind.be>
Subject: Re: [Buildroot] [PATCH v3] package/psplash: add support for missing
 configure options
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
Cc: phil.eichinger@gmail.com, thomas.petazzoni@bootlin.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Ck9uIDExLzEyLzIwMjEgMTA6NTEsIEFybm91dCBWYW5kZWNhcHBlbGxlIHdyb3RlOgo+Cj4KPiBP
biAxNi8xMS8yMDIxIDExOjQ1LCBLb3J5IE1haW5jZW50IHdyb3RlOgo+PiBBZGQgc3VwcG9ydCB0
byB0aHJlZSBjb25maWd1cmUgb3B0aW9uczoKPj4gLS1lbmFibGUtc3RhcnR1cC1tc2c6IEVuYWJs
ZSB0ZXh0IGJhbm5lciBvdXRwdXQgb24gc3RhcnR1cAo+PiAtLWVuYWJsZS1wcm9ncmVzcy1iYXI6
IEVuYWJsZSBwcm9ncmVzcyBiYXIKPj4gLS1lbmFibGUtaW1nLWZ1bGxzY3JlZW46IEVuYWJsZSB0
aGUgbG9nbyBpbWFnZSBpbiBmdWxsc2NyZWVuIG1vZGUKCiDCoEkgZm9yZ290IHRvIG1lbnRpb24g
YmVmb3JlOiB0aGUgY29tbWl0IG1lc3NhZ2Ugc2hvdWxkIHNheSBleHBsaWNpdGx5IHRoYXQgCnN0
YXJ0dXAtbXNnIGFuZCBwcm9ncmVzcy1iYXIgZGVmYXVsdCB0byBlbmFibGVkLCBzbyB0aGV5IGhh
dmUgdGhlIGNvcnJlc3BvbmRpbmcgCmRlZmF1bHQgaW4gQ29uZmlnLmluLgoKCgogwqBSZWdhcmRz
LAogwqBBcm5vdXQKCgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBLb3J5IE1haW5jZW50IDxrb3J5Lm1h
aW5jZW50QGJvb3RsaW4uY29tPgo+PiAtLS0KPj4KPj4gQ2hhbmdlIHNpbmNlIHYxOgo+PiBSZW1v
dmUgdGhlIGNyYXAgLmNvbmZpZy5pbi5zd3AKPj4KPj4gQ2hhbmdlIHNpbmNlIHYyOgo+PiBVc2Ug
Ym90aCBzaWRlIG9mIGVuYWJsZS9kaXNhYmxlIGNvbmZpZ3VyZSBvcHRpb24gY29uZGl0aW9uLgo+
PiBVc2UgcG9zaXRpdmUgb3B0aW9ucyBpbiBLY29uZmlnLgo+Pgo+Pgo+PiDCoCBwYWNrYWdlL3Bz
cGxhc2gvQ29uZmlnLmluwqAgfCAxNyArKysrKysrKysrKysrKysrKwo+PiDCoCBwYWNrYWdlL3Bz
cGxhc2gvcHNwbGFzaC5tayB8IDE4ICsrKysrKysrKysrKysrKysrKwo+PiDCoCAyIGZpbGVzIGNo
YW5nZWQsIDM1IGluc2VydGlvbnMoKykKPj4KPj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvcHNwbGFz
aC9Db25maWcuaW4gYi9wYWNrYWdlL3BzcGxhc2gvQ29uZmlnLmluCj4+IGluZGV4IGRhOTliMjY0
ZTAuLmVkZDMwZGNiNGQgMTAwNjQ0Cj4+IC0tLSBhL3BhY2thZ2UvcHNwbGFzaC9Db25maWcuaW4K
Pj4gKysrIGIvcGFja2FnZS9wc3BsYXNoL0NvbmZpZy5pbgo+PiBAQCAtMzUsNiArMzUsMjMgQEAg
Y29uZmlnIEJSMl9QQUNLQUdFX1BTUExBU0hfSU1BR0UKPj4gwqDCoMKgwqDCoMKgwqAgVXNlIGEg
cGVyc29uYWxpemVkIHBuZyBpbWFnZSBhcyBib290IHNwbGFzaC4KPj4gwqDCoMKgwqDCoMKgwqAg
TGV0IGl0IGVtcHR5IGlmIHlvdSB3YW50IHRvIGtlZXAgdGhlIHBzcGxhc2ggZGVmYXVsdCBpbWFn
ZS4KPj4gwqAgK2NvbmZpZyBCUjJfUEFDS0FHRV9QU1BMQVNIX0ZVTExfU0NSRUVOCj4+ICvCoMKg
wqAgYm9vbCAidXNlIGZ1bGxzY3JlZW4gbW9kZSIKPj4gK8KgwqDCoCBoZWxwCj4+ICvCoMKgwqDC
oMKgIEVuYWJsZSB0aGUgcHNwbGFzaCBpbWFnZSBpbiBmdWxsc2NyZWVuIG1vZGUuCj4+ICsKPj4g
K2NvbmZpZyBCUjJfUEFDS0FHRV9QU1BMQVNIX1NUQVJUVVBfTVNHCj4+ICvCoMKgwqAgYm9vbCAi
ZW5hYmxlIHN0YXJ0dXAgbWVzc2FnZSIKPj4gK8KgwqDCoCBkZWZhdWx0IHkKPj4gK8KgwqDCoCBo
ZWxwCj4+ICvCoMKgwqDCoMKgIEVuYWJsZSB0ZXh0IGJhbm5lciBvdXRwdXQgb24gc3RhcnR1cC4K
Pj4gKwo+PiArY29uZmlnIEJSMl9QQUNLQUdFX1BTUExBU0hfUFJPR1JFU1NfQkFSCj4+ICvCoMKg
wqAgYm9vbCAiZW5hYmxlIHByb2dyZXNzIGJhciIKPj4gK8KgwqDCoCBkZWZhdWx0IHkKPj4gK8Kg
wqDCoCBoZWxwCj4+ICvCoMKgwqDCoMKgIEVuYWJsZSB0aGUgbWFuYWdlbWVudCBvZiB0aGUgcHJv
Z3Jlc3MgYmFyLgo+PiArCj4+IMKgIGVuZGlmCj4+IMKgIMKgIGNvbW1lbnQgInBzcGxhc2ggbmVl
ZHMgYSB0b29sY2hhaW4gdy8gd2NoYXIiCj4+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3BzcGxhc2gv
cHNwbGFzaC5tayBiL3BhY2thZ2UvcHNwbGFzaC9wc3BsYXNoLm1rCj4+IGluZGV4IDVlNjFmMjM5
MmYuLmU1YjIxMjM4MWEgMTAwNjQ0Cj4+IC0tLSBhL3BhY2thZ2UvcHNwbGFzaC9wc3BsYXNoLm1r
Cj4+ICsrKyBiL3BhY2thZ2UvcHNwbGFzaC9wc3BsYXNoLm1rCj4+IEBAIC0xOCw2ICsxOCwyNCBA
QCBlbHNlCj4+IMKgIFBTUExBU0hfQ09ORl9PUFRTICs9IC0td2l0aG91dC1zeXN0ZW1kCj4+IMKg
IGVuZGlmCj4+IMKgICtpZmVxICgkKEJSMl9QQUNLQUdFX1BTUExBU0hfRlVMTF9TQ1JFRU4pLHkp
Cj4+ICtQU1BMQVNIX0NPTkZfT1BUUyArPSAtLWVuYWJsZS1pbWctZnVsbHNjcmVlbgo+PiArZWxz
ZQo+PiArUFNQTEFTSF9DT05GX09QVFMgKz0gLS1kaXNhYmxlLWltZy1mdWxsc2NyZWVuCj4KPiDC
oEhhdmUgeW91IGFjdHVhbGx5IHRlc3RlZCB0aGlzPwo+Cj4gwqBJIGhhdmVuJ3QsIGJ1dCBJIHNl
ZSB0aGlzIGluIGNvbmZpZ3VyZS5hYzoKPgo+IEFDX0FSR19FTkFCTEUoW2ltZy1mdWxsc2NyZWVu
XSwKPiDCoMKgwqAgQVNfSEVMUF9TVFJJTkcoWy0tZW5hYmxlLWltZy1mdWxsc2NyZWVuXSwgW0Vu
YWJsZSB0aGUgbG9nbyBpbWFnZSBpbiAKPiBmdWxsc2NyZWVuIG1vZGUpXSksCj4gwqDCoMKgIFtp
bWdfZnVsbHNjcmVlbj10cnVlXSwKPiDCoMKgwqAgW2ltZ19mdWxsc2NyZWVuPWZhbHNlXSkKPiBB
U19JRihbdGVzdCB4JGltZ19mdWxsc2NyZWVuID0geHRydWVdLCBbCj4gwqDCoMKgIEVYVFJBX0dD
Q19GTEFHUz0iJEVYVFJBX0dDQ19GTEFHUyAtRFBTUExBU0hfSU1HX0ZVTExTQ1JFRU49MSIKPiBd
KQo+Cj4gaS5hLiBBQ19BUkdfRU5BQkxFIGlzIHVzZWQgaW5jb3JyZWN0bHkuIFRoYXQgbWVhbnMg
dGhhdCBib3RoIAo+IC0tZW5hYmxlLWltZy1mdWxsc2NyZWVuIGFuZCAtLWRpc2FibGUtaW1hZ2Ut
ZnVsbHNjcmVlbiB3aWxsIGVuYWJsZSB0aGUgb3B0aW9uIAo+IChiZWNhdXNlIHRoZSBhY3Rpb24t
aWYtcHJlc2VudCBpcyBpbWdfZnVsbHNjcmVlbj10cnVlKSwgd2hpbGUgaWYgbm90aGluZyBpcyAK
PiBzZXQgaXQgd2lsbCBiZSBkaXNibGVkLgo+Cj4gwqBTYW1lIGZvciB0aGUgb3RoZXIgdHdvIG9w
dGlvbnMsIGJ1dCB0aGVyZSB0aGUgbG9naWMgaXMgaW52ZXJ0ZWQgKGkuZS4gaXQncyAKPiBkaXNh
YmxlZCBpZiBwcmVzZW50IGFuZCBlbmFibGVkIGlmIG5vdCkuCj4KPiDCoEkgZG9uJ3Qga25vdyBp
ZiBwc3BsYXNoIGlzIHN0aWxsIGFuIGFjdGl2ZSBwcm9qZWN0OyBpZiBzbywgSSB3b3VsZCBwcm9w
b3NlIHRvIAo+IGZpeCB0aGlzIGluIGNvbmZpZ3VyZS5hYyBhbmQgc2VuZCB0aGUgcGF0Y2ggdXBz
dHJlYW0uIFRoZSBmaXggaXMgc2ltcGxlOgo+Cj4KPiBBQ19BUkdfRU5BQkxFKFtpbWctZnVsbHNj
cmVlbl0sCj4gwqDCoMKgIEFTX0hFTFBfU1RSSU5HKFstLWVuYWJsZS1pbWctZnVsbHNjcmVlbl0s
IFtFbmFibGUgdGhlIGxvZ28gaW1hZ2UgaW4gCj4gZnVsbHNjcmVlbiBtb2RlKV0pKQo+IEFTX0lG
KFt0ZXN0ICJ4JGVuYWJsZV9pbWdfZnVsbHNjcmVlbiIgIT0gInhubyJdLCBbCj4gwqDCoMKgIEVY
VFJBX0dDQ19GTEFHUz0iJEVYVFJBX0dDQ19GTEFHUyAtRFBTUExBU0hfSU1HX0ZVTExTQ1JFRU49
MSIKPiBdKQo+Cj4KPiDCoGFuZCBmb3IgZW5hYmxlLXN0YXJ0dXAtbXNnOgo+Cj4gQUNfQVJHX0VO
QUJMRShbc3RhcnR1cC1tc2ddLAo+IMKgwqDCoCBBU19IRUxQX1NUUklORyhbLS1kaXNhYmxlLXN0
YXJ0dXAtbXNnXSwgW0Rpc2FibGUgdGV4dCBiYW5uZXIgb3V0cHV0IG9uIAo+IHN0YXJ0dXBdKSwK
PiDCoMKgwqAgW10sW2VuYWJsZV9zdGFydHVwX21zZz15ZXNdKQo+IEFTX0lGKFt0ZXN0ICJ4JGVu
YWJsZV9zdGFydHVwX21zZyIgPSAieG5vIl0sIFsKPiDCoMKgwqAgRVhUUkFfR0NDX0ZMQUdTPSIk
RVhUUkFfR0NDX0ZMQUdTIC1EUFNQTEFTSF9ESVNBQkxFX1NUQVJUVVBfTVNHIgo+IF0pCj4KPiAo
bm90ZTogeW91IGhhdmUgdG8gdXNlICJubyIgYmVjYXVzZSB0aGF0IGlzIHRoZSB2YWx1ZSB0aGF0
IGlzIHNldCB3aGVuIAo+IC0tZGlzYWJsZS1mb28gaXMgZ2l2ZW4uIFlvdSBzaG91bGRuJ3QgdXNl
IGFueXRoaW5nIGVsc2UgYmVjYXVzZSAKPiAtLWVuYWJsZS1mb289bm8gb3IgLS1lbmFibGUtZm9v
PXllcyBhcmUgYWxzbyBhbGxvd2VkKS4KPgo+Cj4gwqBSZWdhcmRzLAo+IMKgQXJub3V0Cj4KPj4g
K2VuZGlmCj4+ICsKPj4gK2lmZXEgKCQoQlIyX1BBQ0tBR0VfUFNQTEFTSF9TVEFSVFVQX01TRyks
eSkKPj4gK1BTUExBU0hfQ09ORl9PUFRTICs9IC0tZW5hYmxlLXN0YXJ0dXAtbXNnCj4+ICtlbHNl
Cj4+ICtQU1BMQVNIX0NPTkZfT1BUUyArPSAtLWRpc2FibGUtc3RhcnR1cC1tc2cKPj4gK2VuZGlm
Cj4+ICsKPj4gK2lmZXEgKCQoQlIyX1BBQ0tBR0VfUFNQTEFTSF9QUk9HUkVTU19CQVIpLHkpCj4+
ICtQU1BMQVNIX0NPTkZfT1BUUyArPSAtLWVuYWJsZS1wcm9ncmVzcy1iYXIKPj4gK2Vsc2UKPj4g
K1BTUExBU0hfQ09ORl9PUFRTICs9IC0tZGlzYWJsZS1wcm9ncmVzcy1iYXIKPj4gK2VuZGlmCj4+
ICsKPj4gwqAgUFNQTEFTSF9JTUFHRSA9ICQoY2FsbCBxc3RyaXAsJChCUjJfUEFDS0FHRV9QU1BM
QVNIX0lNQUdFKSkKPj4gwqAgwqAgaWZuZXEgKCQoUFNQTEFTSF9JTUFHRSksKQo+PgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGlu
ZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
