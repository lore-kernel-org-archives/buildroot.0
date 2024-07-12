Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2A1AC2BD09
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 18:28:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 46DDA613FB;
	Fri, 12 Jul 2024 18:28:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wsJSYsHWIavt; Fri, 12 Jul 2024 18:28:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C25B1613D1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C25B1613D1;
	Fri, 12 Jul 2024 18:28:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5CAA71BF4D5
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 18:28:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4884184762
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 18:28:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CG69F15-6i2y for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 18:28:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::235; helo=mail-lj1-x235.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 788A38475F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 788A38475F
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 788A38475F
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 18:28:19 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2eee083c044so161671fa.3
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 11:28:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720808897; x=1721413697;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0/wSVh4/k62P585v2dYkrVyxpl7su2x84kCnvxuBDWQ=;
 b=dEtULjTx+eyDEGQhmXg76vRORsjNIzDDi6djkg318s6haqOeiUIiDY8zu8eV8QLeX/
 K/B/9//toFXoTl8JyGppyzwnNQwKaxrQ8ebgcVpa/ziyNgi4lhHa2lgkK/p1iWf1vEl3
 1KhkClww9QIdwYDtLno3qdiND/F/xW9/zhrmqYlrjyFeUs6IEAgLTqOGVDZXKfrrzags
 CYKTG5ADw+DXodEYFqDFjPYcNHSePu0vqvT6NJ9EpDvnBQdmWjvQWetKYRppxo0Nxji0
 ZPxvEnuGYsKnMSx7zeIc31Kvejwn8JvzUELJajldx+GHTphazNIu+HTU3tz8BQlAZrhP
 VjYg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXA/JoQG4ojsCVwr+YSIWVLRJSyOa0gS5L8F/yCcNaoDFf77OOI5m8h2FuI1FOvnyaapZ3fP3idckmdc22o1ya8zlFw4nZzYA==
X-Gm-Message-State: AOJu0YywLwjYbXnoVRQh4YML11aVRc18SWxI+AKvj0DJ68xCvR/yfCB5
 q2RYjBzLdNe/jpvLond2AFWJyZWORceMtdiQ3UqdPKTBRGawHyldeCyGtqn81HE=
X-Google-Smtp-Source: AGHT+IHOlfMaZv6mboyEP9dIAcZRxI0SxHe632D3bvm76UaxMGGRCri+yyGYugCgj5NexsSLV2IXiQ==
X-Received: by 2002:a05:651c:107c:b0:2ec:5699:5e6 with SMTP id
 38308e7fff4ca-2eeb3102a6amr80128891fa.26.1720808896976; 
 Fri, 12 Jul 2024 11:28:16 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:f9c8:f443:ffd:1bed?
 (2a01cb05949d5800f9c8f4430ffd1bed.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:f9c8:f443:ffd:1bed])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4279f2d7489sm30835625e9.44.2024.07.12.11.28.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Jul 2024 11:28:16 -0700 (PDT)
Message-ID: <d30305a1-c7e6-47a4-a1e4-6b4d4bf40dca@smile.fr>
Date: Fri, 12 Jul 2024 20:28:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bryan Brattlof <bb@ti.com>, Marc Murphy <marc.murphy@sancloud.com>
References: <20240516200837.244258-1-marc.murphy@sancloud.com>
 <20240517143005.lu4x4afty6t7qo7b@bryanbrattlof.com>
 <SEZPR06MB64850609B6CDAB16559658FF80EE2@SEZPR06MB6485.apcprd06.prod.outlook.com>
 <20240605173020.dbxkef36d2g3ijba@bryanbrattlof.com>
Content-Language: en-US
In-Reply-To: <20240605173020.dbxkef36d2g3ijba@bryanbrattlof.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1720808897; x=1721413697; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=0/wSVh4/k62P585v2dYkrVyxpl7su2x84kCnvxuBDWQ=;
 b=nt/inC6d4ZjlH+KqnMHM8yjltVEoylq9LPoww+Y5WaHZEVgxmW0wkYcG4cEuNM2amN
 +9NYIvqPS7+RasFQGNi2yLWEvLxHh4Qh4mDFRlzwZEFAdzkcoVpQMZsG7XOOupFBjM8k
 U8CPzuWBzNJ4Jkz/Rgsl9DgCILjOcK/28Fe6Y=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=nt/inC6d
