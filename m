Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 139AEC001DB
	for <buildroot@archiver.kernel.org>; Mon, 14 Aug 2023 06:08:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6812D40A0F;
	Mon, 14 Aug 2023 06:08:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6812D40A0F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 782NwDRqO4Dt; Mon, 14 Aug 2023 06:08:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B55994095E;
	Mon, 14 Aug 2023 06:08:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B55994095E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4F00D1BF3D1
 for <buildroot@lists.busybox.net>; Mon, 14 Aug 2023 06:08:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 241D360F95
 for <buildroot@lists.busybox.net>; Mon, 14 Aug 2023 06:08:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 241D360F95
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UZ514v5ZqNSS for <buildroot@lists.busybox.net>;
 Mon, 14 Aug 2023 06:07:59 +0000 (UTC)
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0633960B88
 for <buildroot@buildroot.org>; Mon, 14 Aug 2023 06:07:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0633960B88
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3110ab7110aso3772351f8f.3
 for <buildroot@buildroot.org>; Sun, 13 Aug 2023 23:07:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691993277; x=1692598077;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ScO4ec3zmdI67TcP/0+yT+Aay2vMh60ePCPXwZgJOoc=;
 b=ejxqss9iYIW1AN+6pHgcoLKSZ+CwIFl7OSKKSgzrLH7Q1A9elmI+Ce62zfISiULD2n
 EbluTMsOcp94YbCAZLBJbQpsRrTcshcKJTuRSt/NiInKHVPSR3HlAQ1uZZegQZglXFVd
 D8Y/iOrsv0MCqusFZlj8gQAMu23VdtDCU8Bwa+udxANFeOun+YXqLWOxuWGIwOXQCXlL
 skXcWfyB9U69adYw1jaN0BjsLtiFpWlF2bot4prlvp5OpAP8OC8BXw0qi4T/f8ADI8Z+
 kr0YuKrW2KaUKarVbULYSzLbATq/ByAzazkOfEtxeB3ZAQC/E+INn4zbifydqa05/or1
 4YCA==
X-Gm-Message-State: AOJu0YwJHv9qA+DFnkPZisS9N2a12LagHtx333aqsZden35ZtXy6CUMy
 5RJzF5gnXnxMFBzrbAh2KJ2YvjNQhU9IyTmv32m50tuBCKWtzy/xNnM=
X-Google-Smtp-Source: AGHT+IEtFPBoAaUPX5fdO35+zNpnfEZH4VDphLismR2wip6+zVspKrvDwFRANPyeeHHunR16jGbs5HWT6zfaiYErAFE=
X-Received: by 2002:a5d:510c:0:b0:313:f4e2:901d with SMTP id
 s12-20020a5d510c000000b00313f4e2901dmr5911981wrt.22.1691993276680; Sun, 13
 Aug 2023 23:07:56 -0700 (PDT)
MIME-Version: 1.0
References: <20230315091729.1771792-1-javad321javad@gmail.com>
 <20230809233822.334dbbb5@windsurf>
In-Reply-To: <20230809233822.334dbbb5@windsurf>
From: Javad Rahimipetroudi <javad321javad@gmail.com>
Date: Mon, 14 Aug 2023 09:37:45 +0330
Message-ID: <CAL245asR8j3oaWJ4E3HT=SckVd-1-OdG7siim_UrhGTHg8DY1Q@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691993277; x=1692598077;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ScO4ec3zmdI67TcP/0+yT+Aay2vMh60ePCPXwZgJOoc=;
 b=FKeBSsjZUqieGKHDdVfDlLXaYuK6L7+45MUagUdYilOubz+H5Lg5rTq+Fjl0e/LUZ4
 7NrZws/a94E3xK5rSEknt25jvfy9LOzbFSsqPb4Ruz/KMYzNpuN0wWYW1idP2krPbcEU
 29vHug/auZ8Of6MeobXgjEl4ccNFLH5+l8xAVjxilsgMMHdI4aREWgWMeSxwzGWBeKIx
 yQnp/3vTnBj3UmJ+RD6gTtiCuwMOwt1x1KpUVaWYcULzGmndbFNlsRzi77O7K0Clafz/
 clkJLBgEyhG3fOhtq1d/jQhlqcGKF5+ZHbjZN6CxwuNk374vL6DmEltMcQV4ijmHpYYW
 ixsw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=FKeBSsjZ
