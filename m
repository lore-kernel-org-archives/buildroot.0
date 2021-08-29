Return-Path: <SRS0=tQX8=NU=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6439C432BE
	for <buildroot@archiver.kernel.org>; Sun, 29 Aug 2021 11:40:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3568660ED4
	for <buildroot@archiver.kernel.org>; Sun, 29 Aug 2021 11:40:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3568660ED4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0E1A380F39;
	Sun, 29 Aug 2021 11:40:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id P3PVxIdeMeya; Sun, 29 Aug 2021 11:40:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2A77F80F49;
	Sun, 29 Aug 2021 11:40:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 749921BF2EA
 for <buildroot@lists.busybox.net>; Sun, 29 Aug 2021 11:40:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 62CD540123
 for <buildroot@lists.busybox.net>; Sun, 29 Aug 2021 11:40:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DaK3790N2Tsl for <buildroot@lists.busybox.net>;
 Sun, 29 Aug 2021 11:40:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EB9D5400A8
 for <buildroot@buildroot.org>; Sun, 29 Aug 2021 11:40:05 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 818EDFF807;
 Sun, 29 Aug 2021 11:39:57 +0000 (UTC)
Date: Sun, 29 Aug 2021 13:39:55 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <20210829133955.74d921e9@windsurf>
In-Reply-To: <20210828224740.GS2661@scaer>
References: <20210817083930.3718711-1-herve.codina@bootlin.com>
 <20210817083930.3718711-8-herve.codina@bootlin.com>
 <20210828224740.GS2661@scaer>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v3 07/16] package/pkg-generic.mk: detect
 files overwritten in TARGET_DIR and HOST_DIR
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
Cc: Herve Codina <herve.codina@bootlin.com>,
 Naumann Andreas <ANaumann@ultratronik.de>, Peter Seiderer <ps.report@gmx.net>,
 Julien Corjon <corjon.j@ecagroup.com>, buildroot@buildroot.org,
 Ricardo Martincoski <ricardo.martincoski@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

