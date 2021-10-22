Return-Path: <SRS0=MwHx=PK=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36959C433F5
	for <buildroot@archiver.kernel.org>; Fri, 22 Oct 2021 09:48:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6CA73610EA
	for <buildroot@archiver.kernel.org>; Fri, 22 Oct 2021 09:48:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6CA73610EA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id ACC1783B14;
	Fri, 22 Oct 2021 09:48:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OkHQgDh4HXFA; Fri, 22 Oct 2021 09:48:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 15EEB83AFC;
	Fri, 22 Oct 2021 09:48:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A02DC1BF86B
 for <buildroot@lists.busybox.net>; Fri, 22 Oct 2021 09:48:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9B3B24019E
 for <buildroot@lists.busybox.net>; Fri, 22 Oct 2021 09:48:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id F26vR_APUYdu for <buildroot@lists.busybox.net>;
 Fri, 22 Oct 2021 09:48:28 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6CBFA40172
 for <buildroot@buildroot.org>; Fri, 22 Oct 2021 09:48:28 +0000 (UTC)
Received: (Authenticated sender: kory.maincent@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id 4513724000F;
 Fri, 22 Oct 2021 09:48:25 +0000 (UTC)
Date: Fri, 22 Oct 2021 11:48:24 +0200
From: =?UTF-8?B?S8O2cnk=?= Maincent <kory.maincent@bootlin.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <20211022114824.4e9ae29f@kmaincent-XPS-13-7390>
In-Reply-To: <20211021175901.GE2400@scaer>
References: <DB6P194MB00220117F126EF57A84FB509B7B19@DB6P194MB0022.EURP194.PROD.OUTLOOK.COM>
 <20211007235019.51751a53@gmx.net>
 <DB6P194MB0022286BBE77E2174FE40B87B7B29@DB6P194MB0022.EURP194.PROD.OUTLOOK.COM>
 <20211008192555.6dbd67d2@gmx.net>
 <DB6P194MB0022742E4E1B12DFEAC7FD24B7B59@DB6P194MB0022.EURP194.PROD.OUTLOOK.COM>
 <DB6P194MB0022C662CECD3D29EB4BA064B7B59@DB6P194MB0022.EURP194.PROD.OUTLOOK.COM>
 <20211019002255.165e5e00@gmx.net>
 <AM0P194MB0706FB2963323BD5D657815EB7BD9@AM0P194MB0706.EURP194.PROD.OUTLOOK.COM>
 <20211019230252.324bbb61@gmx.net> <20211021175901.GE2400@scaer>
Organization: bootlin
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] Boot process stuck at "GRUB loading.." since
 2021.02.1
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
Cc: Peter Seiderer <ps.report@gmx.net>, "Walter,
 Stefan" <stefan.walter@iml.fraunhofer.de>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

WWFubiwgUGV0ZXIsIFN0ZWZhbiwgYWxsCgpPbiBUaHUsIDIxIE9jdCAyMDIxIDE5OjU5OjAxICsw
MjAwCiJZYW5uIEUuIE1PUklOIiA8eWFubi5tb3Jpbi4xOTk4QGZyZWUuZnI+IHdyb3RlOgoKPiA+
IDxzdGVmYW4ud2FsdGVyQGltbC5mcmF1bmhvZmVyLmRlPiB3cm90ZTogVGhlIGhvc3QtZ3J1YjIg
bW9kdWxlcyBidWlsZCBjYW4KPiA+IGJlIGZpeGVkIGJ5IHRoZSBmb2xsb3dpbmcgcGF0Y2g6Cj4g
PiAKPiA+IC0tLSBhL2Jvb3QvZ3J1YjIvZ3J1YjIubWsKPiA+ICsrKyBiL2Jvb3QvZ3J1YjIvZ3J1
YjIubWsKPiA+IEBAIC0xMjUsNyArMTI1LDkgQEAgR1JVQjJfVFVQTEVTLSQoQlIyX1RBUkdFVF9H
UlVCMl9BUk02NF9FRkkpICs9IGFybTY0LWVmaQo+ID4gICMgdXNlIHRoZSBjcm9zcyBjb21waWxl
IHZhcmlhbnQgdG8gZW5zdXJlIGdydWIyIGJ1aWxkcwo+ID4gCj4gPiAgSE9TVF9HUlVCMl9DT05G
X0VOViA9IFwKPiA+IC0gICAgICAgQ1BQPSIkKEhPU1RDQykgLUUiCj4gPiArICAgICAgIENQUD0i
JChIT1NUQ0MpIC1FIiBcCj4gPiArICAgICAgIENGTEFHUz0iJChIT1NUX0NGTEFHUykgLU9zIiBc
Cj4gPiArICAgICAgIENQUEZMQUdTPSIkKEhPU1RfQ1BQRkxBR1MpIC1PcyIgIAo+IAo+IFN1cmUs
IGJ1dCB3aHkgZG8gd2UgZXZlbiBuZWVkIHRvIGJ1aWxkIHRoZSBtb2R1bGVzIGluIHRoZSBob3N0
IHZlcnNpb24KPiB0byBiZWdpbiB3aXRoPwoKSSBhZ3JlZS4gVGhpcyBwYXRjaCBzZWVtcyBub3Qg
cmVsZXZhbnQuIFdlIGJ1aWxkIGhvc3QtZ3J1YjIgb25seSBmb3IgdGhlCmJpbmFyaWVzLiBTdGVm
YW4gc2hvdWxkIHVzZSB0aGUgdGFyZ2V0IG1vZHVsZXMgZGlyZWN0b3J5IGFuZCBub3QgdGhlIG9u
ZQpmcm9tIHRoZSBob3N0LgoKPiBXZSBzaG91bGQgcHJvYmFibHkgYnVpbGQgdGhlIGhvc3QgdmVy
c2lvbiB3aXRoIC0td2l0aC1wbGF0Zm9ybT1ub25lIEkKPiB0aGluay4KPiAKPiBZZXMsIHdlIGRv
IGN1cnJlbnRseSB1c2UgY2Rib290LmltZyBmcm9tIHRoZSBob3N0LCBidXQgdGhhdCBpcyBwcm9i
YWJseQo+IGEgbWlzdGFrZSBhbmQgYSByZW1uYW50IGZvciBsb25nIGFnby4uLiBJbnN0ZWFkLCBJ
IHRoaW5rIHdlIHNob3VsZCBvbmx5Cj4gdXNlZCBtb2R1bGVzIGZyb20gdGhlIHRhcmdldCBidWls
ZC4KCkkgd2lsbCBhZGQgdGhlIG5vbmUgcGxhdGZvcm0gYW5kIHRoZSByaWdodCBjZGJvb3QuaW1n
IHBhdGggaW50byBteSB2MiBncnViIHBhdGNoCnNlcmllcy4KClJlZ2FyZHMsCkvDtnJ5Cl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWls
aW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qu
b3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
