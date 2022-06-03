Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2683C43334
	for <buildroot@archiver.kernel.org>; Fri,  3 Jun 2022 09:52:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8AB3360AE2;
	Fri,  3 Jun 2022 09:52:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qX26mKPmtCGk; Fri,  3 Jun 2022 09:52:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A9ADD60AF0;
	Fri,  3 Jun 2022 09:52:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B8FDF1BF346
 for <buildroot@lists.busybox.net>; Fri,  3 Jun 2022 09:52:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A87468321B
 for <buildroot@lists.busybox.net>; Fri,  3 Jun 2022 09:52:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cInvnz-ktvIi for <buildroot@lists.busybox.net>;
 Fri,  3 Jun 2022 09:52:12 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp1.osuosl.org (Postfix) with ESMTPS id ADC79831FB
 for <buildroot@buildroot.org>; Fri,  3 Jun 2022 09:52:11 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 3B33E1C0013;
 Fri,  3 Jun 2022 09:52:07 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1nx3yR-00AceZ-8H; Fri, 03 Jun 2022 11:52:07 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: =?utf-8?Q?K=C3=B6ry?= Maincent <kory.maincent@bootlin.com>
References: <20220531084428.100082-1-kory.maincent@bootlin.com>
 <87pmjq14r9.fsf@dell.be.48ers.dk>
 <20220603114411.05ae67c0@kmaincent-XPS-13-7390>
Date: Fri, 03 Jun 2022 11:52:07 +0200
In-Reply-To: <20220603114411.05ae67c0@kmaincent-XPS-13-7390>
 (=?utf-8?Q?=22K=C3=B6ry?=
 Maincent"'s message of "Fri, 3 Jun 2022 11:44:11 +0200")
Message-ID: <87k09y13co.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] boot/arm-trusted-firmware: add -fno-PIE to
 CFLAGS
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
Cc: thomas.petazzoni@bootlin.com, geomatsi@gmail.com,
 Kory Maincent via buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Pj4+Pj4gIkvDtnJ5IiA9PSBLw7ZyeSBNYWluY2VudCA8a29yeS5tYWluY2VudEBib290bGluLmNv
bT4gd3JpdGVzOgoKID4gT24gRnJpLCAwMyBKdW4gMjAyMiAxMToyMTo0NiArMDIwMAogPiBQZXRl
ciBLb3JzZ2FhcmQgPHBldGVyQGtvcnNnYWFyZC5jb20+IHdyb3RlOgoKID4+ID4gIGJvb3QvYXJt
LXRydXN0ZWQtZmlybXdhcmUvYXJtLXRydXN0ZWQtZmlybXdhcmUubWsgfCAxICsKID4+ID4gIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSAgCiA+PiAKID4+ID4gZGlmZiAtLWdpdCBhL2Jv
b3QvYXJtLXRydXN0ZWQtZmlybXdhcmUvYXJtLXRydXN0ZWQtZmlybXdhcmUubWsKID4+ID4gYi9i
b290L2FybS10cnVzdGVkLWZpcm13YXJlL2FybS10cnVzdGVkLWZpcm13YXJlLm1rIGluZGV4CiA+
PiA+IDAzZmE4M2I3YjUuLmIwZGVjMTNhNGMgMTAwNjQ0IC0tLQogPj4gPiBhL2Jvb3QvYXJtLXRy
dXN0ZWQtZmlybXdhcmUvYXJtLXRydXN0ZWQtZmlybXdhcmUubWsgKysrCiA+PiA+IGIvYm9vdC9h
cm0tdHJ1c3RlZC1maXJtd2FyZS9hcm0tdHJ1c3RlZC1maXJtd2FyZS5tayBAQCAtNTAsNiArNTAs
NyBAQAogPj4gPiBlbmRpZiAgCiA+PiAKID4+ID4gIEFSTV9UUlVTVEVEX0ZJUk1XQVJFX01BS0Vf
T1BUUyArPSBcCiA+PiA+ICAJQ1JPU1NfQ09NUElMRT0iJChUQVJHRVRfQ1JPU1MpIiBcCiA+PiA+
ICsJQ0ZMQUdTPSItZm5vLVBJRSIgXCAgCiA+PiAKID4+IEFURiBhbHJlYWR5IGhhcyBsb2dpYyB0
byBkZXRlY3QgaWYgYSB0b29sY2hhaW4gaXMgY29uZmlndXJlZCB3aXRoCiA+PiBkZWZhdWx0IFBJ
RSAobG9va2luZyBhdCBnY2MgLXYgb3V0cHV0KSwgc28gSSB0aGluayB3ZSBzaG91bGQgb25seSBk
bwogPj4gdGhpcyBpZiB3ZSBhZGQgdGhlICJoaWRkZW4iIC1mUElFIGluIHRoZSB0b29sY2hhaW4g
d3JhcHBlci4KCiA+IEZZSSBpdCBpcyB0aGUgb3Bwb3NpdGUsIGlmIFRGLUEgZGV0ZWN0cyB0aGUg
ZGVmYXVsdCBQSUUgaW4gZ2NjIGl0IGRpc2FibGUgaXQKID4gKGlmbmVxKSBiZWNhdXNlIGl0IHNl
ZW1zIHRvIGJyaW5nIGlzc3VlLgogPiBUYWtlIGEgbG9vayBhdCB0aGUgY29tbWl0IGY3ZWMzMWRi
MmRiM2M2OWE3YmQ5NzBmNGU3ZmQ4MjllN2NjMGM1M2EuCgpZZXMsIHRoYXQgaXMgd2hhdCBJIG1l
YW50LiBUaGUgbG9naWMgYWRkZWQgaW4gdGhhdCBjb21taXQgd2lsbCBub3QKdHJpZ2dlciBmb3Ig
c2V0dXBzIHdoZXJlIHRoZSB0b29sY2hhaW4gaXMgTk9UIGJ1aWx0IHdpdGgKLWVuYWJsZS1kZWZh
dWx0LXBpZSBidXQgd2hlcmUgd2Ugc3RpbGwgYWRkIC1mUElFIGluIHRoZSB0b29sY2hhaW4Kd3Jh
cHBlciAoRS5HLiB3aGVuIEJSMl9QSUNfUElFIGlzIGVuYWJsZWQpLgoKCi0tIApCeWUsIFBldGVy
IEtvcnNnYWFyZApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8v
bGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
