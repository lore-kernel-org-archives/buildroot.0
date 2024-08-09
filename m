Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48347C3DA4A
	for <buildroot@archiver.kernel.org>; Fri,  9 Aug 2024 11:33:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F0356412CC;
	Fri,  9 Aug 2024 11:33:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2tIyCvBWRN3q; Fri,  9 Aug 2024 11:33:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A682E412D0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A682E412D0;
	Fri,  9 Aug 2024 11:33:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CA1F81BF336
 for <buildroot@lists.busybox.net>; Fri,  9 Aug 2024 11:33:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B8D1560651
 for <buildroot@lists.busybox.net>; Fri,  9 Aug 2024 11:33:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dagXLVs0Snat for <buildroot@lists.busybox.net>;
 Fri,  9 Aug 2024 11:33:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::433; helo=mail-wr1-x433.google.com;
 envelope-from=gael.portay@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org BCB32600B9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BCB32600B9
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BCB32600B9
 for <buildroot@buildroot.org>; Fri,  9 Aug 2024 11:33:15 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-368440b073bso1157496f8f.0
 for <buildroot@buildroot.org>; Fri, 09 Aug 2024 04:33:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723203193; x=1723807993;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :content-transfer-encoding:mime-version:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=F5AYxzZVU3UeDOi5x3fkSvQT0HpTpQETXbETaWSQC4w=;
 b=Bp4PCRTqyYwE6XyN56cNVkMc5XSxdIHH3Geqrw0UrqLqXDd0qp8lce12TbKEvpRmxM
 DXFZdonk61JBd8BwqOwqfFVrELdR1MVlBVxNCZ4N87VUO4dhC2JTQTqeSLCjAhxG6SqL
 U2GW5OX1+pOqHOkDVzkxCuBBJes2lokZuuj6QrXV2wV0Niyoar/i0btZjjQ+bypbFP6k
 XmFkAOJvzXCXSN/cni9tsHJcpQrz8Sfi0mkgtkH21nnIH8zoNDBZt1F8N2GDpprGtca7
 NqLMoAog0fetAPNCDAHPdzRlzizg8qPqiulD4WBGT+pENFdg/2R7lADkWrOBkGcM1Tox
 H/6Q==
X-Gm-Message-State: AOJu0YxEo8fZKgB3WigvgqScvzTYuWOOC6jW9g7K0ZVI3Xq70f5Dmbcb
 LEyJEt2uSqb2YtGCEO+XtXL8+0YS5e9loAYgFauraK9L5T2vjGRR
X-Google-Smtp-Source: AGHT+IFNknkIla3V5lcWMazQtuUOrBNukL5LPTX/kxHacHryFXpHpc7XYWLNRD1+FU1iQ+MYr/arYQ==
X-Received: by 2002:a05:6000:459a:b0:367:895f:619e with SMTP id
 ffacd0b85a97d-36d2810977fmr3665502f8f.11.1723203193353; 
 Fri, 09 Aug 2024 04:33:13 -0700 (PDT)
Received: from localhost ([2a01:e0a:ce:f2f0:2a6b:35ff:feb8:77d9])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-429059621d1sm120680315e9.10.2024.08.09.04.33.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Aug 2024 04:33:12 -0700 (PDT)
Mime-Version: 1.0
Date: Fri, 09 Aug 2024 13:33:12 +0200
Message-Id: <D3BCJU2YNX4Z.15NGJAY8Q0M02@gmail.com>
From: =?utf-8?q?Ga=C3=ABl_PORTAY?= <gael.portay@gmail.com>
To: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
X-Mailer: aerc 0.18.2-0-ge037c095a049
References: <20240808123938.898039-1-gael.portay@rtone.fr>
 <20240808184233.39b3e326@windsurf>