SGVsbG8gWWFubiwKCkZpcnN0IG9mIGFsbCwgdGhhbmtzIGEgbG90IGZvciByZXZpZXdpbmcgYW5k
IG1lcmdpbmcgYml0cyBvZiB0aGlzIHBhdGNoCnNlcmllcywgSSdtIGdsYWQgdG8gc2VlIHdlJ3Jl
IG1ha2luZyBwcm9ncmVzcyB3aXRoIHRoZSBUTFAgc3R1ZmYuCgpPbiBTdW4sIDI5IEF1ZyAyMDIx
IDAwOjQ3OjQwICswMjAwCiJZYW5uIEUuIE1PUklOIiA8eWFubi5tb3Jpbi4xOTk4QGZyZWUuZnI+
IHdyb3RlOgoKPiBIb3dldmVyLCB3aGF0IHByb21wdGVkIG1lIGZyb20gYXBwbHlpbmcgZm9yIG5v
dywgaXMgdGhhdCB0aGlzIG5ldwo+IGRldGVjdGlvbiBpcyBhIGhhcmQgZXJyb3IuCj4gCj4gUHJl
dmlvdXNseSwgY2hlY2stdW5pcS1maWxlcyB3YXMganVzdCBlbWl0dGluZyB3YXJuaW5ncywgYnV0
IHdvdWxkIG5vdAo+IHByZXZlbnQgdGhlIGJ1aWxkIGZyb20gZmFpbGluZy4gTm93LCB3aXRoIHRo
aXMgcGF0Y2gsIGV2ZW4gYW4gaW5ub2N1b3VzCj4gb3ZlcndyaXRlIChlLmcuIGJlY2F1c2UgYSBw
b3N0LWJ1aWxkIHNjcmlwdCBkZWxldGVzIHRoZSBmaWxlLCBvciB0aGUKPiBjb250ZW50IG9mIHRo
ZSBmaWxlIHJlYWxseSBkb2VzIG5vdCBtYXR0ZXIgYXQgcnVudGltZSksIHRoZSBidWlsZCB3aWxs
Cj4gZmFpbC4KPiAKPiBJLmUuIGNvbmZpZ3VyYXRpb25zIHRoYXQgYXJlIGN1cnJlbnRseSB3b3Jr
aW5nIHdpdGggUFBELCBkZXNwaXRlIHRoZQo+IG92ZXJ3cml0ZSwgd2lsbCBzdWRkZW5seSBubyBs
b25nZXIgYnVpbGQuCj4gCj4gT1RPSCwgaWYgd2UgZG8gbm90IG1ha2UgdGhhdCBhIGhhcmQtZXJy
b3IsIHdlIHdpbGwgbmV2ZXIgZGV0ZWN0IG1vc3QKPiBpc3N1ZXMsIGJlY2F1c2UgdXNlcnMgd2ls
bCBuZXZlciBzcG90IHRob3NlIHdhcm5pbmdzIGFuZCB3aWwgZW52ZXIKPiByZXBvcnQgaXNzdWVz
LCBhbmQgdGhlIGF1dG9idWlsZGVycyB3aWxsIG5vdCBmYWlsIGFuZCB3ZSB3aWxsIG5vdAo+IG5v
dGljZSBlaXRoZXIuLi4KPiAKPiBPbmUgc29sdXRpb24gaXMgdG8gYWRkIGEgY29uZmlndXJhdGlv
biBrbm9iIHRvIG1ha2UgdGhhdCBhIGhhcmQtZXJyb3IsCj4gbGlrZSB3ZSBoYXZlIHRoZSBwYXJh
bm9pZCBsaWJzL2hlYWRlcnMgY2hlY2s6Cj4gCj4gICAgIGNvbmZpZyBCUjJfUFBEX09WRVJXUklU
RV9TVFJJQ1QKPiAgICAgICAgIGJvb2wgIlN0cmljdCBmaWxlIG92ZXJ3cml0ZSBkZXRlY3Rpb24i
Cj4gICAgICAgICBkZXBlbmRzIG9uIEJSMl9QRVJfUEFDS0FHRV9ESVJFQ1RPUklFUwo+ICAgICAg
ICAgaGVscAo+ICAgICAgICAgICBTYXkgJ3knIGhlcmUgdG8gdHVybiB0aGUgZmlsZSBvdmVyd3Jp
dGUgZGV0ZWN0aW9uCj4gICAgICAgICAgIHRvIGEgaGFyZCBlcnJvci4gQnkgZGVmYXVsdCwgb25s
eSB3YXJuaW5ncyB3aWxsIGJlCj4gICAgICAgICAgIHByaW50ZWQuCgpXZSBoYWQgc29tZSBkaXNj
dXNzaW9uIHdpdGggSGVydsOpIGJhY2sgd2hlbiBoZSB3b3JrZWQgb24gdGhpcywgYW5kIEkKZGlz
YWdyZWVkIHdpdGggYWRkaW5nIGFuIG9wdGlvbi4gV2hlbiBCUjJfUEVSX1BBQ0tBR0VfRElSRUNU
T1JJRVM9eSwgYQpmaWxlIG92ZXJ3cml0ZSBtdXN0IGJlIGEgaGFyZCBlcnJvciwgYXMgdGhlIHJl
c3VsdCBvZiB0aGUgYnVpbGQgaXMKaW5jb3JyZWN0IGlmIHRoZXJlIGlzIGFuIG92ZXJ3cml0ZS4g
SXQncyBub3QgdGhlICJsYXRlc3QiIHBhY2thZ2UgdGhhdAp3aW5zIGluIGFuIG92ZXJ3cml0ZSBz
aXR1YXRpb24sIGxpa2UgaXQgZG9lcyBpbiBhIG5vbi1QUEQgY2FzZS4KClNvIEkgcmVhbGx5IHRo
aW5rIHRoaXMgbXVzdCBiZSBhIGhhcmQgZXJyb3IgZm9yIFBQRCBidWlsZHMsIGFuZCBqdXN0IGEK
d2FybmluZyBmb3Igbm9uLVBQRCBidWlsZHMuCgpZZXMsIGZvciBQUEQgYnVpbGRzLCBpdCBtZWFu
cyB1c2VycyB3aWxsIGdldCBmYWlsdXJlcywgYnV0IHRob3NlCmZhaWx1cmVzIGFyZSBwb2ludGlu
ZyB0byByZWFsIHByb2JsZW1zLgoKU28sIG15IHByZWZlcmVuY2Ugd291bGQgYmUgdG8gbWVyZ2Ug
YXMgYW4gdW5jb25kaXRpb25hbCBjaGVjaywgYW5kIHNlZQpob3cgaXQgZ29lcy4gUGVyaGFwcyB0
aGUgc2l0dWF0aW9uIHdpbGwgYmUgc28gYmFkIHRoYXQgd2Ugd2lsbCBoYXZlIHRvCm1ha2UgaXQg
Y29uZGl0aW9uYWwsIGJ1dCBJIHdvdWxkIHByZWZlciB0byBoYXZlIGl0IHVuY29uZGl0aW9uYWwg
Zmlyc3QKYW5kIHNlZSB0aGUgaW1wYWN0LgoKQmVzdCByZWdhcmRzLAoKVGhvbWFzCi0tIApUaG9t
YXMgUGV0YXp6b25pLCBjby1vd25lciBhbmQgQ0VPLCBCb290bGluCkVtYmVkZGVkIExpbnV4IGFu
ZCBLZXJuZWwgZW5naW5lZXJpbmcKaHR0cHM6Ly9ib290bGluLmNvbQpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1
aWxkcm9vdEBidXN5Ym94Lm5ldApodHRwOi8vbGlzdHMuYnVzeWJveC5uZXQvbWFpbG1hbi9saXN0
aW5mby9idWlsZHJvb3QK
