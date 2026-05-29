Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6893BCD6E49
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 18:42:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D6BED8465A;
	Fri, 29 May 2026 18:42:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hfBLrS8TuMIP; Fri, 29 May 2026 18:42:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 18CBB84654
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780080162;
	bh=8z2rJJj7yJ73lb/jfzgyk9CCB3YA8Jdlk1WUjQ4J3u8=;
	h=Date:To:References:From:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ATcaoXTbLh56WgkbMfnNVnxneTuGWohhuZwnrtpkaeuO8dUcgAnaf0kghaXB2NWTO
	 GOeHtvjtNrg7Sr2Vxu4fCr2sb/eOU1mej6ZBlzZMJi4Hi0HxGnsOsQh7/WeJ3+SOvC
	 7IEJaew3bTMbvYVspWOamnaUSVilEdNM+RXqWZDzkXudUYNVocewKT2Z3ITfAbb/mp
	 RQVdCWOqGAE8Yl1ABeiyyuwNvvmwuZj+OJSAhLx8sAsHfne7+RgV9Ak8HwyElTkDK4
	 0okENkEKOX742eQeEWUR2A4+DQNDJTg49sU1MuYxb4yxV79+cS6qTYTOgjW3SVbn2F
	 8TPsi9Xm3ciMg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 18CBB84654;
	Fri, 29 May 2026 18:42:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id C839BD3
 for <buildroot@buildroot.org>; Fri, 29 May 2026 18:42:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B770161661
 for <buildroot@buildroot.org>; Fri, 29 May 2026 18:42:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2rYySqEYjIqC for <buildroot@buildroot.org>;
 Fri, 29 May 2026 18:42:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.178.249;
 helo=mslow3.mail.gandi.net; envelope-from=jeanmichel.hautbois@yoseli.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 915CA6163C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 915CA6163C
Received: from mslow3.mail.gandi.net (mslow3.mail.gandi.net [217.70.178.249])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 915CA6163C
 for <buildroot@buildroot.org>; Fri, 29 May 2026 18:42:39 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by mslow3.mail.gandi.net (Postfix) with ESMTP id 92AD2580CAF
 for <buildroot@buildroot.org>; Fri, 29 May 2026 17:52:08 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 19E1E20662
 for <buildroot@buildroot.org>; Fri, 29 May 2026 17:51:59 +0000 (UTC)
Message-ID: <73dfe5c1-4240-4f84-ae46-1ed0e1889c0f@yoseli.org>
Date: Fri, 29 May 2026 19:51:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: buildroot@buildroot.org
References: <20260424132326.825570-1-jeanmichel.hautbois@yoseli.org>
 <20260424132326.825570-12-jeanmichel.hautbois@yoseli.org>
 <ahmWzUWlNIgPZGjS@windsurf>
Content-Language: fr-FR, en-US, en-GB
From: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
In-Reply-To: <ahmWzUWlNIgPZGjS@windsurf>
X-GND-Sasl: jeanmichel.hautbois@yoseli.org
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: dmFkZTFhZWfm07ySF0ddIkUlNQQ9dAvbXZeyYqUrfevG0x/N0s1iQDncUHy56WfBrakVTsPtwr/9Mebyz9OuZMSnCINyq6auI6/+hscF960OobaSpIsJ0S6r/IoT3kdeU523dvN//tAEYWhJ5FrVUiO1aMPQnRQ0OEt5V1gcS88Aj9e3Mx2fOy/h0KoxwqgI4U9D1qHo4l4wk/6mTmYn+t0rBl5eQXQMGX0HQKOM4sNjLD1Gw5UbVaRv9TF5eM+pIXVmq0dykJE3mNHF/hyg5ePT0irwVq+rKGdlfsqYFmefYgSuU6HiU+FUZb64tBZAqVrmgyWxmCv8MNJ2cXeFvep7uaxItrdWZKvO/C8WoUDFJI9hrGF+IRH8wvxd87Ypteu8OxTe7e+ml7VhTCUxmgD3r4IDiwOEa/rMQMU6G8tNc6AY1bB2P8Q9MFgA9r2CVQ2wjLxZrJ5So1I9ZCc3IyBtGIUFWFrdjekNusivtNCALZ3D0xKJblNsEpnSF27Z3FkyBkqgs7HWz+dY4kyvfMvgo/tkyjRVicPu9O0uy2KG40pFbQD/6/Zc4ws+ZRDJxEF7nSY0f8hsktDOaomB0073c3Po0U5dxWCmvyD47DVmILxhtf46kX5S/1mpIRi/+VjXQDTBhJXM7IOTItgFvDgE9+SXOGQk3o2Qex/FWXZeaIZh8w
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=yoseli.org; s=gm1; t=1780077120;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=y/eV3LmgCdmsUXqTJWlUaFtWnVBEulgnK0G2Cr50fgY=;
 b=RkiAkpKkbbI+mV+ZZrbe2OtAfuCzjwzK2bLYHbdUJ9+hLGGPekZywWSIjg4/BnwNvwKwRo
 pF/X2LvBn+3wZ/hlKFbPAXLY58sPlpkkrfSxsNYRsgmTOdzlltbWErZqiyHymwYFsSGBPy
 5NiuDLtBCtfIBI1LZbh5AHfE8yz9S8uECcydL0AyhtPbAgjtJaNLq94HlwJwwLamYQ9K73
 rdcUzo5adVqo22ilmgOKwh6/xSUP+JXXgRlC3Tc3RWTrFEbYYlEQkaMPpjNC5VKHKl2u4y
 8IgStfUHeGNvAe84t94m3pjLXwPf84bVvsUcuvb0hpkhIGTCygJi6CH0NDdUIg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=yoseli.org
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=yoseli.org header.i=@yoseli.org header.a=rsa-sha256
 header.s=gm1 header.b=RkiAkpKk
