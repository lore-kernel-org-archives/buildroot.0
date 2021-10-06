Return-Path: <SRS0=BIUF=O2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58619C433F5
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 14:59:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ECF1261186
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 14:59:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org ECF1261186
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BE59D60EA4;
	Wed,  6 Oct 2021 14:59:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id I5kfb5VeDWsm; Wed,  6 Oct 2021 14:59:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1AF0560EA5;
	Wed,  6 Oct 2021 14:59:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DFBF51BF25F
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 14:59:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CE9514041A
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 14:59:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Iyz8vxG3R1us for <buildroot@lists.busybox.net>;
 Wed,  6 Oct 2021 14:59:24 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A4E6B4015F
 for <buildroot@buildroot.org>; Wed,  6 Oct 2021 14:59:24 +0000 (UTC)
Received: (Authenticated sender: peter@casa-korsgaard.com)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id E2A2F60016;
 Wed,  6 Oct 2021 14:59:20 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mY8O8-0000KY-4P; Wed, 06 Oct 2021 16:59:20 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20210923155726.87851-1-kory.maincent@bootlin.com>
 <20210923155726.87851-6-kory.maincent@bootlin.com>
 <20211003124719.GH1504958@scaer>
Date: Wed, 06 Oct 2021 16:59:20 +0200
In-Reply-To: <20211003124719.GH1504958@scaer> (Yann E. MORIN's message of
 "Sun, 3 Oct 2021 14:47:19 +0200")
Message-ID: <87v92a5hdj.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
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
Cc: Kory Maincent <kory.maincent@bootlin.com>, thomas.petazzoni@bootlin.com,
 buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Pj4+Pj4gIllhbm4iID09IFlhbm4gRSBNT1JJTiA8eWFubi5tb3Jpbi4xOTk4QGZyZWUuZnI+IHdy
