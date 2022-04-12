Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71B05C433EF
	for <buildroot@archiver.kernel.org>; Tue, 12 Apr 2022 19:55:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2B55D83FFC;
	Tue, 12 Apr 2022 19:55:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id H5tAKUs_PqvO; Tue, 12 Apr 2022 19:55:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2729783F94;
	Tue, 12 Apr 2022 19:55:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9292B1BF3FD
 for <buildroot@lists.busybox.net>; Tue, 12 Apr 2022 19:55:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7E32083218
 for <buildroot@lists.busybox.net>; Tue, 12 Apr 2022 19:55:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eaOl6OVeFu-A for <buildroot@lists.busybox.net>;
 Tue, 12 Apr 2022 19:55:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9CBEA83F94
 for <buildroot@busybox.net>; Tue, 12 Apr 2022 19:55:40 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:7133:9439:48a3:ea79])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 2B61A13F89A;
 Tue, 12 Apr 2022 21:55:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1649793339;
 bh=WAgZzzw7dMJR+mSFDD4lM3bR8HjXBEZemz/cefpq8TE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HJ65hGy7re5WiYrEzOiR6VfpLIoQjUNcUE2YOEwh4b9vRtCY0tH3pXz4ymi9bw7s1
 YqZuwVaQnZ0hWFrErg3sp/a5od+HOUTwPEFjceZEznLtcD66fjZV9eK/HaGTF/dyy5
 WOcaqKAtO2fBbvOqAkPhj6K/GtaIySwzt+aXOVX+dn1Paj+8FvMSB2uJAqxAeoxHNc
 sUgR1ZmCN+orUxDcY4P+U783hFzgwShsHE2VQlze2C4NcrnJBbDgXNCCFwYue/rcAB
 zr6q8vD1cPV9oL1jtzbnye7WhkIz3txFJbS3dH9aejmvJO2hOeUaUbd8urFNIRRqHW
 5rjTp4My9CsbA==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 12 Apr 2022 21:55:36 +0200
Date: Tue, 12 Apr 2022 21:55:36 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Francois Perrad <fperrad@gmail.com>
Message-ID: <20220412195536.GJ4029883@scaer>
References: <20220412180248.2709842-1-francois.perrad@gadz.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220412180248.2709842-1-francois.perrad@gadz.org>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH] package/sqlite: bump to version 3.38.2
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

