Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E466CC433EF
	for <buildroot@archiver.kernel.org>; Wed, 29 Jun 2022 14:37:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 32621408C4;
	Wed, 29 Jun 2022 14:37:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 32621408C4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id erJrtM_-LQo7; Wed, 29 Jun 2022 14:37:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 23A41408A5;
	Wed, 29 Jun 2022 14:37:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 23A41408A5
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4AF131BF28F
 for <buildroot@lists.busybox.net>; Wed, 29 Jun 2022 14:37:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3318C41765
 for <buildroot@lists.busybox.net>; Wed, 29 Jun 2022 14:37:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3318C41765
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lN1WqTnD8IK4 for <buildroot@lists.busybox.net>;
 Wed, 29 Jun 2022 14:37:40 +0000 (UTC)
X-Greylist: delayed 00:07:48 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E10A9408F5
Received: from p3plwbeout24-05.prod.phx3.secureserver.net
 (p3plsmtp24-05-2.prod.phx3.secureserver.net [68.178.252.190])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E10A9408F5
 for <buildroot@buildroot.org>; Wed, 29 Jun 2022 14:37:39 +0000 (UTC)
Received: from mta3.hi.local ([80.90.192.40]) by :WBEOUT: with ESMTP
 id 6YhRoFZJ4pgYp6YhSokoiH; Wed, 29 Jun 2022 07:29:50 -0700
X-CMAE-Analysis: v=2.4 cv=LKSj/La9 c=1 sm=1 tr=0 ts=62bc61de
 a=K/BDc0tkBMwso/NugpMgSw==:117 a=2eo2s28fbmYZrAxBaqkYIw==:17
 a=iM8gF-fFnuYA:10 a=IkcTkHD0fZMA:10 a=JPEYwPQDsx4A:10 a=J0Tn2xNtAAAA:8
 a=JVBWz-2_AAAA:8 a=Fy-Okl9_lPCnGshJuMoA:9 a=QEXdDO2ut3YA:10
 a=9ZcRxastL33iXWX1AWsW:22 a=8kFqV9tar1MRicDWUqxP:22
X-SECURESERVER-ACCT: busybox_mail@rovoreed.com
X-SID: 6YhRoFZJ4pgYp
Received: from [94.10.198.228] (helo=[192.168.1.172])
 by mta3.hi.local with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <busybox_mail@rovoreed.com>) id 1o6YhR-0006S6-0P
 for buildroot@buildroot.org; Wed, 29 Jun 2022 15:29:49 +0100
Message-ID: <b8ccd688c2c755964b5aff6ecfd7ff53a6c6e8fa.camel@rovoreed.com>
From: Mike Davies <busybox_mail@rovoreed.com>
To: buildroot@buildroot.org
Date: Wed, 29 Jun 2022 15:29:48 +0100
In-Reply-To: <2209e11a-bda9-5193-9b4d-20a5f0fa34e3@linatsea.fr>
References: <2209e11a-bda9-5193-9b4d-20a5f0fa34e3@linatsea.fr>
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35) 
MIME-Version: 1.0
X-SA-Score: 1.0
X-Heart-Authenticated: busybox_mail@rovoreed.com
X-Originating-IP: 94.10.198.228
X-CMAE-Envelope: MS4xfOQmqCFvjzBdGFSoVtGFlY9D+fIBWCBVRlz/Psx2z5f27sWic3nqRRYSxhBT+J9UO0tg5tIxNwnBN+HAEc5TgR37PDLEw1rDndi26efw5IIEsOGNLFCd
 qDLzn8ptxu/rOLXv62KOYfbk1FC8J4HykIZ7ttfTnzSqSe44EXAY6tem9KZ5lH6GqOjOy88zO0S1WK0mayf+OnZDdH/skVCd3dQ=
Subject: Re: [Buildroot] candidate packages : ros2 and wxwidgets
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

