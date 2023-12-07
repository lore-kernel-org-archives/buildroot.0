Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E5EAC4167B
	for <buildroot@archiver.kernel.org>; Thu,  7 Dec 2023 17:06:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 039E183C5A;
	Thu,  7 Dec 2023 17:06:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 039E183C5A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XjxnEZEjq_jf; Thu,  7 Dec 2023 17:06:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 46F9B83883;
	Thu,  7 Dec 2023 17:06:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 46F9B83883
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E62E11BF380
 for <buildroot@lists.busybox.net>; Thu,  7 Dec 2023 17:06:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BDE8B400D7
 for <buildroot@lists.busybox.net>; Thu,  7 Dec 2023 17:06:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BDE8B400D7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KE3i23p_mHOC for <buildroot@lists.busybox.net>;
 Thu,  7 Dec 2023 17:06:03 +0000 (UTC)
Received: from mail.tkos.co.il (wiki.tkos.co.il [84.110.109.230])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 97E43400C7
 for <buildroot@buildroot.org>; Thu,  7 Dec 2023 17:06:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 97E43400C7
Received: from localhost (unknown [10.0.8.2])
 by mail.tkos.co.il (Postfix) with ESMTP id D0A6A440319;
 Thu,  7 Dec 2023 19:04:24 +0200 (IST)
References: <20231206164437.22191-1-louis.chauvet@bootlin.com>
 <87h6kvckwc.fsf@tarshish> <ZXH1QcJkmcJdz3nB@louis-chauvet-laptop>
User-agent: mu4e 1.10.8; emacs 29.1
To: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Thu, 07 Dec 2023 19:05:02 +0200
In-reply-to: <ZXH1QcJkmcJdz3nB@louis-chauvet-laptop>
Message-ID: <874jguc58s.fsf@tarshish>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=tkos.co.il; s=default; t=1701968664;
 bh=YXxQRvmLxuoZNjqr6bMrdz0V+w5vDlk8Vn22Oom1CUc=;
 h=References:From:To:Cc:Subject:Date:In-reply-to:From;
 b=lWf+MCCivV+cumt/di0iXB0rr/2BpYsQPHFJ9SybsZHV7Dqg3KqAYBbWU3wv5ju0k
 a+js9Cc5RKD8jf6KEhjsXdpJ5Vzh1BcwizCq/DOwcVNcgE8XJzxfX7V1dXQNEES2hX
 IlhyVoubIc03ZkZkv8xe67rDBdIVsX5tl287H666fx8TKURgF5G3X4IE6M1afTRyTh
 YUsa4kLn1fvWAHQDH4XAClEpNDRjaiuduU9QpaQNLgHp7IqPHBy64t/PcQt2BGHa8z
 dM33Bsb0812tBoh/zyI7XpPoWlaiEWNcuNMe/xwWTdoLmpVWHQbYoTD1pyHf5rugRf
 6Wp1zZDzwznlA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=tkos.co.il header.i=@tkos.co.il
 header.a=rsa-sha256 header.s=default header.b=lWf+MCCi
Subject: Re: [Buildroot] [PATCH] boot/arm-trusted-firmware: fix the RPATH of
 fiptool
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
From: Baruch Siach via buildroot <buildroot@buildroot.org>
Reply-To: Baruch Siach <baruch@tkos.co.il>
Cc: kory.maincent@bootlin.com, thomas.petazzoni@bootlin.com, geomatsi@gmail.com,
 buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgTG91aXMsCgpPbiBUaHUsIERlYyAwNyAyMDIzLCBMb3VpcyBDaGF1dmV0IHdyb3RlOgo+IExl
