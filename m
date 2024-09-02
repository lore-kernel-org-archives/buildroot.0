Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82819CD13CF
	for <buildroot@archiver.kernel.org>; Mon,  2 Sep 2024 20:52:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2CAB9402BC;
	Mon,  2 Sep 2024 20:52:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ls1xMpXMmbWD; Mon,  2 Sep 2024 20:52:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CC158402EA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CC158402EA;
	Mon,  2 Sep 2024 20:52:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id ED3671BF426
 for <buildroot@lists.busybox.net>; Mon,  2 Sep 2024 20:52:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E7C7B606E2
 for <buildroot@lists.busybox.net>; Mon,  2 Sep 2024 20:52:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lP5ply9ldrjK for <buildroot@lists.busybox.net>;
 Mon,  2 Sep 2024 20:52:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=gael.portay@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B950D60622
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B950D60622
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B950D60622
 for <buildroot@buildroot.org>; Mon,  2 Sep 2024 20:52:17 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-42bb9c04fa5so5470075e9.3
 for <buildroot@buildroot.org>; Mon, 02 Sep 2024 13:52:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725310336; x=1725915136;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :content-transfer-encoding:mime-version:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=8SVqqcNnJxIdlGHcIqH218PLHztE1wcqv+96d3O6OoU=;
 b=a57LGIczHi8IjyGiRxhaNc9b3V6OyL0CqKI29YHZ0KkX6xRI7K9HALlnoXPkZpdOYu
 G7xV897EGposotDpYWSKHXBul+S3ywDKJ9ZBAbhGi3BiZPgolVd6PYX1AFwIfgJ4TyHS
 TFKqleWKtBCPlZIF6GrR9YSPtXifGxbe0j37yBvz0jf2+a391rRAQooijJB47GyyOM3M
 CHUy/0cMl21I803kJa2/0aU5qNA/8/JNjDbYGYnaSaNjctAgbSJJJ31h0scEN1AjQSzE
 wCLywkqjtP+GCK4yCizZI7m3hLp6wJ6kxloNsudIH/xD6sphAeQk9M6UNUsXI/LM45jH
 izLg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXtMfsWrHoNIjjuBsK9x+wm7/Nr42xmHL5zf3I47ytwdtLsxAAUQdiRyGRv8B0IpFZ4HMmsiqjpdoc=@buildroot.org
X-Gm-Message-State: AOJu0Yw8ATofVYBsixmjnLrUvyifu9faRXa3Ax8Z6P5JDnemAt9Pzwh1
 FTKNXv/YrLcWj0YLlfCMKUdxab3zBD/HgUdWWJl+3nVUC1V9pGtd
X-Google-Smtp-Source: AGHT+IHasYZEZ52JVwicMcAqbol0xGmRB6zmwVC0Ir0iCe0gqFpffIb/Z1elZI5arQyN8xmlnawRIg==
X-Received: by 2002:a5d:5987:0:b0:374:c4c9:d502 with SMTP id
 ffacd0b85a97d-374c4c9d93fmr2724378f8f.9.1725310335273; 
 Mon, 02 Sep 2024 13:52:15 -0700 (PDT)
Received: from localhost ([2a01:e0a:ce:f2f0:2a6b:35ff:feb8:77d9])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3749ee4c83fsm12411506f8f.22.2024.09.02.13.52.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Sep 2024 13:52:14 -0700 (PDT)
Mime-Version: 1.0
Date: Mon, 02 Sep 2024 22:52:14 +0200
Message-Id: <D3W3GXLAY046.CI48SHS5EP44@gmail.com>
From: =?utf-8?q?Ga=C3=ABl_PORTAY?= <gael.portay@gmail.com>
To: "Fiona Klute" <fiona.klute@gmx.de>, "Michael Walle" <michael@walle.cc>,
 <buildroot@buildroot.org>
X-Mailer: aerc 0.18.2-0-ge037c095a049
References: <20240902112735.728574-1-michael@walle.cc>
 <a9865fde-0c09-42dd-8cd2-d174412dce28@gmx.de>
