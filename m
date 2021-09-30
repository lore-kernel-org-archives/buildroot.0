Return-Path: <SRS0=LUVO=OU=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1C48C433F5
	for <buildroot@archiver.kernel.org>; Thu, 30 Sep 2021 20:28:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5489061994
	for <buildroot@archiver.kernel.org>; Thu, 30 Sep 2021 20:28:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5489061994
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E8157400C6;
	Thu, 30 Sep 2021 20:28:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mGPBMvAT4N6l; Thu, 30 Sep 2021 20:28:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CADAE401CE;
	Thu, 30 Sep 2021 20:28:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5F5121BF947
 for <buildroot@lists.busybox.net>; Thu, 30 Sep 2021 20:28:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 44E3540434
 for <buildroot@lists.busybox.net>; Thu, 30 Sep 2021 20:28:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Q7kBfX0h72n8 for <buildroot@lists.busybox.net>;
 Thu, 30 Sep 2021 20:28:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 490A840431
 for <buildroot@buildroot.org>; Thu, 30 Sep 2021 20:28:24 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:1957:9ac2:5e5e:60b1])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id B2052B004E8;
 Thu, 30 Sep 2021 22:28:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1633033701;
 bh=UVkVnYIYYXjAbU+NgH7o53J5aSlE0uQ4SVL6COIv72c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YMRCaS3jBRvyrUnrVY2Zo0EeJtmEQpBcMzmw3f8LrkupCsG7eWhp4Hlk6io6HYx44
 R0pzD43n/3+pdP5DrmKHUK5Gn4LON4Z60elm0+5J4FbplZHACRvCHWspOURLpOb/65
 FWgV2o/jjiIpkE84rc4IosmtvZ7oNSzT7gDp1UHXE0ITV6iIl4Fz8AgTykEEfFaCvP
 rTnMfjmVxHYZ+lX/tFwJeYwS30mT+pnrLJl2DCL6tglWbuKiWarABvr3HjGRfdXKs6
 6GDi3h+QAIZUlhaVDYtI6nVd5TRiqMgk1GCzR0gKeQEE84TTgTRPrNjcfeJ1yVl7dN
 z0fxaA7g2twaw==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 30 Sep 2021 22:28:10 +0200
Date: Thu, 30 Sep 2021 22:28:10 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Kory Maincent <kory.maincent@bootlin.com>
Message-ID: <20210930202810.GP1504958@scaer>
References: <20210923155726.87851-1-kory.maincent@bootlin.com>
 <20210923155726.87851-6-kory.maincent@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210923155726.87851-6-kory.maincent@bootlin.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH v3 5/7] support/testing/infra/emulator.py:
 update encoding when calling qemu
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
Cc: thomas.petazzoni@bootlin.com, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

