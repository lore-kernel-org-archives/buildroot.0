Return-Path: <SRS0=A6xV=PJ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1933C433EF
	for <buildroot@archiver.kernel.org>; Thu, 21 Oct 2021 16:30:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 382FE613A3
	for <buildroot@archiver.kernel.org>; Thu, 21 Oct 2021 16:30:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 382FE613A3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0270F83C87;
	Thu, 21 Oct 2021 16:30:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ql0JfHlCgni3; Thu, 21 Oct 2021 16:30:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 38BB983C75;
	Thu, 21 Oct 2021 16:30:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 288861BF20B
 for <buildroot@lists.busybox.net>; Thu, 21 Oct 2021 16:30:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1812F606ED
 for <buildroot@lists.busybox.net>; Thu, 21 Oct 2021 16:30:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=ideasonboard.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zqQb012rhnI5 for <buildroot@lists.busybox.net>;
 Thu, 21 Oct 2021 16:30:37 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C807D605C2
 for <buildroot@buildroot.org>; Thu, 21 Oct 2021 16:30:37 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 857338B6;
 Thu, 21 Oct 2021 18:30:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1634833834;
 bh=a8EwgCmJd/o9bp4zrcoXRa7Zn11Phnvjgg/UHxwzOIY=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=T77RsV68VFNvHc8Kx8ukq4hx8RG/rJD2TtLvhesHYi7kUhTsMGsTYA0uRO2JNB36r
 VbNpvQ3Tg3UCmge7+Mr05XYotaVWc867ePDNZK11cuMRbHeDfD6tYJkiIQlkME4FNM
 NDn2bo+vK8iRuxVerQLeV1OONzcfx0LXlAagQ5Q4=
MIME-Version: 1.0
In-Reply-To: <CAPi7W83vxd8_KX=UCxVNZoKYxODXnKkTxUmu3saKJYStK9JLdw@mail.gmail.com>
References: <20211020190423.3547893-1-fontaine.fabrice@gmail.com>
 <163480816021.2663858.13418966210945898355@Monstersaurus>
 <CAPi7W83vxd8_KX=UCxVNZoKYxODXnKkTxUmu3saKJYStK9JLdw@mail.gmail.com>
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 21 Oct 2021 17:30:31 +0100
Message-ID: <163483383168.4018488.6875581227372699361@Monstersaurus>
User-Agent: alot/0.9.1
Subject: Re: [Buildroot] [PATCH 1/1] package/libcamera: disable compliance
 tool
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
Cc: Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

