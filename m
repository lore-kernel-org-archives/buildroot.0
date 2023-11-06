Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFFC0C4332F
	for <buildroot@archiver.kernel.org>; Mon,  6 Nov 2023 09:18:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5319440C98;
	Mon,  6 Nov 2023 09:18:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5319440C98
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zEU-2WZVsQNk; Mon,  6 Nov 2023 09:18:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3AD8940C6F;
	Mon,  6 Nov 2023 09:18:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3AD8940C6F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DCD301BF2B7
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 09:18:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C357B61117
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 09:18:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C357B61117
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5RDwmKR3HpsJ for <buildroot@lists.busybox.net>;
 Mon,  6 Nov 2023 09:18:34 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BCFC461114
 for <buildroot@buildroot.org>; Mon,  6 Nov 2023 09:18:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BCFC461114
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6EC7D20003;
 Mon,  6 Nov 2023 09:18:30 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1qzvkb-00GGn2-22;
 Mon, 06 Nov 2023 10:18:29 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Arnout Vandecappelle <arnout@mind.be>
References: <20231105183719.3811015-1-peter@korsgaard.com>
 <65d90378-9751-4666-9f36-e101a3e496ab@mind.be>
Date: Mon, 06 Nov 2023 10:18:29 +0100
In-Reply-To: <65d90378-9751-4666-9f36-e101a3e496ab@mind.be> (Arnout
 Vandecappelle's message of "Sun, 5 Nov 2023 21:22:02 +0100")
Message-ID: <87o7g7xmsa.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/4] configs/stm32mp157a_dk1_defconfig:
 unbreak TF-A build with GCC >= 12
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
Cc: Bartosz Bilas <b.bilas@grinn-global.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Pj4+Pj4gIkFybm91dCIgPT0gQXJub3V0IFZhbmRlY2FwcGVsbGUgPGFybm91dEBtaW5kLmJlPiB3
cml0ZXM6CgogPiBPbiAwNS8xMS8yMDIzIDE5OjM3LCBQZXRlciBLb3JzZ2FhcmQgd3JvdGU6CiA+
PiBXaXRoIHRoZSBtb3ZlIHRvIGRlZmF1bHQgdG8gR0NDIDEyIGluIGNvbW1pdCBlMDA5MWU0MmVl
ZjkgKHBhY2thZ2UvZ2NjOgogPj4gc3dpdGNoIHRvIGdjYyAxMi54IGFzIHRoZSBkZWZhdWx0KSwg
VEYtQSBub3cgZmFpbHMgdG8gYnVpbGQgYXMgYSB3YXJuaW5nIGlzCiA+PiBnZW5lcmF0ZWQgYW5k
IGl0IGJ1aWxkcyB3aXRoIC1XZXJyb3I6CiA+PiBDQyAgICAgIHBsYXQvc3Qvc3RtMzJtcDEvYmwy
X3BsYXRfc2V0dXAuYwogPj4gZHJpdmVycy9zdC9pby9pb19zdG0zMmltYWdlLmM6IEluIGZ1bmN0
aW9uIOKAmHN0bTMyaW1hZ2VfcGFydGl0aW9uX3JlYWTigJk6CiA+PiBkcml2ZXJzL3N0L2lvL2lv
X3N0bTMyaW1hZ2UuYzoyNDk6MTM6IGVycm9yOiDigJhyZXN1bHTigJkgbWF5IGJlIHVzZWQgdW5p
bml0aWFsaXplZCBbLVdlcnJvcj1tYXliZS11bmluaXRpYWxpemVkXQogPj4gMjQ5IHwgICAgICAg
ICBpbnQgcmVzdWx0OwogPj4gfCAgICAgICAgICAgICBefn5+fn4KID4+IGNjMTogYWxsIHdhcm5p
bmdzIGJlaW5nIHRyZWF0ZWQgYXMgZXJyb3JzCiA+PiBUaGlzIGlzIGZpeGVkIGluIFRGLUEgdjIu
NiB3aXRoIGNvbW1pdCBjMWQ3MzJkMGRiMjQKID4+IChmaXgoaW9fc3RtMzJpbWFnZSk6CiA+PiB1
bmluaXRpYWxpemVkIHZhcmlhYmxlIHdhcm5pbmcpLCBidXQgSSBkbyBub3QgaGF2ZSB0aGUgYm9h
cmQgdG8gdmVyaWZ5IGlmCiA+PiB2Mi42IHdvcmtzLCBzbyBpbnN0ZWFkIGRpc2FibGUgLVdlcnJv
ciBieSBtYXNzc2luZyBFPTAuCgpFaGgsIHRoYXQgc2hvdWxkIG5hdHVyYWxseSBiZSBwYXNzaW5n
IDspCgogPiAgSSAob3IgYWN0dWFsbHksIG15IGNvbGxlYWd1ZXMpIGhhdmUgYm90aCBhIERLMSBh
bmQgYSBESzIsIHNvIHNoYWxsIEkKID4gIHRlc3QgdGhlIDIuOSBidW1wIG9uIHRoZW0/CgpGZWVs
IGZyZWUgdG8gZG8gc28sIGJ1dCBpdCBhZmFpayByZXF1aXJlcyBhIGNoYW5nZSB0byB0aGUgIkZJ
UCIgZm9ybWF0CihhbmQgaGVuY2Ugc2hhcmVkIGdlbmltYWdlIHRlbXBsYXRlKSBhcyB0aGUgc3Rt
MzIgZm9ybWF0IGdvdCBkcm9wcGVkIGluCnYyLjggd2l0aDoKCmNvbW1pdCA5ODFiOWRjYjg3OGM4
Njg5ODMzODhjZDg2YzEzM2Y2NjNlYWIxYWY0CkF1dGhvcjogWWFubiBHYXV0aWVyIDx5YW5uLmdh
dXRpZXJAc3QuY29tPgpEYXRlOiAgIE1vbiBOb3YgMTQgMTQ6MTQ6NDggMjAyMiArMDEwMAoKICAg
IHJlZmFjdG9yKHN0bTMybXAxKTogcmVtb3ZlIFNUTTMyTVBfVVNFX1NUTTMySU1BR0UKCiAgICBU
aGUgY29kZSBtYW5hZ2luZyBsZWdhY3kgYm9vdCAod2l0aG91dCBGSVApIHRoYXQgd2FzIHVuZGVy
CiAgICBTVE0zMk1QX1VTRV9TVE0zMklNQUdFIGZsYWcgaXMgcmVtb3ZlLgoKICAgIENoYW5nZS1J
ZDogSTA0NDUyNDUzZWQ4NDU2N2IwZGUzOWU5MDA1OTRhODE1MjY1NjIyNTkKICAgIFNpZ25lZC1v
ZmYtYnk6IFlhbm4gR2F1dGllciA8eWFubi5nYXV0aWVyQHN0LmNvbT4KClNvIGZvciAyMDIzLjEx
LCBJIHRoaW5rIGl0IG1ha2VzIG1vcmUgc2Vuc2UgdG8gc3RpY2sgdG8gdjIuNS4KCi0tIApCeWUs
IFBldGVyIEtvcnNnYWFyZApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0
dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
