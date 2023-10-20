Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7024FC001DF
	for <buildroot@archiver.kernel.org>; Fri, 20 Oct 2023 14:57:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E42487055A;
	Fri, 20 Oct 2023 14:57:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E42487055A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id i-AP8fJCydbZ; Fri, 20 Oct 2023 14:57:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 32E7970547;
	Fri, 20 Oct 2023 14:57:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 32E7970547
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AE00A1BF860
 for <buildroot@lists.busybox.net>; Fri, 20 Oct 2023 14:57:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 93357818C9
 for <buildroot@lists.busybox.net>; Fri, 20 Oct 2023 14:57:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 93357818C9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DidNHKzdEfxR for <buildroot@lists.busybox.net>;
 Fri, 20 Oct 2023 14:57:13 +0000 (UTC)
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7109C84B40
 for <buildroot@buildroot.org>; Fri, 20 Oct 2023 14:57:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7109C84B40
Received: by mail-pj1-x1035.google.com with SMTP id
 98e67ed59e1d1-27ddc1b1652so716220a91.2
 for <buildroot@buildroot.org>; Fri, 20 Oct 2023 07:57:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697813833; x=1698418633;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KRNfe0nxPEwGqf2FDHfoJQ13ZTX59dvrougss/h8KYM=;
 b=uUViTahspc5wZ/3bUj2jiacjGE+d/mRiQFdF45PqL/1gNZJhHj02TrNuU+rqUWK4zg
 Ire+OPy7AWaHz05GDozBM0SU6sTlzsV/scNq4GD3FRXrhXsnJ7voBkx3i+KqlyQUW8S5
 vL3GSThEbDX5dAY1STkdWXyLmdYhern8HO00aE8jlP/NV3a5nRxDZhAHEt17Eg96X/PM
 Fn02kp9U/Hjus2S17oBCxtm/4KgYBFXh3luNBS+xq+2USLQb+bCCbW9uEnSdrfpPvMVA
 Kgud5/aGkYPTN3Tfq4tyVqnHR/HaybxyiRn/IaJ0c7wg167CSiMXjyvRMdyDvyLSVSsz
 UScg==
X-Gm-Message-State: AOJu0YxjeUEDaHejh/RJ0cwAAq+uMflCWWNxbmzvHfLmK6uK4N4QUriN
 2xi3TmgGSUeDc2ypI5mXu0EAYxswAfx2iKoTbKU=
X-Google-Smtp-Source: AGHT+IFGZSO3hwdsdzbhPcAEN9v0JCW+q9KZbCd6yb8O5RUBGavhJbzUqHwUiDP+hLzIX8wG0fG/Z9X9SMic0xpX1Vk=
X-Received: by 2002:a17:90a:196:b0:27d:63c:34f2 with SMTP id
 22-20020a17090a019600b0027d063c34f2mr2060230pjc.41.1697813832605; Fri, 20 Oct
 2023 07:57:12 -0700 (PDT)
MIME-Version: 1.0
References: <20231017143424.430007-1-anaumann@ultratronik.de>
 <PH1P110MB1603AE1FC3925D2A2D33EEED9FD6A@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
 <38dd6e9a-7fea-e3fb-21a1-5a381a36c8cf@mind.be>
 <bede2a82-ee1f-4f8a-97f8-c6e2b54b2b84@grenoble.cnrs.fr>
 <b2979a64-22b7-4006-9cec-912af8b1cb02@andin.de>
In-Reply-To: <b2979a64-22b7-4006-9cec-912af8b1cb02@andin.de>
From: =?UTF-8?B?QsO2cmdlIFN0csO8bXBmZWw=?= <boerge.struempfel@gmail.com>
Date: Fri, 20 Oct 2023 16:57:01 +0200
Message-ID: <CAEktqcv9kDVi_OZevO+uAU4mhf_J3nDZTqNz9oC-XWPNvZCj7Q@mail.gmail.com>
To: Andreas Naumann <dev@andin.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1697813833; x=1698418633; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KRNfe0nxPEwGqf2FDHfoJQ13ZTX59dvrougss/h8KYM=;
 b=bjQZ7mkNE47xuWDVpbyKyA4BXg4D+ziH1sAHNSdZIkIIzQ5x5Byd6Xk9zV2M3YMmet
 lm+Jzx6xWpw4c0C1HmPzp4YWoGxzM4lOxg9+wJZaTI2B/LM02k1sTVeEVPhoIMYuSlar
 +Db4C8RRXWgg3lah9Ygy81WUjIzbBNcKajOqipr/gImusI9B3nRvpGzEOI7/42+On1xC
 xSZon0v/8jFXQ+szyJ/i612tF7uJ+qL+tGPZVoUD790Ryk47mZivHr7zYXNkTtj3BInA
 t/50iZruHPVXPxvr9AUYp1qWgQED0deTpj443K7hTYdjAS4QdUwXdPzJQwmBre486rLM
 WFCg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=bjQZ7mkN
