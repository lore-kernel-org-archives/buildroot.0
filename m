Return-Path: <SRS0=7Mk9=NP=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C444CC4338F
	for <buildroot@archiver.kernel.org>; Tue, 24 Aug 2021 21:03:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 54E496113B
	for <buildroot@archiver.kernel.org>; Tue, 24 Aug 2021 21:03:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 54E496113B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1391E404E2;
	Tue, 24 Aug 2021 21:03:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QUxe8HqooRDq; Tue, 24 Aug 2021 21:03:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 783F0406EA;
	Tue, 24 Aug 2021 21:02:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 177FC1BF5A5
 for <buildroot@lists.busybox.net>; Tue, 24 Aug 2021 21:02:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 115666131B
 for <buildroot@lists.busybox.net>; Tue, 24 Aug 2021 21:02:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2UbL1sZfp5qc for <buildroot@lists.busybox.net>;
 Tue, 24 Aug 2021 21:02:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7C5E260C23
 for <buildroot@buildroot.org>; Tue, 24 Aug 2021 21:02:52 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 398ECE0003;
 Tue, 24 Aug 2021 21:02:48 +0000 (UTC)
Date: Tue, 24 Aug 2021 23:02:47 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Jonah Petri <jonah@petri.us>
Message-ID: <20210824230247.19116d61@windsurf>
In-Reply-To: <78204681-4e6d-625e-718a-fe9be05c682b@petri.us>
References: <20210824201657.1553593-1-jonah@petri.us>
 <78204681-4e6d-625e-718a-fe9be05c682b@petri.us>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] toolchain: handle toolchains with multiple
 ld*.so.* files
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

SGVsbG8sCgpPbiBUdWUsIDI0IEF1ZyAyMDIxIDE2OjM1OjM2IC0wNDAwCkpvbmFoIFBldHJpIDxq
b25haEBwZXRyaS51cz4gd3JvdGU6Cgo+IFNvcnJ5IGZvciB0aGUgbWlzc2luZyBTT0IgLSBJIHdp
bGwgcmVzdWJtaXQuwqAgVGhlIGluc3RydWN0aW9ucyBvbiAKPiBodHRwczovL2J1aWxkcm9vdC5v
cmcvZG93bmxvYWRzL21hbnVhbC9tYW51YWwuaHRtbCNzdWJtaXR0aW5nLXBhdGNoZXMgCj4gbWln
aHQgbmVlZCBhIG1vZGlmaWNhdGlvbiwgYXMgSSBmb2xsb3dlZCB0aGVtIHByZWNpc2VseSwgSSB0
aGluayEgRXhwZWN0IAo+IGEgdjIgc2hvcnRseSB3aXRoIGEgU09CLgoKVGhhbmtzIGZvciB5b3Vy
IHBhdGNoIGFuZCBnb2luZyB0aHJvdWdoIG91ciBtYW51YWwuIElmIHlvdSB0aGluawphbnl0aGlu
ZyBpcyBtaXNzaW5nLCB0aGUgbWFudWFsIHNvdXJjZSBjb2RlIGlzIGluIGRvY3MvbWFudWFsLywg
c28geW91CmNhbiBlYXNpbHkgc2VuZCBhIHBhdGNoLgoKSG93ZXZlciwgSSB0aGluayB0aGlzIHJl
cXVpcmVtZW50IGZvciBhIFNpZ25lZC1vZmYtYnkgaXMgY2xlYXJseSBpbiBvdXIKaW5zdHJ1Y3Rp
b25zLiBTZWN0aW9uIDIyLjUuMSBvZiBvdXIgbWFudWFsIGhhczoKCiAgRmluYWxseSwgdGhlIHBh
dGNoIHNob3VsZCBiZSBzaWduZWQgb2ZmLiBUaGlzIGlzIGRvbmUgYnkgYWRkaW5nCiAgU2lnbmVk
LW9mZi1ieTogWW91ciBSZWFsIE5hbWUgPHlvdXJAZW1haWwuYWRkcmVzcz4gYXQgdGhlIGVuZCBv
ZiB0aGUKICBjb21taXQgbWVzc2FnZS4gZ2l0IGNvbW1pdCAtcyBkb2VzIHRoYXQgZm9yIHlvdSwg
aWYgY29uZmlndXJlZAogIHByb3Blcmx5LiBUaGUgU2lnbmVkLW9mZi1ieSB0YWcgbWVhbnMgdGhh
dCB5b3UgcHVibGlzaCB0aGUgcGF0Y2gKICB1bmRlciB0aGUgQnVpbGRyb290IGxpY2Vuc2UgKGku
ZS4gR1BMLTIuMCssIGV4Y2VwdCBmb3IgcGFja2FnZQogIHBhdGNoZXMsIHdoaWNoIGhhdmUgdGhl
IHVwc3RyZWFtIGxpY2Vuc2UpLCBhbmQgdGhhdCB5b3UgYXJlIGFsbG93ZWQKICB0byBkbyBzby4g
U2VlIHRoZSBEZXZlbG9wZXIgQ2VydGlmaWNhdGUgb2YgT3JpZ2luIGZvciBkZXRhaWxzLgoKQmVz
dCByZWdhcmRzIQoKVGhvbWFzCi0tIApUaG9tYXMgUGV0YXp6b25pLCBjby1vd25lciBhbmQgQ0VP
LCBCb290bGluCkVtYmVkZGVkIExpbnV4IGFuZCBLZXJuZWwgZW5naW5lZXJpbmcKaHR0cHM6Ly9i
b290bGluLmNvbQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidXN5Ym94Lm5ldApodHRwOi8vbGlz
dHMuYnVzeWJveC5uZXQvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
