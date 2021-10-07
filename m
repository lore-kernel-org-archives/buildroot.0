Return-Path: <SRS0=EluJ=O3=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18C2AC433F5
	for <buildroot@archiver.kernel.org>; Thu,  7 Oct 2021 06:22:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1483761248
	for <buildroot@archiver.kernel.org>; Thu,  7 Oct 2021 06:22:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1483761248
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D792140991;
	Thu,  7 Oct 2021 06:22:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HT1DkhNq_i3w; Thu,  7 Oct 2021 06:22:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 493074098F;
	Thu,  7 Oct 2021 06:22:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 54CAD1BF379
 for <buildroot@lists.busybox.net>; Thu,  7 Oct 2021 06:22:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 423B260F61
 for <buildroot@lists.busybox.net>; Thu,  7 Oct 2021 06:22:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ol4s2RrlgtOb for <buildroot@lists.busybox.net>;
 Thu,  7 Oct 2021 06:22:39 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 59CEF60689
 for <buildroot@buildroot.org>; Thu,  7 Oct 2021 06:22:38 +0000 (UTC)
Received: (Authenticated sender: peter@casa-korsgaard.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id B25CC1BF206;
 Thu,  7 Oct 2021 06:22:35 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mYMna-0006mT-NA; Thu, 07 Oct 2021 08:22:34 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Arnout Vandecappelle <arnout@mind.be>
References: <2426ca2d-7fa8-d8a1-c542-0abbfcec3ec8@grenoble.cnrs.fr>
 <62f5735f-8b4e-c807-1ba5-0c0ff68f4dfd@mind.be>
Date: Thu, 07 Oct 2021 08:22:34 +0200
In-Reply-To: <62f5735f-8b4e-c807-1ba5-0c0ff68f4dfd@mind.be> (Arnout
 Vandecappelle's message of "Wed, 6 Oct 2021 21:23:47 +0200")
Message-ID: <87r1cx2w2d.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] support/kconfig: fix compiler warnings
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
Cc: Edgar Bonet <bonet@grenoble.cnrs.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Pj4+Pj4gIkFybm91dCIgPT0gQXJub3V0IFZhbmRlY2FwcGVsbGUgPGFybm91dEBtaW5kLmJlPiB3
cml0ZXM6CgogPiBPbiAyMi8wOS8yMDIxIDE2OjA4LCBFZGdhciBCb25ldCB3cm90ZToKID4+IENv
bXBpbGluZyBvbiBVYnVudHUgMjAuMDQgZ2VuZXJhdGVzIHRoaXM6CiA+PiAKID4+IC4vdXRpbC5j
OiBJbiBmdW5jdGlvbiDigJhmaWxlX3dyaXRlX2RlcOKAmQogPj4gLi91dGlsLmM6NTQ6MTg6IHdh
cm5pbmc6IOKAmC4uY29uZmlnLnRtcOKAmSBkaXJlY3RpdmUgd3JpdGluZyAxMiBieXRlcwogPj4g
aW50byBhIHJlZ2lvbiBvZiBzaXplIGJldHdlZW4gMSBhbmQgNDA5NyBbLVdmb3JtYXQtb3ZlcmZs
b3c9XQogPj4gNTQgfCAgc3ByaW50ZihidWYsICIlcy4uY29uZmlnLnRtcCIsIGRpcik7CiA+PiB8
ICAgICAgICAgICAgICAgICAgXn5+fn5+fn5+fn5+CiA+PiAuL3V0aWwuYzo1NDoyOiBub3RlOiDi
gJhzcHJpbnRm4oCZIG91dHB1dCBiZXR3ZWVuIDEzIGFuZCA0MTA5IGJ5dGVzIGludG8gYSBkZXN0
aW5hdGlvbiBvZiBzaXplIDQwOTcKID4+IDU0IHwgIHNwcmludGYoYnVmLCAiJXMuLmNvbmZpZy50
bXAiLCBkaXIpOwogPj4gfCAgXn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn4KID4+
IAogPj4gYW5kIHNpbWlsYXIgd2FybmluZ3Mgb24gY29uZmRhdGEuYywgbGluZXMgNzc4LCA5ODks
IDk5NSwgMTAwMCwgMTAwNywKID4+IDEwNDAsIDEwNDYgYW5kIDEwNTQuIEF2b2lkIHRoZSB3YXJu
aW5ncyBieSBlbmxhcmdpbmcgdGhlIGRlc3RpbmF0aW9uCiA+PiBidWZmZXIgb2YgZnByaW50Zigp
LgogPj4gCiA+PiBTaWduZWQtb2ZmLWJ5OiBFZGdhciBCb25ldCA8Ym9uZXRAZ3Jlbm9ibGUuY25y
cy5mcj4KID4+IC0tLQogPj4gc3VwcG9ydC9rY29uZmlnL2NvbmZkYXRhLmMgfCA0ICsrLS0KID4+
IHN1cHBvcnQva2NvbmZpZy91dGlsLmMgICAgIHwgMiArLQogPj4gMiBmaWxlcyBjaGFuZ2VkLCAz
IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgogPiAgTm9ybWFsbHksIHdoZW4gd2UgbWFr
ZSBjaGFuZ2VzIHRvIHRoZSBrY29uZmlnIHNvdXJjZXMsIHdlIHdhbnQgdG8KID4ga2VlcCB0cmFj
ayBvZiB0aGF0IHdpdGggcGF0Y2hlcyBpbiBzdXBwb3J0L2tjb25maWcvcGF0Y2hlcy4gVGhpcwog
PiBhbGxvd3MgdXMgdG8gdHJhY2sgdXBzdHJlYW0gd2l0aG91dCBsb29zaW5nIHRoZSBtb2RpZmlj
YXRpb25zIHdlIG1ha2UuCgogPiAgSG93ZXZlciwgaW4gdGhpcyBjYXNlLCB1cHN0cmVhbSBoYXMg
YWxyZWFkeSBoZWF2aWx5IG1vZGlmaWVkIHRob3NlCiA+IGZpbGVzLCBhbmQgZml4ZWQgdGhlIGlz
c3Vlcy4gU28gd2UgdGhlcmUncyBubyBuZWVkIHRvIGtlZXAgaXQgYXMKID4gcGF0Y2hlcy4KCiA+
ICBUaGVyZWZvcmUsIGFwcGxpZWQgdG8gbWFzdGVyLCB3aXRoIGFuIHVwZGF0ZWQgY29tbWl0IG1l
c3NhZ2UgdGhhdAogPiBleHBsYWlucyB0aGUgYWJvdmUsIHRoYW5rcy4KCkNvbW1pdHRlZCB0byAy
MDIxLjAyLngsIDIwMjEuMDUueCBhbmQgMjAyMS4wOC54LCB0aGFua3MuCgpNYXliZSBpdCBpcyB0
aW1lIHRvIHJlc3luYyBvdXQga2NvbmZpZyBjb3B5PwoKLS0gCkJ5ZSwgUGV0ZXIgS29yc2dhYXJk
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9v
dCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWls
ZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
