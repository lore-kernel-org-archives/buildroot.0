Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4025AC54798
	for <buildroot@archiver.kernel.org>; Sat,  2 Mar 2024 22:53:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B44EC4010F;
	Sat,  2 Mar 2024 22:52:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kEf-zzSsRsTU; Sat,  2 Mar 2024 22:52:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 37F9440377
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 37F9440377;
	Sat,  2 Mar 2024 22:52:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 738331BF57C
 for <buildroot@lists.busybox.net>; Sat,  2 Mar 2024 22:52:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6189A410A4
 for <buildroot@lists.busybox.net>; Sat,  2 Mar 2024 22:52:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0IaZNjEg68nS for <buildroot@lists.busybox.net>;
 Sat,  2 Mar 2024 22:52:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 477CA407EC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 477CA407EC
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 477CA407EC
 for <buildroot@buildroot.org>; Sat,  2 Mar 2024 22:52:55 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-412d501fb96so5012275e9.0
 for <buildroot@buildroot.org>; Sat, 02 Mar 2024 14:52:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709419973; x=1710024773;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CoDoSnpPMzZlTM3Uu7XyohsdxHDnMeuJNN0Hj8ursgo=;
 b=JrfZvsKCFSwwtNtn1kKDCcBLW47rAViLzwcOonIWvq9m17WkFpqQRx79hhRTDRHDGE
 YCJ1i+KWCJDI3gRLghUfvz6hG5TuA2xlFexpGIS9/bkgApPtM4+Ud9k2KhjEPXMeuR3U
 96pp7ukz1lvqO5xV+h7jz7361vpA2sP4lVpCP7HNjZoEyxmj2QtCmeKVCkjNpoetVp6S
 Qjm7KlebidgSe/9Rimab+WnQGf4G1ylpdtHX74R2TUNZFJCCOay+VXOJFfMglPRsU5IA
 ZCvDTlFwgCj1TeXjORXVhzAYpw3/llBM/EBBwxMmryx9iQL0T5yO4QUftiVGR4OY9SS1
 o26A==
X-Gm-Message-State: AOJu0YxcpkLSaCAw8JSLE4NQddoAn+/hnaDY4mKaOiYuP8kRUqz3fOKK
 qZQNQqCZrVK+DzPYbdZvv73qQidZ9+8r5CdV7RG81Ahan6sv7fpF467fXPvCfJk=
X-Google-Smtp-Source: AGHT+IFtSF4S2c6WXsdIW5+hiCdb905J5ehSdbtIR/EWDEjIHsuOqYRwgM4H0gK4bUIn91hikswYZQ==
X-Received: by 2002:a5d:6e48:0:b0:33d:d82e:85c7 with SMTP id
 j8-20020a5d6e48000000b0033dd82e85c7mr3792320wrz.47.1709419973228; 
 Sat, 02 Mar 2024 14:52:53 -0800 (PST)
Received: from ?IPV6:2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31?
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 g14-20020a05600c4ece00b00412b775e979sm9984603wmq.2.2024.03.02.14.52.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 02 Mar 2024 14:52:52 -0800 (PST)
Message-ID: <73584dbb-97d6-4b72-a58e-540a4beab266@smile.fr>
Date: Sat, 2 Mar 2024 23:52:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
References: <20240301133620.3547430-1-dario.binacchi@amarulasolutions.com>
 <20240301133620.3547430-21-dario.binacchi@amarulasolutions.com>
 <056ae2bc-0380-4d86-b554-06a375a44bf5@smile.fr>
 <CABGWkvpi3jgV70jXi3Leti6+EgODiLnBCkmaYjb_qMcqEMZNmA@mail.gmail.com>
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <CABGWkvpi3jgV70jXi3Leti6+EgODiLnBCkmaYjb_qMcqEMZNmA@mail.gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1709419973; x=1710024773;
 darn=buildroot.org; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=CoDoSnpPMzZlTM3Uu7XyohsdxHDnMeuJNN0Hj8ursgo=;
 b=soHsQObcwFrB/YVIWOUeHtEm9/UEyFkh6311UWBUMTag11AuqbjdzE+wMD7R54jx2a
 AYNSG7Ll22EtoPRsJZQBJFSfI6NIvpeIneBVYBwkyUcBuD4Q9aG7ZFdTot047eLD3mJq
 wc1FQMGSIJnhhFRxLP8kQwmqbb2lCwriGMZz58iXkrcxTnXr3m4EuNJobJibnl4AlO9Z
 gX1kVZtD4KuB+q3BJdXl/aw296c9Hg6aG0HxwdYEEWQmotrcNkkyPWqv31eybCB12Sxz
 GLEw2MqT+umg7dzYKFBAtcAbQHhBKWji8FMenL6L2xPlKK5AsbqPeMq+B+2CR1lX9ieU
 ED0A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=soHsQObc