Subject: Re: [Buildroot] [PATCH 1/3] configs/orangepi_pc2: add board support
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgVGhvbWFzLAoKT24gVGh1LCBBdWcgMTAsIDIwMjMgYXQgMTowOOKAr0FNIFRob21hcyBQZXRh
enpvbmkKPHRob21hcy5wZXRhenpvbmlAYm9vdGxpbi5jb20+IHdyb3RlOgo+Cj4gSGVsbG8gSmF2
YWQsCj4KPiBPbiBXZWQsIDE1IE1hciAyMDIzIDEyOjQ3OjI3ICswMzMwCj4gSmF2YWQgUmFoaW1p
IDxqYXZhZDMyMWphdmFkQGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiA+IFRoaXMgcGF0Y2ggYWRkcyBy
ZXF1cmllZCBjb25maWd1cmF0aW9uIGZvciBPcmFuZ2VQSSBQQzIgYm9hcmQuCj4gPiBJdCB3YXMg
c3VwcHJvdGVkIGJlZm9yZSwgaG93ZXZlciBkdWUgdG8gcHJvYmxlbXMgaW4KPiA+IGJ1aWxkaW5n
IEFybSBUcnVzdGVkIFBMYXRmb3JtLCBpdCB3YXMgcmVtb3ZlZCBpbgo+ID4gIGNvbW1pdCAiZWVl
ZGU2MTFmODFkOGY4M2I3MmU0YTY2NzFjZDdkMWU0NmIyNjZiMCIKPiA+Cj4gPiBTaWduZWQtb2Zm
LWJ5OiBKYXZhZCBSYWhpbWkgPGphdmFkMzIxamF2YWRAZ21haWwuY29tPgo+ID4gLS0tCj4gPiAg
Y29uZmlncy9vcmFuZ2VwaV9wYzJfZGVmY29uZmlnIHwgMzYgKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKwo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAzNiBpbnNlcnRpb25zKCspCj4gPiAg
Y3JlYXRlIG1vZGUgMTAwNjQ0IGNvbmZpZ3Mvb3JhbmdlcGlfcGMyX2RlZmNvbmZpZwo+Cj4gU29y
cnkgZm9yIHRoZSBsb25nIGRlbGF5IGluIGdldHRpbmcgYmFjayB0byB5b3UuIEkgaGF2ZSBhcHBs
aWVkIHlvdXIKPiBwYXRjaCBzZXJpZXMsIGJ1dCBhZnRlciBzcXVhc2hpbmcgdGhlIDMgcGF0Y2hl
cyB0b2dldGhlciBpbiBvbmUgY29tbWl0Lgo+IFNwbGl0dGluZyBpdCBpbnRvIDMgZGlkbid0IG1h
a2Ugc2Vuc2UgaW4gdGhpcyBjYXNlLgo+Cj4gSG93ZXZlciwgY291bGQgeW91IHdvcmsgb24gdXBk
YXRpbmcgdGhlIHZlcnNpb24gb2YgdGhlIGNvbXBvbmVudHMgaW4KPiB0aGUgZGVmY29uZmlnPyBC
dWlsZGluZyBMaW51eCA1LjE2LCBURi1BIDIuNSBhbmQgVS1Cb290IDIwMjIuMDEgaXMKPiBxdWl0
ZSBvbGQuIENvdWxkIHlvdSBzdWJtaXQgYSBmb2xsb3dlZC11cCB0aGF0IHVwZGF0ZXMgdGhpcyBk
ZWZjb25maWcKPiB0byBuZXdlciBMaW51eCwgbmV3ZXIgVEYtQSBhbmQgbmV3ZXIgVS1Cb290PyBQ
bGVhc2UgbWFrZSBzdXJlIHRvIGJhc2UKPiB5b3VyIHBhdGNoIG9uIG91ciAibmV4dCIgYnJhbmNo
LCBhcyBJIG1lcmdlZCB5b3VyIGNvbnRyaWJ1dGlvbiBpbnRvCj4gdGhpcyAibmV4dCIgYnJhbmNo
Lgo+Cj4gICBodHRwczovL2dpdGxhYi5jb20vYnVpbGRyb290Lm9yZy9idWlsZHJvb3QvLS9jb21t
aXQvOTMwYTZkOTQ3MGVmYzVjNDZiY2ZmMzU4OTQ3YzA1MDU0MDU1NWE2Ywo+ClN1cmUsIEkgaGF2
ZSB1cGRhdGVkIHRoZSBrZXJuZWwsIFRGLUEgYW5kIFVib290LgpIb3dldmVyLCBJIGhhdmUgZmFj
ZWQgYSBwcm9ibGVtIHdpdGggIi9kZXYiIG1hbmFnZW1lbnQgYWZ0ZXIgdXBncmFkaW5nCnRoZSBw
YWNrYWdlcy4gV2hlbiBpdCBpcyBpbiAiRHluYW1pYyB1c2luZyBkZXZ0bXBmcyBvbmx5IiBtb2Rl
LCBubwprZXJuZWwgbW9kdWxlIGlzIGxvYWRlZCBhZnRlciBib290LiBCdXQgaW4gIkR5bmFtaWMg
dXNpbmcgZGV2dG1wZnMgKwptZGV2IiBldmVyeXRoaW5nIHdvcmtzIGZpbmUuIENhbiBJIHB1dCBp
dCBpbiB0aGlzIG1vZGU/Cj4gVGhhbmtzIGEgbG90IQo+Cj4gVGhvbWFzCj4gLS0KPiBUaG9tYXMg
UGV0YXp6b25pLCBDVE8sIEJvb3RsaW4KPiBFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2lu
ZWVyaW5nCj4gaHR0cHM6Ly9ib290bGluLmNvbQoKVGhhbmtzLApKYXZhZApfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0
CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
