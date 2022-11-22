Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE482C4332F
	for <buildroot@archiver.kernel.org>; Tue, 22 Nov 2022 20:28:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6CE8A812EE;
	Tue, 22 Nov 2022 20:28:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6CE8A812EE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bFsrlSsR0ASt; Tue, 22 Nov 2022 20:28:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AA7D5812E2;
	Tue, 22 Nov 2022 20:28:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AA7D5812E2
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 038231BF285
 for <buildroot@lists.busybox.net>; Tue, 22 Nov 2022 20:28:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CEC5E40B78
 for <buildroot@lists.busybox.net>; Tue, 22 Nov 2022 20:28:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CEC5E40B78
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aC231lebnc_m for <buildroot@lists.busybox.net>;
 Tue, 22 Nov 2022 20:28:33 +0000 (UTC)
X-Greylist: delayed 00:06:14 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A29F440186
Received: from out0.migadu.com (out0.migadu.com [IPv6:2001:41d0:2:267::])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A29F440186
 for <buildroot@buildroot.org>; Tue, 22 Nov 2022 20:28:33 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
MIME-Version: 1.0
Message-Id: <A6EE03B3-29A3-408B-B645-54C2C719C427@senzilla.io>
Date: Tue, 22 Nov 2022 21:22:01 +0100
To: =?utf-8?Q?Vincent_Stehl=C3=A9?= <vincent.stehle@arm.com>
X-Migadu-Flow: FLOW_OUT
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=senzilla.io; s=key1; t=1669148534;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=W+vYrsayzlVjDnRF0d5hP2xxeACPuRstkAT6fXr6/tI=;
 b=kDGJCe2j/icjHlrU6NsO+S8zWgyMkh8Yhqp2qZu+fB6Tb45+b/vENudElJB2vO2WsGN7K7
 1KS4+lUSRWeT4fGohcoGit3WWfrzVGCS6f8UfMgqvfIuv1coyUgZ0YJGSzRkPCTv7mY2Ls
 6cfba62vq7bdRoL9KYVUh1DS3rSd9fc=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=senzilla.io header.i=@senzilla.io header.a=rsa-sha256
 header.s=key1 header.b=kDGJCe2j
Subject: Re: [Buildroot] [PATCH] boot/edk2: fix the build for arm sgi575
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
From: "D. Olsson via buildroot" <buildroot@buildroot.org>
Reply-To: "D. Olsson" <hi@senzilla.io>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

77u/CkhpIFZpbmNlbnQsCgo+IE9uIDIyIE5vdiAyMDIyLCBhdCAxODoxNSwgVmluY2VudCBTdGVo
bMOpIDx2aW5jZW50LnN0ZWhsZUBhcm0uY29tPiB3cm90ZToKPiAKPiDvu79UaGUgZWRrMiBwYWNr
YWdlIGNhbiBiZSBjb25maWd1cmVkIGZvciBwbGF0Zm9ybSBBcm0gU2dpNTc1IGJ1dCB0aGlzIGRv
ZXMKPiBub3QgYnVpbGQgY29ycmVjdGx5LiBBZGQgdGhlIG5lY2Vzc2FyeSBkZWZpbml0aW9ucyB0
byBmaXggdGhlIGJ1aWxkLgoKVGhhbmtzIGZvciBjYXRjaGluZyB0aGlzIQoKSSB3YXMgdXNpbmcg
dGhlIFNnaTU3NSB0YXJnZXQgYSBiaXQgZm9yIHRlc3Rpbmcgd2hlbiBidWlsZGluZyBvdXQgdGhp
cyBwYWNrYWdlIGVhcmx5IG9uLiBJIG11c3QgaGF2ZSBtaXNzZWQgdGhlIGRlZmluaXRpb25zIHdo
ZW4gYXNzZW1ibGluZyB0aGUgaW5pdGlhbCBwYXRjaHNldC4KCj4gQWx0ZXJuYXRpdmVseSB3ZSBj
b3VsZCByZW1vdmUgdGhlIEJSMl9UQVJHRVRfRURLMl9QTEFURk9STV9BUk1fU0dJNTc1IGZyb20g
dGhlCj4gQ29uZmlnLmluIGZpbGUgY29tcGxldGVseSBpZiB0aGlzIGlzIHByZWZlcnJlZC4gSnVz
dCBsZXQgbWUga25vdyBhbmQgSSB3aWxsCj4gc2VuZCBhIHBhdGNoLgoKSSB0aGluayBpdCBzaG91
bGQgYmUga2VwdC4gSXQncyBhIGdyZWF0IHRhcmdldCBmb3IgdGVzdGluZyBhbmQgZW11bGF0aW9u
LgoKPiBCZXN0IHJlZ2FyZHMsCj4gVmluY2VudC4KPiAKPiAKPiBib290L2VkazIvZWRrMi5tayB8
IDYgKysrKysrCj4gMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1n
aXQgYS9ib290L2VkazIvZWRrMi5tayBiL2Jvb3QvZWRrMi9lZGsyLm1rCj4gaW5kZXggNWNiZDlk
MTUyZTcuLjdkODc2NWMzMTA4IDEwMDY0NAo+IC0tLSBhL2Jvb3QvZWRrMi9lZGsyLm1rCj4gKysr
IGIvYm9vdC9lZGsyL2VkazIubWsKPiBAQCAtNzUsNiArNzUsMTIgQEAgRURLMl9QQUNLQUdFX05B
TUUgPSBBcm1WaXJ0UGtnCj4gRURLMl9QTEFURk9STV9OQU1FID0gQXJtVmlydFFlbXVLZXJuZWwK
PiBFREsyX0JVSUxEX0RJUiA9ICQoRURLMl9QTEFURk9STV9OQU1FKS0kKEVESzJfQVJDSCkKPiAK
PiArZWxzZSBpZmVxICgkKEJSMl9UQVJHRVRfRURLMl9QTEFURk9STV9BUk1fU0dJNTc1KSx5KQo+
ICtFREsyX0FSQ0ggPSBBQVJDSDY0Cj4gK0VESzJfUEFDS0FHRV9OQU1FID0gUGxhdGZvcm0vQVJN
L1NnaVBrZy9TZ2k1NzUKPiArRURLMl9QTEFURk9STV9OQU1FID0gU2dpNTc1Cj4gK0VESzJfQlVJ
TERfRElSID0gJChFREsyX1BMQVRGT1JNX05BTUUpCj4gKwo+IGVsc2UgaWZlcSAoJChCUjJfVEFS
R0VUX0VESzJfUExBVEZPUk1fQVJNX1ZFWFBSRVNTX0ZWUF9BQVJDSDY0KSx5KQo+IEVESzJfQVJD
SCA9IEFBUkNINjQKPiBFREsyX1BBQ0tBR0VfTkFNRSA9IFBsYXRmb3JtL0FSTS9WRXhwcmVzc1Br
Zwo+IC0tIAo+IDIuMzUuMQoKSSB3b24ndCBiZSBhYmxlIHRvIHRlc3QgdGhpcyBhbnl0aW1lIHNv
b24uIEJ1dCBhdCBhIGdsYW5jZSB0aGUgcGF0Y2ggbG9va3Mgb2shCgoKQ2hlZXJzLAoKRC4gT2xz
c29uCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVp
bGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3Rz
LmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