Subject: Re: [Buildroot] [PATCH v8 20/23] package/ti-k3: fix
 BR2_PACKAGE_TI_K3_SOC setting for am64x SOC
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
Cc: michael@amarulasolutions.com, linux-amarula@amarulasolutions.com,
 Asaf Kahlon <asafka7@gmail.com>, Xuanhao Shi <X15000177@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org,
 Andreas Dannenberg <dannenberg@ti.com>,
 Alexander Sverdlin <alexander.sverdlin@gmail.com>, bryce@redpinelabs.com,
 Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gRGFyaW8sCgpMZSAwMi8wMy8yMDI0IMOgIDE1OjIxLCBEYXJpbyBCaW5hY2NoaSBhIMOp
Y3JpdMKgOgo+IEhpIFJvbWFpbiwgQWxsLAo+IAo+IE9uIFNhdCwgTWFyIDIsIDIwMjQgYXQgMTI6
MDbigK9QTSBSb21haW4gTmFvdXIgPHJvbWFpbi5uYW91ckBzbWlsZS5mcj4gd3JvdGU6Cj4+Cj4+
IEhpIERhcmlvLAo+Pgo+PiBMZSAwMS8wMy8yMDI0IMOgIDE0OjM2LCBEYXJpbyBCaW5hY2NoaSBh
IMOpY3JpdCA6Cj4+PiBJbiB0aGUgY2FzZSBvZiBTT0MgYW02NHgsIHRpLWszLXI1LWxvYWRlciBj
cmVhdGVzIHRoZSBmb2xsb3dpbmcKPj4+IHRpYm9vdDMuYmluIGZpbGVzOgo+Pj4gLSBHUCAgICAt
PiB0aWJvb3QzX2FtNjR4LWdwLWV2bS5iaW4KPj4+IC0gSFMgICAgLT4gdGlib290M19hbTY0eF9z
cjItaHMtZXZtLmJpbgo+Pj4gLSBIU19GUyAtPiB0aWJvb3QzX2FtNjR4X3NyMi1ocy1mcy1ldm0u
YmluCj4+Pgo+Pj4gVGhlIHBhdGNoIGFsbG93cyB5b3UgdG8gaWRlbnRpZnkgdGhlIGNvcnJlY3Qg
ZmlsZSBiYXNlZCBvbiB0aGUgU0VDX1RZUEUKPj4+IG9wdGlvbi4KPj4KPj4gSXQgc2VlbXMgdGhp
cyBwYXRjaCBzaG91bGQgYmUgbWVyZ2VkIHdpdGggdGhlIEFNNjR4IHUtYm9vdCB2ZXJzaW9uIGJ1
bXAgc2luY2UKPj4gdGktazMtcjUgKGFrYSB1LWJvb3QpIG5vdyBwcm92aWRlIHRpYm9vdDMuYmlu
Lgo+IAo+IEkgd2lsbCBzcXVhc2ggaXQgdG8gW1BBVENIIDIxLzIzXSBjb25maWdzL3RpX2FtNjR4
X3NrX2RlZmNvbmZpZzogYnVtcAo+IFUtQm9vdCB2ZXJzaW9uIHRvIDIwMjQuMDEKCk9rCgo+IAo+
Pgo+PiBBbHNvIG90aGVyIFRJIEszIFNvQyB2YXJpYW50IGxpa2UgQU02NSBwcm92aWRlIGEgc3Iy
IGJpbmFyeToKPj4KPj4gdGlib290My1hbTYyYXgtaHMtZnMtZXZtLmJpbgo+PiB0aWJvb3QzLWFt
NjJheC1ncC1ldm0uYmluCj4+IHRpYm9vdDMtYW02MmF4LWhzLWV2bS5iaW4KPj4KPj4gdGlib290
My1hbTYycHgtaHMtZnMtZXZtLmJpbgo+Pgo+PiB0aWJvb3QzLWFtNjJ4LWhzLWZzLWV2bS5iaW4K
Pj4gdGlib290My1hbTYyeC1ncC1ldm0uYmluCj4+IHRpYm9vdDMtYW02MngtaHMtZXZtLmJpbgo+
Pgo+PiB0aWJvb3QzLWFtNjR4X3NyMi1ocy1mcy1ldm0uYmluCj4+IHRpYm9vdDMtYW02NHgtZ3At
ZXZtLmJpbgo+PiB0aWJvb3QzLWFtNjR4X3NyMi1ocy1ldm0uYmluCj4+Cj4+IHRpYm9vdDMtYW02
NXhfc3IyLWdwLWV2bS5iaW4KPj4gdGlib290My1hbTY1eF9zcjItaHMtZXZtLmJpbgo+Pgo+PiB0
aWJvb3QzLWo3MjAwLWdwLWV2bS5iaW4KPj4gdGlib290My1qNzIwMF9zcjItaHMtZnMtZXZtLmJp
bgo+PiB0aWJvb3QzLWo3MjAwX3NyMi1ocy1ldm0uYmluCj4+Cj4+IHRpYm9vdDMtajcyMWUtZ3At
ZXZtLmJpbgo+PiB0aWJvb3QzLWo3MjFlX3NyMi1ocy1mcy1ldm0uYmluCj4+IHRpYm9vdDMtajcy
MWVfc3IxXzEtaHMtZXZtLmJpbgo+Pgo+PiB0aWJvb3QzLWo3MjFzMi1ncC1ldm0uYmluCj4+IHRp
Ym9vdDMtajcyMXMyLWhzLWZzLWV2bS5iaW4KPj4KPj4gdGlib290My1qNzIycy1ocy1mcy1ldm0u
YmluCj4+Cj4+IHRpYm9vdDMtajc4NHM0LWdwLWV2bS5iaW4KPj4gdGlib290My1qNzg0czQtaHMt
ZnMtZXZtLmJpbgo+Pgo+PiBNYXliZSB3ZSBuZWVkIHRvIGludHJvZHVjZSBUSV9LM19SNV9MT0FE
RVJfU09DX1NVRkZJWCB0byBoYW5kbGUgc3IyLCBzcjFfMSBvciAiIiA/Cj4+Cj4gQXQgZmlyc3Qs
IEkgYWxzbyB0aG91Z2h0IGFib3V0IGEgbmV3IGNvbmZpZ3VyYXRpb24gdG8gc3BlY2lmeSBhbgo+
IGFkZGl0aW9uYWwgc3VmZml4LCBidXQgYWZ0ZXIgdmVyaWZ5aW5nCj4gdGhhdCBCUjJfUEFDS0FH
RV9USV9LM19TT0MgaXMgb25seSB1c2VkIGluCj4gYm9vdC90aS1rMy1yNS1sb2FkZXIvdGktazMt
cjUtbG9hZGVyLm1rLCB0aGUKPiBhZG9wdGVkIHNvbHV0aW9uOgo+IAo+IC0gICAgICAgZGVmYXVs
dCAiYW02NHgiICBpZiBCUjJfUEFDS0FHRV9USV9LM19TT0NfQU02NFgKPiArICAgICAgIGRlZmF1
bHQgImFtNjR4IiAgaWYgQlIyX1BBQ0tBR0VfVElfSzNfU09DX0FNNjRYICYmCj4gQlIyX1BBQ0tB
R0VfVElfSzNfU0VDVFlQRV9HUAo+ICsgICAgICAgZGVmYXVsdCAiYW02NHhfc3IyIiAgaWYgQlIy
X1BBQ0tBR0VfVElfSzNfU09DX0FNNjRYICYmCj4gIUJSMl9QQUNLQUdFX1RJX0szX1NFQ1RZUEVf
R1AKPiAKPiBzZWVtZWQgdGhlIHNpbXBsZXN0IHRvIG1lLgo+IAo+IEFuZCBJIHRoaW5rIHRoaXMg
YXBwcm9hY2ggY2FuIGFsc28gYmUgdXNlZCBmb3IgdGhlIHZhcmlhbnRzIHlvdQo+IGxpc3RlZCwg
c2luY2UgZm9yIGVhY2gge1NPQyxTRUNfVFlQRX0gcGFpcgo+IHRoZXJlIGV4aXN0cyBvbmUgYW5k
IG9ubHkgb25lIHRpYm9vdDMuYmluLgoKV2hhdCBhYm91dCByZW1vdmluZyBCUjJfUEFDS0FHRV9U
SV9LM19TT0MgYW5kIEJSMl9QQUNLQUdFX1RJX0szX1NFQ1RZUEUKKGluaGVyaXRlZCBmcm9tIHRp
LWszLWltYWdlLWdlbiwgc28gd2UgbmVlZCB0aGVtIHVudGlsIHdlIGNhbiByZW1vdmUgdGhpcwpw
YWNrYWdlKSB3ZSBqdXN0IG5lZWQgdG8ga25vdyB0aGUgbmFtZSBvZiB0aGUgZmlsZSB3ZSBzaG91
bGQgY29weSBiYXNlZCBvbiBUSSBLMwpTb0MgYW5kIFNlY3VyaXR5IHR5cGUgc2VsZWN0aW9uLgoK
Y29uZmlnIEJSMl9QQUNLQUdFX1RJX0szX1RJQk9PVDNfQklOCglzdHJpbmcKCWRlZmF1bHQgInRp
Ym9vdDMtYW02MmF4LWdwLWV2bS5iaW4iIGlmIEJSMl9QQUNLQUdFX1RJX0szX1NPQ19BTTYyQVgg
JiYKQlIyX1BBQ0tBR0VfVElfSzNfU0VDVFlQRV9HUAoJZGVmYXVsdCAidGlib290My1hbTYyYXgt
aHMtZXZtLmJpbiIgaWYgQlIyX1BBQ0tBR0VfVElfSzNfU09DX0FNNjJBWCAmJgpCUjJfUEFDS0FH
RV9USV9LM19TRUNUWVBFX0hTCglkZWZhdWx0ICJ0aWJvb3QzLWFtNjJheC1ocy1mcy1ldm0uYmlu
IiBpZiBCUjJfUEFDS0FHRV9USV9LM19TT0NfQU02MkFYICYmCkJSMl9QQUNLQUdFX1RJX0szX1NF
Q1RZUEVfSFNfRlMKLi4uCgogZGVmaW5lIFRJX0szX1I1X0xPQURFUl9JTlNUQUxMX0lNQUdFU19D
TURTCiAJY3AgJChARCkvc3BsL3UtYm9vdC1zcGwuYmluICQoQklOQVJJRVNfRElSKS9yNS11LWJv
b3Qtc3BsLmJpbgoJY3AgJChARCkvJChCUjJfUEFDS0FHRV9USV9LM19USUJPT1QzX0JJTikgJChC
SU5BUklFU19ESVIpL3RpYm9vdDMuYmluCiBlbmRlZgoKU28gd2UgY2FuIGF2b2lkIHVzaW5nIGNv
bXBsZXggZmluZCAtcmVnZXggLWV4ZWMgLWNwIGNvbW1hbmQgOikKCkJSMl9QQUNLQUdFX1RJX0sz
X1RJQk9PVDNfQklOIGNhbiBiZSBkZWZpbmVkIGluIHRpLWszLXI1LWxvYWRlciBwYWNrYWdlLgoK
QmVzdCByZWdhcmRzLApSb21haW4KCgo+IAo+IEZ1cnRoZXJtb3JlLCBpZiBJJ20gbm90IG1pc3Np
bmcgYW55dGhpbmcsIHRoaXMgcmVtYWlucyB0aGUgb25seQo+IGFkanVzdG1lbnQgd2UgbmVlZCB0
byBtYWtlIHNpbmNlIHRoZXJlIGFyZSBubwo+IG90aGVyIGNvbmZpZ3VyYXRpb25zIGluIGJ1aWxk
cm9vdCBhbW9uZyB0aG9zZSB5b3UgbGlzdGVkLiBTbywgaW4gbXkKPiBodW1ibGUgb3Bpbmlvbiwg
Zm9yIG5vdywgdGhpcyBzaG91bGQgYmUgZmluZS4KPiAKPiBTbywgcGxlYXNlIGxldCBtZSBrbm93
IGlmLCBpbiBhZGRpdGlvbiB0byBzcXVhc2hpbmcgdGhpcyBwYXRjaCBpbnRvCj4gIlsyMS8yM10g
Y29uZmlncy90aV9hbTY0eF9za19kZWZjb25maWc6Cj4gYnVtcCBVLUJvb3QgdmVyc2lvbiB0byAy
MDI0LjAxIiwgSSBuZWVkIHRvIG1ha2UgYW55IG90aGVyIGFkanVzdG1lbnRzCj4gZm9yIHZlcnNp
b24gOS4KPiAKPiBUaGFua3MgYW5kIHJlZ2FyZHMsCj4gRGFyaW8KPiAKPj4gQmVzdCByZWdhcmRz
LAo+PiBSb21haW4KPj4KPj4KPj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBEYXJpbyBCaW5hY2NoaSA8
ZGFyaW8uYmluYWNjaGlAYW1hcnVsYXNvbHV0aW9ucy5jb20+Cj4+Pgo+Pj4gLS0tCj4+Pgo+Pj4g
QWRkZWQgaW4gdjgKPj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBEYXJpbyBCaW5hY2NoaSA8ZGFyaW8u
YmluYWNjaGlAYW1hcnVsYXNvbHV0aW9ucy5jb20+Cj4+PiAtLS0KPj4+ICBwYWNrYWdlL3RpLWsz
L0NvbmZpZy5pbiB8IDMgKystCj4+PiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwg
MSBkZWxldGlvbigtKQo+Pj4KPj4+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3RpLWszL0NvbmZpZy5p
biBiL3BhY2thZ2UvdGktazMvQ29uZmlnLmluCj4+PiBpbmRleCBiODU0NWI3YmNhNjIuLjljNjFm
ODg4MGExNSAxMDA2NDQKPj4+IC0tLSBhL3BhY2thZ2UvdGktazMvQ29uZmlnLmluCj4+PiArKysg
Yi9wYWNrYWdlL3RpLWszL0NvbmZpZy5pbgo+Pj4gQEAgLTQzLDcgKzQzLDggQEAgY29uZmlnIEJS
Ml9QQUNLQUdFX1RJX0szX1NPQwo+Pj4gICAgICAgc3RyaW5nCj4+PiAgICAgICBkZWZhdWx0ICJh
bTYyYXgiIGlmIEJSMl9QQUNLQUdFX1RJX0szX1NPQ19BTTYyQVgKPj4+ICAgICAgIGRlZmF1bHQg
ImFtNjJ4IiAgaWYgQlIyX1BBQ0tBR0VfVElfSzNfU09DX0FNNjJYCj4+PiAtICAgICBkZWZhdWx0
ICJhbTY0eCIgIGlmIEJSMl9QQUNLQUdFX1RJX0szX1NPQ19BTTY0WAo+Pj4gKyAgICAgZGVmYXVs
dCAiYW02NHgiICBpZiBCUjJfUEFDS0FHRV9USV9LM19TT0NfQU02NFggJiYgQlIyX1BBQ0tBR0Vf
VElfSzNfU0VDVFlQRV9HUAo+Pj4gKyAgICAgZGVmYXVsdCAiYW02NHhfc3IyIiAgaWYgQlIyX1BB
Q0tBR0VfVElfSzNfU09DX0FNNjRYICYmICFCUjJfUEFDS0FHRV9USV9LM19TRUNUWVBFX0dQCj4+
PiAgICAgICBkZWZhdWx0ICJhbTY1eCIgIGlmIEJSMl9QQUNLQUdFX1RJX0szX1NPQ19BTTY1WAo+
Pj4KPj4+ICBjb25maWcgQlIyX1BBQ0tBR0VfVElfSzNfU0VDVFlQRQo+Pgo+IAo+IAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxp
bmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5v
cmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