UXVvdGluZyBGYWJyaWNlIEZvbnRhaW5lICgyMDIxLTEwLTIxIDE3OjA1OjUxKQo+IEhpIEtpZXJh
biwKPiAKPiBMZSBqZXUuIDIxIG9jdC4gMjAyMSDDoCAxMToyMiwgS2llcmFuIEJpbmdoYW0KPiA8
a2llcmFuLmJpbmdoYW1AaWRlYXNvbmJvYXJkLmNvbT4gYSDDqWNyaXQgOgo+ID4KPiA+IEhpIEZh
YnJpY2UsCj4gPgo+ID4gUXVvdGluZyBGYWJyaWNlIEZvbnRhaW5lICgyMDIxLTEwLTIwIDIwOjA0
OjIzKQo+ID4gPiBEaXNhYmxlIGNvbXBsaWFuY2UgdG9vbCB0byBmaXggdGhlIGZvbGxvd2luZyBi
dWlsZCBmYWlsdXJlCj4gPiA+IHJhaXNlZCBzaW5jZSBjb21taXQgZTFkMzdhYjBhN2IyYjg3MzVl
NjljMDcwNTE5OTc4ZDI4OThkMmU3OSBhbmQKPiA+ID4gaHR0cHM6Ly9naXQubGludXh0di5vcmcv
bGliY2FtZXJhLmdpdC9jb21taXQvP2lkPTAyYmMxMTA4NTc4ZThiOGViNjhmYTdkOWFlM2VlZWE1
NTg3MjM5MzE6Cj4gPiA+Cj4gPiA+IC91c3IvbGZzL2hkZF92MS9yYy1idWlsZHJvb3QtdGVzdC9z
Y3JpcHRzL2luc3RhbmNlLTEvb3V0cHV0LTEvaG9zdC9saWIvZ2NjL2FybS1idWlsZHJvb3QtbGlu
dXgtdWNsaWJjZ251ZWFiaS8xMC4zLjAvLi4vLi4vLi4vLi4vYXJtLWJ1aWxkcm9vdC1saW51eC11
Y2xpYmNnbnVlYWJpL2Jpbi9sZDogY2Fubm90IGZpbmQgLWxndGVzdAo+ID4gPgo+ID4gPiBGaXhl
czoKPiA+ID4gIC0gaHR0cDovL2F1dG9idWlsZC5idWlsZHJvb3Qub3JnL3Jlc3VsdHMvZTFiYjhh
YTFkZTMxMGYzZDI3Yjc0ZWM3ZDg3NDhkMTcwYWQ0NDRlMgo+ID4gPgo+ID4KPiA+IEFueSBpZGVh
IHdoeSB3ZSdyZSBmYWlsaW5nIHRvIGZpbmQgZ3Rlc3Q/Cj4gTm9wZSwgSSBkaWRuJ3QgdGFrZSB0
aW1lIHRvIGZpbmQgb3V0IHdoeSB0aGlzIGlzIGZhaWxpbmcgYXMgSSB0aGluawo+IHRoYXQgbGMt
Y29tcGxpYW5jZSBpcyBqdXN0IG5vdCBuZWVkZWQgaW4gdGhlIGNvbnRleHQgb2YgYnVpbGRyb290
IChhcwo+IGd0ZXN0IGlzIG5vdCBpbnN0YWxsZWQgb24gdGFyZ2V0KS4KPiA+Cj4gPiBPdXIgbWVz
b24uYnVpbGQgZm9yIHNyYy9sYy1jb21wbGlhbmNlIGNvbnRhaW5zIHRoZSBmb2xsb3dpbmc6Cj4g
Pgo+ID4gIiIiCj4gPiAjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBDQzAtMS4wCj4gPgo+ID4g
bGliZXZlbnQgPSBkZXBlbmRlbmN5KCdsaWJldmVudF9wdGhyZWFkcycsIHJlcXVpcmVkIDogZ2V0
X29wdGlvbignbGMtY29tcGxpYW5jZScpKQo+ID4gbGliZ3Rlc3QgPSBkZXBlbmRlbmN5KCdndGVz
dCcsIHJlcXVpcmVkIDogZ2V0X29wdGlvbignbGMtY29tcGxpYW5jZScpKQo+ID4KPiA+IGlmIG5v
dCAobGliZXZlbnQuZm91bmQoKSBhbmQgbGliZ3Rlc3QuZm91bmQoKSkKPiA+ICAgICBsY19jb21w
bGlhbmNlX2VuYWJsZWQgPSBmYWxzZQo+ID4gICAgIHN1YmRpcl9kb25lKCkKPiA+IGVuZGlmCj4g
Pgo+ID4gbGNfY29tcGxpYW5jZV9lbmFibGVkID0gdHJ1ZQo+ID4gIiIiCj4gPgo+ID4gV2hpY2gg
aW1wbGllcyB0aGF0IGxpYmd0ZXN0IHdhcyBmb3VuZCBkdXJpbmcgdGhlIGNvbmZpZ3VyYXRpb24g
cGhhc2UsCj4gPiBidXQgbm90IGR1cmluZyB0aGUgbGlua2luZyBwaGFzZS4uLi4KPiA+Cj4gPiBJ
cyBsaWJndGVzdCBidWlsdCBhcyBwYXJ0IG9mIHRoaXMgYnVpbGQgY29uZmlndXJhdGlvbj8gSWYg
aXQgaXMgLSBJJ2QKPiA+IGV4cGVjdCBsYy1jb21wbGlhbmNlIHRvIGdldCBidWlsdCBhZ2FpbnN0
IGl0LiBJZiBub3QgLSB0aGVuIGl0IHdvdWxkCj4gPiBhdXRvbWF0aWNhbGx5IGJlIGRpc2FibGVk
IGJ5IG91ciBidWlsZC4uLgo+IFllcywgaXQgaXMgYnVpbHQgYW5kIGZvdW5kIGJ5IG1lc29uIG90
aGVyd2lzZSBsYy1jb21wbGlhbmNlIHdvbid0IGJlCj4gYnVpbHQgYnV0IGZvciBhbiB1bmtub3du
IHJlYXNvbiwgdGhlIGxpbmsgc3RlcCBmYWlscy4KCllvdSd2ZSBtZW50aW9uZWQgYWJvdmUgdGhh
dCBndGVzdCB3b24ndCBiZSBpbnN0YWxsZWQgb24gdGhlIHRhcmdldC4uLiBTbwouLiBJIHdvdWxk
IGV4cGVjdCB0aGF0IG1lYW5zIGl0IGlzbid0IGluIHRoZSB0YXJnZXQgc3lzcm9vdCwgYW5kIGNh
bid0CmJlIGxpbmtlZCBhZ2FpbnN0LgoKU28gaXQgc2VlbXMgdGhhdCBmb3Igc29tZSByZWFzb24g
bWVzb24gZmluZHMgYSBob3N0IHBhY2thZ2UgaW5zdGVhZCBvZiBhCnRhcmdldCBwYWNrYWdlPwoK
RG8gd2UgaGF2ZSBhIHdheSB0byBkaWZmZXJlbnRpYXRlIHRoZXNlIGluIGJ1aWxkcm9vdD8KCkkn
bSBub3Qgc3VyZSBpZiB0aGVyZSdzIHNvbWUgYnVpbGRyb290IHdpemFyZHJ5IHRoYXQgd291bGQg
bWFrZQpsaWJjYW1lcmEncyBjb25maWd1cmUgcGhhc2Ugc2VlIG9ubHkgdGhlIHBhY2thZ2VzIHRo
YXQgYXJlIGluc3RhbGxlZCBvbgp0aGUgdGFyZ2V0IHdoZW4gYmVpbmcgYnVpbHQsIGJ1dCBpZiBi
dWlsZHJvb3QgZG9lc24ndCBzdXBwb3J0IGluc3RhbGxpbmcKZ3Rlc3QgYXQgYWxsIC0gdGhlbiBp
bmRlZWQgdGhlcmUgaXNuJ3QgYW55IHBvaW50IHN1cHBvcnRpbmcKbGMtY29tcGxpYW5jZSB3aGlj
aCByZXF1aXJlcyBpdC4KCgo+ID4KPiA+Cj4gPiA+IFNpZ25lZC1vZmYtYnk6IEZhYnJpY2UgRm9u
dGFpbmUgPGZvbnRhaW5lLmZhYnJpY2VAZ21haWwuY29tPgo+ID4gPiAtLS0KPiA+ID4gIHBhY2th
Z2UvbGliY2FtZXJhL2xpYmNhbWVyYS5tayB8IDEgKwo+ID4gPiAgMSBmaWxlIGNoYW5nZWQsIDEg
aW5zZXJ0aW9uKCspCj4gPiA+Cj4gPiA+IGRpZmYgLS1naXQgYS9wYWNrYWdlL2xpYmNhbWVyYS9s
aWJjYW1lcmEubWsgYi9wYWNrYWdlL2xpYmNhbWVyYS9saWJjYW1lcmEubWsKPiA+ID4gaW5kZXgg
OGFiOTVmYjQyYS4uNjM4YzlhYzU1MyAxMDA2NDQKPiA+ID4gLS0tIGEvcGFja2FnZS9saWJjYW1l
cmEvbGliY2FtZXJhLm1rCj4gPiA+ICsrKyBiL3BhY2thZ2UvbGliY2FtZXJhL2xpYmNhbWVyYS5t
awo+ID4gPiBAQCAtMTcsNiArMTcsNyBAQCBMSUJDQU1FUkFfREVQRU5ERU5DSUVTID0gXAo+ID4g
PiAgTElCQ0FNRVJBX0NPTkZfT1BUUyA9IFwKPiA+ID4gICAgICAgICAtRGFuZHJvaWQ9ZGlzYWJs
ZWQgXAo+ID4gPiAgICAgICAgIC1EZG9jdW1lbnRhdGlvbj1kaXNhYmxlZCBcCj4gPiA+ICsgICAg
ICAgLURsYy1jb21wbGlhbmNlPWRpc2FibGVkIFwKPiA+ID4gICAgICAgICAtRHRlc3Q9ZmFsc2Ug
XAo+ID4gPiAgICAgICAgIC1Ed2Vycm9yPWZhbHNlCj4gPiA+ICBMSUJDQU1FUkFfSU5TVEFMTF9T
VEFHSU5HID0gWUVTCj4gPiA+IC0tCj4gPiA+IDIuMzMuMAo+ID4gPgo+IEJlc3QgUmVnYXJkcywK
PiAKPiBGYWJyaWNlCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6
Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