In-Reply-To: <20240808184233.39b3e326@windsurf>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1723203193; x=1723807993; darn=buildroot.org;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :content-transfer-encoding:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=F5AYxzZVU3UeDOi5x3fkSvQT0HpTpQETXbETaWSQC4w=;
 b=QZLOhsxbTMVzZqm1aXEze12UbpQCUJQ5+A53qjRxqoZR5IdBWUgLZ+dqHB2i2qf7Z5
 QkBqKI8poctIQWkRI8x0HJx3r0c4WTwn5gk+wZj9abAH63tmxvDR7k8wTzSmbzH31RQH
 PiSpCZq3zMsugYUyfSLOAA4oTcd+lUCakMFO7uImAE49EY+ahg6vm6cnvqews0rt+N4c
 qkbZcNxMqOj4D5yzHPHo67QF8LV7WTc6H0vrK89keMahv09FIxcU6UMlk3Q8bvkN5p38
 8EygmdtzBk0jriGD9bq8Yj+CkSPdoB4vC+OUw2J/rqzMkmkN67V0iUa1YzuhT3979QNt
 lhsQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=QZLOhsxb
Subject: Re: [Buildroot] [PATCH 1/2] configs: add Raspberry Pi Zero 2 W
 64-bit defconfig
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
Cc: =?utf-8?q?Ga=C3=ABl_PORTAY?= <gael.portay@rtone.fr>,
 Martin Bark <martin@barkynet.com>, Julien
 Grossholtz <julien.grossholtz@openest.io>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gVGhvbWFzLAoKT24gVGh1IEF1ZyA4LCAyMDI0IGF0IDY6NDIgUE0gQ0VTVCwgVGhvbWFz
