Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EAEAEE3F3B
	for <buildroot@archiver.kernel.org>; Tue, 12 Sep 2023 21:53:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AE9858139B;
	Tue, 12 Sep 2023 21:53:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AE9858139B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1xX6qqcEzd-J; Tue, 12 Sep 2023 21:53:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E7DF18135B;
	Tue, 12 Sep 2023 21:53:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E7DF18135B
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 734181BF421
 for <buildroot@lists.busybox.net>; Tue, 12 Sep 2023 21:53:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5924640BFA
 for <buildroot@lists.busybox.net>; Tue, 12 Sep 2023 21:53:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5924640BFA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Im5RukQM4YIr for <buildroot@lists.busybox.net>;
 Tue, 12 Sep 2023 21:53:38 +0000 (UTC)
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B994A40550
 for <buildroot@buildroot.org>; Tue, 12 Sep 2023 21:53:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B994A40550
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id A1A0719F574;
 Tue, 12 Sep 2023 23:53:32 +0200 (CEST)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:37174])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 12 Sep 2023 23:53:32 +0200
MIME-Version: 1.0
Date: Tue, 12 Sep 2023 23:53:32 +0200
From: Julien Olivain <ju.o@free.fr>
To: Marcus Folkesson <marcus.folkesson@gmail.com>
In-Reply-To: <ZQBfUcvieaqDg7sv@gmail.com>
References: <20230908082741.409005-1-marcus.folkesson@gmail.com>
 <20230908225704.0aafa7eb@windsurf> <ZPxtEfe6FVIucVWS@gmail.com>
 <20230909155549.15a4b507@windsurf>
 <35d775ed8e08f7082c025d0c32f53bb4@free.fr> <ZP4cBkx2VFsfsN7M@gmail.com>
 <6316e92cc730f0e9fdd11379a95dd10b@free.fr> <ZQBfUcvieaqDg7sv@gmail.com>
User-Agent: Webmail Free/1.6.1
Message-ID: <a0991242abf58a2ea58071b1e32837f0@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1694555614;
 bh=24XX4cvxwEkpiJJse3LbKCQY7S/dh50pWBG0S+ktsDE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=NYzbl2bkXx86qnYQ4q27hnxvIpAOkZzvNXSQAXAR+YR8iTrVGRt3nMNcXBGqRbSEb
 MLepNnEdOtfMaFnIxiUIOnUpUcPBDnX3aPv6HyAdWInTdhM0m8EQ7q+3qMiy6GDKDp
 wp/7KjVCFbgMcd01ECoHZx+HmJn3fU9FM3cPzaZYvfsw/MJjHDb3SG/vqjQf0oW0Yr
 W5bG3/lsKH1liLPCAwTYgfZm4jghZRBHhIA4wRlOD2bAmKlxDgKguJCWyiqoklCpqK
 xGfBr2Zfk9m1JnMfyZhVHslsqioE8/FHPWeASXue6Ht4EVInsuF4c+BiAucl5YZkGb
 8NkBy3ijwh5GA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=NYzbl2bk
