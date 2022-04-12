Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67942C433F5
	for <buildroot@archiver.kernel.org>; Tue, 12 Apr 2022 19:54:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F05C840B4E;
	Tue, 12 Apr 2022 19:54:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aehLLmHmrIZi; Tue, 12 Apr 2022 19:54:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E674640B47;
	Tue, 12 Apr 2022 19:54:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D84DF1BF3FD
 for <buildroot@lists.busybox.net>; Tue, 12 Apr 2022 19:54:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C7DDC81B99
 for <buildroot@lists.busybox.net>; Tue, 12 Apr 2022 19:54:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id n-0ofL0STBuA for <buildroot@lists.busybox.net>;
 Tue, 12 Apr 2022 19:54:00 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E9B5F81B7B
 for <buildroot@busybox.net>; Tue, 12 Apr 2022 19:53:59 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:7133:9439:48a3:ea79])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id CCCB613F88F;
 Tue, 12 Apr 2022 21:53:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1649793237;
 bh=vjGdM7GHOk+NzHX+9NUT+XAsI2l0QlD8X5gjJSsY/Yo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nydMbiaKMeNfwd0HhQjdTT/epC+Vri5db1dbWMMp9OlOsU+iil29jahTnjV8VF85d
 lmAGV0tEGj3E4iq8udchoFFwXYGb87iSh0bxStOenuJb0q+UrRg/XKwngA/XAYToHD
 AzgEdodjV6r7mewByzZuZrwRdNiB9O+7vLfA8HQ1XZSeMx/BrUj14bk5TwnO97Mw0F
 wNoY0MLV4zkl2EF+rWkzxcCMQ6RX+lO/M65H+dc//iNNiXWG59FseNqu3iKlgF3UU6
 9n6yaH3ec9DCdKGMI0mWSfP98n6zFhwIkr6l27fuj42wCorZEK/uV4gJK6mWS/IeMN
 YjnVGs3RFmySQ==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 12 Apr 2022 21:53:54 +0200
Date: Tue, 12 Apr 2022 21:53:54 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Francois Perrad <fperrad@gmail.com>
Message-ID: <20220412195354.GD4029883@scaer>
References: <20220412180057.2709514-1-francois.perrad@gadz.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220412180057.2709514-1-francois.perrad@gadz.org>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH] package/freetype: bump to version 2.12.0
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

