Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E567C4706C
	for <buildroot@archiver.kernel.org>; Sat, 13 Jan 2024 20:26:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3767960B1A;
	Sat, 13 Jan 2024 20:26:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3767960B1A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gCxnDL0Umoa9; Sat, 13 Jan 2024 20:26:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7FE4460ACC;
	Sat, 13 Jan 2024 20:26:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7FE4460ACC
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AF8411BF83A
 for <buildroot@lists.busybox.net>; Sat, 13 Jan 2024 20:26:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 95BFE60ACC
 for <buildroot@lists.busybox.net>; Sat, 13 Jan 2024 20:26:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 95BFE60ACC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FIElfLcFB0YE for <buildroot@lists.busybox.net>;
 Sat, 13 Jan 2024 20:26:16 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8931A60709
 for <buildroot@buildroot.org>; Sat, 13 Jan 2024 20:26:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8931A60709
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6DA09C0003;
 Sat, 13 Jan 2024 20:26:14 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rOka5-00DNUV-2Q;
 Sat, 13 Jan 2024 21:26:13 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20240101215142.2480384-1-yann.morin.1998@free.fr>
Date: Sat, 13 Jan 2024 21:26:13 +0100
In-Reply-To: <20240101215142.2480384-1-yann.morin.1998@free.fr> (Yann
 E. MORIN's message of "Mon, 1 Jan 2024 22:51:42 +0100")
Message-ID: <87cyu5rndm.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH] Revert "support/download: generate even
 more reproducible tarballs"
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
Cc: Antoine Coutant <antoine.coutant@smile.fr>,
 Vincent Fazio <vfazio@xes-inc.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Pj4+Pj4gIllhbm4iID09IFlhbm4gRSBNT1JJTiA8eWFubi5tb3Jpbi4xOTk4QGZyZWUuZnI+IHdy