In-Reply-To: <a9865fde-0c09-42dd-8cd2-d174412dce28@gmx.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725310336; x=1725915136; darn=buildroot.org;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :content-transfer-encoding:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8SVqqcNnJxIdlGHcIqH218PLHztE1wcqv+96d3O6OoU=;
 b=jnF/rfduT+WDOVTUii9kGrhWAspGlDUcJcsOCj0bC15Bndugycx03oKw7N8h0msYHS
 oWXwrVnXpOpzIYOEvCOqVPEbKh000dI4qVN/H9LD+RcwB5SHOEaDd/5OWFh3sLBJiVVa
 pzPUJS3WGc9UdztfL9icf7CfUuRRjitiOHLoymt+blbz05UurM8bHDobqVqrNPpTtTgw
 W6vGiwPvBVl7doF4hJCVtu6V6GvzoHEasNlW3uivZ6JPk7d0luS6b65mOUfbdi8pPDCj
 IcYD5TtoW+gIQYiMCgvvJBZartic98uPlpq8BGKKMUEQ29uabp/4pQsfSZMRYPICHkoH
 7z5A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=jnF/rfdu
Subject: Re: [Buildroot] [PATCH v2] linux: add support for device tree
 overlays
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
Cc: Niklas Cassel <Niklas.Cassel@wdc.com>,
 =?utf-8?q?Ga=C3=ABl_PORTAY?= <gael.portay@rtone.fr>,
 Julien Grossholtz <julien.grossholtz@openest.io>,
 Damien Le Moal <dlemoal@kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Martin Bark <martin@barkynet.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QWxsLCB0aGFuayB5b3UgZm9yIHlvdXIgaW50ZXJlc3QgaW4gYnJpbmdpbmcgdGhlIHN1cHBvcnQg