RnJhbsOnb2lzLCBBbGwsCgpPbiAyMDIyLTA0LTEyIDIwOjAwICswMjAwLCBGcmFuY29pcyBQZXJy
YWQgc3Bha2UgdGh1c2x5Ogo+IFNpZ25lZC1vZmYtYnk6IEZyYW5jb2lzIFBlcnJhZCA8ZnJhbmNv
aXMucGVycmFkQGdhZHoub3JnPgoKSSBqdXN0IG5vdGljZWQgdGhhdCB5b3VyIEZyb20gKGdpdCBj
b21taXQgYXV0aG9yKSBkb2VzIG5vdCBtYXRjaCB5b3VyClNvQi4gQ2FuIHlvdSBwbGVhc2UgY2hl
Y2sgdGhhdCB0aGV5IG1hdGNoIGZvciBmdXR1cmUgY29udHJpYnV0aW9ucywKcGxlYXNlPwoKQW55
d2F5OyBhcHBsaWVkIHRvIG1hc3RlciwgdGhhbmtzLgoKUmVnYXJkcywKWWFubiBFLiBNT1JJTi4K
Cj4gLS0tCj4gIHBhY2thZ2UvZnJlZXR5cGUvZnJlZXR5cGUuaGFzaCB8IDYgKysrLS0tCj4gIHBh
Y2thZ2UvZnJlZXR5cGUvZnJlZXR5cGUubWsgICB8IDIgKy0KPiAgMiBmaWxlcyBjaGFuZ2VkLCA0
IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2Uv
ZnJlZXR5cGUvZnJlZXR5cGUuaGFzaCBiL3BhY2thZ2UvZnJlZXR5cGUvZnJlZXR5cGUuaGFzaAo+
IGluZGV4IDdhYmMzZDk2ZC4uNzhkMGJhMjBkIDEwMDY0NAo+IC0tLSBhL3BhY2thZ2UvZnJlZXR5
cGUvZnJlZXR5cGUuaGFzaAo+ICsrKyBiL3BhY2thZ2UvZnJlZXR5cGUvZnJlZXR5cGUuaGFzaAo+
IEBAIC0xLDggKzEsOCBAQAo+IC0jIEZyb20gaHR0cHM6Ly9zb3VyY2Vmb3JnZS5uZXQvcHJvamVj
dHMvZnJlZXR5cGUvZmlsZXMvZnJlZXR5cGUyLzIuMTEuMS8KPiAtc2hhMSAgODZiZGM5OGIzN2Vm
ZTQ0N2NmNTM0MjBiZjJjMTg0MDJmZjkwNTExMiAgZnJlZXR5cGUtMi4xMS4xLnRhci54ego+ICsj
IEZyb20gaHR0cHM6Ly9zb3VyY2Vmb3JnZS5uZXQvcHJvamVjdHMvZnJlZXR5cGUvZmlsZXMvZnJl
ZXR5cGUyLzIuMTIuMC8KPiArc2hhMSAgZmQxZWIxYTI3ZjE3ODgwOGUxZDhjY2Q4MmM3MWFiZmE1
ZDBlYmUxMyAgZnJlZXR5cGUtMi4xMi4wLnRhci54ego+ICtzaGEyNTYgIGVmNWMzMzZhYWNjMWEw
NzlmZjkyNjJkNjMwOGQ2YzJhMDY2ZGQ0ZDJhOTA1MzAxYzRhZGRhOWIzNTQzOTkwMzMgIGZyZWV0
eXBlLTIuMTIuMC50YXIueHoKPiAgCj4gICMgTG9jYWxseSBjYWxjdWxhdGVkCj4gLXNoYTI1NiAg
MzMzM2FlN2NmZGE4ODQyOWM5N2E3YWU2M2I3ZDAxYWIzOTgwNzZjM2I2NzE4MmU5NjBlNTY4NDA1
MGYyYzVjOCAgZnJlZXR5cGUtMi4xMS4xLnRhci54ego+ICBzaGEyNTYgIGM4NWU4NDJiN2ZmMDRk
OTVkYWI3ZDY4ZTgxMjc3M2RlMGY4YjY3OTQwZTU0NDlkMzViNDJjNjZlYjBmNjE5ZmUgIExJQ0VO
U0UuVFhUCj4gIHNoYTI1NiAgMDhjMTM1NzU1ZGQ1ODkwMzk0NzBmMWZkYmI0MDBkYWFhYmFhYTUw
ZDBiMzY2ZDE5Y2ViZmY0ZDIyOTg2YmFhMSAgZG9jcy9GVEwuVFhUCj4gIHNoYTI1NiAgYzQxMjBj
Njc1MmM5MTBjMjk5ZTNiZDljYjNhNDZmZjI2MmMyNjgzMDNjYTIwNjliNjFmOTJmMTBhNTY1NmMx
OCAgZG9jcy9HUEx2Mi5UWFQKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9mcmVldHlwZS9mcmVldHlw
ZS5tayBiL3BhY2thZ2UvZnJlZXR5cGUvZnJlZXR5cGUubWsKPiBpbmRleCA5MTJlNmM0ZGEuLjVj
NmI4YzczYiAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL2ZyZWV0eXBlL2ZyZWV0eXBlLm1rCj4gKysr
IGIvcGFja2FnZS9mcmVldHlwZS9mcmVldHlwZS5tawo+IEBAIC00LDcgKzQsNyBAQAo+ICAjCj4g
ICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCj4gIAo+IC1GUkVFVFlQRV9WRVJTSU9OID0gMi4xMS4x
Cj4gK0ZSRUVUWVBFX1ZFUlNJT04gPSAyLjEyLjAKPiAgRlJFRVRZUEVfU09VUkNFID0gZnJlZXR5
cGUtJChGUkVFVFlQRV9WRVJTSU9OKS50YXIueHoKPiAgRlJFRVRZUEVfU0lURSA9IGh0dHA6Ly9k
b3dubG9hZC5zYXZhbm5haC5nbnUub3JnL3JlbGVhc2VzL2ZyZWV0eXBlCj4gIEZSRUVUWVBFX0lO
U1RBTExfU1RBR0lORyA9IFlFUwo+IC0tIAo+IDIuMzIuMAo+IAo+IF9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+
IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4gaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21h
aWxtYW4vbGlzdGluZm8vYnVpbGRyb290CgotLSAKLi0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0t
LS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4KfCAg
WWFubiBFLiBNT1JJTiAgfCBSZWFsLVRpbWUgRW1iZWRkZWQgfCAvIlwgQVNDSUkgUklCQk9OIHwg
RXJpY3MnIGNvbnNwaXJhY3k6IHwKfCArMzMgNjYyIDM3NiAwNTYgfCBTb2Z0d2FyZSAgRGVzaWdu
ZXIgfCBcIC8gQ0FNUEFJR04gICAgIHwgIF9fXyAgICAgICAgICAgICAgIHwKfCArMzMgNTYxIDA5
OSA0MjcgYC0tLS0tLS0tLS0tLS4tLS0tLS0tOiAgWCAgQUdBSU5TVCAgICAgIHwgIFxlLyAgVGhl
cmUgaXMgbm8gIHwKfCBodHRwOi8veW1vcmluLmlzLWEtZ2Vlay5vcmcvIHwgXy8qXF8gfCAvIFwg
SFRNTCBNQUlMICAgIHwgICB2ICAgY29uc3BpcmFjeS4gIHwKJy0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLV4tLS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS0t
LScKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRy
b290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1
aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
