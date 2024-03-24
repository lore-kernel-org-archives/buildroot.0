Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93B3AC6FD1F
	for <buildroot@archiver.kernel.org>; Sun, 24 Mar 2024 07:58:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3F3EE40510;
	Sun, 24 Mar 2024 07:58:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Yx3YFtK_K1Lk; Sun, 24 Mar 2024 07:58:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E19EE40551
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E19EE40551;
	Sun, 24 Mar 2024 07:58:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 54BA51BF3C1
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 07:58:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4E07B40551
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 07:58:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XZ4ZJwZz2XQp for <buildroot@lists.busybox.net>;
 Sun, 24 Mar 2024 07:58:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::222;
 helo=relay2-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A102640510
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A102640510
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A102640510
 for <buildroot@buildroot.org>; Sun, 24 Mar 2024 07:58:33 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 48E8E40004;
 Sun, 24 Mar 2024 07:58:30 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1roIkP-000Soc-1v;
 Sun, 24 Mar 2024 08:58:29 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: =?utf-8?Q?=C5=81ukasz?= Tekieli <tekieli.lukasz@gmail.com>
References: <20240208211517.9234-1-tekieli.lukasz@gmail.com>
 <20240208211517.9234-3-tekieli.lukasz@gmail.com>
 <874jcwitlk.fsf@48ers.dk>
 <CAFfxiozPcc5QisMEsKadCX2wb0F-oQ1GqQ2fXmJDK_+7xk=qXA@mail.gmail.com>