Subject: Re: [Buildroot] [PATCH 1/2] package/criu: new package
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgTWFyY3VzLAoKT24gMTIvMDkvMjAyMyAxNDo1MywgTWFyY3VzIEZvbGtlc3NvbiB3cm90ZToK
PiBIaSBKdWxpZW4sCj4gCj4gCj4gT24gU3VuLCBTZXAgMTAsIDIwMjMgYXQgMTE6MDU6MTlQTSAr
MDIwMCwgSnVsaWVuIE9saXZhaW4gd3JvdGU6Cj4+IEhpIE1hcmN1cywKPj4gCj4+IE9uIDEwLzA5
LzIwMjMgMjE6NDEsIE1hcmN1cyBGb2xrZXNzb24gd3JvdGU6Cj4+ID4gSGkgSnVsaWVuLAo+PiA+
Cj4+ID4gT24gU2F0LCBTZXAgMDksIDIwMjMgYXQgMTE6MTY6MjdQTSArMDIwMCwgSnVsaWVuIE9s
aXZhaW4gd3JvdGU6Cj4+ID4gPiBIaSBUaG9tYXMsIE1hcmN1cywKPj4gPiA+Cj4+ID4gPiBPbiAw
OS8wOS8yMDIzIDE1OjU1LCBUaG9tYXMgUGV0YXp6b25pIHdyb3RlOgo+PiA+ID4gPiBPbiBTYXQs
IDkgU2VwIDIwMjMgMTU6MDM6MTMgKzAyMDAKPj4gPiA+ID4gTWFyY3VzIEZvbGtlc3NvbiA8bWFy
Y3VzLmZvbGtlc3NvbkBnbWFpbC5jb20+IHdyb3RlOgo+PiA+ID4gPgo+PiA+ID4gPiA+IFRoYW5r
IHlvdSBmb3IgeW91ciBzb2xpZCByZXZpZXcuCj4+ID4gPgo+PiA+ID4gWy4uLl0KPj4gPiA+Cj4+
ID4gPiA+IE9uZSBnb29kIHRoaW5nIHdvdWxkIGJlIHRvIGhhdmUgYSBydW50aW1lIHRlc3QgZm9y
IGNyaXUsIGluCj4+ID4gPiA+IHN1cHBvcnQvdGVzdGluZy4gSnVsaWVuIE9saXZhaW4gKGluIENj
KSBjYW4gcHJvYmFibHkgcHJvdmlkZSBzb21lCj4+ID4gPiA+IGd1aWRhbmNlIGhlcmUuCj4+ID4g
Pgo+PiA+ID4KPj4gPiA+IE1hcmN1cywgeW91IHNob3VsZCBiZSBhYmxlIHRvIHJlcHJvZHVjZSB0
aGF0IHdpdGggdGhlIGNvbW1hbmQ6Cj4+ID4gPgo+PiA+ID4gICAgIHV0aWxzL3Rlc3QtcGtnIC1w
IGNyaXUKPj4gPgo+PiA+IEkndmUgc2VudCBvdXQgYSB2MiB3aGVyZSB0aGUgY29tbWVudHMgZnJv
bSBUaG9tYXMgaXMgYWRkcmVzc2VkLiBCdXQgSSBhbQo+PiA+IG5vdCBhYmxlIHRvIHJlcHJvZHVj
ZSB0aGUgZXJyb3JzIHlvdSBnb3Qgd2l0aCB0ZXN0LXBrZy4KPj4gPgo+PiA+IEknbSBub3Qgc3Vy
ZSB3aHkgaXQgc2tpcHMgbXkgdGVzdHMuIENvdWxkIHlvdSBwbGVhc2UgcHJvdmlkZSBzb21lCj4+
ID4gZ3VpZGFuY2U/Cj4+IAo+PiBBbGwgdGVzdCBhcmUgc2tpcHBlZCBiZWNhdXNlIG9mIHRoZSAi
ZGVwZW5kcyBvbgo+PiBCUjJfUEFDS0FHRV9IT1NUX1BZVEhPTjMiIG5vdCBiZWluZyBzZXQgYnkg
ZGVmYXVsdC4KPj4gCj4+IEknbSBub3Qgc3VyZSBpcyB0aGlzICJkZXBlbmRzIG9uIiBpcyByZWFs
bHkgbmVlZGVkLCBhcyBJIGV4cGVjdCBpdAo+PiB0byBiZSBhIGJ1aWxkIGRlcGVuZGVuY3kuIElm
IGl0J3MgdGhlIGNhc2UsIHRoZSBkZXBlbmRlbmN5IGlzIG9ubHkKPj4gbmVlZGVkIGluIHRoZSAu
bWsgZmlsZS4gSSBsZXQgdGhlIHJldmlld2VycyBjb21tZW50IHRoZSB2MiBwYXRjaAo+PiBvbiB0
aGF0IHRvcGljLi4uCj4+IAo+PiBBbnl3YXlzLCBmb3IgdGhlIG1vbWVudCwgdGhpcyBjYW4gYmUg
bWFuYWdlZCBieSBtYW51YWxseSBjcmVhdGluZyBhCj4+IGNvbmZpZyBzZXR0aW5nIHRoaXMgZm9y
IHRlc3QtcGtnLiBGb3IgZXhhbXBsZToKPj4gCj4+ICAgICBjYXQgPiBjcml1LmNvbmZpZyA8PEVP
Rgo+PiAgICAgQlIyX1BBQ0tBR0VfSE9TVF9QWVRIT04zPXkKPj4gICAgIEJSMl9QQUNLQUdFX0NS
SVU9eQo+PiAgICAgRU9GCj4+IAo+PiBUaGVuLCB0ZXN0LXBrZyB3aWxsIG5vIGxvbmdlciBza2lw
IHRoZSB0ZXN0cy4gT24gbXkgc2lkZSwgSSBub3cgc2VlOgo+PiAKPj4gICAgIHV0aWxzL3Rlc3Qt
cGtnIC1jIGNyaXUuY29uZmlnIC1wIGNyaXUKPj4gICAgICAgICAgICAgICAgICAgICBib290bGlu
LWFybXY1LXVjbGliYyBbMS82XTogRkFJTEVECj4+ICAgICAgICAgICAgICAgICAgICAgIGJvb3Rs
aW4tYXJtdjctZ2xpYmMgWzIvNl06IEZBSUxFRAo+PiAgICAgICAgICAgICAgICAgICAgYm9vdGxp
bi1hcm12N20tdWNsaWJjIFszLzZdOiBTS0lQUEVECj4+ICAgICAgICAgICAgICAgICAgICAgIGJv
b3RsaW4teDg2LTY0LW11c2wgWzQvNl06IE9LCj4+ICAgICAgICAgICAgICAgICAgICAgICBici1h
cm0tZnVsbC1zdGF0aWMgWzUvNl06IFNLSVBQRUQKPj4gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHNvdXJjZXJ5LWFybSBbNi82XTogRkFJTEVECj4+ICAgICA2IGJ1aWxkcywgMiBza2lwcGVk
LCAzIGJ1aWxkIGZhaWxlZCwgMCBsZWdhbC1pbmZvIGZhaWxlZCwgMCAKPj4gc2hvdy1pbmZvCj4+
IGZhaWxlZAo+PiAKPj4gSSBsZXQgeW91IGluc3BlY3QgdGhlIGJ1aWxkIGxvZyBmaWxlcyB+L2Jy
LXRlc3QtcGtnLyovbG9nZmlsZSBmb3IKPj4gdGhlIGRldGFpbHMuCj4gCj4gCj4gVGhlIGVycm9y
IHNlZW1zIHRvIGJlIHJlbGF0ZWQgdG8gaG9zdC1saWJ6bGliIHJhdGhlciB0aGFuIGNyaXUgOi0v
Cj4gCj4gCj4gbWFrZVsxXTogTGVhdmluZyBkaXJlY3RvcnkgCj4gJy9ob21lL21hcmN1cy9tbnQv
ZW5jd29yay9naXQvYnItdGVzdC1wa2cvYm9vdGxpbi1hcm12NS11Y2xpYmMvYnVpbGQvaG9zdC1s
aWJ6bGliLTEuMycKPiAqKioKPiAqKiogRVJST1I6IHBhY2thZ2UgaG9zdC1saWJ6bGliIGluc3Rh
bGxzIGV4ZWN1dGFibGVzIHdpdGhvdXQgcHJvcGVyIAo+IFJQQVRIOgo+ICoqKiAgIAo+IC9ob21l
L21hcmN1cy9tbnQvZW5jd29yay9naXQvYnItdGVzdC1wa2cvYm9vdGxpbi1hcm12NS11Y2xpYmMv
aG9zdC9iaW4veG1sd2YKPiAqKiogICAKPiAvaG9tZS9tYXJjdXMvbW50L2VuY3dvcmsvZ2l0L2Jy
LXRlc3QtcGtnL2Jvb3RsaW4tYXJtdjUtdWNsaWJjL2hvc3QvYmluL3BrZ2NvbmYKPiAqKiogICAK
PiAvaG9tZS9tYXJjdXMvbW50L2VuY3dvcmsvZ2l0L2JyLXRlc3QtcGtnL2Jvb3RsaW4tYXJtdjUt
dWNsaWJjL2hvc3QvYmluL3Byb3RvYwo+ICoqKiAgIAo+IC9ob21lL21hcmN1cy9tbnQvZW5jd29y
ay9naXQvYnItdGVzdC1wa2cvYm9vdGxpbi1hcm12NS11Y2xpYmMvaG9zdC9iaW4vcHJvdG9jLWdl
bi1jCj4gKioqICAgCj4gL2hvbWUvbWFyY3VzL21udC9lbmN3b3JrL2dpdC9ici10ZXN0LXBrZy9i
b290bGluLWFybXY1LXVjbGliYy9ob3N0L2Jpbi9weXRob24zLjExCj4gKioqICAgCj4gL2hvbWUv
bWFyY3VzL21udC9lbmN3b3JrL2dpdC9ici10ZXN0LXBrZy9ib290bGluLWFybXY1LXVjbGliYy9o
b3N0L2Jpbi9vcGVuc3NsCj4gbWFrZTogKioqIFtwYWNrYWdlL3BrZy1nZW5lcmljLm1rOjMwNTog
Cj4gL2hvbWUvbWFyY3VzL21udC9lbmN3b3JrL2dpdC9ici10ZXN0LXBrZy9ib290bGluLWFybXY1
LXVjbGliYy9idWlsZC9ob3N0LWxpYnpsaWItMS4zLy5zdGFtcF9ob3N0X2luc3RhbGxlZF0gCj4g
RXJyb3IgMQoKRm9yIGluZm9ybWF0aW9uLCBvbiBteSBzaWRlLCBJIHNlZSB0aGUgY3JpdSBwYWNr
YWdlIGJ1aWxkIGZhaWxpbmcKZm9yIHZhcmlvdXMgcmVhc29ucy4KCkZvciBleGFtcGxlLCB0b29s
Y2hhaW4gYm9vdGxpbi1hcm12NS11Y2xpYmMgaXMgZmFpbGluZyB3aXRoOgoKY29tcGVsL2FyY2gv
YXJtL3NyYy9saWIvaW5mZWN0LmM6IEluIGZ1bmN0aW9uIArigJhjb21wZWxfc2V0X3Rhc2tfZXh0
X3JlZ3PigJk6CmNvbXBlbC9hcmNoL2FybS9zcmMvbGliL2luZmVjdC5jOjEwNzoyMDogZXJyb3I6
IOKAmFBUUkFDRV9TRVRWRlBSRUdT4oCZIAp1bmRlY2xhcmVkIChmaXJzdCB1c2UgaW4gdGhpcyBm
dW5jdGlvbik7IGRpZCB5b3UgbWVhbiAK4oCYUFRSQUNFX1NFVEZQUkVHU+KAmT8KICAgMTA3IHwg
ICAgICAgICBpZiAocHRyYWNlKFBUUkFDRV9TRVRWRlBSRUdTLCBwaWQsIE5VTEwsIGV4dF9yZWdz
KSkgewogICAgICAgfCAgICAgICAgICAgICAgICAgICAgXn5+fn5+fn5+fn5+fn5+fn4KICAgICAg
IHwgICAgICAgICAgICAgICAgICAgIFBUUkFDRV9TRVRGUFJFR1MKClRvb2xjaGFpbiBib290bGlu
LWFybXY3LWdsaWJjIGZhaWxpbmcgd2l0aDoKCi9ici10ZXN0LXBrZy9ib290bGluLWFybXY3LWds
aWJjL2hvc3QvYmluL2FybS1saW51eC1sZDogCi4vY29tcGVsL3BsdWdpbnMvc3RkLmxpYi5hKGxv
Zy5vKTogaW4gZnVuY3Rpb24gYHN0ZF92cHJpbnRfbnVtJzoKbG9nLmM6KC50ZXh0KzB4MmMwKTog
dW5kZWZpbmVkIHJlZmVyZW5jZSB0byBgX19hZWFiaV9pZGl2bW9kJwovYnItdGVzdC1wa2cvYm9v
dGxpbi1hcm12Ny1nbGliYy9ob3N0L2Jpbi9hcm0tbGludXgtbGQ6IAouL2NvbXBlbC9wbHVnaW5z
L3N0ZC5saWIuYShsb2cubyk6IGluIGZ1bmN0aW9uIGBzYnVmX3ByaW50Zic6CmxvZy5jOigudGV4
dCsweDQxYyk6IHVuZGVmaW5lZCByZWZlcmVuY2UgdG8gYF9fYWVhYmlfaWRpdm1vZCcKL2JyLXRl
c3QtcGtnL2Jvb3RsaW4tYXJtdjctZ2xpYmMvaG9zdC9iaW4vYXJtLWxpbnV4LWxkOiAKLi9jb21w
ZWwvcGx1Z2lucy9zdGQubGliLmEoc3RyaW5nLm8pOiBpbiBmdW5jdGlvbiBgc3RkX3ZkcHJpbnRm
JzoKc3RyaW5nLmM6KC50ZXh0KzB4MTE0KTogdW5kZWZpbmVkIHJlZmVyZW5jZSB0byBgX19hZWFi
aV9pZGl2bW9kJwoKVGhlcmUgaXMgcG9zc2libHkgb3RoZXJzLiAgSSdsbCB0cnkgdG8gaW52ZXN0
aWdhdGUgaG93IHRvIHJlc29sdmUgdGhvc2UgCmlzc3Vlcy4KCj4+IFdpdGggdGhpcyB2MiwgSSBh
bSBub3cgYWJsZSB0byBidWlsZCBjcml1IG9uIHNvbWUgeDg2XzY0IGFuZCBBYXJjaDY0Cj4+IGNv
bmZpZ3VyYXRpb25zLCBzbyBJIGNhbiBzdGFydCB3cml0aW5nIGEgcnVudGltZSB0ZXN0IDspCj4g
Cj4gWWVheSEKCkkgaGF2ZSBub3cgYSBmdWxseSB3b3JraW5nIHRlc3Qgb24gQWFyY2g2NC4gSSds
bCBzZW5kIGl0IHdoZW4gY3JpdQp3aWxsIGJlIG1lcmdlZC4KCkJlc3QgcmVnYXJkcywKCkp1bGll
bi4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRy
b290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1
aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