Subject: Re: [Buildroot] [PATCH 11/11] package/libglib2: add m68k ColdFire
 support
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

SGkgVGhvbWFzLAoKTGUgMjkvMDUvMjAyNiDDoCAxNTo0NCwgVGhvbWFzIFBldGF6em9uaSB2aWEg
YnVpbGRyb290IGEgw6ljcml0wqA6Cj4gSGVsbG8sCj4gCj4gT24gRnJpLCBBcHIgMjQsIDIwMjYg
YXQgMDM6MjM6MjZQTSArMDIwMCwgSmVhbi1NaWNoZWwgSGF1dGJvaXMgd3JvdGU6Cj4+IE9uIG02
OGsgQ29sZEZpcmUsIGxpYmdpbyBleGNlZWRzIHRoZSBkZWZhdWx0IDE2LWJpdCBHT1QgZW50cnkg
bGltaXQKPj4gKDgxOTIgZW50cmllcykuIEFkZCAtbXhnb3QgdG8gdXNlIDMyLWJpdCBHT1Qgb2Zm
c2V0cy4KPiAKPiBXaHkgaXNuJ3QgdGhpcyBhbHJlYWR5IGhhcHBlbmluZyBmb3IgZXhpc3Rpbmcg
Q29sZGZpcmUgY29uZmlndXJhdGlvbnM/Cj4gCgotbXhnb3QgaXMgcmVxdWlyZWQgb25jZSBsaWJn
aW8ncyBHT1QgZXhjZWVkcyB0aGUgMTYtYml0IG9mZnNldCB3aW5kb3cgCig4MTkyIGVudHJpZXMp
LgpJdCBpcyBub3QgdGllZCB0byBhIHBhcnRpY3VsYXIgQ29sZEZpcmUgY29yZSBidXQgdG8gYnVp
bGRpbmcgYSBsYXJnZSAKZW5vdWdoIHNoYXJlZCBsaWJyYXJ5LgoKVGhlIG9ubHkgQ29sZEZpcmUg
Y3VycmVudGx5IHN1cHBvcnRlZCwgdGhlIDUyMDgsIGlzIGEgbm8tTU1VIChGTEFUKSAKdGFyZ2V0
IHRoYXQgaXMgbm90IGJ1aWx0IHdpdGggdGhlIGZ1bGwgc2hhcmVkIGxpYmdpbyB0aGF0IG92ZXJm
bG93cyB0aGUgCkdPVCwgc28gdGhlIGxpbWl0IHdhcyBuZXZlciBoaXQgYmVmb3JlIEFGQUlDVC4K
ClRoZSBNQ0Y1NDQxeCBpcyBhbiBNTVUgY29yZSBidWlsdCB3aXRoIHNoYXJlZCBsaWJyYXJpZXMg
YW5kIHRoZSBjb21wbGV0ZSAKZ2lvLCB3aGljaCByZWFjaGVzIGl0LgoKPj4gQWxzbyBlbmFibGUg
Yl9zdGF0aWNwaWM9dHJ1ZSB0byBhbGxvdyBsaW5raW5nIHN0YXRpYyBpbnRlcm5hbAo+PiBsaWJy
YXJpZXMgKGdpcmVwb3NpdG9yeS1pbnRlcm5hbHMpIGludG8gc2hhcmVkIGxpYnJhcmllcwo+PiAo
bGliZ2lyZXBvc2l0b3J5KSwgd2hpY2ggcmVxdWlyZXMgcG9zaXRpb24taW5kZXBlbmRlbnQgY29k
ZS4KPiAKPiBXaHkgaXMgdGhpcyBDb2xkZmlyZSBzcGVjaWZpYz8KPiAKCllvdSBhcmUgcmlnaHQs
IGl0IHNob3VsZCBub3QgYmUgZG9uZSBoZXJlICEKClRoZSByZWFsIGNhdXNlIGlzIHRoZSBDb2xk
RmlyZSBWMi9WMyBjb3JlcyAoSVNBX0EvSVNBX0ErLCBlLmcuIHRoZSAKNTIwOCk6IHRoZXkgaGF2
ZSBubyAzMi1iaXQgUEMtcmVsYXRpdmUgYnJhbmNoLCBzbyBhIC1mUElDIGZ1bmN0aW9uIHdob3Nl
IApib2R5IGV4Y2VlZHMgdGhlIDE2LWJpdCBicmFuY2ggcmFuZ2UgY2Fubm90IGJlIGFzc2VtYmxl
ZCwgc2VlOgoKIlRyaWVkIHRvIGNvbnZlcnQgUEMgcmVsYXRpdmUgYnJhbmNoIHRvIGFic29sdXRl
IGp1bXAiLCBHQ0MgUFIgMTAxOTcxLCAKY2xvc2VkIGFzIGludmFsaWQgZm9yIHRoaXMgcmVhc29u
LgoKVGhhdCBpcyB3aHkgYl9zdGF0aWNwaWMgd2FzIGRpc2FibGVkIGZvciB0aGUgd2hvbGUgQ29s
ZEZpcmUgZmFtaWx5IGluCmNvbW1pdCBlNzBmZWZhM2I4IGJhY2sgd2hlbiB0aGUgNTIwOCB3YXMg
dGhlIG9ubHkgQ29sZEZpcmUgc3VwcG9ydGVkLgoKVGhlIFY0L1Y0ZSBjb3JlcyAoSVNBX0IvSVNB
X0MpLCBpbmNsdWRpbmcgdGhlIE1DRjU0NDF4LCBnYWluZWQgdGhlIAozMi1iaXQgYnJhLmwvYnNy
LmwgYW5kIGJ1aWxkIFBJQyBjb2RlIGZpbmUuCgpJIHZlcmlmaWVkIHRoaXMgd2l0aCBib3RoIGdj
YyAxNC4zLjAgYW5kIDE1LjIuMC4KU28gcmF0aGVyIHRoYW4gb3ZlcnJpZGluZyBiX3N0YXRpY3Bp
YyBpbiBsaWJnbGliMiwgSSBwcm9wb3NlIHRvIGRyb3AgCnRoaXMgaHVuayBhbmQgaW5zdGVhZCBy
ZXN0cmljdCB0aGUgd29ya2Fyb3VuZCBpbiBwa2ctbWVzb24ubWsgdG8gCkJSMl9tNjhrX2NmNTIw
OCwgd2hpY2ggbGV0cyBuZXdlciBDb2xkRmlyZSBjb3JlcyBrZWVwIGJfc3RhdGljcGljIAplbmFi
bGVkIChhcyBnaXJlcG9zaXRvcnktaW50ZXJuYWxzIG5lZWRzKS4KClRoYXQgd291bGQgYmUgYSBz
ZXBhcmF0ZSBwYXRjaCBpbiB2Mi4KCj4+IERpc2FibGUgc3lzcHJvZiBwcm9maWxpbmcgc3VwcG9y
dCB3aGljaCBpcyBub3QgdXNlZnVsIG9uIGVtYmVkZGVkCj4+IHRhcmdldHMgYW5kIGFkZHMgdW5u
ZWNlc3NhcnkgYnVpbGQgY29tcGxleGl0eS4KPiAKPiBUaGlzIHNob3VsZCBkZWZpbml0ZWx5IGJl
IGRvbmUgYXMgYSBzZXBhcmF0ZSBwYXRjaCwgYW5kIGV2ZW4gaXMKPiBzb21ldGhpbmcgeW91IGNh
biBzZW5kIHNlcGFyYXRlbHkgZnJvbSB0aGUgQ29sZGZpcmUgc2VyaWVzIHNvIHRoYXQgd2UKPiBj
YW4gbWVyZ2UgaXQgcmlnaHQgYXdheS4KPiAKCkluZGVlZC4gSSB3aWxsIHNwbGl0IGl0IGludG8g
YSBzdGFuZGFsb25lIHBhdGNoLgoKVGhhbmtzICEKSk0KCj4gVGhhbmtzIQo+IAo+IFRob21hcwoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290
IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxk
cm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