T24gV2VkLCAyMDIyLTAxLTA1IGF0IDEwOjQ2ICswMTAwLCBUaGllcnJ5IEJ1bHRlbCB3cm90ZToK
PiBIaSwKPiAKPiBGb3IgYSBudW1iZXIgb2YgY29tcGFuaWVzLCBJIGNhbiBzZWUgYSBncm93aW5n
IGludGVyZXN0IGluIGhhdmluZwo+IHJvczIgCj4gc3VwcG9ydCBpbiBidWlsZHJvb3QuCj4gQ3Vy
cmVudGx5LCBwZW9wbGUgd2FudGluZyB0byBwcm90b3R5cGUgKG9yIG1ha2UgYSBwcm9kdWN0KSBh
IHJvYm90aWNzCj4gYXBwbGljYXRpb25zLCBhcmUgc3R1Y2sKPiB0byBlaXRoZXIgeW9jdG8sIG9y
LCB3b3JzZSwgdG8gYSBkZXNrdG9wLWxpa2UgZGlzdHJpYnV0aW9uLgo+IAo+IAoKSSBoYXZlIG9u
bHkganVzdCBzdHVtYmxlZCBhY3Jvc3MgdGhpcyB0aHJlYWQuCgpJIGhhdmUgc3BlbnQgbWFueSBo
b3VycyAob3ZlciAxMDAgc28gZmFyKSB0cnlpbmcgdG8gZ2V0IFJPUzIgYnVpbHQgYXMKcGFydCBv
ZiBidWlsZHJvb3QuIEkgaGF2ZSBiZWVuIHVzaW5nIHRoZSByZWNvbW1lbmRlZCBST1Mgc291cmNl
IGJ1aWxkCnJvdXRlIG9mIHVzaW5nIHJvc2RlcC9jb2xjb24gZXRjLiwgdG8gYnVpbGQgUk9TMiBH
YWxhY3RpYyBhbmQgbW9yZQpyZWNlbnRseSBIdW1ibGUKClN0YXJ0aW5nIHdpdGggYnVpbGRyb290
LTIwMjIuMDIgSSBoYXZlIGhhZCB0byBhZGQgNDEgbmV3IHBhY2thZ2VzLCBhbmQKYWx0ZXIgYW4g
ZXhpc3RpbmcgNiBwYWNrYWdlcyAtIGVpdGhlciBhZGRpbmcgaG9zdCBidWlsZHMgb3IgY2hhbmdp
bmcKY29uZmlndXJhdGlvbiBvcHRpb25zLgoKU28gZmFyIEkgaGF2ZSBtYW5hZ2VkIHRvIGJ1aWxk
IDE1NyBvZiB0aGUgMzQwIG9kZCBjb21wb25lbnRzLiBJIGNhbiBnZXQKY29kZSBvbnRvIHRoZSB0
YXJnZXQsIGJ1dCBpdCBkb2Vzbid0IGRvIGEgbG90IGJlY2F1c2Ugc28gbWFueQpjb21wb25lbnRz
IGFyZSBtaXNzaW5nLgoKQWxhcywgSSBoYXZlIGdvdCB0byB0aGUgc3RhZ2Ugd2hlcmUgSSB0aGlu
ayBpdCBpcyBubyBsb25nZXIgcG9zc2libGUgdG8KcHJvZ3Jlc3MsIG9yIGF0IGxlYXN0LCBpdCBp
cyBnb2luZyB0byB0YWtlIHZhc3RseSBtb3JlIHRpbWUgdGhhbiBJIGFtCndpbGxpbmcgdG8gdGFr
ZS4KCk15IGxhdGVzdCBwcm9ibGVtIGlzIHRoYXQgUk9TMiBhc3N1bWVzIFB5dGhvbiBjb21wbGll
cyB3aXRoIFBFUDMxNDkgLQp3aGljaCBpcyBub3QgZW50aXJlbHkgdW5yZWFzb25hYmxlIHNpbmNl
IFBFUDMxNDkgY2FtZSBvdXQgMTIgeWVhcnMgYWdvLgpQRVAzMTQ5IGlzIGFuIGV4dGVuc2lvbiBv
ZiBQRVAzMTQ3LCBhbmQgUEVQMzE0NyBoYXMgYmVlbiBwYXRjaGVkIG91dCBvZgp0aGUgYnVpbGRy
b290IHZlcnNpb24gb2YgUHl0aG9uIHRvIHNhdmUgc3BhY2UuIEFsb25nc2lkZSB0aGlzIHRoZXJl
IGFyZQprbm93biBwcm9ibGVtcyBjcm9zcyBjb21waWxpbmcgUk9TMiAtIGFuZCBmb2xsb3dpbmcg
dmFyaW91cyB0aHJlYWRzIGl0CmFwcGVhcnMgdGhhdCB0aGVzZSBwcm9ibGVtcyBoYXZlIGJlZW4g
a25vd24gYWJvdXQgZm9yIHllYXJzLiBUcnkgYQpzZWFyY2ggZm9yIFBZVEhPTl9TT0FCSSB3aGlj
aCBhcHBlYXJzIHJlbGF0ZWQuCgpTaG91bGQgYW55b25lIG5lZWQgYSByb2JvdGljcyBpbmZyYXN0
cnVjdHVyZSwgdGhlbiBNUlBUIG1pZ2h0IGJlIGFuCmFuc3dlci4gSXQgdG9vayBsZXNzIHRoYW4g
YSBkYXkgdG8gZ2V0IHRoYXQgdXAgYW5kIHJ1bm5pbmcgaW4KYnVpbGRyb290LCBidXQgTVJQVCBp
cyBsZXNzIHdpZGVseSB1c2VkLgoKSSBtYXkgY29udGludWUgd2l0aCB0aGlzIHBvcnQgb2YgUk9T
Mi4gSXQgaGFzIGJlZW4gZWR1Y2F0aW9uYWwgLSBoYXZpbmcKbGVhcm50IGEgbG90IGFsb25nIHRo
ZSB3YXksIGFuZCBwcm9iYWJseSBtb3JlIHRvIGxlYXJuLCBidXQgSSBkb24ndAp0aGluayBpdCdz
IGdvaW5nIHRvIGJlIHBvc3NpYmxlIHdpdGhvdXQgYSBsb3Qgb2YgYnV0Y2hlcnkgdG8gYnVpbGRy
b290CiYgdGhhdCBtYXkgaGF2ZSBpbXBsaWNhdGlvbnMgZm9yIGV4aXN0aW5nIHVzZXJzLgoKCj4g
QW5vdGhlciB0b3BpYyBpcyBjaGFydHMgZGlzcGxheWluZyBmb3Igc2FpbGluZy4gVGhlIG1vc3Qg
ZmFtb3VzIAo+IGFwcGxpY2F0aW9uIChtb3N0bHkgdXNlZAo+IG9uIHJhc3BiZXJyeSBieSBzYWls
b3JzKSBpcyBPcGVuQ3BuLCB3aGljaCBpcyBncmVhdCBidXQgcmVsaWVzIG9uCj4gd3hXaWRnZXRz
Lgo+IAo+IFdoZXJlYXMgSSBhbSBsb29raW5nIGZvciBhIHNwb25zb3IgZm9yIGFkZGluZyByb3My
IHRvIGJ1aWxkcm9vdCwgCj4gKGJlY2F1c2UgaXQgaXMgYSBxdWl0ZSBzaWduaWZpY2FudCB3b3Jr
LAo+IHRoYXQgaW1wbGllcyB0byBhZGQgYSBuZXcgYnVpbGQgZnJhbWV3b3JrKSwgSSBhbSB0aGlu
a2luZyBhYm91dCB1c2luZwo+IG15IAo+IChsaXR0bGUpIGZyZWUgdGltZSBmb3Igd3hXaWRnZXRz
IChhbmQgT3BlbkNwbiBsYXRlcikuCj4gVGhlcmUgaGFzIGJlZW4gYW4gYXR0ZW1wdCBpcyB0aGUg
cGFzdCAKPiAoaHR0cHM6Ly9idWdzLmJ1c3lib3gubmV0L3Nob3dfYnVnLmNnaT9pZD0yNjEpIGJ1
dCBpdCBkb2VzIG5vdAo+IHNlZW0gdG8gaGF2ZSBsZWFkIHRvIGFueXRoaW5nIGVsc2Ugc2luY2Ug
dGhhdCB0aW1lLgo+IAo+IFdoYXQgYXJlIHlvdXIgdGhvdWdodCBhYm91dCB0aGVzZSBib3RoIHBh
Y2thZ2VzID8gQW55IGlkZWFzLCBvciBsaW5rcwo+IHRvIAo+IHNvbWUgV0lQIHN0dWZmID8KPiAK
PiBCZXN0IHJlZ2FyZHMKPiBUaGllcnJ5Cj4gCj4gLS0gCj4gUmU6IHRlc3QKPiB3d3cubGluYXRz
ZWEuZnLCoDx3d3cubGluYXRzZWEuZnI+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJv
b3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxk
cm9vdAo=