aXRlczoKCiA+IENvbW1pdCA3NjhmOWY4MGY2MmMgKHN1cHBvcnQvZG93bmxvYWQ6IGdlbmVyYXRl
IGV2ZW4gbW9yZSByZXByb2R1Y2libGUKID4gdGFyYmFsbHMpIGNhdXNlcyBub24tcmVwcm9kdWNp
YmlsaXR5IGluIHRhcmJhbGxzIHdlIHByZXZpb3VzeQogPiBnZW5lcmF0ZWQsIGVzcGVjaWFsbHkg
dGhlIGFyY2hpdmVzIGZvciB0d28gY2FyZ28tdmVuZG9yZWQgcGFja2FnZXMsCiA+IHJpcGdyZXAg
YW5kIHNlbnRyeS1jbGkuCgogPiBUaGUgY2F1c2UgaXMgdGhhdCB0aG9zZSB0d28gcGFrY2FnZXMg
ZXZlbnR1YWxseSB2ZW5kb3IgYSBmaWxlIHRoYXQgaGFzCiA+IHRoZSB1K3ggYml0IHNldCwgYnV0
IGlzIG90ZWhyd2lzZSBnby14LiBXaXRoIDc2OGY5ZjgwZjYyYywgdGhlIGZpbGVzIGFyZQogPiBu
b3cgZ28reCwgc28gdGhlIGhhc2ggZm9yIHRob3NlIGdlbmVyYXRlZCBhcmNoaXZlcyBoYXMgY2hh
bmdlZC4KCiA+IEJlc2lkZXMsIHRoYXQgY29tbWl0IHdhcyB3cm9uZzogaXQgZGlkIG5vdCBhY2Nv
dW50IGZvciB0aGUgJ3InIGJpdCBmb3IKID4gZ28gcGFydCwgbGVhdmluZyBzb21lIG5vbi1yZXBy
b2R1Y2liaWxpdHkgc3RpbGwgdW5hY2NvdW50ZWQgZm9yLgoKID4gU28sIHRvIGdlbmVyYXRlIHJl
YWxseSByZXByb2R1Y2libGUgYXJjaGl2ZXMsIHdlIHdvdWxkIG5lZWQgdG8gZml4IHRoYXQKID4g
cmVhZCBiaXQgYXMgd2VsbCwgYW5kIHRoYXQgaGFzIHRoZSBwb3RlbnRpYWwgdG8gYWZmZWN0IGFs
bCB0aGUgYXJjaGl2ZXMKID4gd2UgZ2VuZXJhdGVkIHNvIGZhci4gSWYgd2Ugd2FudGVkIHRvIGRv
IHNvLCB3ZSdkIG5lZWQgYSB3YXkgdG8gdmVyc2lvbgogPiBhbGwgZ2VuZXJhdGVkIGFyY2hpdmVz
LCBsaWtlIHdlIGRvIGZvciBnaXQgYW5kIHN2biwgYnV0IG5vdyBmb3IgYWxsIHRoZQogPiBkaWZm
ZXJlbnQgQ1ZTZXMsIGFzIHdlbGwgYXMgZm9yIGFsbCB0aGUgdmVuZG9yaW5nIHBvc3QtcHJvY2Vz
c2VzLgoKID4gRm9yIDc2OGY5ZjgwZjYyYywgYWxsIHRoYXQgd2FzIG9mIGNvbmVybiB3YXMgdGhl
IHdvcmtpbmcgY29waWVzIG9mIENWU2VzCiA+IChpLmUuIGdpdCwgc3ZuLCBjdnMuLi4pIHRoYXQg
d2UgY2FjaGUgaW4gdGhlIEJ1aWxkcm9vdCBkb3dubG9hZCBkaXIsIG5vdAogPiB0aGUgdGVtcG9y
YXJ5IGZpbGVzIGR1cmluZyBwb3N0LXByb2Nlc3NpbmcuIEluZGVlZCwgaW4gdGhhdCBsYXR0ZXIg
Y2FzZSwKID4gdGhlIHVzZXIgaGFzIHZpcnR1YWxseSBubyB3YXkgdG8gbWFuZ2xlIHdpdGggdGhl
IG1vZGUgb2YgdGhlCiA+IGludGVybWVkaWF0ZSBleHRyYWN0IGJlZm9yZSByZXBhY2suCgogPiBB
bmQgd2UgZG8gaGF2ZSBhIGJpZyBmYXQgd2FybmluZyB0aGF0IHVzZXJzIHNob3VsZCBub3QgYXR0
ZW1wdCB0byBtZWRkbGUKID4gd2l0aCB0aGUgZ2l0IHRyZWUgdGhhdCBCdWlsZHJvb3QgY2FjaGVz
LgoKID4gQXMgNzY4ZjlmODBmNjJjIGhvd2V2ZXIgZGVtb25zdHJhdGVzLCBpcyB0aGF0IGl0IHRv
b2sgcXVpdGUgYSBsb25nIHRpbWUKID4gYmV0d2VlbiB0aGUgaW50cm9kdWN0aW9uIG9mIHRoZSBn
aXQgY2FjaGluZywgYW5kIHRoZSB0aW1lIHNvbWVvbmUKID4gZXZlbnR1YWxseSBkaXNjb3ZlcmVk
IHRoZXkgY291bGQgbWVkZGxlIGluIHRoZXJlLiBUaGlzIHNob3dzIHRoYXQgdGhlCiA+IGlzc3Vl
IGl0IG5vdCBhY3R1YWxseSBjcml0aWNhbCBpbiBtb3N0IHNldHVwcy4KCiA+IEFsc28sIHRoZSB0
YXIgbWFudWFsIFswXSBoaW50cyBhdCBhIGJldHRlciBzb2x1dGlvbiB0byBoYW5kbGUKID4gcmVw
cm9kdWNpYmlsaXR5LCB3aGljaCBldmVuIGF2b2lkcyB0b3VjaGluZyB0aGUgZmlsZXMgb24gZGlz
ayB3aGljaCBpcwogPiBldmVuIG5pY2VyOgoKID4gICAgIOKAmC0tbW9kZT0nZ28rdSxnby13J+KA
mQogPiAgICAgICAgIE9taXQgaXJyZWxldmFudCBpbmZvcm1hdGlvbiBhYm91dCBmaWxlIHBlcm1p
c3Npb25zLgoKID4gSWYgd2Ugd2VyZSB0byBhY3R1YWxseSBoYW5kbGUgdGhlIG1vZGUgYml0IGZv
ciByZXByb2R1Y2liaWxpdHksIHdlJ2QKID4gbmVlZCB0bzoKID4gICAtIGludHJvZHVjZSBhcmNo
aXZlIHZlcnNpb25pbmcgZm9yIGFsbCBkb3dubG9hZCBiYWNrZW5kcyBhbmQKID4gICAgIHByb3N0
LXByb2Nlc3NpbmcKID4gICAtIHVzZSB0aGUgdGFyIG9mZmljaWFsbHkgc3VnZ2VzdGVkIG1ldGhv
ZAoKID4gU28sIHJldmVydCB0aGF0IGNoYW5nZSwgYXMgaXQgd2FzIGluY29tcGxldGUsIHdhcyBu
b3QgcmVhbGx5IGZpeGluZyBtdWNoCiA+IGlzc3VlcywgYW5kIGNhdXNlcyBhY3R1YWwgaXNzdWVz
LgoKID4gVGhpcyByZXZlcnRzIGNvbW1pdCA3NjhmOWY4MGY2MmMxZGE2ZTI5OGM2ODBmMGY0YmZh
ODg3ZjM4Yzc4LgoKID4gWzBdIGh0dHBzOi8vd3d3LmdudS5vcmcvc29mdHdhcmUvdGFyL21hbnVh
bC90YXIuaHRtbCNSZXByb2R1Y2liaWxpdHkKCiA+IFRoYW5rcyB0byBWaW5jZW50IGFuZCBBcm5v
dXQgZm9yIHBvaW50aW5nIGF0IHRoZSB0YXIgbWFudWFsLgoKID4gUmVwb3J0ZWQtYnk6IEFudG9p
bmUgQ291dGFudCA8YW50b2luZS5jb3V0YW50QHNtaWxlLmZyPgogPiBSZXBvcnRlZC1ieTogVGhv
bWFzIFBldGF6em9uaSA8dGhvbWFzLnBldGF6em9uaUBib290bGluLmNvbT4KID4gU2lnbmVkLW9m
Zi1ieTogWWFubiBFLiBNT1JJTiA8eWFubi5tb3Jpbi4xOTk4QGZyZWUuZnI+CiA+IENjOiBWaW5j
ZW50IEZhemlvIDx2ZmF6aW9AeGVzLWluYy5jb20+CiA+IENjOiBBcm5vdXQgVmFuZGVjYXBwZWxs
ZSAoRXNzZW5zaXVtL01pbmQpIDxhcm5vdXRAbWluZC5iZT4KCkNvbW1pdHRlZCB0byAyMDIzLjAy
LnggYW5kIDIwMjMuMTEueCwgdGhhbmtzLgoKLS0gCkJ5ZSwgUGV0ZXIgS29yc2dhYXJkCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWls
aW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qu
b3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