Date: Sun, 24 Mar 2024 08:58:29 +0100
In-Reply-To: <CAFfxiozPcc5QisMEsKadCX2wb0F-oQ1GqQ2fXmJDK_+7xk=qXA@mail.gmail.com>
 (=?utf-8?Q?=22=C5=81ukasz?= Tekieli"'s message of "Sun, 24 Mar 2024
 08:35:44 +0100")
Message-ID: <87zfuogixm.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH v2 2/2] board/visionfive2: enable u-boot
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
Cc: Francois Dugast <francois.dugast.foss@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Pj4+Pj4gIsWBdWthc3oiID09IMWBdWthc3ogVGVraWVsaSA8dGVraWVsaS5sdWthc3pAZ21haWwu
Y29tPiB3cml0ZXM6CgogPiBIZWxsbywKID4gT24gU2F0LCBNYXIgMjMsIDIwMjQgYXQgOToyNeKA
r1BNIFBldGVyIEtvcnNnYWFyZCA8cGV0ZXJAa29yc2dhYXJkLmNvbT4gd3JvdGU6CiA+PiAKID4+
IEhtbSwgc28gdG8gdXNlIHRoYXQgd2UgbmVlZCB0byBjaGFuZ2UgdGhlIGJvb3QgbW9kZSB0byBT
RCwgb3RoZXJ3aXNlIHRoZQogPj4gU0JJL1UtQm9vdCBpbiB0aGUgU1BJIGZsYXNoIHdpbGwgc3Rp
bGwgYmUgdXNlZCAtIFNvIHdlIHNob3VsZCBhZGQgYSBub3RlCiA+PiBhYm91dCB0aGF0LgoKID4g
WWVzLCBTRCBtb2RlIGlzIHJlcXVpcmVkIHRvIHVzZSB0aGlzLiBJIGhhdmUgYSBwYXRjaCB0aGF0
IGJ1aWxkcyBhbHNvCiA+IHRoZSBTUEkgZmxhc2ggaW1hZ2UsIGJ1dCBkaWRuJ3Qgc3VibWl0IHll
dC4KID4gSSdsbCBhZGQgYSBub3RlIGluIHRoZSBib2FyZCByZWFkbWUuCgogPj4gSSBnYXZlIGl0
IGEgcXVpY2sgdHJ5IGhlcmUgYW5kIGl0IGRvZXMgYm9vdCwgYnV0IFVTQiBpcyBicm9rZW4gaW4g
VS1Cb290CiA+PiBhbmQgTGludXgsIGlzIHRoYXQgYSBrbm93biBpc3N1ZT8KID4+IAogPj4gWyAg
ICA4LjcyODU5Ml0geGhjaV9oY2QgMDAwMDowMTowMC4wOiBFcnJvciB3aGlsZSBhc3NpZ25pbmcg
ZGV2aWNlIHNsb3QgSUQKID4+IFsgICAgOC43MzUzMDFdIHhoY2lfaGNkIDAwMDA6MDE6MDAuMDog
TWF4IG51bWJlciBvZiBkZXZpY2VzIHRoaXMgeEhDSSBob3N0IHN1cHBvcnRzIGlzIDMyLgogPj4g
WyAgICA4Ljc0MzQ5NV0gdXNiIHVzYjItcG9ydDI6IGNvdWxkbid0IGFsbG9jYXRlIHVzYl9kZXZp
Y2UKID4+IFsgICAgOC43NDg5ODRdIHhoY2lfaGNkIDAwMDA6MDE6MDAuMDogRXJyb3Igd2hpbGUg
YXNzaWduaW5nIGRldmljZSBzbG90IElECiA+PiBbICAgIDguNzU1NjYwXSB4aGNpX2hjZCAwMDAw
OjAxOjAwLjA6IE1heCBudW1iZXIgb2YgZGV2aWNlcyB0aGlzIHhIQ0kgaG9zdCBzdXBwb3J0cyBp
cyAzMi4KID4+IFsgICAgOC43NjM2ODZdIHVzYiB1c2IxLXBvcnQxOiBjb3VsZG4ndCBhbGxvY2F0
ZSB1c2JfZGV2aWNlCgogPiBJJ3ZlIGFscmVhZHkgZml4ZWQgZW1hYzAgcHJvYmxlbXMgaW4gdXBz
dHJlYW0gdS1ib290LiBJIG5vdGljZWQgdGhhdAogPiB0aGUgY2hhbmdlcyBiZXR3ZWVuIFN0YXJG
aXZlIGZvcmtzIGFuZCB1cHN0cmVhbSBhcmUgcXVpdGUgZXh0ZW5zaXZlCiA+IGFuZCB0aGV5IGRl
ZmluYXRlbHkgbWlzc2VkIHNvbWUgcGFydHMuCiA+IEknbGwgdGFrZSBhIGxvb2sgYXQgdGhpcy4K
ClBvc3NpYmx5IHdlIG5lZWQgdG8gYnVtcCB0aGUgTGludXgga2VybmVsLiBIb3cgaXMgdGhlIG1h
aW5saW5lIHN1cHBvcnQKc2l0dWF0aW9uIGJ5IG5vdz8gSWRlYWxseSB3ZSB3b3VsZCB1c2UgbWFp
bmxpbmUgTGludXggYXMgd2VsbC4KCiA+PiA+IFUtQm9vdCBjb25maWcgdXNlcyBCUjJfVEFSR0VU
X1VCT09UX0ZPUk1BVF9DVVNUT01fTkFNRSB3aXRoIHZhbHVlCiA+PiA+ICJ1LWJvb3QuaXRiIi4g
VXNpbmcgQlIyX1RBUkdFVF9VQk9PVF9GT1JNQVRfSVRCIGZhaWxzLCBiZWNhdXNlIHRoZQogPj4g
PiBidWlsZCBkb2VzIG5vdCBzdXBwb3J0IHUtYm9vdC5pdGIgbWFrZSB0YXJnZXQuCiA+PiAKID4+
IEhtbSwgb2RkLgoKID4gWWVzLCB0aGVyZSBhcmUgb3RoZXIgYm9hcmRzIHRoYXQgdXNlIHRoaXMg
YXBwcm9hY2ggYXMgd2VsbDoKCiA+IHJvY2s2NF9kZWZjb25maWc6QlIyX1RBUkdFVF9VQk9PVF9G
T1JNQVRfQ1VTVE9NX05BTUU9InUtYm9vdC5pdGIiCiA+IGFuZGVzX2FlMzUwXzQ1X2RlZmNvbmZp
ZzpCUjJfVEFSR0VUX1VCT09UX0ZPUk1BVF9DVVNUT01fTkFNRT0idS1ib290Lml0YiIKID4gcm9j
a3BybzY0X2RlZmNvbmZpZzpCUjJfVEFSR0VUX1VCT09UX0ZPUk1BVF9DVVNUT01fTkFNRT0idS1i
b290Lml0YiIKID4gcGluZTY0X2RlZmNvbmZpZzpCUjJfVEFSR0VUX1VCT09UX0ZPUk1BVF9DVVNU
T01fTkFNRT0idS1ib290Lml0YiIKID4gcm9jX3BjX3JrMzM5OV9kZWZjb25maWc6QlIyX1RBUkdF
VF9VQk9PVF9GT1JNQVRfQ1VTVE9NX05BTUU9InUtYm9vdC5pdGIiCiA+IGZyaWVuZGx5YXJtX25h
bm9waV9yMnNfZGVmY29uZmlnOkJSMl9UQVJHRVRfVUJPT1RfRk9STUFUX0NVU1RPTV9OQU1FPSJ1
LWJvb3QuaXRiIgogPiBwaW5lNjRfc29waW5lX2RlZmNvbmZpZzpCUjJfVEFSR0VUX1VCT09UX0ZP
Uk1BVF9DVVNUT01fTkFNRT0idS1ib290Lml0YiIKID4gaGlmaXZlX3VubGVhc2hlZF9kZWZjb25m
aWc6QlIyX1RBUkdFVF9VQk9PVF9GT1JNQVRfQ1VTVE9NX05BTUU9InUtYm9vdC5pdGIiCgogPiBN
aWdodCBiZSBhbHNvIHdvcnRoIGZpeGluZyB0aGlzIGluIHUtYm9vdC4KClBvc3NpYmx5LCB5ZXMg
LSBCdXQgd2UgbmVlZCB0byB2ZXJpZnkgdGhhdCBpdCBkb2Vzbid0IGJyZWFrIHRoZSBleGlzdGlu
Zwp1c2VyczoKCmdpdCBncmVwIEJSMl9UQVJHRVRfVUJPT1RfRk9STUFUX0lUQgp6eW5xbXBfa3Jp
YV9rZDI0MF9kZWZjb25maWc6QlIyX1RBUkdFVF9VQk9PVF9GT1JNQVRfSVRCPXkKenlucW1wX2ty
aWFfa3IyNjBfZGVmY29uZmlnOkJSMl9UQVJHRVRfVUJPT1RfRk9STUFUX0lUQj15Cnp5bnFtcF9r
cmlhX2t2MjYwX2RlZmNvbmZpZzpCUjJfVEFSR0VUX1VCT09UX0ZPUk1BVF9JVEI9eQp6eW5xbXBf
emN1MTAyX2RlZmNvbmZpZzpCUjJfVEFSR0VUX1VCT09UX0ZPUk1BVF9JVEI9eQp6eW5xbXBfemN1
MTA0X2RlZmNvbmZpZzpCUjJfVEFSR0VUX1VCT09UX0ZPUk1BVF9JVEI9eQp6eW5xbXBfemN1MTA2
X2RlZmNvbmZpZzpCUjJfVEFSR0VUX1VCT09UX0ZPUk1BVF9JVEI9eQoKSSBmaW5hbGx5IGVuZGVk
IHVwIGFwcGx5aW5nIHRoaXMgcGF0Y2ggYWZ0ZXIgYWxsLCBhcyBpdCBtb3ZlcyB1cyBpbiB0aGUK
cmlnaHQgZGlyZWN0aW9uLiBJIGRpZCB0aGUgZm9sbG93aW5nIGNoYW5nZXM6CgotIEFkZGVkIG5v
dGUgYWJvdXQgY2hhbmdpbmcgdGhlIGJvb3QgbW9kZSBwaW5zIGluIHRoZSBib2FyZCByZWFkbWUg
YW5kCiAgbGlua2VkIHRvCiAgaHR0cHM6Ly9kb2MtZW4ucnZzcGFjZS5vcmcvVmlzaW9uRml2ZTIv
UXVpY2tfU3RhcnRfR3VpZGUvVmlzaW9uRml2ZTJfU0RLX1FTRy9ib290X21vZGVfc2V0dGluZ3Mu
aHRtbAoKLSBBZGRlZCBhIGxpbmsgdG8gdGhlIFUtQm9vdCBkb2N1bWVudGF0aW9uIHdoaWNoIGRl
c2NyaWJlcyB0aGUgYm9vdAogIGZsb3cgaW4gdGhlIGNvbW1pdCBtZXNzYWdlCgpUaGFua3MhCgot
LSAKQnllLCBQZXRlciBLb3JzZ2FhcmQKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290
Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJv
b3QK