aXRlczoKCiA+IEvDtnJ5LCBBbGwsCiA+IE9uIDIwMjEtMDktMjMgMTc6NTcgKzAyMDAsIEtvcnkg
TWFpbmNlbnQgc3Bha2UgdGh1c2x5OgogPj4gV2l0aCBVVEYtOCBnb3QgaXNzdWUgd2l0aCB3cm9u
ZyBjaGFyYWN0ZXIgcmV0dXJuZWQgYnkgUWVtdSB3aGVuIHVzaW5nIEVGSQogPj4gQklPUy4gVGhp
cyBicmVha3MgdGhlIHRlc3QgcHJvY2VzcyB3aXRoIHRoZSBmb2xsb3dpbmcgZXJyb3IuIFVwZGF0
ZSB0bwogPj4gSVNPLTg4NTktMSBlbmNvZGluZyB0byBhdm9pZCBpdC4KID4+IAogPj4gZW11bGF0
b3IubG9naW4oKQogPj4gRmlsZSAiL2hvbWUva21haW5jZW50L0RvY3VtZW50cy9wcm9qZWN0cy9h
cmlhbmUtZ3JvdXBlL2J1aWxkcm9vdC9zdXBwb3J0L3Rlc3RpbmcvaW5mcmEvZW11bGF0b3IucHki
LCBsaW5lIDg5LCBpbiBsb2dpbgogPj4gaW5kZXggPSBzZWxmLnFlbXUuZXhwZWN0KFsiYnVpbGRy
b290IGxvZ2luOiIsIHBleHBlY3QuVElNRU9VVF0sCiA+PiBGaWxlICIvdXNyL2xpYi9weXRob24z
L2Rpc3QtcGFja2FnZXMvcGV4cGVjdC9zcGF3bmJhc2UucHkiLCBsaW5lIDM0MCwgaW4gZXhwZWN0
CiA+PiByZXR1cm4gc2VsZi5leHBlY3RfbGlzdChjb21waWxlZF9wYXR0ZXJuX2xpc3QsCiA+PiBG
aWxlICIvdXNyL2xpYi9weXRob24zL2Rpc3QtcGFja2FnZXMvcGV4cGVjdC9zcGF3bmJhc2UucHki
LCBsaW5lIDM2OSwgaW4gZXhwZWN0X2xpc3QKID4+IHJldHVybiBleHAuZXhwZWN0X2xvb3AodGlt
ZW91dCkKID4+IEZpbGUgIi91c3IvbGliL3B5dGhvbjMvZGlzdC1wYWNrYWdlcy9wZXhwZWN0L2V4
cGVjdC5weSIsIGxpbmUgMTExLCBpbiBleHBlY3RfbG9vcAogPj4gaW5jb21pbmcgPSBzcGF3bi5y
ZWFkX25vbmJsb2NraW5nKHNwYXduLm1heHJlYWQsIHRpbWVvdXQpCiA+PiBGaWxlICIvdXNyL2xp
Yi9weXRob24zL2Rpc3QtcGFja2FnZXMvcGV4cGVjdC9wdHlfc3Bhd24ucHkiLCBsaW5lIDQ4NSwg
aW4gcmVhZF9ub25ibG9ja2luZwogPj4gcmV0dXJuIHN1cGVyKHNwYXduLCBzZWxmKS5yZWFkX25v
bmJsb2NraW5nKHNpemUpCiA+PiBGaWxlICIvdXNyL2xpYi9weXRob24zL2Rpc3QtcGFja2FnZXMv
cGV4cGVjdC9zcGF3bmJhc2UucHkiLCBsaW5lIDE3OCwgaW4gcmVhZF9ub25ibG9ja2luZwogPj4g
cyA9IHNlbGYuX2RlY29kZXIuZGVjb2RlKHMsIGZpbmFsPUZhbHNlKQogPj4gRmlsZSAiL3Vzci9s
aWIvcHl0aG9uMy44L2NvZGVjcy5weSIsIGxpbmUgMzIyLCBpbiBkZWNvZGUKID4+IChyZXN1bHQs
IGNvbnN1bWVkKSA9IHNlbGYuX2J1ZmZlcl9kZWNvZGUoZGF0YSwgc2VsZi5lcnJvcnMsIGZpbmFs
KQogPj4gVW5pY29kZURlY29kZUVycm9yOiAndXRmLTgnIGNvZGVjIGNhbid0IGRlY29kZSBieXRl
IDB4ZGEgaW4gcG9zaXRpb24gMDogaW52YWxpZCBjb250aW51YXRpb24gYnl0ZQogPj4gCiA+PiBT
aWduZWQtb2ZmLWJ5OiBLb3J5IE1haW5jZW50IDxrb3J5Lm1haW5jZW50QGJvb3RsaW4uY29tPgog
Pj4gLS0tCiA+PiBzdXBwb3J0L3Rlc3RpbmcvaW5mcmEvZW11bGF0b3IucHkgfCAyICstCiA+PiAx
IGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKID4+IAogPj4gZGlm
ZiAtLWdpdCBhL3N1cHBvcnQvdGVzdGluZy9pbmZyYS9lbXVsYXRvci5weSBiL3N1cHBvcnQvdGVz
dGluZy9pbmZyYS9lbXVsYXRvci5weQogPj4gaW5kZXggMGE3N2ViODBmYy4uMWZhYjljYWFkOCAx
MDA2NDQKID4+IC0tLSBhL3N1cHBvcnQvdGVzdGluZy9pbmZyYS9lbXVsYXRvci5weQogPj4gKysr
IGIvc3VwcG9ydC90ZXN0aW5nL2luZnJhL2VtdWxhdG9yLnB5CiA+PiBAQCAtNzYsNyArNzYsNyBA
QCBjbGFzcyBFbXVsYXRvcihvYmplY3QpOgogPj4gc2VsZi5sb2dmaWxlLndyaXRlKCI+IHN0YXJ0
aW5nIHFlbXUgd2l0aCAnJXMnXG4iICUgIiAiLmpvaW4ocWVtdV9jbWQpKQogPj4gc2VsZi5xZW11
ID0gcGV4cGVjdC5zcGF3bihxZW11X2NtZFswXSwgcWVtdV9jbWRbMTpdLAogPj4gdGltZW91dD01
ICogc2VsZi50aW1lb3V0X211bHRpcGxpZXIsCiA+PiAtICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIGVuY29kaW5nPSd1dGYtOCcsCiA+PiArICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIGVuY29kaW5nPSdJU08tODg1OS0xJywKCiA+IEFmdGVyIHJldmlldyBmcm9tIFRo
b21hcywgSSd2ZSBpbmRlZWQgcmV2ZXJ0ZWQgdG8gdXNpbmcgdXRmLTgsIGJ1dCB1c2luZwogPiBj
b2RlY2Vycm9ycz0ncmVwbGFjZScgdG8gZml4IGludmFsaWQgdXRmLTggc2VxdWVuY2VzLgoKID4g
SSd2ZSBhbHNvIHJld29yZGVkIHRoZSBjb21taXQgbG9nIGFjY29yZGluZ2x5LgoKID4gQXBwbGll
ZCB0byBtYXN0ZXIsIHRoYW5rcy4KCkNvbW1pdHRlZCB0byAyMDIxLjAyLngsIDIwMjEuMDUueCBh
bmQgMjAyMS4wOC54LCB0aGFua3MuCgotLSAKQnllLCBQZXRlciBLb3JzZ2FhcmQKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcg
bGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcv
bWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
