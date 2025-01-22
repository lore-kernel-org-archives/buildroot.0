Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48881C02181
	for <buildroot@archiver.kernel.org>; Wed, 22 Jan 2025 14:34:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AE45E41DDC;
	Wed, 22 Jan 2025 14:34:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TSifnnwTxLP1; Wed, 22 Jan 2025 14:34:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A763341E18
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A763341E18;
	Wed, 22 Jan 2025 14:34:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id D5395D7
 for <buildroot@buildroot.org>; Wed, 22 Jan 2025 14:34:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D0F1884E07
 for <buildroot@buildroot.org>; Wed, 22 Jan 2025 14:34:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jvRfNnZdbq5q for <buildroot@buildroot.org>;
 Wed, 22 Jan 2025 14:34:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.196;
 helo=relay4-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8B23084E04
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8B23084E04
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8B23084E04
 for <buildroot@buildroot.org>; Wed, 22 Jan 2025 14:34:33 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6EB2BE000A;
 Wed, 22 Jan 2025 14:34:30 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1taboL-008nuR-2L;
 Wed, 22 Jan 2025 15:34:29 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Vincent =?utf-8?Q?Stehl=C3=A9?= via buildroot <buildroot@buildroot.org>
Cc: Vincent =?utf-8?Q?Stehl=C3=A9?= <vincent.stehle@laposte.net>
References: <20250113221402.3300-1-vincent.stehle@laposte.net>
Date: Wed, 22 Jan 2025 15:34:29 +0100
In-Reply-To: <20250113221402.3300-1-vincent.stehle@laposte.net> ("Vincent
 =?utf-8?Q?Stehl=C3=A9?= via buildroot"'s message of "Mon, 13 Jan 2025
 23:14:02 +0100")
Message-ID: <87a5bior2i.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH] support/testing: new xen runtime test
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Pj4+Pj4gIlZpbmNlbnQiID09IFZpbmNlbnQgU3RlaGzDqSB2aWEgYnVpbGRyb290IDxidWlsZHJv
b3RAYnVpbGRyb290Lm9yZz4gd3JpdGVzOgoKID4gU2lnbmVkLW9mZi1ieTogVmluY2VudCBTdGVo
bMOpIDx2aW5jZW50LnN0ZWhsZUBsYXBvc3RlLm5ldD4KID4gLS0tCiA+ICBERVZFTE9QRVJTICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDIgKwogPiAgc3VwcG9ydC90ZXN0
aW5nL3Rlc3RzL3BhY2thZ2UvdGVzdF94ZW4ucHkgICAgIHwgIDY1ICsrKysrKwogPiAgLi4uL3Rl
c3RzL3BhY2thZ2UvdGVzdF94ZW4vZ2VuaW1hZ2UuY2ZnICAgICAgIHwgIDM1ICsrKwogPiAgLi4u
L3Rlc3RzL3BhY2thZ2UvdGVzdF94ZW4vbGludXguY29uZmlnICAgICAgIHwgMjA0ICsrKysrKysr
KysrKysrKysrKwogPiAgLi4uL3Rlc3RzL3BhY2thZ2UvdGVzdF94ZW4vcG9zdC1pbWFnZS5zaCAg
ICAgIHwgICA3ICsKID4gIC4uLi90ZXN0aW5nL3Rlc3RzL3BhY2thZ2UvdGVzdF94ZW4veGVuLmNm
ZyAgICB8ICAgMiArCiA+ICA2IGZpbGVzIGNoYW5nZWQsIDMxNSBpbnNlcnRpb25zKCspCiA+ICBj
cmVhdGUgbW9kZSAxMDA2NDQgc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2UvdGVzdF94ZW4u
cHkKID4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBzdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS90
ZXN0X3hlbi9nZW5pbWFnZS5jZmcKID4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBzdXBwb3J0L3Rlc3Rp
bmcvdGVzdHMvcGFja2FnZS90ZXN0X3hlbi9saW51eC5jb25maWcKID4gIGNyZWF0ZSBtb2RlIDEw
MDc1NSBzdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS90ZXN0X3hlbi9wb3N0LWltYWdlLnNo
CiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQgc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2UvdGVz
dF94ZW4veGVuLmNmZwoKQ29tbWl0dGVkIHRvIDIwMjQuMDIueCBhbmQgMjAyNC4xMS54LCB0aGFu
a3MuCgotLSAKQnllLCBQZXRlciBLb3JzZ2FhcmQKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVp
bGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9i
dWlsZHJvb3QK
