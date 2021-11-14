Return-Path: <SRS0=+oVz=QB=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A650C433F5
	for <buildroot@archiver.kernel.org>; Sun, 14 Nov 2021 18:35:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 95E686112E
	for <buildroot@archiver.kernel.org>; Sun, 14 Nov 2021 18:35:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 95E686112E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F080A60667;
	Sun, 14 Nov 2021 18:35:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EvW0rliCe4AW; Sun, 14 Nov 2021 18:35:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 31C5B60692;
	Sun, 14 Nov 2021 18:35:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 832351BF5E0
 for <buildroot@lists.busybox.net>; Sun, 14 Nov 2021 18:35:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 70F7E60692
 for <buildroot@lists.busybox.net>; Sun, 14 Nov 2021 18:35:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QGbO9E0t5RiH for <buildroot@lists.busybox.net>;
 Sun, 14 Nov 2021 18:35:48 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E516960667
 for <buildroot@buildroot.org>; Sun, 14 Nov 2021 18:35:47 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:588e:4f72:56a8:ef3a])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id AD9C9780310;
 Sun, 14 Nov 2021 19:35:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1636914944;
 bh=Aa5ahZcDw/X37JKq69H0lcR15mUE+sznnCpQ8uSt3/4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Au7q3INp4kycaXkcv3c2oDgKJGlSC7J9N2inW4Gd61EcVA9eC8cQF1y1BBZEsYQ4I
 QO2UnsVIc7sHugJinxmRXU71OTUNPimRQCnDxG9o7QU+V3wbQGW67wrgHDtJmI0Dxz
 d9D6ch5PGXxvHG0fH07Rm5m4GOrBLjknEQFEXii/a2mrIkC3jgmL7VBcxjSVmiBzBh
 x3cWsQNErK+ZiDzI+9/mgYv+u23y0GR28sKf4Tjy6PtPCX2zcEMcKarNMeMqnzRwAM
 P9frgrwXC16dx9SR5+bBM63H7gEpTqZdjCiEXsd1YGwTAdRiGpoRwBuhDnJiLRMJ8t
 2pTU0enWZw6WQ==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 14 Nov 2021 19:35:38 +0100
