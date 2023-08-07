Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A45B8EB64DD
	for <buildroot@archiver.kernel.org>; Mon,  7 Aug 2023 11:47:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3704640272;
	Mon,  7 Aug 2023 11:47:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3704640272
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zgISJELH3mM2; Mon,  7 Aug 2023 11:47:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 19B2840227;
	Mon,  7 Aug 2023 11:47:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 19B2840227
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 58E691BF85D
 for <buildroot@lists.busybox.net>; Mon,  7 Aug 2023 11:47:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 76ABF8146A
 for <buildroot@lists.busybox.net>; Mon,  7 Aug 2023 11:45:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 76ABF8146A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fZnAupZxg8xO for <buildroot@lists.busybox.net>;
 Mon,  7 Aug 2023 11:45:23 +0000 (UTC)
Received: from helium.openadk.org (helium.openadk.org
 [IPv6:2a00:1828:2000:679::23])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9A24D80E6E
 for <buildroot@buildroot.org>; Mon,  7 Aug 2023 11:45:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9A24D80E6E
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 6BB1E3520C3F; Mon,  7 Aug 2023 13:45:18 +0200 (CEST)
Date: Mon, 7 Aug 2023 13:45:18 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <ZNDZTgPEnKnwH3qZ@waldemar-brodkorb.de>
References: <ZM/aaG0d/pzoYgp1@waldemar-brodkorb.de>
 <1f870f14-4bc1-1f8d-aa4e-e9f3e32f7f3c@benettiengineering.com>
 <e33edaae-e04b-c9fd-29f1-8bd6954d2d74@benettiengineering.com>
 <ZNCMCpph+op/jEC/@waldemar-brodkorb.de>
 <39b4139d-89d8-ad88-261d-29e29d2ac979@benettiengineering.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <39b4139d-89d8-ad88-261d-29e29d2ac979@benettiengineering.com>
X-Operating-System: Linux 5.10.0-21-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1691408718; bh=hNtaTtfAo+mhohV61US1qNuTkux2h2VzM7V0AG1np8U=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ck8MalNsYLH4chZbjaf5p29zFJ16Uu3vXXps1B3Udl6RV873uwU7fIKw5Did+pTLp
 sC4HLb4NmTkKF2bpRitcICN4jsZmctDibKdaM8cHSaZrHb11WZ0QZv7VfK/5hyNv2W
 7Cs9TzezMV8jcWQTlNp0YK82gJDz3U2leA4Fk9odwtIJl8PoIDnF7Rx579D33ELXRy
 cIqDPOFq7/9sxekCZ6r0+3X4n3mg5uHg7keog3iLIvcM2zp0AmoxL73hKuAVK5Owr/
 8fIWVf1SZK4lTmmF10AHVvPk0L4ESYpQ4dNTVf4wHWfGVd5uMF1RaoZj9OJpowv1/j
 +co+/sRt72x0Q==