IDA2LzEyLzIzIC0gMTk6MDUsIEJhcnVjaCBTaWFjaCB2aWEgYnVpbGRyb290IGEgw6ljcml0IDoK
Pj4gT24gV2VkLCBEZWMgMDYgMjAyMywgTG91aXMgQ2hhdXZldCB2aWEgYnVpbGRyb290IHdyb3Rl
Ogo+PiA+IFRoZSBhcm0tdHJ1c3RlZC1maXJtd2FyZSBwYWNrYWdlIGJ1aWxkcyBhIGhvc3QgdG9v
bCBjYWxsZWQgImZpcHRvb2wiLAo+PiA+IHdoaWNoIGlzIHVzZWQgZHVyaW5nIHRoZSBidWlsZCBw
cm9jZXNzIG9mIGFybS10cnVzdGVkLWZpcm13YXJlCj4+ID4gaXRzZWxmLiBUaGlzIHRvb2wgbGlu
a3MgYWdhaW5zdCB0aGUgT3BlblNTTCBob3N0IGxpYnJhcnksIGFuZAo+PiA+IHRoZXJlZm9yZSBu
ZWVkcyB0byBiZSBidWlsdCB3aXRoIHRoZSBjb3JyZWN0IFJQQVRIIHBvaW50aW5nIHRvCj4+ID4g
JEhPU1RfRElSL2xpYi4KPj4gPgo+PiA+IFRoaXMgaXMgd2h5IGNvbW1pdCBhOTU3ZDlhOTBhZGU0
MTk0ZGZmZTNlYjJmYzAxMzZiYzVkMDc3YzI4Cj4+ID4gKCJib290L2FybS10cnVzdGVkLWZpcm13
YXJlOiBidWlsZCBmaXB0b29sIHNlcGFyYXRlbHkgd2l0aCBkZXBlbmRlbmN5Cj4+ID4gbyBuIGhv
c3Qtb3BlbnNzbCIpIGFkZGVkIHRoZSBBUk1fVFJVU1RFRF9GSVJNV0FSRV9CVUlMRF9GSVBUT09M
Cj4+ID4gdmFyaWFibGUsIHdoaWNoIGJ1aWxkcyB0aGUgZmlwdG9vbCB0b29sIGZpcnN0LCB3aXRo
IHRoZSByaWdodAo+PiA+IHZhcmlhYmxlcyBzZXQsIGJlZm9yZSBpbnZva2luZyB0aGUgZnVsbCBi
dWlsZCBvZiBURi1BLiBUaGlzIGVuc3VyZWQKPj4gPiB0aGF0IGZpcHRvb2wgd2FzIGJ1aWx0IHdp
dGggdGhlIGNvcnJlY3QgUlBBVEguCj4+ID4KPj4gPiBIb3dldmVyLCBtb3JlIHJlY2VudCB2ZXJz
aW9ucyBvZiBURi1BIGhhdmUgbW9kaWZpZWQgdGhlaXIgTWFrZWZpbGUKPj4gPiBtYWNoaW5lcnks
IGFuZCBmaXB0b29sIGlzIGJlaW5nIHJlYnVpbHQgZXZlbiBpZiBpdCB3YXMgYnVpbHQKPj4gPiBi
ZWZvcmUuIFVuZm9ydHVuYXRlbHksIHRoaXMgcmVidWlsZCBpcyBubyBsb25nZXIgZG9uZSB3aXRo
IHRoZSByaWdodAo+PiA+IGZsYWdzLCBzbyB3ZSBlbmQgdXAgd2l0aCBhIGZpcHRvb2wgYmluYXJ5
IHRoYXQgbm8gbG9uZ2VyIGhhcyB0aGUgcmlnaHQKPj4gPiBSUEFUSCwgYW5kIGZpcHRvb2wgZmFp
bHMgdG8gZmluZCB0aGUgT3BlblNTTCBsaWJyYXJpZXMgZnJvbQo+PiA+ICRIT1NUX0RJUi9saWIu
Cj4+ID4KPj4gPiBJbiBvcmRlciB0byBmaXggdGhpcywgd2UgdGFrZSBhIGRpZmZlcmVudCBhcHBy
b2FjaDogd2UgZG8gbm90IGJ1aWxkCj4+ID4gZmlwdG9vbCBzZXBhcmF0ZWx5IGZpcnN0LCBidXQg
d2UgaW5qZWN0IHRoZSBuZWNlc3NhcnkgZmxhZ3MgdGhyb3VnaAo+PiA+IHRoZSBIT1NUQ0MgdmFy
aWFibGUuIEluZGVlZCwgdGhlcmUncyBubyBIT1NUX0xERkxBR1Mgb3IgSE9TVF9MRExJQlMKPj4g
PiB2YXJpYWJsZSBvciBzaW1pbGFyIHRoYXQgd291bGQgYWxsb3cgdXMgdG8gcGFzcyB0aGUgLVds
LC1ycGF0aCBmbGFnCj4+ID4gdGhhdCBpcyBuZWVkZWQuIFNob2UtaG9ybmluZyB0aGlzIGZsYWcg
aW50byBIT1NUQ0MgZ2V0cyB0aGUgam9iIGRvbmUsCj4+ID4gYW5kIGFjdHVhbGx5IHNpbXBsaWZp
ZXMgb3VyIGFybS10cnVzdGVkLWZpcm13YXJlLm1rLgo+PiAKPj4gVGhlIGNvZGUgdGhpcyBwYXRj
aCByZW1vdmVzIHRyaWVzIHRvIGtlZXAgY29tcGF0aWJpbGl0eSB3aXRoIFRGLUEKPj4gdmVyc2lv
bnMgZWFybGllciB0aGFuIDEuMy4gVGhpcyBwYXRjaCByZWxpZXMgb24gSE9TVENDIHRoYXQgd2Fz
IG9ubHkKPj4gaW50cm9kdWNlZCBpbiBURi1BIHZlcnNpb24gMS40IHdpdGggdXBzdHJlYW0gY29t
bWl0IDcyNjEwYzQxMDI5OTAKPj4gKCJidWlsZDogSW50cm9kdWNlIEhPU1RDQyBmbGFnIikuIEkg
Z3Vlc3MgbG9zaW5nIGNvbXBhdGliaWxpdHkgd2l0aAo+PiBvbGRlciBURi1BIGlzIGZpbmUsIHNp
bmNlIGFsbCBCdWlsZHJvb3QgaW4tdHJlZSBjb25maWdzIGFwcGVhciB0byB1c2UKPj4gbmV3ZXIg
dmVyc2lvbnMuIEJ1dCBJIHRoaW5rIHRoaXMgc2hvdWxkIGF0IGxlYXN0IGJlIG1lbnRpb25lZCBp
biB0aGUKPj4gY29tbWl0IGxvZy4KPgo+IFRoYW5rcyBmb3IgeW91ciBmZWVkYmFjay4gRG8geW91
IHRoaW5rIHRoaXMgaXMgc3VmZmljaWVudCA/Cj4KPiBUaGlzIHBhdGNoIGJyZWFrIHRoZSBjb21w
YXRpYmlsaXR5IHdpdGggdmVyc2lvbiBwcmlvciB0byAxLjQgKHVwc3RyZWFtCj4gY29tbWl0IDcy
NjEwYzQxMDI5OTAgKCJidWlsZDogSW50cm9kdWNlIEhPU1RDQyBmbGFnIikpLiB2MS40IGlzIHZl
cnkgb2xkIAo+IChKdWx5IDIwMTcpLCBub3QgdXNlZCBhbnltb3JlIGluLXRyZWUgYW5kIHByb2Jh
Ymx5IG5vdCB1c2VkIGFueW1vcmUgCj4gb3V0c2lkZSB0aGUgdHJlZS4KCkxvb2tzIGdvb2QgdG8g
bWUuCgpiYXJ1Y2gKCi0tIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIH4uIC5+ICAgVGsgT3BlbiBTeXN0ZW1zCj19LS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tb29PLS1VLS1Pb28tLS0tLS0tLS0tLS17PQog
ICAtIGJhcnVjaEB0a29zLmNvLmlsIC0gdGVsOiArOTcyLjUyLjM2OC40NjU2LCBodHRwOi8vd3d3
LnRrb3MuY28uaWwgLQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBz
Oi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
