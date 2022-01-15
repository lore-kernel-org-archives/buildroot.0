Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 637EEC433F5
	for <buildroot@archiver.kernel.org>; Sat, 15 Jan 2022 10:18:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 055F881CA5;
	Sat, 15 Jan 2022 10:18:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KZRQHGyBu7Wz; Sat, 15 Jan 2022 10:18:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 48A4381C56;
	Sat, 15 Jan 2022 10:18:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A019F1BF5DD
 for <buildroot@lists.busybox.net>; Sat, 15 Jan 2022 10:18:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8DC1A81CA3
 for <buildroot@lists.busybox.net>; Sat, 15 Jan 2022 10:18:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0A_TB9w6iHTP for <buildroot@lists.busybox.net>;
 Sat, 15 Jan 2022 10:18:31 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9F72381C21
 for <buildroot@busybox.net>; Sat, 15 Jan 2022 10:18:31 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:edb9:18:17ad:29d4])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id E033D19F55C;
 Sat, 15 Jan 2022 11:18:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1642241910;
 bh=qCQVYJbY85gw70hO81wmg0ePzoPkbc9GdKNPw4HocfI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DW+MEngbY0zLnBuA+bGXt4sTzZdDy8Kc0rkzRN0tyDKq/LVi+p5WvS/b8u4DZOvk1
 /wmFIrnVF+ncK87J9Jed9vbhDvgTBlcfWrJ52KXlgeYQC7AF4ovTkFr8QBvgK5r+Dy
 4TWy0AVXNovEO4QjnwWoDmryzX5tvcqu23mJF8JYmZylZVuSDn50QfcNu4zjTVOM8s
 sgVWxAspCwRgYGTstCHz7AWFlZITDM4zKNlyqGnUicPXWRYERhKd+UiJy4KoV1L1bP
 OVjaLN9xAHGyGL94dENrt07L/yputY/sKojQv6AFRs7sW0J0tyGorlclSYoQwduqBB
 bF4W+F1EMghUg==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 15 Jan 2022 11:18:27 +0100
Date: Sat, 15 Jan 2022 11:18:27 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Francois Perrad <fperrad@gmail.com>
Message-ID: <20220115101827.GH1945846@scaer>
References: <20220115091354.60566-1-francois.perrad@gadz.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220115091354.60566-1-francois.perrad@gadz.org>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH] package/janet: bump to version 1.19.2
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
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

RnJhbsOnb2lzLCBBbGwsCgpPbiAyMDIyLTAxLTE1IDEwOjEzICswMTAwLCBGcmFuY29pcyBQZXJy
YWQgc3Bha2UgdGh1c2x5Ogo+IFNpZ25lZC1vZmYtYnk6IEZyYW5jb2lzIFBlcnJhZCA8ZnJhbmNv
aXMucGVycmFkQGdhZHoub3JnPgoKQXBwbGllZCB0byBtYXN0ZXIsIHRoYW5rcy4KClJlZ2FyZHMs
Cllhbm4gRS4gTU9SSU4uCgo+IC0tLQo+ICBwYWNrYWdlL2phbmV0L2phbmV0Lmhhc2ggfCAyICst
Cj4gIHBhY2thZ2UvamFuZXQvamFuZXQubWsgICB8IDIgKy0KPiAgMiBmaWxlcyBjaGFuZ2VkLCAy
IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2Uv
amFuZXQvamFuZXQuaGFzaCBiL3BhY2thZ2UvamFuZXQvamFuZXQuaGFzaAo+IGluZGV4IDhlNzhk
OWE0ZC4uNTBlNmIxZmVmIDEwMDY0NAo+IC0tLSBhL3BhY2thZ2UvamFuZXQvamFuZXQuaGFzaAo+
ICsrKyBiL3BhY2thZ2UvamFuZXQvamFuZXQuaGFzaAo+IEBAIC0xLDUgKzEsNSBAQAo+ICAjIExv
Y2FsbHkgY2FsY3VsYXRlZAo+IC1zaGEyNTYgIGJmYzI5YzExYTA3MGNjMTc1NjY2Zjc0ZWI5OWVh
OTkyMjc2ZDZlMjY5NzAxYmE5NTU4YTcyY2VmMDVhYzgwYjQgIGphbmV0LTEuMTguMS50YXIuZ3oK
PiArc2hhMjU2ICAwMmZmODkyZjRiZmMwNjBhOGEzN2Y0YTVjM2U2NTliZjM0YmE1ZjFmMWM1ZWIw
N2Q2MGRjMjY0MmM1Y2YwNDc2ICBqYW5ldC0xLjE5LjIudGFyLmd6Cj4gIAo+ICAjIExvY2FsbHkg
Y2FsY3VsYXRlZAo+ICBzaGEyNTYgIGUyZDJhZTgzNjBkOTUzODZhZjc1MWFjN2QxYTNkYTM2ZWE4
Y2ViMjMwZTVmMGViYTdlYjc2MjU0N2IxYzU4YzkgIExJQ0VOU0UKPiBkaWZmIC0tZ2l0IGEvcGFj
a2FnZS9qYW5ldC9qYW5ldC5tayBiL3BhY2thZ2UvamFuZXQvamFuZXQubWsKPiBpbmRleCBiMDBm
ODI4NDYuLjViNmE5YTE4MiAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL2phbmV0L2phbmV0Lm1rCj4g
KysrIGIvcGFja2FnZS9qYW5ldC9qYW5ldC5tawo+IEBAIC00LDcgKzQsNyBAQAo+ICAjCj4gICMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjCj4gIAo+IC1KQU5FVF9WRVJTSU9OID0gMS4xOC4xCj4gK0pB
TkVUX1ZFUlNJT04gPSAxLjE5LjIKPiAgSkFORVRfU0lURSA9ICQoY2FsbCBnaXRodWIsamFuZXQt
bGFuZyxqYW5ldCx2JChKQU5FVF9WRVJTSU9OKSkKPiAgSkFORVRfTElDRU5TRSA9IE1JVAo+ICBK
QU5FVF9MSUNFTlNFX0ZJTEVTID0gTElDRU5TRQo+IC0tIAo+IDIuMzIuMAo+IAo+IF9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gYnVpbGRyb290IG1haWxp
bmcgbGlzdAo+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4gaHR0cHM6Ly9saXN0cy5idWlsZHJv
b3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290CgotLSAKLi0tLS0tLS0tLS0tLS0tLS0t
Li0tLS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0t
LS0tLS4KfCAgWWFubiBFLiBNT1JJTiAgfCBSZWFsLVRpbWUgRW1iZWRkZWQgfCAvIlwgQVNDSUkg
UklCQk9OIHwgRXJpY3MnIGNvbnNwaXJhY3k6IHwKfCArMzMgNjYyIDM3NiAwNTYgfCBTb2Z0d2Fy
ZSAgRGVzaWduZXIgfCBcIC8gQ0FNUEFJR04gICAgIHwgIF9fXyAgICAgICAgICAgICAgIHwKfCAr
MzMgNTYxIDA5OSA0MjcgYC0tLS0tLS0tLS0tLS4tLS0tLS0tOiAgWCAgQUdBSU5TVCAgICAgIHwg
IFxlLyAgVGhlcmUgaXMgbm8gIHwKfCBodHRwOi8veW1vcmluLmlzLWEtZ2Vlay5vcmcvIHwgXy8q
XF8gfCAvIFwgSFRNTCBNQUlMICAgIHwgICB2ICAgY29uc3BpcmFjeS4gIHwKJy0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tLS0t
LS0tLS0tLS0tLScKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczov
L2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
