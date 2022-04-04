Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FB08C433F5
	for <buildroot@archiver.kernel.org>; Mon,  4 Apr 2022 20:28:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EC35560FF4;
	Mon,  4 Apr 2022 20:28:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pHBV5j8h6nkw; Mon,  4 Apr 2022 20:28:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0948460FE2;
	Mon,  4 Apr 2022 20:28:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C7D301BF232
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 20:28:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B081940204
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 20:28:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iSN3mUL7KPFQ for <buildroot@lists.busybox.net>;
 Mon,  4 Apr 2022 20:28:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B57A7400D9
 for <buildroot@buildroot.org>; Mon,  4 Apr 2022 20:28:16 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id qh7so12368626ejb.11
 for <buildroot@buildroot.org>; Mon, 04 Apr 2022 13:28:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=QqTFjddriHPKGQksQTBetkB2FDjUBSvHaIhFJ910hwQ=;
 b=iW/vpfYVdmvZoCV5OJ3yMoHVtVB38uqUv+2+ovYR2vm8DlcKa9NRshZR3R3g0KictA
 Nuqo3t/obCZT8MIwBFGuX3GPeAXkp8VAV5PGr8JmZ9G4I2sRv0tsvz7/mb9JDEIhS2l9
 oa0Anc/ZLNW7p03nUbX6wC0Fc/4TJAGjKuveoFpSuo1yP6bEM+7ONaKJWW4Dv2AVDrXB
 mqBFlgzmYtEzPDn5UJOqziJ20NyVYWQ5VG36KQDhOPSaDMUHej+aISzL4G1phr0kcL70
 l2s/ch7FeBfbXijhijw4OV2yiJVsacEy0xFQQi0hB2SDNdRJNUycTylQlvyYQ5OhY/5W
 1zEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=QqTFjddriHPKGQksQTBetkB2FDjUBSvHaIhFJ910hwQ=;
 b=WI/rHd8FKlyG7t6hm3iSgJUwDcBvrtoFM87CcV2CTtRt3posPqoxFxo4ngjW1DXfjG
 Cx5puT8cmQU/UzV03g2MqE+RQmy5F3RCPr0thUEmqzh6nSqfDcONTS1eoBz8g8zEuYXm
 0y32NKcAyIM5PIgCOpHxgHiC+2Hp6xUWdhYVB4nmgopD4JTDH2uGRGmuHfMw8FNDXJOQ
 RLQOOAFhQVWF5rvR8qUZ095QXms7cC/HlVphE3mrtZZdOKCOMEyplRieKjc/LSBKapKG
 Io9gSp6S/ZMg/vpEAjaI4ET/lGHUDxcbjv7Ed/tsxP4NIZgOt5Njo8nPBwTzSTLUDL/S
 rSSg==
X-Gm-Message-State: AOAM530JUzMT1YZzSr3/qZM5Hi2yznr2GqW0sXzemN/IYBLq9d2HngHJ
 z3Q39EXyX3lm+soZ4fUZc86eygeDqQi0Ig==
X-Google-Smtp-Source: ABdhPJwetyINjRUNVb0TlqkitHZftSbn8TTPgyOxCnRmrzPEwGc1WA4DtD19w0pomzrqvcl+ksswuA==
X-Received: by 2002:a17:907:8a15:b0:6e8:a80:aaae with SMTP id
 sc21-20020a1709078a1500b006e80a80aaaemr183091ejc.637.1649104094868; 
 Mon, 04 Apr 2022 13:28:14 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 dn4-20020a17090794c400b006dbec4f4acbsm4810135ejc.6.2022.04.04.13.28.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Apr 2022 13:28:14 -0700 (PDT)
Message-ID: <2646beec-15db-f2e9-5490-0f7fd551857f@mind.be>
Date: Mon, 4 Apr 2022 22:28:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: buildroot@buildroot.org, Gerome Burlats <gerome.burlats@smile.fr>,
 Romain Naour <romain.naour@gmail.com>
References: <20220329205136.32435-1-vincent.stehle@laposte.net>
 <40cedffc-e46e-e4d5-e2f3-c0dd398906cd@mind.be>
 <YktJLL+SywDe7TYm@romuald.bergerie>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <YktJLL+SywDe7TYm@romuald.bergerie>
Subject: Re: [Buildroot] [PATCH] configs/qemu_xtensa_lx60_nommu: use busybox
 minimal config
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