Subject: Re: [Buildroot] [PATCH 1/1] package/ti-k3-r5-loader: support
 patching in same way as u-boot
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Cc: SanCloud <mailer@sancloud.com>, Xuanhao Shi <X15000177@gmail.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>,
 Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gTWFyYywgQnJ5YW4sIEFsbCwKCkxlIDA1LzA2LzIwMjQgw6AgMTk6MzAsIEJyeWFuIEJy
YXR0bG9mIHZpYSBidWlsZHJvb3QgYSDDqWNyaXTCoDoKPiBPbiBNYXkgMTcsIDIwMjQgdGh1cyBz
YXlldGggTWFyYyBNdXJwaHk6Cj4+IEhpIEJyeWFuLAo+Pgo+Pj4gSGkgTWFyYywKPj4+Cj4+PiBP
biBNYXkgMTYsIDIwMjQgdGh1cyBzYXlldGggTWFyYyBNdXJwaHk6Cj4+Pj4gU2lnbmVkLW9mZi1i
eTogTWFyYyBNdXJwaHkgPG1hcmMubXVycGh5QHNhbmNsb3VkLmNvbT4KPj4+PiAtLS0KPj4+PiAg
Ym9vdC90aS1rMy1yNS1sb2FkZXIvQ29uZmlnLmluICAgICAgICAgIHwgMTIgKysrKysrKysrKysr
Cj4+Pj4gIGJvb3QvdGktazMtcjUtbG9hZGVyL3RpLWszLXI1LWxvYWRlci5tayB8IDE5ICsrKysr
KysrKysrKysrKysrKysKPj4+PiAgMiBmaWxlcyBjaGFuZ2VkLCAzMSBpbnNlcnRpb25zKCspCj4+
Pj4KPj4+PiBkaWZmIC0tZ2l0IGEvYm9vdC90aS1rMy1yNS1sb2FkZXIvQ29uZmlnLmluCj4+Pj4g
Yi9ib290L3RpLWszLXI1LWxvYWRlci9Db25maWcuaW4gaW5kZXggYzI3NjUyOGZhZC4uMGUyNmEx
NTM2OSAxMDA2NDQKPj4+PiAtLS0gYS9ib290L3RpLWszLXI1LWxvYWRlci9Db25maWcuaW4KPj4+
PiArKysgYi9ib290L3RpLWszLXI1LWxvYWRlci9Db25maWcuaW4KPj4+PiBAQCAtNjksNiArNjks
MTggQEAgY29uZmlnIEJSMl9UQVJHRVRfVElfSzNfUjVfTE9BREVSX1ZFUlNJT04KPj4+PiAgCQlp
ZiBCUjJfVEFSR0VUX1RJX0szX1I1X0xPQURFUl9DVVNUT01fR0lUIHx8IFwKPj4+PiAgCQkgICBC
UjJfVEFSR0VUX1RJX0szX1I1X0xPQURFUl9DVVNUT01fSEcgIHx8IFwKPj4+PiAgCQkgICBCUjJf
VEFSR0VUX1RJX0szX1I1X0xPQURFUl9DVVNUT01fU1ZOCj4+Pj4gKwo+Pj4+ICtjb25maWcgQlIy
X1RBUkdFVF9USV9LM19SNV9MT0FERVJfUEFUQ0gKPj4+PiArCXN0cmluZyAiQ3VzdG9tIFUtQm9v
dCBwYXRjaGVzIgo+Pj4+ICsJZGVmYXVsdCAiIgo+Pj4+ICsJaGVscAo+Pj4+ICsJICBBIHNwYWNl
LXNlcGFyYXRlZCBsaXN0IG9mIHBhdGNoZXMgdG8gYXBwbHkgdG8gVS1Cb290Lgo+Pj4+ICsJICBF
YWNoIHBhdGNoIGNhbiBiZSBkZXNjcmliZWQgYXMgYW4gVVJMLCBhIGxvY2FsIGZpbGUgcGF0aCwK
Pj4+PiArCSAgb3IgYSBkaXJlY3RvcnkuIEluIHRoZSBjYXNlIG9mIGEgZGlyZWN0b3J5LCBhbGwg
ZmlsZXMKPj4+PiArCSAgbWF0Y2hpbmcgKi5wYXRjaCBpbiB0aGUgZGlyZWN0b3J5IHdpbGwgYmUg
YXBwbGllZC4KPj4+PiArCj4+Pj4gKwkgIE1vc3QgdXNlcnMgbWF5IGxlYXZlIHRoaXMgZW1wdHkK
Pj4+PiArCj4+Pgo+Pj4gVGhhbmtzIGZvciB0aGUgcGF0Y2ghIEp1c3QgdHJ5aW5nIHRvIHVuZGVy
c3RhbmQgd2hhdCB3ZSdyZSB0cnlpbmcgdG8gZG8uCj4+Cj4+IFdoZW4gd2UgdXNlIGFuIGV4dGVy
bmFsIGNvbmZpZyAoQlIyX0VYVEVSTkFMKSBhbmQgc3BlY2lmeSB0aGUgdmVyc2lvbiBvZiB1LWJv
b3QgdG8gdXNlIHdlIG5lZWQgdG8gYXBwbHkgcGxhdGZvcm0gc3BlY2lmaWMgcGF0Y2hlcyB3ZSBu
b3JtYWxseSB1c2U6Cj4+ICRCUjJfRVhURVJOQUwgL2JvYXJkL2JvYXJkLXR5cGUvcGF0Y2hlcy91
Ym9vdAo+Pgo+PiBJZiB3ZSB3YW50IHRvIHVzZSBhIGRlZGljYXRlZCBUaSByZWxlYXNlIGUuZy4g
MDguMDYuMDAuMDA3IGFuZCBhcHBseSBvdXIgcGF0Y2hlcyB0byBpdCwgdGhpcyBpcyBnb29kIGZv
ciB0aGUgbm9ybWFsIHVib290IGJvb3Rsb2FkZXIuICBJZiB3ZSBuZWVkIHRvIGFwcGx5IHBhdGNo
ZXMgdG8gdGhlIGszIGJvb3Rsb2FkZXIgaXQgaXMgbm90IHBvc3NpYmxlIGFuZCBidWlsZHJvb3Qg
Y2hlY2tzIG91dCBhIGRlZGljYXRlZCBmb2xkZXIgZm9yIGJ1aWxkaW5nOgo+PiBkcnd4ci14ci14
ICAyNSBtYXJjIG1hcmMgICAgNDA5NiBNYXkgMTYgMTQ6MzQgdGktazMtcjUtbG9hZGVyLWN1c3Rv
bQo+PiBkcnd4ci14ci14ICAyNSBtYXJjIG1hcmMgICAgNDA5NiBNYXkgMTYgMTQ6MzQgdWJvb3Qt
Y3VzdG9tCj4+Cj4+IFdlIGhhdmUgZGVkaWNhdGVkIGJvYXJkIGNvbmZpZ3MsIGRldmljZSB0cmVl
IGFuZCBzb21lIGNvZGUgY2hhbmdlcyB0aGF0IGFyZSBub3QgaW4gbWFpbmxpbmUgYW5kIG5lZWQg
YXBwbHlpbmcgdG8gYm90aCBidWlsZHMgb2YgdWJvb3QuCj4+IElmIHRoZXJlIGlzIGFub3RoZXIg
d2F5IHRvIGRvIHRoaXMgSSB3b3VsZCBhcHByZWNpYXRlIHRoZSBmZWVkYmFjay4KPj4KPiAKPiBB
aCB5ZWFoLiBJJ3ZlIGJlZW4gdHJ5aW5nIHRvIGZpbmQgYSB3YXkgZ29vZCB3YXkgdG8gZG8gdGhh
dCBteXNlbGYuIAo+IElkZWFsbHkgdGhlc2UgcGFja2FnZXMgc2hvdWxkIGJlIGV4YWN0bHkgdGhl
IHNhbWUgd2l0aCBhIGRpZmZlcmVudCBjcm9zcyAKPiBjb21waWxlci4gTXkgZW5kIGdvYWwgaXMg
dHJ5aW5nIHRvIGZpbmQgYSB3YXkgdG8gc2hvcnQtY2lyY3VpdCB0aGUgREwgCj4gcGF0aCBhbmQg
dGhlIFBBVENIIGRpcmVjdG9yeSB0byBwb2ludCB0byBVLUJvb3QgYnV0IEkgaGF2ZW4ndCBmb3Vu
ZCBhIAo+IHdheSB0byBkbyB0aGF0IHlldC4gOi8KPiAKPiBUaGlzIHNvbHV0aW9uIHdvcmtzIGZv
ciBtZSBhcyBhIHN0b3BnYXAgZm9yIG5vdyBidXQgaWYgeW91IGtub3cgb2YgYSB3YXkgCj4gdG8g
cG9pbnQgdGhlc2UgdmFyaWFibGVzIHRvIHdoYXRldmVyIHVib290LyBpcyB1c2luZyBsZXQgbWUg
a25vdwoKSW5kZWVkLCB0aGUgQlIyX0dMT0JBTF9QQVRDSF9ESVIgb3B0aW9uIGlzIHVzdWFsbHkg
dGhlIHByZWZlcnJlZCBtZXRob2QgZm9yCnNwZWNpZnlpbmcgYSBjdXN0b20gcGF0Y2ggZGlyZWN0
b3J5IGZvciBwYWNrYWdlcyBbMV0uIFRoZSBsaW51eCBhbmQgdS1ib290CnBhY2thZ2VzIGFyZSBl
eGNlcHRpb25zIHdpdGggdGhlaXIgIkN1c3RvbSB7a2VybmVsL1UtQm9vdH0gcGF0Y2hlcyIgb3B0
aW9uLgoKVGhlcmUgaXMgYW5vdGhlciBleGFtcGxlIGluIEJ1aWxkcm9vdCB3ZXJlIHR3byBwYWNr
YWdlcyBjYW4gYWN0dWFsbHkgdXNlIHRoZQpzYW1lIHNvdXJjZTogbGludXggYW5kIGxpbnV4LWhl
YWRlcnMgd2l0aCBCUjJfS0VSTkVMX0hFQURFUlNfQVNfS0VSTkVMIGVuYWJsZWQuCgpJdCBjb3Vs
ZCBiZSBpbnRlcmVzdGluZyB0byBpbXBsZW1lbnQgc29tZXRoaW5nIHNpbWlsYXI6Cgpjb25maWcg
QlIyX1RBUkdFVF9USV9LM19SNV9MT0FERVJfQVNfVUJPT1QKICBzdHJpbmcgIlNhbWUgYXMgdWJv
b3QgYmVpbmcgYnVpbHQiCgpEb2luZyBzbyBpdCB3b3VsZCBiZSBwb3NzaWJsZSB0byByZXRyaWV2
ZSB1Ym9vdCBwYXRjaGVzIGZyb20gQlIyX0dMT0JBTF9QQVRDSF9ESVI6CgpUQVJHRVRfVElfSzNf
UjVfTE9BREVSX1BBVENIRVMgPSBcCgkkKHdpbGRjYXJkICQoYWRkc3VmZml4IC91Ym9vdCwkKGNh
bGwgcXN0cmlwLCQoQlIyX0dMT0JBTF9QQVRDSF9ESVIpKSkpCgpbMV0KaHR0cHM6Ly9uaWdodGx5
LmJ1aWxkcm9vdC5vcmcvbWFudWFsLmh0bWwjX2FkZGluZ19wcm9qZWN0X3NwZWNpZmljX3BhdGNo
ZXNfYW5kX2hhc2hlcwoKQ2FuIHlvdSB0cnk/CgpJbiB0aGUgbWVhbnRpbWUsIEknbGwgbWFyayB0
aGlzIHBhdGNoICJDaGFuZ2VzIHJlcXVlc3RlZCIuCgpUaGFua3MhCgpCZXN0IHJlZ2FyZHMsClJv
bWFpbgoKCj4gCj4gfkJyeWFuCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KPiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4gYnVpbGRyb290QGJ1aWxkcm9v
dC5vcmcKPiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWls
ZHJvb3QKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1
aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0
cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