RnJhbsOnb2lzLCBBbGwsCgpPbiAyMDIyLTA0LTEyIDIwOjAyICswMjAwLCBGcmFuY29pcyBQZXJy
YWQgc3Bha2UgdGh1c2x5Ogo+IFNpZ25lZC1vZmYtYnk6IEZyYW5jb2lzIFBlcnJhZCA8ZnJhbmNv
aXMucGVycmFkQGdhZHoub3JnPgoKQXBwbGllZCB0byBtYXN0ZXIsIHRoYW5rcy4KClJlZ2FyZHMs
Cllhbm4gRS4gTU9SSU4uCgo+IC0tLQo+ICBwYWNrYWdlL3NxbGl0ZS9zcWxpdGUuaGFzaCB8IDIg
Ky0KPiAgcGFja2FnZS9zcWxpdGUvc3FsaXRlLm1rICAgfCA0ICsrLS0KPiAgMiBmaWxlcyBjaGFu
Z2VkLCAzIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3Bh
Y2thZ2Uvc3FsaXRlL3NxbGl0ZS5oYXNoIGIvcGFja2FnZS9zcWxpdGUvc3FsaXRlLmhhc2gKPiBp
bmRleCAxYjNkYzM1Y2MuLjg4MmNmODU2NCAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL3NxbGl0ZS9z
cWxpdGUuaGFzaAo+ICsrKyBiL3BhY2thZ2Uvc3FsaXRlL3NxbGl0ZS5oYXNoCj4gQEAgLTEsMyAr
MSwzIEBACj4gICMgTG9jYWxseSBjb21wdXRlZAo+IC1zaGEyNTYgIDhlM2E4Y2ViOTc5NGQ5Njgz
OTk1OTBkMmRkZjlkNWMwNDRhOTdkZDgzZDM4Yjk2MTMzNjRhMjQ1ZWM4YTJmYzQgIHNxbGl0ZS1h
dXRvY29uZi0zMzgwMTAwLnRhci5nego+ICtzaGEyNTYgIGU3OTc0YWExNDMwYmFkNjkwYTVlOWY3
OWE2ZWU1Yzg0OTJhZGE4MjY5ZGM2NzU4NzVhZDBmYjc0N2Q3Y2FkYTQgIHNxbGl0ZS1hdXRvY29u
Zi0zMzgwMjAwLnRhci5nego+ICBzaGEyNTYgIDY2ZTA1NmI2ZTg2ODdmMzJhZjMwZDUxODc2MTFi
OThiMTJhOGY0NmYwN2FhZjYyZjQzNTg1ZjI3NmU4ZjBhYzkgIHRlYS9saWNlbnNlLnRlcm1zCj4g
ZGlmZiAtLWdpdCBhL3BhY2thZ2Uvc3FsaXRlL3NxbGl0ZS5tayBiL3BhY2thZ2Uvc3FsaXRlL3Nx
bGl0ZS5tawo+IGluZGV4IGEwYzkwYjdmNi4uOWY4OGFmN2FlIDEwMDY0NAo+IC0tLSBhL3BhY2th
Z2Uvc3FsaXRlL3NxbGl0ZS5tawo+ICsrKyBiL3BhY2thZ2Uvc3FsaXRlL3NxbGl0ZS5tawo+IEBA
IC00LDggKzQsOCBAQAo+ICAjCj4gICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCj4gIAo+IC1TUUxJ
VEVfVkVSU0lPTiA9IDMuMzguMQo+IC1TUUxJVEVfVEFSX1ZFUlNJT04gPSAzMzgwMTAwCj4gK1NR
TElURV9WRVJTSU9OID0gMy4zOC4yCj4gK1NRTElURV9UQVJfVkVSU0lPTiA9IDMzODAyMDAKPiAg
U1FMSVRFX1NPVVJDRSA9IHNxbGl0ZS1hdXRvY29uZi0kKFNRTElURV9UQVJfVkVSU0lPTikudGFy
Lmd6Cj4gIFNRTElURV9TSVRFID0gaHR0cHM6Ly93d3cuc3FsaXRlLm9yZy8yMDIyCj4gIFNRTElU
RV9MSUNFTlNFID0gUHVibGljIGRvbWFpbgo+IC0tIAo+IDIuMzIuMAo+IAo+IF9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gYnVpbGRyb290IG1haWxpbmcg
bGlzdAo+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4gaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qu
b3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290CgotLSAKLi0tLS0tLS0tLS0tLS0tLS0tLi0t
LS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0t
LS4KfCAgWWFubiBFLiBNT1JJTiAgfCBSZWFsLVRpbWUgRW1iZWRkZWQgfCAvIlwgQVNDSUkgUklC
Qk9OIHwgRXJpY3MnIGNvbnNwaXJhY3k6IHwKfCArMzMgNjYyIDM3NiAwNTYgfCBTb2Z0d2FyZSAg
RGVzaWduZXIgfCBcIC8gQ0FNUEFJR04gICAgIHwgIF9fXyAgICAgICAgICAgICAgIHwKfCArMzMg
NTYxIDA5OSA0MjcgYC0tLS0tLS0tLS0tLS4tLS0tLS0tOiAgWCAgQUdBSU5TVCAgICAgIHwgIFxl
LyAgVGhlcmUgaXMgbm8gIHwKfCBodHRwOi8veW1vcmluLmlzLWEtZ2Vlay5vcmcvIHwgXy8qXF8g
fCAvIFwgSFRNTCBNQUlMICAgIHwgICB2ICAgY29uc3BpcmFjeS4gIHwKJy0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tLS0tLS0t
LS0tLS0tLScKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
YnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xp
c3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
