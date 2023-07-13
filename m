Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1CD3C001B0
	for <buildroot@archiver.kernel.org>; Thu, 13 Jul 2023 20:09:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0106A405B3;
	Thu, 13 Jul 2023 20:09:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0106A405B3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hTfyJNRzSbxK; Thu, 13 Jul 2023 20:09:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 38A5940575;
	Thu, 13 Jul 2023 20:09:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 38A5940575
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2C1CA1BF3D0
 for <buildroot@lists.busybox.net>; Thu, 13 Jul 2023 20:09:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F3F5642023
 for <buildroot@lists.busybox.net>; Thu, 13 Jul 2023 20:09:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F3F5642023
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SWvhZrgqrZ62 for <buildroot@lists.busybox.net>;
 Thu, 13 Jul 2023 20:09:44 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6535D42025
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6535D42025
 for <buildroot@buildroot.org>; Thu, 13 Jul 2023 20:09:43 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 81FE4FF805;
 Thu, 13 Jul 2023 20:09:40 +0000 (UTC)
Date: Thu, 13 Jul 2023 22:09:39 +0200
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20230713220939.28e4ca0a@windsurf>
In-Reply-To: <20230530200728.12239-1-ju.o@free.fr>
References: <20230530200728.12239-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1689278981;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=y+TQg9nACMuEvs8HYXbd0Fm/UiZI94JRM+0dNbbUXaA=;
 b=SuR3FJu9/r4cUH9puL0qAhc/QoIfhtjzvori9StvbIuKAl9Pbln3hAFKtM2toW1ApFbDpJ
 yUSKIRtdg8LWgwGAarAA8SfnnSPoFmBC4Xubk1/trGH+lH8yL8Xo+Y1DfBJSzOxctdyZ69
 g0F1j5cOvoWCxJrEkNEKx7pLRNUJe3t0Z2ET11I8bCp3NeDPZyRkvOnXIJRLCyYvBBDg8q
 sFj4URDorgflAvJDBEjfjDyx6VJP31MZqHsmjwve2QtgLC/qItBrP/Ba3jqhdCyGiGMAtE
 xF6H+emyIy8h472qPTE3OrohF+WfmXpcRb0zgLxQpfHmcpl+q0FB9KpU/H8Ttw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=SuR3FJu9
Subject: Re: [Buildroot] [PATCH 1/3] boot/edk2: bump to version
 edk2-stable202305
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Vincent =?UTF-8?B?U3RlaGzDqQ==?= <vincent.stehle@arm.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gVHVlLCAzMCBNYXkgMjAyMyAyMjowNzoyNiArMDIwMApKdWxpZW4gT2xpdmFpbiA8anUub0Bm
cmVlLmZyPiB3cm90ZToKCj4gRm9yIGNoYW5nZSBsb2cgc2luY2UgdmVyc2lvbiBlZGsyLXN0YWJs
ZTIwMjIwOCwgc2VlOgo+IC0gaHR0cHM6Ly9naXRodWIuY29tL3RpYW5vY29yZS9lZGsyL3JlbGVh
c2VzL3RhZy9lZGsyLXN0YWJsZTIwMjIxMQo+IC0gaHR0cHM6Ly9naXRodWIuY29tL3RpYW5vY29y
ZS9lZGsyL3JlbGVhc2VzL3RhZy9lZGsyLXN0YWJsZTIwMjMwMgo+IC0gaHR0cHM6Ly9naXRodWIu
Y29tL3RpYW5vY29yZS9lZGsyL3JlbGVhc2VzL3RhZy9lZGsyLXN0YWJsZTIwMjMwNQo+IAo+IFRo
ZSBtYWluIG1vdGl2YXRpb24gb2YgdGhpcyBidW1wIGlzIHRoZSBSSVNDLVYgUUVNVSBWaXJ0IHN1
cHBvcnQKPiBpbnRyb2R1Y2VkIGluIGVkazItc3RhYmxlMjAyMzAyIChub3QgeWV0IHN1cHBvcnRl
ZCBpbiBCdWlsZHJvb3QpLgo+IAo+IENjOiBEaWNrIE9sc3NvbiA8aGlAc2VuemlsbGEuaW8+Cj4g
Q2M6IFZpbmNlbnQgU3RlaGzDqSA8dmluY2VudC5zdGVobGVAYXJtLmNvbT4KPiBTaWduZWQtb2Zm
LWJ5OiBKdWxpZW4gT2xpdmFpbiA8anUub0BmcmVlLmZyPgo+IC0tLQo+IFBhdGNoIHNlcmllcyB0
ZXN0ZWQgb24gYnJhbmNoIG1hc3RlciBhdCBjb21taXQgYzc2NWFjOSB3aXRoIGNvbW1hbmRzOgoK
U2VyaWVzIGFwcGxpZWQsIHRoYW5rcyEKClRob21hcwotLSAKVGhvbWFzIFBldGF6em9uaSwgQ1RP
LCBCb290bGluCkVtYmVkZGVkIExpbnV4IGFuZCBLZXJuZWwgZW5naW5lZXJpbmcKaHR0cHM6Ly9i
b290bGluLmNvbQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8v
bGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