Zm9yIGR0Ym8hCgpPbiBNb24gU2VwIDIsIDIwMjQgYXQgNDozMiBQTSBDRVNULCBGaW9uYSBLbHV0
ZSB2aWEgYnVpbGRyb290IHdyb3RlOgo+ID4gLUxJTlVYX0RUU19OQU1FICs9ICQoYmFzZW5hbWUg
JChmaWx0ZXIgJS5kdHMsJChub3RkaXIgJChjYWxsIHFzdHJpcCwkKEJSMl9MSU5VWF9LRVJORUxf
Q1VTVE9NX0RUU19QQVRIKSkpKSkKPiA+ICtMSU5VWF9DVVNUT01fRFRTX1BBVEggPSAkKGNhbGwg
cXN0cmlwLCQoQlIyX0xJTlVYX0tFUk5FTF9DVVNUT01fRFRTX1BBVEgpKQo+ID4gK0xJTlVYX0RU
U19OQU1FICs9ICQoYmFzZW5hbWUgJChmaWx0ZXIgJS5kdHMsJChub3RkaXIgJChMSU5VWF9DVVNU
T01fRFRTX1BBVEgpKSkpCj4gPiArTElOVVhfRFRTT19OQU1FUyArPSAkKGJhc2VuYW1lICQoZmls
dGVyICUuZHRzbywkKG5vdGRpciAkKExJTlVYX0NVU1RPTV9EVFNfUEFUSCkpKSkKPiA+Cj4gPiAt
TElOVVhfRFRCUyA9ICQoYWRkc3VmZml4IC5kdGIsJChMSU5VWF9EVFNfTkFNRSkpCj4gPiArTElO
VVhfRFRCUyA9ICQoYWRkc3VmZml4IC5kdGIsJChMSU5VWF9EVFNfTkFNRSkpICQoYWRkc3VmZml4
IC5kdGJvLCQoTElOVVhfRFRTT19OQU1FUykpCj4KPiBUaGlzIGxvb2tzIGxpa2UgdGhlIERUQk9z
IHdpbGwgYmUgaW5zdGFsbGVkIHRvICRCSU5BUklFU19ESVIgYWxvbmcgd2l0aAo+IHRoZSBEVEJz
LiBBdCBsZWFzdCBvbiBSUGkgcGxhdGZvcm1zIGl0J2QgYmUgcHJlZmVyYWJsZSB0byBiZSBhYmxl
IHRvIHB1dAo+IHRoZW0gaW4gYW4gb3ZlcmxheXMvIGRpcmVjdG9yeSwgdG8gbWFrZSBpdCBlYXNp
ZXIgdG8gY3JlYXRlIHRoZQo+IHN0cnVjdHVyZSBleHBlY3RlZCBieSB0aGUgZmlybXdhcmUgaW4g
YSBnZW5pbWFnZSBjb25maWcgd2l0aG91dAo+IHRlbXBsYXRpbmcuIEkgZG9uJ3Qga25vdyBob3cg
Y29tbW9uIHRoaXMgaXMgYWNyb3NzIG90aGVyIHBsYXRmb3JtcyB0aGF0Cj4gdXNlIERUIG92ZXJs
YXlzLgo+CgpJSVJDLCBJIGhhdmUgc2VlbiBwbGF0Zm9ybXMgdGhhdCBwdXQgdGhlIGR0YiBhbmQg
ZHRibyBhdCB0aGUgc2FtZSBwbGFjZS4KCkkgc3Ryb25nbHkgdGhpbmsgdGhlIFBpIGlzIHRoZSBv
bmUgdGhhdCBwdXQgdGhlIGR0Ym8gaW4gdGhlIHN1YmRpcmVjdG9yeQpvdmVybGF5cy8uCgo+IFdv
dWxkIGl0IGJlIHByYWN0aWNhbCB0byBhZGQgYW4gb3B0aW9uIHRvIGluc3RhbGwgRFRCT3MgaW4g
YQo+IChjb25maWd1cmFibGUpIHN1YmRpcmVjdG9yeT8KPgoKV2VsbCwgSSBkbyBub3QgcmVhbGx5
IGxpa2UgYWRkaW5nIGFuIG9wdGlvbiB0byBzZXQgdGhlIHRhcmdldCBkaXJlY3RvcnkuCgpJbiBt
eSBwYXRjaCBzZXJpZSBJIGhhdmUgY29tcGxldGx5IHNwbGl0IHRoZSBkdGJvIGZyb20gdGhlIGR0
Yjsgc28geW91CmNhbiBrZWVwIG9yIG5vdCB0aGUgInRvcCIgZGlyZWN0b3J5IGZvciBkdGIgKGJy
b2FkY29tKSBhbmQgZm9yIGR0Ym8KKG92ZXJsYXlzKS4KCkkgZG8gbm90IHRoaW5rIGl0IHdvcnRo
IGl0LCBidXQgaXQgaGVscHMgZm9yIHRoZSBQaS4KCkluIHRoZSBjYXNlIG9mIHRoZSBQaSwgeW91
IHNldDoKCgkjIEJSMl9MSU5VWF9LRVJORUxfRFRCX0tFRVBfRElSTkFNRSBpcyBub3Qgc2V0CglC
UjJfTElOVVhfS0VSTkVMX0RUQk9fS0VFUF9ESVJOQU1FPXkKClRvIGluc3RhbGwgZHRib3MgdG8g
JEJJTkFSSUVTX0RJUi9vdmVybGF5cyBhbmQgZHRiIHRvICRCSU5BUklFU19ESVIuCgoJaHR0cHM6
Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9wcm9qZWN0L2J1aWxkcm9vdC9wYXRjaC8yMDI0MDkwMjIw
MzUzMy4zOTYxMTA4LTItZ2FlbC5wb3J0YXlAcnRvbmUuZnIvCgpJIGhhdmUgbm8gc3Ryb25nIG9w
aW5pb24gYWJvdXQgeW91ciB3b3JrIChtb3JlIHNpbXBsZSkgYW5kIG1pbmUgKG1vcmUKZHVwbGlj
YXRpb24pLgoKPiBFaXRoZXIgd2F5IHRoYW5rIHlvdSBmb3Igd29ya2luZyBvbiB0aGlzIQo+CgpZ
ZXMgdGhhbmsgeW91IChhZ2FpbikuCgo+IEJlc3QgcmVnYXJkcywKPiBGaW9uYQo+CgpLaW5kIFJl
Z2FyZHMsCkdhw6tsCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6
Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