IFBldGF6em9uaSB3cm90ZToKPiBUaGFua3MgZm9yIHRoaXMgcGF0Y2guIFRoZSBjb21taXQgdGl0
bGUgc2hvdWxkIGJlOgo+Cj4gCWNvbmZpZ3MvcmFzcGJlcnJ5cGl6ZXJvMndfNjQ6IG5ldyBkZWZj
b25maWcKPgoKV293LCBkaXQgSSByZWFsbHkgbWFrZSB0aGF0IGNvbW1pdCB0aXRsZT8hPwoKRml4
ZWQgaW4gdjIuCgo+ID4gLS0tCj4gPiAgYm9hcmQvcmFzcGJlcnJ5cGkvY29uZmlnX3plcm8yd182
NGJpdC50eHQgfCAzMiArKysrKysrKysrKysrKysKPiA+ICBib2FyZC9yYXNwYmVycnlwaXplcm8y
dy02NCAgICAgICAgICAgICAgICB8ICAxICsKPiA+ICBjb25maWdzL3Jhc3BiZXJyeXBpemVybzJ3
XzY0X2RlZmNvbmZpZyAgICB8IDQ4ICsrKysrKysrKysrKysrKysrKysrKysrCj4gPiAgMyBmaWxl
cyBjaGFuZ2VkLCA4MSBpbnNlcnRpb25zKCspCj4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGJvYXJk
L3Jhc3BiZXJyeXBpL2NvbmZpZ196ZXJvMndfNjRiaXQudHh0Cj4gPiAgY3JlYXRlIG1vZGUgMTIw
MDAwIGJvYXJkL3Jhc3BiZXJyeXBpemVybzJ3LTY0Cj4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGNv
bmZpZ3MvcmFzcGJlcnJ5cGl6ZXJvMndfNjRfZGVmY29uZmlnCj4KPiBQbGVhc2UgYWRkIGFuIGVu
dHJ5IGluIHRoZSBERVZFTE9QRVJTIGZpbGUgZm9yIHRoaXMgbmV3IGRlZmNvbmZpZy4KPiBQZXJo
YXBzIHlvdSBhbHNvIHdhbnQgdG8gYWRkIHlvdXJzZWxmIGZvciBhbGwgUmFzcGJlcnJ5IHBsYXRm
b3Jtcz8KPgoKT2theS4KCj4KPiA+IGRpZmYgLS1naXQgYS9ib2FyZC9yYXNwYmVycnlwaXplcm8y
dy02NCBiL2JvYXJkL3Jhc3BiZXJyeXBpemVybzJ3LTY0Cj4gPiBuZXcgZmlsZSBtb2RlIDEyMDAw
MAo+ID4gaW5kZXggMDAwMDAwMDAwMC4uZmNkYWZjODFlZAo+ID4gLS0tIC9kZXYvbnVsbAo+ID4g
KysrIGIvYm9hcmQvcmFzcGJlcnJ5cGl6ZXJvMnctNjQKPiA+IEBAIC0wLDAgKzEgQEAKPiA+ICty
YXNwYmVycnlwaQo+Cj4gSSByZWFsbHkgZG9uJ3QgdW5kZXJzdGFuZCB3aHkgd2UgaGF2ZSBhbGwg
dGhvc2Ugc3ltbGlua3MsIGl0IG1ha2VzIG5vCj4gc2Vuc2UuIElmIGFsbCBkZWZjb25maWdzIGFy
ZSB1c2luZyB0aGUgc2FtZSBmaWxlcyBmcm9tCj4gYm9hcmQvcmFzcGJlcnJ5cGkvLCB3aHkgYXJl
IHRoZSBkZWZjb25maWdzIG5vdCBhbGwgdXNpbmcKPiBib2FyZC9yYXNwYmVycnlwaS8gaW5zdGVh
ZCBvZiB0aG9zZSBzaWxseSBzeW1saW5rcz8KPgoKVGhleSBleGlzdCBzaW5jZSBhIGxvdCBvZiB0
aW1lIG5vdy4gSSBoYXZlIHJlbW92ZWQgdGhlbSBhbmQgSSBob3BlIEkKaGF2ZSBub3QgbWlzc2Vk
IHNvbWV0aGluZy4KCkkgaG9wZSB0aGUgYnIyLWV4dGVybmFsIGRvIG5vdCB1c2UgdGhlbSwgb3Ig
dGhleSB3aWxsIGhhdmUgdG8gdXBkYXRlIHRoZQpwYXRoLgoKPiA+IGRpZmYgLS1naXQgYS9jb25m
aWdzL3Jhc3BiZXJyeXBpemVybzJ3XzY0X2RlZmNvbmZpZyBiL2NvbmZpZ3MvcmFzcGJlcnJ5cGl6
ZXJvMndfNjRfZGVmY29uZmlnCj4gPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+ID4gaW5kZXggMDAw
MDAwMDAwMC4uN2MzNjE4M2E5Zgo+ID4gLS0tIC9kZXYvbnVsbAo+ID4gKysrIGIvY29uZmlncy9y
YXNwYmVycnlwaXplcm8yd182NF9kZWZjb25maWcKPiA+IEBAIC0wLDAgKzEsNDggQEAKPiA+ICtC
UjJfYWFyY2g2ND15Cj4gPiArQlIyX2NvcnRleF9hNTM9eQo+ID4gK0JSMl9BUk1fRlBVX1ZGUFY0
PXkKPiA+ICsKPiA+ICsjIHBhdGNoZXMKPiA+ICtCUjJfR0xPQkFMX1BBVENIX0RJUj0iYm9hcmQv
cmFzcGJlcnJ5cGkvcGF0Y2hlcyIKPgo+IEhlcmUgeW91J3JlIG5vdCBldmVuIHVzaW5nIHRoYXQg
bmV3IHN5bWxpbmsuCj4KCldlbGwsIEkgaGF2ZSBtYWtlIGEgY29weSBvZiB0aGUgZXhpc3Rpbmcg
cmFzcGJlcnJ5cGl6ZXJvMndfZGVmY29uZmlnOyBJCmhhdmUgbm90IG5vdGljZWQgdGhhdCBpbmNv
aGVyZW5jZSA6KQoKPiA+ICtCUjJfRE9XTkxPQURfRk9SQ0VfQ0hFQ0tfSEFTSEVTPXkKPiA+ICsK
PiA+ICsjIExpbnV4IGhlYWRlcnMgc2FtZSBhcyBrZXJuZWwsIGEgNi42IHNlcmllcwo+ID4gK0JS
Ml9QQUNLQUdFX0hPU1RfTElOVVhfSEVBREVSU19DVVNUT01fNl82PXkKPiA+ICsKPiA+ICtCUjJf
VE9PTENIQUlOX0JVSUxEUk9PVF9DWFg9eQo+ID4gKwo+ID4gK0JSMl9MSU5VWF9LRVJORUw9eQo+
ID4gK0JSMl9MSU5VWF9LRVJORUxfQ1VTVE9NX1RBUkJBTEw9eQo+ID4gK0JSMl9MSU5VWF9LRVJO
RUxfQ1VTVE9NX1RBUkJBTExfTE9DQVRJT049IiQoY2FsbCBnaXRodWIscmFzcGJlcnJ5cGksbGlu
dXgsNTc2Y2MxMGUxZWQ1MGE5ZWFjZmZjN2EwNWM3OTYwNTFkNzM0M2VhNCkvbGludXgtNTc2Y2Mx
MGUxZWQ1MGE5ZWFjZmZjN2EwNWM3OTYwNTFkNzM0M2VhNC50YXIuZ3oiCj4gPiArQlIyX0xJTlVY
X0tFUk5FTF9ERUZDT05GSUc9ImJjbXJwaTMiCj4gPiArCj4gPiArIyBCdWlsZCB0aGUgRFRCIGZy
b20gdGhlIGtlcm5lbCBzb3VyY2VzCj4gPiArQlIyX0xJTlVYX0tFUk5FTF9EVFNfU1VQUE9SVD15
Cj4gPiArQlIyX0xJTlVYX0tFUk5FTF9JTlRSRUVfRFRTX05BTUU9ImJyb2FkY29tL2JjbTI3MTAt
cnBpLXplcm8tMi13Igo+ID4gKwo+ID4gK0JSMl9MSU5VWF9LRVJORUxfTkVFRFNfSE9TVF9PUEVO
U1NMPXkKPiA+ICsKPiA+ICtCUjJfUEFDS0FHRV9SUElfRklSTVdBUkU9eQo+ID4gK0JSMl9QQUNL
QUdFX1JQSV9GSVJNV0FSRV9CT09UQ09ERV9CSU49eQo+ID4gK0JSMl9QQUNLQUdFX1JQSV9GSVJN
V0FSRV9WQVJJQU5UX1BJPXkKPiA+ICtCUjJfUEFDS0FHRV9SUElfRklSTVdBUkVfQ09ORklHX0ZJ
TEU9ImJvYXJkL3Jhc3BiZXJyeXBpemVybzJ3LTY0L2NvbmZpZ196ZXJvMndfNjRiaXQudHh0Igo+
Cj4gQnV0IGhlcmUgeW91J3JlIHVzaW5nIGl0Lgo+Cj4gQ291bGQgeW91IGZpeCB0aGF0IHVwIGFu
ZCBzZW5kIGEgbmV3IGl0ZXJhdGlvbj8KPgoKSSBoYXZlICJmaXhlZCIgaXQuCgpXb3VsZCB5b3Ug
bWluZCBtYWtlaW5nIHN1cmUgSSBoYXZlIG5vdCBtaXNzZWQgYSB0aGluZz8gSSBoYXZlIHJlYnVp
bGQKb25seSB0aGUgcGk1LgoKPiBUaGFua3MhCj4KCk15IHBsZWFzdXJlIDspCgo+IFRob21hcwoK
R2HDq2wKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVp
bGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3Rz
LmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
