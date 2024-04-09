Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DBF7CD1284
	for <buildroot@archiver.kernel.org>; Tue,  9 Apr 2024 12:05:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B0498409F3;
	Tue,  9 Apr 2024 12:05:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XPDCD10adm0z; Tue,  9 Apr 2024 12:05:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A234B40B39
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A234B40B39;
	Tue,  9 Apr 2024 12:05:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EBF4C1BF2C5
 for <buildroot@lists.busybox.net>; Tue,  9 Apr 2024 12:05:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D90B640B02
 for <buildroot@lists.busybox.net>; Tue,  9 Apr 2024 12:05:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tYTL7drPd_Tw for <buildroot@lists.busybox.net>;
 Tue,  9 Apr 2024 12:05:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org CAACD409F3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CAACD409F3
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CAACD409F3
 for <buildroot@buildroot.org>; Tue,  9 Apr 2024 12:05:04 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-416b606f3e3so1649715e9.1
 for <buildroot@buildroot.org>; Tue, 09 Apr 2024 05:05:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712664303; x=1713269103;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=krSoq44tZU0o/gvYkOQdkOxuh+SDaBT+FRTRQ6Mk6+0=;
 b=HzhVyKch8clPCr5//oD3/8QxkP8gu3phMLMsXPfcJAWMZKNkW0stFtEIU0TrKSG6WR
 ShlfBlUcuY/RC6SFjsNJ9iNrN23mUM0voNOE4jgZ6l5AHzKvZx1xlvPL9VESerZUkunW
 yQlwAswbmX5I32fOCZoci7RyRyDtY51TVNO+nm2P9Gp+EP56JhKrBxQTf3+vlHZ1KZvb
 movVU2Xq2Hs74XmD7383JVC1Sa08fR8KK1g3Bn81Kzc+GPmMShAHFTubHG5ioJvbjx1Q
 Aq9cCn7jjNxXOhiZp3pbznOdDS5ugxkrwTIK5WQhiTqg0YPfUOIBDQ6DRqW7Ntb211gI
 Zzmw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV6qfM2EPPAVttoDvfkkmy3PAK2t5GWxN0zLnfj0Uiww78nbuJoZQiYaxeDB0tXDtw9YCSZtrxJMuZUocKfJMLBUeX7JL/tDA==
X-Gm-Message-State: AOJu0YxZ3aZfL7XzAYyqRviSnH7Jj6Z1dqiKalfcl23eadXW3/AXBiiG
 rAuILjhivePa0Klq2xU9PDOMgdB2S+flIxwtbYZUP3AtGfyoemF38aeW7/Fh+L52ZBpD8UruO24
 2