Subject: Re: [Buildroot] [PATCH] package/openssh: fix compile issue for m68k
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgR2l1bGlvLApHaXVsaW8gQmVuZXR0aSB3cm90ZSwKCj4gSGkgV2FsZGVtYXIsCj4gCj4gT24g
MDcvMDgvMjMgMDg6MTUsIFdhbGRlbWFyIEJyb2Rrb3JiIHdyb3RlOgo+ID4gSGkgR2l1bGlvLAo+
ID4gR2l1bGlvIEJlbmV0dGkgd3JvdGUsCj4gPiAKPiA+ID4gT24gMDYvMDgvMjMgMjA6MzksIEdp
dWxpbyBCZW5ldHRpIHdyb3RlOgo+ID4gPiA+IEhpIFdhbGRlbWFyLAo+ID4gPiA+IAo+ID4gPiA+
IE9uIDA2LzA4LzIzIDE5OjM3LCBXYWxkZW1hciBCcm9ka29yYiB3cm90ZToKPiA+ID4gPiA+IEZv
bGxvd2luZyBJQ0Ugb2NjdXJzOgo+ID4gPiA+ID4gKGNkIG9wZW5ic2QtY29tcGF0ICYmIC9ob21l
L2F1dG9idWlsZC9tYWtlL21ha2UpCj4gPiA+ID4gPiBtYWtlWzJdOiBFbnRlcmluZyBkaXJlY3Rv
cnkgJy9ob21lL2F1dG9idWlsZC9hdXRvYnVpbGQvaW5zdGFuY2UtMTAvb3V0cHV0LTEvYnVpbGQv
b3BlbnNzaC05LjNwMS9vcGVuYnNkLWNvbXBhdCcKPiA+ID4gPiA+IC9ob21lL2F1dG9idWlsZC9h
dXRvYnVpbGQvaW5zdGFuY2UtMTAvb3V0cHV0LTEvaG9zdC9iaW4vbTY4ay1idWlsZHJvb3QtbGlu
dXgtdWNsaWJjLWdjYyAtRF9MQVJHRUZJTEVfU09VUkNFIC1EX0xBUkdFRklMRTY0X1NPVVJDRSAt
RF9GSUxFX09GRlNFVF9CSVRTPTY0wqAgLU8zIC1nMMKgIC1waXBlIC1Xbm8tZXJyb3I9Zm9ybWF0
LXRydW5jYXRpb24gLVdhbGwgLVdwb2ludGVyLWFyaXRoIC1XdW5pbml0aWFsaXplZCAtV3NpZ24t
Y29tcGFyZSAtV2Zvcm1hdC1zZWN1cml0eSAtV3NpemVvZi1wb2ludGVyLW1lbWFjY2VzcyAtV25v
LXBvaW50ZXItc2lnbiAtV25vLXVudXNlZC1yZXN1bHQgLVdpbXBsaWNpdC1mYWxsdGhyb3VnaCAt
V21pc2xlYWRpbmctaW5kZW50YXRpb24gLWZuby1zdHJpY3QtYWxpYXNpbmcgLURfRk9SVElGWV9T
T1VSQ0U9MiAtZnRyYXB2IC1memVyby1jYWxsLXVzZWQtcmVncz1hbGwgLWZuby1idWlsdGluLW1l
bXNldMKgwqAgLWZQSUMgLUkuIC1JLi4gLUkuIC1JLi8uLiAtRF9MQVJHRUZJTEVfU09VUkNFIC1E
X0xBUkdFRklMRTY0X1NPVVJDRSAtRF9GSUxFX09GRlNFVF9CSVRTPTY0IC1EX1hPUEVOX1NPVVJD
RT02MDAgLURfQlNEX1NPVVJDRSAtRF9ERUZBVUxUX1NPVVJDRSAtRF9HTlVfU09VUkNFIC1ESEFW
RV9DT05GSUdfSCAtYyBic2QtYXNwcmludGYuYwo+ID4gPiA+ID4gL2hvbWUvYXV0b2J1aWxkL2F1
dG9idWlsZC9pbnN0YW5jZS0xMC9vdXRwdXQtMS9ob3N0L2Jpbi9tNjhrLWJ1aWxkcm9vdC1saW51
eC11Y2xpYmMtZ2NjIC1EX0xBUkdFRklMRV9TT1VSQ0UgLURfTEFSR0VGSUxFNjRfU09VUkNFIC1E
X0ZJTEVfT0ZGU0VUX0JJVFM9NjTCoCAtTzMgLWcwwqAgLXBpcGUgLVduby1lcnJvcj1mb3JtYXQt
dHJ1bmNhdGlvbiAtV2FsbCAtV3BvaW50ZXItYXJpdGggLVd1bmluaXRpYWxpemVkIC1Xc2lnbi1j
b21wYXJlIC1XZm9ybWF0LXNlY3VyaXR5IC1Xc2l6ZW9mLXBvaW50ZXItbWVtYWNjZXNzIC1Xbm8t
cG9pbnRlci1zaWduIC1Xbm8tdW51c2VkLXJlc3VsdCAtV2ltcGxpY2l0LWZhbGx0aHJvdWdoIC1X
bWlzbGVhZGluZy1pbmRlbnRhdGlvbiAtZm5vLXN0cmljdC1hbGlhc2luZyAtRF9GT1JUSUZZX1NP
VVJDRT0yIC1mdHJhcHYgLWZ6ZXJvLWNhbGwtdXNlZC1yZWdzPWFsbCAtZm5vLWJ1aWx0aW4tbWVt
c2V0wqDCoCAtZlBJQyAtSS4gLUkuLiAtSS4gLUkuLy4uIC1EX0xBUkdFRklMRV9TT1VSQ0UgLURf
TEFSR0VGSUxFNjRfU09VUkNFIC1EX0ZJTEVfT0ZGU0VUX0JJVFM9NjQgLURfWE9QRU5fU09VUkNF
PTYwMCAtRF9CU0RfU09VUkNFIC1EX0RFRkFVTFRfU09VUkNFIC1EX0dOVV9TT1VSQ0UgLURIQVZF
X0NPTkZJR19IIC1jIGJzZC1jbG9zZWZyb20uYwo+ID4gPiA+ID4gZHVyaW5nIFJUTCBwYXNzOiB6
ZXJvX2NhbGxfdXNlZF9yZWdzCj4gPiA+ID4gPiBic2QtY2xvc2Vmcm9tLmM6IEluIGZ1bmN0aW9u
ICdjbG9zZWZyb20nOgo+ID4gPiA+ID4gYnNkLWNsb3NlZnJvbS5jOjE1MToxOiBpbnRlcm5hbCBj
b21waWxlciBlcnJvcjogaW4gY2hhbmdlX2FkZHJlc3NfMSwKPiA+ID4gPiA+IGF0IGVtaXQtcnRs
LmM6MjI3NQo+ID4gPiA+ID4gIMKgwqAgMTUxIHwgfQo+ID4gPiA+ID4gIMKgwqDCoMKgwqDCoCB8
IF4KPiA+ID4gPiA+IDB4N2ZhNzZmNGJhZDA5IF9fbGliY19zdGFydF9tYWluCj4gPiA+ID4gPiAg
wqDCoMKgwqAuLi9jc3UvbGliYy1zdGFydC5jOjMwOAo+ID4gPiA+ID4gUGxlYXNlIHN1Ym1pdCBh
IGZ1bGwgYnVnIHJlcG9ydCwKPiA+ID4gPiA+IHdpdGggcHJlcHJvY2Vzc2VkIHNvdXJjZSBpZiBh
cHByb3ByaWF0ZS4KPiA+ID4gPiA+IFBsZWFzZSBpbmNsdWRlIHRoZSBjb21wbGV0ZSBiYWNrdHJh
Y2Ugd2l0aCBhbnkgYnVnIHJlcG9ydC4KPiA+ID4gPiA+IFNlZSA8aHR0cDovL2J1Z3MuYnVpbGRy
b290Lm5ldC8+IGZvciBpbnN0cnVjdGlvbnMuCj4gPiA+ID4gPiBtYWtlWzJdOiAqKiogW01ha2Vm
aWxlOjEwNjogYnNkLWNsb3NlZnJvbS5vXSBFcnJvciAxCj4gPiA+ID4gPiAKPiA+ID4gPiA+IEZp
eGVzIGZvbGxvd2luZyBhdXRvYnVpbGQgZmFpbHVyZToKPiA+ID4gPiA+IGh0dHA6Ly9hdXRvYnVp
bGQuYnVpbGRyb290Lm5ldC9yZXN1bHRzL2QyOS9kMjljNjYyZTQxZDg5NjllNmE4YWEyNDg3MGU3
MjhiY2M3MDUwNTYzLwo+ID4gPiA+ID4gCj4gPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBXYWxkZW1h
ciBCcm9ka29yYiA8d2J4QG9wZW5hZGsub3JnPgo+ID4gPiA+ID4gLS0tCj4gPiA+ID4gPiAgwqAg
cGFja2FnZS9vcGVuc3NoL29wZW5zc2gubWsgfCA1ICsrKysrCj4gPiA+ID4gPiAgwqAgMSBmaWxl
IGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKQo+ID4gPiA+ID4gCj4gPiA+ID4gPiBkaWZmIC0tZ2l0
IGEvcGFja2FnZS9vcGVuc3NoL29wZW5zc2gubWsgYi9wYWNrYWdlL29wZW5zc2gvb3BlbnNzaC5t
awo+ID4gPiA+ID4gaW5kZXggZTE0ZDc1MjI5MC4uNjVmMDIwODhhMCAxMDA2NDQKPiA+ID4gPiA+
IC0tLSBhL3BhY2thZ2Uvb3BlbnNzaC9vcGVuc3NoLm1rCj4gPiA+ID4gPiArKysgYi9wYWNrYWdl
L29wZW5zc2gvb3BlbnNzaC5tawo+ID4gPiA+ID4gQEAgLTM1LDYgKzM1LDExIEBAIGRlZmluZSBP
UEVOU1NIX1BFUk1JU1NJT05TCj4gPiA+ID4gPiAgwqDCoMKgwqDCoCAvdmFyL2VtcHR5IGQgNzU1
IHJvb3Qgcm9vdCAtIC0gLSAtIC0KPiA+ID4gPiA+ICDCoCBlbmRlZgo+ID4gPiA+ID4gKyMgd29y
a2Fyb3VuZCBnY2MgSUNFIHdpdGggMTEueC8xMi54IGFuZCAxMy54Cj4gPiA+ID4gPiAraWZlcSAo
JChCUjJfbTY4aykseSkKPiA+ID4gPiA+ICtPUEVOU1NIX0NPTkZfT1BUUyArPSAtLXdpdGhvdXQt
aGFyZGVuaW5nCj4gPiA+ID4gPiArZW5kaWYKPiA+ID4gPiA+ICsKPiA+ID4gPiAKPiA+ID4gPiBU
aGlzIGRlc2VydmVzIGEgZ2NjIGJ1ZyB0aGF0IEkndmUgYWRkZWQgd2l0aCB0aGlzIHBhdGNoOgo+
ID4gPiA+IGh0dHBzOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcvcHJvamVjdC9idWlsZHJvb3QvcGF0
Y2gvMjAyMzA4MDYxODM3MzguMjU3MDA2LTEtZ2l1bGlvLmJlbmV0dGlAYmVuZXR0aWVuZ2luZWVy
aW5nLmNvbS8KPiA+ID4gPiAKPiA+ID4gPiB0aGlzIGlzIHRoZSBidWc6Cj4gPiA+ID4gaHR0cHM6
Ly9nY2MuZ251Lm9yZy9idWd6aWxsYS9zaG93X2J1Zy5jZ2k/aWQ9ODA3ODYKPiA+ID4gPiAKPiA+
ID4gPiBhbmQgZm9yIGNvbnNpc3RlbmN5IGluIEJ1aWxkcm9vdCB3ZSB0ZW5kIHRvIHdvcmstYXJv
dW5kIGdjYy9iaW51dGlscwo+ID4gPiA+IGJ1Z3MsIHdoZW5ldmVyIHBvc3NpYmxlLCBieSBsb3dl
cmluZyB0aGUgb3B0aW1pemF0aW9uIHRvIC1PMCwgc28gSSBhc2sKPiA+ID4gPiB5b3UgdG8gc2Vu
ZCBhIHBhdGNoIGRvaW5nIHRoaXMuCj4gPiA+ID4gWW91IGNhbiB0YWtlIGFzIGEgbW9kZWwgdGhp
cyBjb21taXQgZm9yIHRoZSBjb21taXQgbG9nIHRvbzoKPiA+ID4gPiBodHRwczovL2dpdGxhYi5j
b20vYnVpbGRyb290Lm9yZy9idWlsZHJvb3QvLS9jb21taXQvODAzMjQ3MzM3ZDM1NjQzYWZkY2E5
NzE4YzQ2MTY1MDBiOTkzMGYyZAo+ID4gPiAKPiA+ID4gQnkgdGhlIHdheSBJJ3ZlIGdpdmVuIGEg
dHJ5IHdpdGggLU8wIHdvcmthcm91bmQgYnV0IGl0IHN0aWxsIHNob3dzIGdjYwo+ID4gPiBJQ0Ug
d2l0aCBnY2MgMTMuMi4wLiBTbyBhdCB0aGlzIHBvaW50IEkgd291bGQgZGlzYWJsZSBoYXJkZW5p
bmcgbGlrZQo+ID4gPiB5b3UndmUgcHJvcG9zZWQgYnV0IGJ5IGNoZWNraW5nIGZvciBCUjJfVE9P
TENIQUlOX0hBU19HQ0NfQlVHXzgwNzg2Cj4gPiA+IGluc3RlYWQgb2YgQlIyX202OGsuIENhbiB5
b3UgcHJvdmlkZSBzdWNoIHBhdGNoIHBvaW50aW5nIHRoYXQgaXQKPiA+ID4gZGVwZW5kcyBvbiBt
aW5lIG9uIGEgY292ZXIgbGV0dGVyIG9yIGFmdGVyIHRoZSAzIGRhc2hlcz8KPiA+IAo+ID4gQXJl
IHlvdSBzdXJlIGl0IGlzIHRoZSBzYW1lIGdjYyBidWcgd2Ugc2VlaW5nIGhlcmUuIEkgd291bGQg
c2F5IGl0Cj4gPiBoYXMgc29tZXRoaW5nIHRvIGRvIHdpdGggLWZ6ZXJvLWNhbGwtdXNlZC1yZWdz
PWFsbCBpbnN0ZWFkLgo+IAo+IE9oLCBJIHRoaW5rIHlvdSBhcmUgcmlnaHQsIHNvIGNhbiB5b3Ug
cGxlYXNlIHN1Ym1pdCBhIG5ldyBnY2MgYnVnIGZvciB0aGlzPwoKSSBvcGVuZWQgYSBidWcgcmVw
b3J0OgpodHRwczovL2djYy5nbnUub3JnL2J1Z3ppbGxhL3Nob3dfYnVnLmNnaT9pZD0xMTA5MzQK
CkhvdyB0byBwcm9jZWVkIG5vdz8gSXMgaXQgcG9zc2libGUgdG8gYXBwZW5kIHRoZSBDRkxBR1MK
LWZ6ZXJvLWNhbGwtdXNlZC1yZWdzPXVzZWQgc29tZWhvdz8KCmJlc3QgcmVnYXJkcwogV2FsZGVt
YXIKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRy
b290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1
aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