Date: Sun, 14 Nov 2021 19:35:38 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20211114183538.GX247986@scaer>
References: <20211113141703.1124706-1-thomas.petazzoni@bootlin.com>
 <20211113180206.GT247986@scaer> <20211114140055.61997bd6@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211114140055.61997bd6@windsurf>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH] utils/genrandconfig: reduce the maximum
 "size" of random configurations
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Buildroot List <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhvbWFzLCBBbGwsCgpPbiAyMDIxLTExLTE0IDE0OjAwICswMTAwLCBUaG9tYXMgUGV0YXp6b25p
IHNwYWtlIHRodXNseToKPiBPbiBTYXQsIDEzIE5vdiAyMDIxIDE5OjAyOjA2ICswMTAwCj4gIllh
bm4gRS4gTU9SSU4iIDx5YW5uLm1vcmluLjE5OThAZnJlZS5mcj4gd3JvdGU6Cj4gPiBPbiBJUkMs
IHdlIGRpc2N1c3NlZCBhYm91dCB1c2luZyBhIG5vcm1hbCBkaXN0cm9idXRpb24gcmF0aGVyIHRo
YW4gdGhlCj4gPiB1bmlmb3JtIGRpc3RyaWJ1dGlvbiB0aGF0IHJhbmRpbnQoKSBwcm92aWRlcy4K
PiBZZWFoLCBidXQgYWZ0ZXIgdGhpbmtpbmcgbW9yZSBhYm91dCBpdCwgSSdtIHdvbmRlcmluZyB3
aGV0aGVyIHRoaXMKPiBtYWtlcyBzZW5zZSBvciBub3QuIEluZGVlZCwgd2h5IGFyZSB3ZSBtb3Jl
IGludGVyZXN0ZWQgYnkKPiBjb25maWd1cmF0aW9ucyBoYXZpbmcgfjEwJSBvZiBvcHRpb25zIGVu
YWJsZWQgY29tcGFyZWQgdG8gdGhlIG9uZXMKPiBoYXZpbmcgMSUgb3IgMjAlID8gQWxsIG9mIHRo
ZW0gYXJlIGVxdWFsbHkgaW50ZXJlc3RpbmcsIGFyZW4ndCB0aGV5PwoKV2VsbCwgeW91IHNhaWQg
eW91cnNlbGYgdGhhdCBpdCBpcyBtb3N0IHByb2JhYmx5IHRoYXQgY29uZmlndXJhdGlvbnMKaGF2
ZSBmZXcgb3B0aW9ucyB0dXJuZWQgb24sIHNvIHdlJ2QgcHJvYmFibHkgZmF2b3VyIHNtYWxsZXIK
Y29uZmlndXJhdGlvbnMgb3ZlciBiaWdnZXIgb25lcy4KCkVzcGVjaWFsbHkgc2luY2Ugc21hbGxl
ciBjb25maWd1cmF0aW9ucyBhcmUgbW9yZSBwcm9uZSB0byBleGhpYml0Cm1pc3Npbmcgb3Igb3Ro
ZXJ3aXNlLWluaGVyaXRlZCBkZXBlbmRlbmNpZXMuIENvbnZlcnNlbHksIHRob3VnaCwgYmlnZ2Vy
CmNvbmZpZ3VyYXRpb25zIGFyZSBhbHNvIG1vcmUgcHJvbmUgdG8gZXhoaWJpdCBidWlsZCBmYWls
dXJlcyBvbgp1bmV4cGVjdGVkIGRlcGVuZGVuY2llcy4KClNvIFlNTVYuLi4KCj4gPiBBbmQgaGVy
ZSBpcyB0aGUgKDEwLDcpIGdhdXNzaWFuICh3aGljaCBoYXMgbXkgcHJlZmVyZW5jZSk6ClstLVNO
SVAtLV0KPiBJIHRoaW5rIHRoZSByZWFsaXR5IG9mIEJ1aWxkcm9vdCBjb25maWd1cmF0aW9ucyBp
cyBwcm9iYWJseSBldmVuIG1vcmUKPiBiaWFzZWQgdG93YXJkcyBoYXZpbmcganVzdCBhIGZldyBw
ZXJjZW50cyBvZiBvcHRpb25zIGVuYWJsZWQuCgpXZSBjYW4gbWF5YmUgcmVmaW5lIHRoZSBwYXJh
bWV0ZXJzLCBsaWtlICgzLDcpLgoKPiA+IFNpbmNlIGEgZ2F1c3NpYW4gY2FuIG91dHB1dCB2YWx1
ZXMgYWxsIG92ZXIg4oSdLCB3ZSBtdXN0IGxpbWl0IHRoZSByYW5nZQo+ID4gZXhwbGljaXRseSAo
bm90ZSB0aGF0IHRoZSAwJSBhYm92ZSBhcmUgbm90IHJlcHJlc2VudGluZyAwIG9jY3VyZW5jZXMh
KToKPiA+IAo+ID4gICAgIHByb2JhID0gMAo+ID4gICAgIHdoaWxlIHByb2JhIDwgMSBvciBwcm9i
YSA+IDEwMDoKPiA+ICAgICAgICAgcHJvYmEgPSBpbnQocmFuZG9tLmdhdXNzKDE1LCA1KSkKPiAK
PiBIb3cgbXVjaCBDUFUgaXMgdGhpcyBsb29wIGdvaW5nIHRvIGNvbnN1bWUgYmVmb3JlIGl0IGdp
dmVzIGEgdmFsdWUgdGhhdAo+IGlzIHdpdGhpbiAxIGFuZCAxMDAgPyBXb3VsZCBhICUgMTAwIGJl
IGJldHRlciA/CgpXZWxsLCB0aGUgbm9ybWFsIGRpc3RyaWJ1dGlvbiBpcyB2ZXJ5IHByZWRpY3Rh
YmxlIFswXS4gSGVyZSwgdGhlIG1lYW4gwrUKaXMgMTAsIGFuZCB0aGUgc3RhbmRhcmQgZGV2aWF0
aW9uIM+DIGlzIDcuIFRoaXMgbWVhbnMgdGhhdDoKCiAgLSA1MCUgb2YgdmFsdWVzIGFyZSBiZWxv
dyDCtSwgNTAlIGFib3ZlCiAgLSB+NjguMjklIG9mIHZhbHVlcyBhcmUgYmV0d2VlbiDCtS3Pgz0z
IGFuZCDCtSvPgz0xNwogIC0gfjk1LjQ1JSBvZiB2YWx1ZXMgYXJlIGJldHdlZW4gwrUtMs+DPS00
IGFuZCDCtSsyz4M9MjQKICAtIH45OS43MyUgb2YgdmFsdWVzIGFyZSBiZXR3ZWVuIMK1LTPPgz0t
MTEgYW5kIMK1KzPPgz0zMQogIC0gfjg0LjElIG9mIHZhbHVlcyBhcmUgZ3JlYXRlciB0aGFuIMK1
Lc+DPTMKICAtIH4xNS40JSBvZiB2YWx1ZXMgYXJlIGJlbG93IMK1Lc+DPTMKICAtIH4yLjIlIG9m
IHZhbHVlcyBhcmUgYmVsb3cgwrUtMs+DPS00CgpBbmQgd2l0aCB0aGUgZm9sbG93aW5nIHRlc3Q6
CgogICAgPj4+IGltcG9ydCByYW5kb20KICAgID4+PiByZXN0YXJ0ID0gKDAsIDApCiAgICA+Pj4g
Zm9yIGkgaW4gcmFuZ2UoMTAwKjEwMDAqMTAwMCk6ICAjIDEwME0gaXRlcmF0aW9ucwogICAgLi4u
ICAgICByID0gaW50KHJhbmRvbS5nYXVzcygxMCwgNykrMC41KSAgIyBSb3VuZCB0byBuZWFyZXN0
IGludAogICAgLi4uICAgICBpZiByIDwgMToKICAgIC4uLiAgICAgICAgIHJlc3RhcnQgPSAocmVz
dGFydFswXSsxLCByZXN0YXJ0WzFdKQogICAgLi4uICAgICBlbGlmIHIgPiAxMDA6CiAgICAuLi4g
ICAgICAgICByZXN0YXJ0ID0gKHJlc3RhcnRbMF0sIHJlc3RhcnRbMV0rMSkKICAgIC4uLgogICAg
Pj4+IHByaW50KCdyZXN0YXJ0PXt9Jy5mb3JtYXQocmVzdGFydCkpCiAgICByZXN0YXJ0PSg4NzM2
MTI4LCAwKQoKU28sIGl0IG1lYW5zIHRoZXJlIHdlcmUgfjguNzM2JSBvZiB2YWx1ZXMgYmVsb3cg
MSwgYW5kIG5vbmUgYWJvdmUKMTAwLCB3aGljaCBpcyBjb25zaXN0ZW50IHdpdGggdGhlIHRoZW9y
eS4gU28sIHdlIHdvdWxkIHVzdWFsbHkgbmVlZApqdXN0IGEgdmVyeSBmZXcgbG9vcHMgdG8gZmlu
ZCBhbiBhcHByb3ByaWF0ZSB2YWx1ZToKCiAgICAgICAgICAgICAgICAgQ3VtdWxhdGl2ZSBwcm9i
YWJpbGl0eSB0aGUgbG9vcCBnZW5lcmF0ZXM6CiAgICAgICAgICAgICAgICB8IDwxICAgICAgICAg
ICAgICAgICAgICB8ID49MQogICAgLS0tLS0tLS0tLS0tKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
Ky0tLS0tLS0tLS0tLS0tLS0tCiAgICAxc3QgaXRlciAgICB8IDAuMDg3MzYgICAgICAgICAgICAg
ICB8IDAuOTEyNjQKICAgIDJuZCBpdGVyICAgIHwgMC4wMDc2MyA9MC4wODczNl4yICAgIHwgMC45
OTIzNgogICAgM3JkIGl0ZXIgICAgfCAwLjAwMDY2ID0wLjA4NzM2XjMgICAgfCAwLjk5OTMzCiAg
ICA0dGggaXRlciAgICB8IDAuMDAwMDYgPTAuMDg3MzZeNCAgICB8IDAuOTk5OTQKICAgIDV0aCBp
dGVyICAgIHwgMC4wMDAwMDUgPTAuMDg3MzZeNSAgIHwgMC45OTk5OQoKSS5lLiB0aGUgb2RkcyB0
byBnZXQgc29tZXRoaW5nIGxlc3MgdGhhbiBvbmUgYWZ0ZXIgdGhlIDV0aCBpdGVyYXRpb24gYXJl
Cmxlc3MgdGhhbiBpbiBpbiAxMDAsMDAwLgoKRm9yIHRoZSBvdGhlciBleHRyZW1pdHkgb2YgdGhl
IHJhbmdlLCAxMDAsIGl0IGlzIHNvIGZhciBhd2F5IChhbG1vc3QKMTPPgyAhKSB0aGF0IHdlIGRp
ZCBub3QgZXZlbiBnZXQgb25lIGluIDEwMCBtaWxsaW9uIGl0ZXJhdGlvbnMuIFRoYXQncwpsZXNz
IHRoYW4gdGhlIG9kZHMgb2YgYSBkaW5vc2F1ci1raWxsaW5nIGFzdGVyb2lkIGhpdHRpbmcgRWFy
dGggaW4gdGhlCm5leHQgbWlsbGlvbiB5ZWFycyAob3IgYSB2ZXJ5IGJpZyBudW1iZXIgbGlrZSB0
aGF0ISkuLi4KCk9oLCBhbmQgZG9pbmcgdGhvc2UgMTAwTSBpdGVyYXRpb25zIHRvb2sgfjU0cywg
d2hpY2ggbWVhbnMgdGhlIGxvb3AgaXMsCndlbGwsIGNoZWFwLiBWZXJ5IGNoZWFwLgoKWzBdIGh0
dHBzOi8vZW4ud2lraXBlZGlhLm9yZy93aWtpL05vcm1hbF9kaXN0cmlidXRpb24KCihZZWFoLCBJ
IGxvdmUgbWF0aHMgYW5kIHByb2JhYmxpdGllcy4gRXZlbiB0aG91Z2ggSSdtIHByZXR0eSBiYWQg
YXQgaXQhKQoKUmVnYXJkcywKWWFubiBFLiBNT1JJTi4KCi0tIAouLS0tLS0tLS0tLS0tLS0tLS0u
LS0tLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0t
LS0tLgp8ICBZYW5uIEUuIE1PUklOICB8IFJlYWwtVGltZSBFbWJlZGRlZCB8IC8iXCBBU0NJSSBS
SUJCT04gfCBFcmljcycgY29uc3BpcmFjeTogfAp8ICszMyA2NjIgMzc2IDA1NiB8IFNvZnR3YXJl
ICBEZXNpZ25lciB8IFwgLyBDQU1QQUlHTiAgICAgfCAgX19fICAgICAgICAgICAgICAgfAp8ICsz
MyA1NjEgMDk5IDQyNyBgLS0tLS0tLS0tLS0tLi0tLS0tLS06ICBYICBBR0FJTlNUICAgICAgfCAg
XGUvICBUaGVyZSBpcyBubyAgfAp8IGh0dHA6Ly95bW9yaW4uaXMtYS1nZWVrLm9yZy8gfCBfLypc
XyB8IC8gXCBIVE1MIE1BSUwgICAgfCAgIHYgICBjb25zcGlyYWN5LiAgfAonLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0tLS0tLS0t
LS0tLS0tLS0tJwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8v
bGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