S8O2cnksIEFsbCwKCitBcm5vdXQsICtQZXRyIGZvciB0aGVpciBweXRob24zIGV4cGVydGlzZQoK
T24gMjAyMS0wOS0yMyAxNzo1NyArMDIwMCwgS29yeSBNYWluY2VudCBzcGFrZSB0aHVzbHk6Cj4g
V2l0aCBVVEYtOCBnb3QgaXNzdWUgd2l0aCB3cm9uZyBjaGFyYWN0ZXIgcmV0dXJuZWQgYnkgUWVt
dSB3aGVuIHVzaW5nIEVGSQo+IEJJT1MuIFRoaXMgYnJlYWtzIHRoZSB0ZXN0IHByb2Nlc3Mgd2l0
aCB0aGUgZm9sbG93aW5nIGVycm9yLiBVcGRhdGUgdG8KPiBJU08tODg1OS0xIGVuY29kaW5nIHRv
IGF2b2lkIGl0LgoKSSBhbSBhbHdheXMgc2tlcHRpY2FsIGFib3V0IHN3aXRjaGluZyBhd2F5IGZy
b20gVVRGLTguIFJhdGhlciwgSSdkIGxpa2UKdG8gdW5kZXJzYW5kIHdoeSB0aGF0IGlzIHRoZSBj
YXNlLgoKSXMgaXQgc3BlY2lmaWMgdG8ganVzdCB0aGUgZWRrMiB0ZXN0cyB5b3UgYWRkZWQgbGF0
ZXIgaW4gdGhlIHNlcmllcz8KV2hhdCBpZiB5b3Ugc2V0IHlvdXIgbG9jYWxlIHRvICdDJyAoTENf
QUxMPUMgTEFORz1DKSB3aGVuIHJ1bmluZyB0aGUKdGVzdC1zdWl0ZT8gT3IgdG8gJ0MuVVRGLTgn
PwoKPiAgICAgZW11bGF0b3IubG9naW4oKQo+ICAgRmlsZSAiL2hvbWUva21haW5jZW50L0RvY3Vt
ZW50cy9wcm9qZWN0cy9hcmlhbmUtZ3JvdXBlL2J1aWxkcm9vdC9zdXBwb3J0L3Rlc3RpbmcvaW5m
cmEvZW11bGF0b3IucHkiLCBsaW5lIDg5LCBpbiBsb2dpbgo+ICAgICBpbmRleCA9IHNlbGYucWVt
dS5leHBlY3QoWyJidWlsZHJvb3QgbG9naW46IiwgcGV4cGVjdC5USU1FT1VUXSwKPiAgIEZpbGUg
Ii91c3IvbGliL3B5dGhvbjMvZGlzdC1wYWNrYWdlcy9wZXhwZWN0L3NwYXduYmFzZS5weSIsIGxp
bmUgMzQwLCBpbiBleHBlY3QKPiAgICAgcmV0dXJuIHNlbGYuZXhwZWN0X2xpc3QoY29tcGlsZWRf
cGF0dGVybl9saXN0LAo+ICAgRmlsZSAiL3Vzci9saWIvcHl0aG9uMy9kaXN0LXBhY2thZ2VzL3Bl
eHBlY3Qvc3Bhd25iYXNlLnB5IiwgbGluZSAzNjksIGluIGV4cGVjdF9saXN0Cj4gICAgIHJldHVy
biBleHAuZXhwZWN0X2xvb3AodGltZW91dCkKPiAgIEZpbGUgIi91c3IvbGliL3B5dGhvbjMvZGlz
dC1wYWNrYWdlcy9wZXhwZWN0L2V4cGVjdC5weSIsIGxpbmUgMTExLCBpbiBleHBlY3RfbG9vcAo+
ICAgICBpbmNvbWluZyA9IHNwYXduLnJlYWRfbm9uYmxvY2tpbmcoc3Bhd24ubWF4cmVhZCwgdGlt
ZW91dCkKPiAgIEZpbGUgIi91c3IvbGliL3B5dGhvbjMvZGlzdC1wYWNrYWdlcy9wZXhwZWN0L3B0
eV9zcGF3bi5weSIsIGxpbmUgNDg1LCBpbiByZWFkX25vbmJsb2NraW5nCj4gICAgIHJldHVybiBz
dXBlcihzcGF3biwgc2VsZikucmVhZF9ub25ibG9ja2luZyhzaXplKQo+ICAgRmlsZSAiL3Vzci9s
aWIvcHl0aG9uMy9kaXN0LXBhY2thZ2VzL3BleHBlY3Qvc3Bhd25iYXNlLnB5IiwgbGluZSAxNzgs
IGluIHJlYWRfbm9uYmxvY2tpbmcKPiAgICAgcyA9IHNlbGYuX2RlY29kZXIuZGVjb2RlKHMsIGZp
bmFsPUZhbHNlKQo+ICAgRmlsZSAiL3Vzci9saWIvcHl0aG9uMy44L2NvZGVjcy5weSIsIGxpbmUg
MzIyLCBpbiBkZWNvZGUKPiAgICAgKHJlc3VsdCwgY29uc3VtZWQpID0gc2VsZi5fYnVmZmVyX2Rl
Y29kZShkYXRhLCBzZWxmLmVycm9ycywgZmluYWwpCj4gVW5pY29kZURlY29kZUVycm9yOiAndXRm
LTgnIGNvZGVjIGNhbid0IGRlY29kZSBieXRlIDB4ZGEgaW4gcG9zaXRpb24gMDogaW52YWxpZCBj
b250aW51YXRpb24gYnl0ZQoKMHhkYSBpbiBpc284ODU5LTE1IGlzIMOaIChMQVRJTiBDQVBJVEFM
IExFVFRFUiBVIFdJVEggQUNVVEUpLiBUaGlzIGlzIGEKd2VpcmQgY2hhcmFjdGVyIHRvIHNlZS4u
LiBBbmQgaGlzIGlzIHRoZSBmaXJzdCBieXRlLi4uIElzIGVkazIganVzdApzcGl0dGluZyBhY3R1
YWwgYmluYXJ5PwoKU28gSSdkIHJlYWxseSBsaWtlIHRvIHVuZGVyc3RhbmQgd2h5IHRoYXQgaXMu
Li4gCgpSZWdhcmRzLApZYW5uIEUuIE1PUklOLgoKPiBTaWduZWQtb2ZmLWJ5OiBLb3J5IE1haW5j
ZW50IDxrb3J5Lm1haW5jZW50QGJvb3RsaW4uY29tPgo+IC0tLQo+ICBzdXBwb3J0L3Rlc3Rpbmcv
aW5mcmEvZW11bGF0b3IucHkgfCAyICstCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigr
KSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS9zdXBwb3J0L3Rlc3RpbmcvaW5mcmEv
ZW11bGF0b3IucHkgYi9zdXBwb3J0L3Rlc3RpbmcvaW5mcmEvZW11bGF0b3IucHkKPiBpbmRleCAw
YTc3ZWI4MGZjLi4xZmFiOWNhYWQ4IDEwMDY0NAo+IC0tLSBhL3N1cHBvcnQvdGVzdGluZy9pbmZy
YS9lbXVsYXRvci5weQo+ICsrKyBiL3N1cHBvcnQvdGVzdGluZy9pbmZyYS9lbXVsYXRvci5weQo+
IEBAIC03Niw3ICs3Niw3IEBAIGNsYXNzIEVtdWxhdG9yKG9iamVjdCk6Cj4gICAgICAgICAgc2Vs
Zi5sb2dmaWxlLndyaXRlKCI+IHN0YXJ0aW5nIHFlbXUgd2l0aCAnJXMnXG4iICUgIiAiLmpvaW4o
cWVtdV9jbWQpKQo+ICAgICAgICAgIHNlbGYucWVtdSA9IHBleHBlY3Quc3Bhd24ocWVtdV9jbWRb
MF0sIHFlbXVfY21kWzE6XSwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHRp
bWVvdXQ9NSAqIHNlbGYudGltZW91dF9tdWx0aXBsaWVyLAo+IC0gICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgZW5jb2Rpbmc9J3V0Zi04JywKPiArICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIGVuY29kaW5nPSdJU08tODg1OS0xJywKPiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIGVudj17IlFFTVVfQVVESU9fRFJWIjogIm5vbmUifSkKPiAgICAgICAg
ICAjIFdlIHdhbnQgb25seSBzdGRvdXQgaW50byB0aGUgbG9nIHRvIGF2b2lkIGRvdWJsZSBlY2hv
Cj4gICAgICAgICAgc2VsZi5xZW11LmxvZ2ZpbGVfcmVhZCA9IHNlbGYubG9nZmlsZQo+IC0tIAo+
IDIuMjUuMQo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCj4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+IGJ1aWxkcm9vdEBsaXN0cy5idWlsZHJvb3Qu
b3JnCj4gaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRy
b290CgotLSAKLi0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0t
LS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4KfCAgWWFubiBFLiBNT1JJTiAgfCBSZWFs
LVRpbWUgRW1iZWRkZWQgfCAvIlwgQVNDSUkgUklCQk9OIHwgRXJpY3MnIGNvbnNwaXJhY3k6IHwK
fCArMzMgNjYyIDM3NiAwNTYgfCBTb2Z0d2FyZSAgRGVzaWduZXIgfCBcIC8gQ0FNUEFJR04gICAg
IHwgIF9fXyAgICAgICAgICAgICAgIHwKfCArMzMgNTYxIDA5OSA0MjcgYC0tLS0tLS0tLS0tLS4t
LS0tLS0tOiAgWCAgQUdBSU5TVCAgICAgIHwgIFxlLyAgVGhlcmUgaXMgbm8gIHwKfCBodHRwOi8v
eW1vcmluLmlzLWEtZ2Vlay5vcmcvIHwgXy8qXF8gfCAvIFwgSFRNTCBNQUlMICAgIHwgICB2ICAg
Y29uc3BpcmFjeS4gIHwKJy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tXi0t
LS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS0tLScKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWls
ZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9idWlsZHJvb3QK