CgpPbiAwNC8wNC8yMDIyIDIxOjM4LCBWaW5jZW50IFN0ZWhsw6kgd3JvdGU6Cj4gT24gU3VuLCBB
cHIgMDMsIDIwMjIgYXQgMDU6MDc6NDhQTSArMDIwMCwgQXJub3V0IFZhbmRlY2FwcGVsbGUgd3Jv
dGU6Cj4+Cj4+Cj4+IE9uIDI5LzAzLzIwMjIgMjI6NTEsIFZpbmNlbnQgU3RlaGzDqSB2aWEgYnVp
bGRyb290IHdyb3RlOgo+Pj4gVXBkYXRlIHRoZSBxZW11X3h0ZW5zYV9seDYwX25vbW11X2RlZmNv
bmZpZyB0byB1c2UgdGhlCj4+PiBidXN5Ym94LW1pbmltYWwuY29uZmlnLCB0byBtYWtlIGl0IG1v
cmUgY29uc2lzdGVudCB3aXRoIHRoZSBvdGhlciBuby1NTVUKPj4+IGRlZmNvbmZpZ3MuCj4+Cj4+
ICAgVGhhdCdzIG5vdCBhIHZhbGlkIHJlYXNvbiBJTUhPLiBXZSB1c2UgdGhlIG1pbmltYWwgYnVz
eWJveCBmb3IgYm9hcmRzIHRoYXQKPj4gYXJlIGV4dHJlbWVseSB0aWdodCBvbiBtZW1vcnkgLSB3
aGljaCBpcyBvZnRlbiB0aGUgY2FzZSBmb3Igbm9NTVUgYm9hcmRzLgo+PiBCdXQgaWYgd2UgY2Fu
IHNwYXJlIHRoZSBzaXplLCBmdWxsIGJ1c3lib3ggaXMgYSBsb3QgbW9yZSB1c2VhYmxlLgo+IAo+
IEhpIEFybm91dCwKPiAKPiBUaGFua3MgZm9yIHJldmlld2luZyB0aGlzIHBhdGNoLgo+IAo+PiAg
IEkndmUgbWFya2VkIHRoaXMgcGF0Y2ggYXMgUmVqZWN0ZWQgaW4gcGF0Y2h3b3JrLCBidXQgaWYg
dGhlcmUncyBhIGdvb2QKPj4gcmVhc29uIHRvIGRvIHRoaXMsIHdlIGNhbiBhbHdheXMgcmVjb3Zl
ciBpdC4KPiAKPiBUaGVyZSBpcyBhbm90aGVyIGluY2VudGl2ZSB0byB1c2luZyB0aGUgbWluaW1h
bCBjb25maWcgb24gbm8tTU1VIHBsYXRmb3JtczogaXQKPiBmaXhlcyB0aGUgdWRoY3BjIGVycm9y
IGFuZCByZXBhaXJzIHRoZSBuZXR3b3JrIGluaXRpYWxpemF0aW9uLgoKICBPb2gsIG5vdyBJIHVu
ZGVyc3RhbmQgd2hhdCB0aGF0IGNvbW1pdCBkb2VzLi4uCgogIEJ1dCB0aGF0IGFjdHVhbGx5IGNh
dXNlcyBhIHByb2JsZW06IGlmIHVkaGNwYyBkb2Vzbid0IGtlZXAgcnVubmluZyB0aGUgCmJhY2tn
cm91bmQgYW55IG1vcmUsIGl0J3Mgbm90IGdvaW5nIHRvIHJlZnJlc2ggaXRzIGxlYXNlLCBidXQg
d2lsbCBrZWVwIG9uIHVzaW5nIAppdHMgSVAgYWRkcmVzcyBpbmRlZmluaXRlbHkuIEFsdGhvdWdo
IHRoaXMgc2VlbXMgdG8gd29yayBhdCBmaXJzdCBoYW5kLCBpdCdzIApnb2luZyB0byBjYXVzZSBz
b21lIHByb2JsZW0gc29tZXdoZXJlIGRvd24gdGhlIGxpbmUuLi4KCiAgU28gd2Ugc2hvdWxkIGZp
bmQgYSBkaWZmZXJlbnQgc29sdXRpb24sIGFuZCB3ZSBzaG91bGQgcHJvYmFibHkgdXNlIHRoYXQg
aW4gdGhlIApNTVUgY2FzZSBhcyB3ZWxsIChqdXN0IHRvIGtlZXAgdGhpbmdzIGNvbnNpc3RlbnQu
CgogIFJlZ2FyZHMsCiAgQXJub3V0CgoKPiAKPiBKdXN0IGxldCBtZSBrbm93IGlmIHlvdSB3YW50
IG1lIHRvIHJld29yZCB0aGUgY29tbWl0IG1lc3NhZ2UgdG8gaW5zaXN0IG1vcmUgb24KPiB0aGlz
IGFzcGVjdCBhbmQgc3VibWl0IGEgdjIuIE9yIHdlIGNhbiBhYmFuZG9uIGl0IGZvciBnb29kIGlm
IHlvdSBwcmVmZXIuCj4gCj4gQmVzdCByZWdhcmRzLAo+IFZpbmNlbnQuCj4gCj4+Cj4+ICAgUmVn
YXJkcywKPj4gICBBcm5vdXQKPj4KPj4+Cj4+PiBBZnRlciBjb21taXQgM2RlNDg2ZjhiMDUyICgi
cGFja2FnZS9idXN5Ym94OiBmaXggdWRoY3BjIG9wdGlvbnMgaW4gbWluaW1hbAo+Pj4gY29uZmln
IiksIHRoaXMgaGFzIHRoZSBiZW5lZml0IG9mIGZpeGluZyB0aGUgZm9sbG93aW5nIG5ldHdvcmsK
Pj4+IGluaXRpYWxpemF0aW9uIGZhaWx1cmU6Cj4+Pgo+Pj4gICAgIHVkaGNwYzogaW52YWxpZCBv
cHRpb24gLS0gYgo+Pj4KPj4+IFNpZ25lZC1vZmYtYnk6IFZpbmNlbnQgU3RlaGzDqSA8dmluY2Vu
dC5zdGVobGVAbGFwb3N0ZS5uZXQ+Cj4+PiBDYzogUm9tYWluIE5hb3VyIDxyb21haW4ubmFvdXJA
Z21haWwuY29tPgo+Pj4gQ2M6IEdlcm9tZSBCdXJsYXRzIDxnZXJvbWUuYnVybGF0c0BzbWlsZS5m
cj4KPj4+IC0tLQo+Pj4gICAgY29uZmlncy9xZW11X3h0ZW5zYV9seDYwX25vbW11X2RlZmNvbmZp
ZyB8IDMgKysrCj4+PiAgICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspCj4+Pgo+Pj4g
ZGlmZiAtLWdpdCBhL2NvbmZpZ3MvcWVtdV94dGVuc2FfbHg2MF9ub21tdV9kZWZjb25maWcgYi9j
b25maWdzL3FlbXVfeHRlbnNhX2x4NjBfbm9tbXVfZGVmY29uZmlnCj4+PiBpbmRleCBjNDQ3M2Zi
MzJhLi40NGZiODFiZDc0IDEwMDY0NAo+Pj4gLS0tIGEvY29uZmlncy9xZW11X3h0ZW5zYV9seDYw
X25vbW11X2RlZmNvbmZpZwo+Pj4gKysrIGIvY29uZmlncy9xZW11X3h0ZW5zYV9seDYwX25vbW11
X2RlZmNvbmZpZwo+Pj4gQEAgLTcsNiArNyw5IEBAIEJSMl9YVEVOU0FfT1ZFUkxBWV9GSUxFPSJo
dHRwczovL2dpdGh1Yi5jb20vamNtdmJrYmMveHRlbnNhLXRvb2xjaGFpbi1idWlsZC9yYXcvCj4+
PiAgICBCUjJfUEFDS0FHRV9IT1NUX0VMRjJGTFQ9eQo+Pj4gICAgIyBCUjJfVVNFX01NVSBpcyBu
b3Qgc2V0Cj4+PiArIyBVc2UgbWluaW1hbCBidXN5Ym94IHdpdGggaHVzaCBhbmQgbmV0d29ya2lu
ZyB0b29scwo+Pj4gK0JSMl9QQUNLQUdFX0JVU1lCT1hfQ09ORklHPSJwYWNrYWdlL2J1c3lib3gv
YnVzeWJveC1taW5pbWFsLmNvbmZpZyIKPj4+ICsKPj4+ICAgICMgU3lzdGVtCj4+PiAgICBCUjJf
U1lTVEVNX0RIQ1A9ImV0aDAiCj4+PiAgICBCUjJfVEFSR0VUX0dFTkVSSUNfR0VUVFlfUE9SVD0i
dHR5UzAiCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1
aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0
cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
