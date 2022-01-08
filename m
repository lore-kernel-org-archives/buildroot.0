Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23600C433F5
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 13:58:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B489240195;
	Sat,  8 Jan 2022 13:58:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id REboCQPE9OTk; Sat,  8 Jan 2022 13:58:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DA2DC40103;
	Sat,  8 Jan 2022 13:58:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 49F441BF301
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 13:58:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 30F9640106
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 13:58:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7iewnLo2xkTQ for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 13:58:14 +0000 (UTC)
X-Greylist: delayed 00:05:26 by SQLgrey-1.8.0
Received: from smtprelay07.ispgateway.de (smtprelay07.ispgateway.de
 [134.119.228.97])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0B2D2400D3
 for <buildroot@buildroot.org>; Sat,  8 Jan 2022 13:58:14 +0000 (UTC)
Received: from [94.220.116.10] (helo=sju.home.jstuber.net)
 by smtprelay07.ispgateway.de with esmtpa (Exim 4.94.2)
 (envelope-from <juergen@jstuber.net>)
 id 1n6C7C-0006uJ-UN; Sat, 08 Jan 2022 14:50:39 +0100
Date: Sat, 8 Jan 2022 14:52:44 +0100
From: Juergen Stuber <juergen@jstuber.net>
To: buildroot@buildroot.org
Message-ID: <20220108145237.63a25b31@sju.home.jstuber.net>
In-Reply-To: <20220107235959.2638b513@windsurf>
References: <20220106210000.397694-1-thomas.petazzoni@bootlin.com>
 <20220106210000.397694-6-thomas.petazzoni@bootlin.com>
 <CADvTj4rf+NisSUL7=Ee_=3bpDFCaxpsXmUzcOF=oUD5imqXbSQ@mail.gmail.com>
 <20220107105223.01912574@windsurf>
 <CADvTj4q+Ha1qvJ7t6YRRcmu9E8y-J_sU8=i0ZhdTzc1x_ZW+0A@mail.gmail.com>
 <20220107235959.2638b513@windsurf>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Df-Sender: OTE4MDk1
Subject: Re: [Buildroot] [PATCH v3 05/11] package/pkg-cargo.mk: introduce
 the cargo package infrastructure
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgVGhvbWFzLCBKYW1lcywgYWxsLAoKT24gRnJpLCA3IEphbiAyMDIyIDIzOjU5OjU5ICswMTAw
ClRob21hcyBQZXRhenpvbmkgPHRob21hcy5wZXRhenpvbmlAYm9vdGxpbi5jb20+IHdyb3RlOgo+
IE9uIEZyaSwgNyBKYW4gMjAyMiAxNjozMDoxMiAtMDYwMAo+IEphbWVzIEhpbGxpYXJkIDxqYW1l
cy5oaWxsaWFyZDFAZ21haWwuY29tPiB3cm90ZToKPiAKPiA+ID4gPiAgICAgQ0FSR09fVEFSR0VU
XyQoUlVTVENfVEFSR0VUX1RSSVBMRSlfTElOS0VSPSQobm90ZGlyCj4gPiA+ID4gJChUQVJHRVRf
Q1JPU1MpKWdjYyAgICAKPiA+ID4KPiA+ID4gSG93IGNvbWUgdGhpbmdzIGFyZSB3b3JraW5nIHRv
ZGF5IHdpdGggdGhpcyBvbmU/ICAgIAo+ID4gCj4gPiBJIHRoaW5rIHRoaXMgaXMgY3VycmVudGx5
IHNldCBpbiB0aGUgY2FyZ28gY29uZmlnIGZpbGUuICAKPiAKPiBBaCwgcmlnaHQ6Cj4gCj4gW3Rh
cmdldC5AUlVTVENfVEFSR0VUX05BTUVAXQo+IGxpbmtlciA9ICJAQ1JPU1NfUFJFRklYQGdjYyIK
PiAKPiBpbiBwYWNrYWdlL3J1c3RjL2NhcmdvLWNvbmZpZy5pbgoKdGhlIGNvbmZpZyBmaWxlIGhh
cyB0aGUgcHJvYmxlbSB0aGF0IGl0IGlzIGZvdW5kIHZpYSBDQVJHT19IT01FLAp3aGljaCBjb21l
cyBsYXN0IGluIHRoZSBzZWFyY2ggcGF0aCwgYWZ0ZXIgc2VhcmNoaW5nIHVwd2FyZCBpbiB0aGUK
ZGlyZWN0b3J5IGhpZXJhcmNoeS4gIFdoZW4gSSB1c2VkIFJ1c3QgdW5kZXIgYnVpbGRyb290IGZv
ciB0aGUgZmlyc3QKdGltZSwgYSBicm9rZW4gLmNhcmdvL2NvbmZpZyBpbiBteSBob21lIGRpcmVj
dG9yeSB3aGljaCBJIGhhZApjb21wbGV0ZWx5IGZvcmdvdHRlbiBhYm91dCBjYXVzZWQgdGhlIGJ1
aWxkIHRvIGZhaWwsIGFuZCBpdCB0b29rIG1lIGEKd2hpbGUgdG8gZmlndXJlIGl0IG91dC4KCkVu
dmlyb25tZW50IHZhcmlhYmxlcyB0YWtlIHByZWNlZGVuY2Ugb3ZlciBjb25maWcgZmlsZXMsIHNv
IElNSE8gdGhleQphcmUgdGhlIGJldHRlciBjaG9pY2UuCgo+ID4gPiAgLSBSZWxldmFuY2Ugb2YK
PiA+ID4gQ0FSR09fVEFSR0VUXyQoUlVTVENfVEFSR0VUX1RSSVBMRSlfTElOS0VSPSQobm90ZGly
Cj4gPiA+ICQoVEFSR0VUX0NST1NTKSlnY2MgICAgCj4gPiAKPiA+IFNldCB2aWEgQ0FSR09fSE9N
RSBjdXJyZW50bHksIGJ1dCBJIHRoaW5rIG1heSBhbGxvdyB0aGUgY2FyZ28KPiA+IGNvbmZpZyB0
byBub3QgYmUgcmVxdWlyZWQuICAKPiAKPiBJJ20gbm8gc3VyZSB3aHkgeW91IHNheSB0aGlzIGlz
IHNldCB2aWEgQ0FSR09fSE9NRT8gQmVjYXVzZSB0aGUKPiBjb25maWcgZmlsZSBpcyBzdG9yZWQg
aW4gJChDQVJHT19IT01FKS9jb25maWcgPwoKCkdyZWV0aW5ncwoKSsO8cmdlbgoKLS0gCkrDvHJn
ZW4gU3R1YmVyIDxqdWVyZ2VuQGpzdHViZXIubmV0PgpodHRwOi8vd3d3LmpzdHViZXIubmV0LwpU
ZWw6ICs0OS0yMDgtMzA0IDIwIDUwCk1vYmlsOiArNDktMTc4LTM5IDM5IDYyOAoxQjc4IEE1Nzkg
RTE1OSAyQTg1IDY3QkIgIDEzMTQgQzA4MyAyMjRCIDBGOUMgREEyMQpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1
aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2J1aWxkcm9vdAo=