Subject: Re: [Buildroot] [External] - [PATCH 0/1] libgpiod v2
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
Cc: vfazio@xes-inc.com, Edgar Bonet <bonet@grenoble.cnrs.fr>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGksCgpJIGhhdmUgbm93IHVwbG9hZGVkIGEgcGF0Y2gtc2VyaWVzIHRvIHRoZSBzd3VwZGF0ZSBt
YWlsaW5nIGxpc3QsIHdoaWNoCnVzZXMgdGhlIG1lY2hhbmlzbSBwcm9wb3NlZCBieSBFZGdhciBC
b25ldCBpbiBvcmRlciB0byBkZXRlY3QgYXBpIHYxIHZzCmFwaSB2Mi4KClRoZSBmaXJzdCB2ZXJz
aW9uIGNhbiBiZSBmb3VuZCBoZXJlOgpodHRwczovL2dyb3Vwcy5nb29nbGUuY29tL2cvc3d1cGRh
dGUvYy81NS1fc1lhZmx1awoKT24gRnJpLCBPY3QgMjAsIDIwMjMgYXQgNDozMOKAr1BNIEFuZHJl
YXMgTmF1bWFubiA8ZGV2QGFuZGluLmRlPiB3cm90ZToKPgo+IEhpIFZpbmNlbnQsIGFsbCwKPgo+
IEkndmUgZ290IHRoZSBzYW1lIGltcHJlc3Npb24gYW5kIHdvdWxkIHZvdGUgdG8gY3JlYXRlIGxp
YmdwaW9kMiBmb3IgdGhlCj4gc2FtZSByZWFzb25zIEFybm91dCBzdGF0ZWQuIEV2ZW4gaWYgY29u
ZGl0aW9uYWwgdXNlIGlzIHBvc3NpYmxlLCBpdCdzCj4gbm90IHRoYXQgc3RyYWlnaHRmb3J3YXJk
IGFuZCByZXF1aXJpbmcgc29tZWJvZHkgdG8gaW1wbGVtZW50IGFuZAo+IHBvc3NpYmx5IHVwc3Ry
ZWFtIHRob3NlIGZvciB0aGUgNCBkZXBlbmRlbnQgcGFja2FnZXMgc2VlbXMgbGlrZSBjcmVhdGlu
Zwo+IGEgYmFycmllci4KPgo+IEluIGFkZGl0aW9uLCBpIHRoaW5rIHRoZSBiZWhhdmlvdXIgb2Yg
dGhlIHRvb2xzIGhhcyBjaGFuZ2VkIGEgYml0LCBlLmcuCj4gYWZ0ZXIgZ3Bpb3NldCBmaW5pc2hl
cyBpdCByZXR1cm5zIHRoZSBHUElPIHRvIHRoZSBvcmlnaW5hbCBzdGF0ZSAoYXQKPiBsZWFzdCB0
aGF0J3Mgd2hhdCBJIHJlY2FsbCBmcm9tIHdoYXQgQsO2cmdlIHRvbGQgbWUgYWJvdXQgaXQpLgo+
CgpJIGRvbid0IHRoaW5rLCB0aGUgdG9vbHMgcmV0dXJuIHRvIHRoZSBvcmlnaW5hbCBzdGF0ZSwg
SSB0aGluaywgdGhleQpqdXN0IHJlbGVhc2UKdGhlbSwgd2hpY2ggbWFrZXMgdGhlbSBnbyBiYWNr
IHRvIGlucHV0LiBIb3dldmVyIEkgdGhpbmsgdGhleSBkaWQgdGhhdCBpbiB2MS42CmFzIHdlbGwu
IFRoZXkgb25seSBrZWVwIHRoZWlyIHZhbHVlcyBpbmRlZmluYXRlbHkgd2l0aG91dCBzcGVjaWZp
eWluZwpzbywgd2hlbiB1c2luZwp0aGUgb2xkZXIgc3lzZnMgZXhwb3J0IGZ1bmN0aW9uYWxpdHku
CgpUaGUgcHJvYmxlbSBpcywgdGhhdCB3cm9uZ2Z1bGwgdXNhZ2Ugb2YgdGhlIGdwaW90b29scyBp
cyBub3QgaW1lZGlhdGx5Cm9idmlvdXMsIHNpbmNlCmlmIHRoZSBsaW5lcyBhcmUgZmxvYXRpbmcs
IHRoZXkgbWlnaHQga2VlcCB0aGVpciB2YWx1ZSBmb3Igc29tZSB0aW1lCmFmdGVyIHNldHRpbmcg
dGhlbQoob3IgcG9zc2libHkgYmUgcmVsZWFzZWQgYmVmb3JlIGNoYXJnaW5nIHRoZSBjYXBhY2l0
eSBzdWZmaWNpZW50bHkgYW5kCnRoZXJlZm9yZSwgd2hpY2gKaXMgbW9yZSBvYnZpb3VzLCBzaW5j
ZSBpdCB3aWxsIHJlc3VsdCBpbiBhICdidWcnIHdoZXJlIHRoZSBsaW5lIGRvZXMKbm90IGFjdHVh
bGx5IGNoYW5nZQphZnRlciB0aGUgZmlyc3QgY2FsbCwgYnV0IG1pZ2h0IGNoYW5nZSBhZnRlciB0
aGUgc2Vjb25kIG9yIHRoaXJkIGNhbGwuLi4uKQoKPgo+IFNvIGlmIHBlb3BsZSB1c2UgZ3Bpb2dl
dC9zZXQgYW5kIHNvIG9uIGluIHNjcmlwdHMsIHRoZSBiZWhhdmlvdXIgbW9zdAo+IGxpa2VseSBj
aGFuZ2VzIHVuZXhwZWN0ZWRseS4KPgoKTW9zdCBsaWtlbHkgY3VzdG9tIHNjcmlwdHMgd291bGQg
YnJlYWsgYW55d2F5LCBzaW5jZSB0aGUgc3ludGF4IGZvcgppZGVudGlmeWluZyBhCnNwZWNpZmlj
IGdwaW8gaGFzIGNoYW5nZWQuIChiZWZvcmUgaXQgd2FzIGxpa2UgZ3Bpb3NldCA8YmFuaz4gPG9m
ZnNldD49PHZhbHVlPgp3aGVyZWFzIGl0IGlzIG5vdyBncGlvc2V0IC1jIDxiYW5rL2NoaXA+IDxv
ZmZzZXQ+PTx2YWx1ZT4gb3IgaWYgbGluZS1uYW1lcyBhcmUKZ2l2ZW4gZ3Bpb3NldCA8bGluZS1u
YW1lPj08dmFsdWU+KQoKQWxzbyBhIGxvdCBvZiB0aGUgb3B0aW9ucyByZWdhcmRpbmcgaG93IGxv
bmcgdGhlIGxpbmUgc2hvdWxkIGJlIGhlbGQsIGhhdmUgYmVlbgpyZXdvcmtlZCwgYW5kIHRoZSBw
YXJhbWV0ZXJzIGhhdmUgY2hhbmdlZC4KCj4KPiBAVmluY2VudCwgZG8geW91IGhhdmUgdGhlIGlu
dGVudCBvciBtYXliZSBldmVuIGEgcGF0Y2ggZm9yIGNyZWF0aW5nIGEKPiBzZXBhcmF0ZSB2MiBw
YWNrYWdlPyBPdGhlcndpc2UgbWUvQsO2cmdlIHdvdWxkIGxvb2sgaW50byBjb21pbmcgdXAgd2l0
aCBvbmUuCj4KPgo+IHJlZ2FyZHMsCj4gQW5kcmVhcwo+ID4gX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KPiA+IGJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKPiA+
IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4gPiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcv
bWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QKPiA+Cj4gX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KPiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4gYnVpbGRy
b290QGJ1aWxkcm9vdC5vcmcKPiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9idWlsZHJvb3QKCktpbmQgUmVnYXJkcywKQm9lcmdlCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVp
bGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4v
bGlzdGluZm8vYnVpbGRyb290Cg==