X-Google-Smtp-Source: AGHT+IFZgIYEFJlKLXmu8bHktAnrk7Qs2sciyR0a9qzdHY+ZPWU+qqgXKfWjCPLUOd0eScM/mJgZUg==
X-Received: by 2002:a05:600c:198f:b0:416:a620:fd39 with SMTP id
 t15-20020a05600c198f00b00416a620fd39mr1184702wmq.26.1712664302834; 
 Tue, 09 Apr 2024 05:05:02 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:e3ef:2d7a:4131:71f?
 (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
 by smtp.gmail.com with ESMTPSA id
 z2-20020a05600c0a0200b0041624ddff48sm20570262wmp.28.2024.04.09.05.05.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Apr 2024 05:05:02 -0700 (PDT)
Message-ID: <6c00985e-e617-4a1b-a94e-fe7dd3acbabd@smile.fr>
Date: Tue, 9 Apr 2024 14:05:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Arnout Vandecappelle <arnout@mind.be>, buildroot@buildroot.org
References: <20240407103512.1112712-1-romain.naour@smile.fr>
 <20240407103512.1112712-8-romain.naour@smile.fr>
 <452821da-0cdd-41af-bf8f-7c78297878d6@mind.be>
Content-Language: fr, en-US
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <452821da-0cdd-41af-bf8f-7c78297878d6@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1712664303; x=1713269103;
 darn=buildroot.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=krSoq44tZU0o/gvYkOQdkOxuh+SDaBT+FRTRQ6Mk6+0=;
 b=AuoPIjLhPKdW3HQZ1CV9CCK4bKxnP+R9J2lBbipzFJERnD3uqBG0OplWCAt/qG8VbV
 gRiJr5m9RS4jofNnsDkWeMdH+rMMpYbV/0ZoOdfz+c84tzIblOSnVcznpnSnfEJ0uVeh
 43ekEHuhcATRODDiIhxldGtiX2VQcS9C3P7F5mWSM+CFPoeqZvlWJ5u2w7L6o6/EZ0UV
 rH0c+K0FzH7nlU+qCe3o0zyLfYl6GaFiUDa55/PKVwjnz/BRizRyfDoK1RQ75HHAJKga
 osg2cFj5UhUOpWNBFB+kUSJTawNTtohF0R1e/JOBIjuMGigWfT6x+kiJVJw4+ikZ+pc3
 skjg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=AuoPIjLh
Subject: Re: [Buildroot] [PATCH v12 07/16] configs/ti_am62x_sk_defconfig:
 bump U-Boot version to 2024.01
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
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gQXJub3V0LAoKTGUgMDgvMDQvMjAyNCDDoCAxNTowMCwgQXJub3V0IFZhbmRlY2FwcGVs
bGUgYSDDqWNyaXTCoDoKPiAKPiAKPiBPbiAwNy8wNC8yMDI0IDEyOjM1LCBSb21haW4gTmFvdXIg
d3JvdGU6Cj4+IEZyb206IERhcmlvIEJpbmFjY2hpIDxkYXJpby5iaW5hY2NoaUBhbWFydWxhc29s
dXRpb25zLmNvbT4KPj4KPj4gVGhlIDIwMjQuMDEgdmVyc2lvbiBvZiBVLUJvb3QgZm9yIHRoZSBh
bTYyeC1zayBib2FyZCBoYXMgaW50cm9kdWNlZCB0d28KPj4gbWFqb3IgY2hhbmdlczoKPj4gLSBU
aGUgZGV2aWNlIHRyZWUgazMtYW02MjUtc2suZHRiIGlzIG5vIGxvbmdlciBzZWFyY2hlZCBpbiAv
Ym9vdCwgYnV0IGluCj4+IMKgwqAgL2Jvb3QvZHRiL3RpLiBIZW5jZSwgdGhlIGRpc2FibGluZyBv
ZiBCUjJfTElOVVhfS0VSTkVMX0lOU1RBTExfVEFSR0VUCj4+IMKgwqAgYW5kIHRoZSB1c2Ugb2Yg
ZXh0bGludXguY29uZiBmb3IgdGhlIHByb3BlciBsb2FkaW5nIG9mIHRoZSBkZXZpY2UgdHJlZS4K
Pj4gwqDCoCBGdXJ0aGVybW9yZSwgdGhlIHBhcmFtZXRlciBCUjJfUk9PVEZTX1BPU1RfU0NSSVBU
X0FSR1Mgd2FzIHVzZWQgdG8KPj4gwqDCoCBhdXRvLWdlbmVyYXRlIHRoZSBleHRsaW51eC5jb25m
IGZpbGUgc28gdGhhdCBkZXZlbG9wZXJzIGNhbiBjaGFuZ2UgdGhlCj4+IMKgwqAga2VybmVsIGxv
YWRpbmcgb3B0aW9ucyBieSBtb2RpZnlpbmcgdGhlIC5jb25maWcuCj4+IC0gVS1Cb290IGlzIGNh
cGFibGUgb2YgYnVpbGRpbmcgdGlib290My5iaW4gdXNpbmcgQmlubWFuLiBTbyBpdCdzIG5vIGxv
bmdlcgo+PiDCoMKgIG5lY2Vzc2FyeSB0byB1c2UgY3VzdG9tIHRvb2xzIGxpa2UgdGktazMtaW1h
Z2UtZ2VuLgo+PiAtIFVzZSBhIGN1c3RvbSB0aWJvb3QzLmJpbiBzaW5jZSB0aGUgZGVmYXVsdCBp
cyAiaHMtZnMiLAo+PiDCoMKgIGJ1dCB0aGUgdGlfYW02Mnhfc2tfZGVmY29uZmlnIGV4cGVjdCB0
aGUgImdwIiBvbmUKPj4KPj4gVGVzdGVkIG9uIFNLLUFNNjJCLVAxLgo+Pgo+PiBTaWduZWQtb2Zm
LWJ5OiBEYXJpbyBCaW5hY2NoaSA8ZGFyaW8uYmluYWNjaGlAYW1hcnVsYXNvbHV0aW9ucy5jb20+
Cj4+IFNpZ25lZC1vZmYtYnk6IFJvbWFpbiBOYW91ciA8cm9tYWluLm5hb3VyQHNtaWxlLmZyPgo+
IAo+IFtzbmlwXQo+PiArY2F0IDw8LV9fSEVBREVSX0VPRiA+ICIke0JJTkFSSUVTX0RJUn0vZXh0
bGludXguY29uZiIKPj4gK8KgwqDCoCBsYWJlbCBhbTYyeC1zay1idWlsZHJvb3QKPj4gK8KgwqDC
oMKgwqAga2VybmVsIC9JbWFnZQo+PiArwqDCoMKgwqDCoCBmZHRkaXIgLwo+PiArwqDCoMKgwqDC
oCBkZXZpY2V0cmVlIC8ke0RFVklDRVRSRUV9Cj4+ICvCoMKgwqDCoMKgIGFwcGVuZCAke2FwcGVu
ZH0KPiAKPiDCoEkgd29uZGVyIGlmIGl0J3MgcmVhbGx5IHVzZWZ1bCB0byBoYXZlIHRoaXMgY3Vz
dG9tIGV4dGxpbnV4LmNvbmYuLi4gV2UgY291bGQKPiBhbHNvIGdpdmUgdGhlIGRldmljZXRyZWUg
YSBjb21tb24gbmFtZSwgYW5kIG1vdmUgdGhlIGFwcGVuZCBsaW5lIGludG8gdGhlIGRldmljZQo+
IHRyZWUgaXRzZWxmLgo+IAo+IMKgQnV0IHRoaXMgcGF0Y2ggaGFzIGhhZCBlbm91Z2ggaXRlcmF0
aW9ucywgbGV0J3MganVzdCBrZWVwIGl0IGFzIGlzIDotKQo+IAo+IFtzbmlwXQo+PiAtQlIyX1RB
UkdFVF9USV9LM19SNV9MT0FERVJfQ1VTVE9NX1ZFUlNJT05fVkFMVUU9IjIwMjIuMTAiCj4+ICtC
UjJfVEFSR0VUX1RJX0szX1I1X0xPQURFUl9DVVNUT01fVkVSU0lPTl9WQUxVRT0iMjAyNC4wMSIK
PiAKPiDCoFRoZSBoYXNoIGZvciAyMDI0LjAxIGlzIGN1cnJlbnRseSBpbiBib290L3Vib290L3Vi
b290Lmhhc2gsIGJ1dCBhcyBzb29uIGFzIHdlCj4gdXBkYXRlIHRoZSBVLUJvb3QgdmVyc2lvbiwg
aXQgd2lsbCBubyBsb25nZXIgYmUuIFNvIHRvIGJlIGZ1dHVyZSBzYWZlLCB3ZSBzaG91bGQKPiBh
ZGQgYSBsb2NhbCBvdmVycmlkZSBvZiB0aGUgdWJvb3QgaGFzaCBmaWxlIGFzIHdlbGwgKHdoaWNo
IGlzIHNpbXBseSBpZGVudGljYWwKPiB0byB1Ym9vdC5oYXNoKS4KCkkgdXBkYXRlZCBib2FyZC90
aS9hbTYyeC1zay9wYXRjaGVzL3RpLWszLXI1LWxvYWRlci90aS1rMy1yNS1sb2FkZXIuaGFzaCBp
biB0aGlzCnZlcnNpb24sIHNvIHdlIGFyZSBmdXR1cmUgc2FmZSBhbHJlYWR5IDopCgpCZXN0IHJl
Z2FyZHMsClJvbWFpbgoKCj4gCj4gwqBSZWdhcmRzLAo+IMKgQXJub3V0Cj4gCj4+IMKgIEJSMl9U
QVJHRVRfVElfSzNfUjVfTE9BREVSX0JPQVJEX0RFRkNPTkZJRz0iYW02MnhfZXZtX3I1Igo+PiAr
QlIyX1RBUkdFVF9USV9LM19SNV9MT0FERVJfVElCT09UM19CSU49InRpYm9vdDMtYW02MngtZ3At
ZXZtLmJpbiIKPj4gK0JSMl9UQVJHRVRfVElfSzNfUjVfTE9BREVSX1VTRV9CSU5NQU49eQo+PiDC
oCBCUjJfVEFSR0VUX1VCT09UPXkKPj4gwqAgQlIyX1RBUkdFVF9VQk9PVF9CVUlMRF9TWVNURU1f
S0NPTkZJRz15Cj4+IMKgIEJSMl9UQVJHRVRfVUJPT1RfQ1VTVE9NX1ZFUlNJT049eQo+PiAtQlIy
X1RBUkdFVF9VQk9PVF9DVVNUT01fVkVSU0lPTl9WQUxVRT0iMjAyMi4xMCIKPj4gK0JSMl9UQVJH
RVRfVUJPT1RfQ1VTVE9NX1ZFUlNJT05fVkFMVUU9IjIwMjQuMDEiCj4+IMKgIEJSMl9UQVJHRVRf
VUJPT1RfQk9BUkRfREVGQ09ORklHPSJhbTYyeF9ldm1fYTUzIgo+PiDCoCBCUjJfVEFSR0VUX1VC
T09UX05FRURTX0RUQz15Cj4+IMKgIEJSMl9UQVJHRVRfVUJPT1RfTkVFRFNfT1BFTlNTTD15Cj4+
IMKgIEJSMl9UQVJHRVRfVUJPT1RfTkVFRFNfQVRGX0JMMzE9eQo+PiDCoCBCUjJfVEFSR0VUX1VC
T09UX05FRURTX1RJX0szX0JPT1RfRklSTVdBUkU9eQo+PiArQlIyX1RBUkdFVF9VQk9PVF9VU0Vf
QklOTUFOPXkKPj4gwqAgIyBCUjJfVEFSR0VUX1VCT09UX0ZPUk1BVF9CSU4gaXMgbm90IHNldAo+
PiDCoCBCUjJfVEFSR0VUX1VCT09UX0ZPUk1BVF9JTUc9eQo+PiDCoCBCUjJfVEFSR0VUX1VCT09U
X1NQTD15CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpi
dWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlz
dHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
