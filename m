Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 180AEC25B06
	for <buildroot@archiver.kernel.org>; Sun, 14 Aug 2022 14:51:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B7D41827FB;
	Sun, 14 Aug 2022 14:51:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B7D41827FB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 50finQo9_e69; Sun, 14 Aug 2022 14:51:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D9BB0823DD;
	Sun, 14 Aug 2022 14:51:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D9BB0823DD
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 129611BF2BC
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 14:50:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CADDD8278F
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 14:50:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CADDD8278F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Of4WCEhMye8C for <buildroot@lists.busybox.net>;
 Sun, 14 Aug 2022 14:50:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DE69482864
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DE69482864
 for <buildroot@busybox.net>; Sun, 14 Aug 2022 14:50:49 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:4cac:4fa9:6c11:832f])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 3614E6012F;
 Sun, 14 Aug 2022 16:50:46 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 14 Aug 2022 16:50:43 +0200
Date: Sun, 14 Aug 2022 16:50:43 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Francois Perrad <fperrad@gmail.com>
Message-ID: <20220814145043.GE2775145@scaer>
References: <20220814125612.1227910-1-francois.perrad@gadz.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220814125612.1227910-1-francois.perrad@gadz.org>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1660488648;
 bh=5myIX66sJCGT0fqd4oCoI3dg7x1UO2Io9jwBk3QGmG8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gF5bZXkLEMI5pWCtD2nGARbDJxyLP0LtarAjvZD1nG7L45zfjvsYJf8ai5wOFBTWQ
 8DZhlPrHi3+q6F0i8TLuShSKzPB6F18cOphQFB1dUwPdkIonvNNNQNoe4NMt6mbzss
 fyW22SpHJR2lIbZr602G42TSZCyqkPPPJ6s/RVRe40mZh9VHRciQz78Za9Q0sLxPmS
 OAMJk83MB7Zb/nbPU1AtIXIn3oYjKas5fgWohp5HyJQfX/OmTpihbw8PBiTjCP2jz0
 6Xi3ziIMOaZRR81CNDSAVcLPubradxnpTj0oooIR/E4HuTkPPH1z1kLH0vIEb15eWi
 7MmOrChRjvC6w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=gF5bZXkL
Subject: Re: [Buildroot] [PATCH] package/nettle: bump to version 3.8.1
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

RnJhbsOnb2lzLCBBbGwsCgpPbiAyMDIyLTA4LTE0IDE0OjU2ICswMjAwLCBGcmFuY29pcyBQZXJy
YWQgc3Bha2UgdGh1c2x5Ogo+IFNpZ25lZC1vZmYtYnk6IEZyYW5jb2lzIFBlcnJhZCA8ZnJhbmNv
aXMucGVycmFkQGdhZHoub3JnPgoKQXBwbGllZCB0byBuZXh0LCB0aGFua3MuCgpSZWdhcmRzLApZ
YW5uIEUuIE1PUklOLgoKPiAtLS0KPiAgcGFja2FnZS9uZXR0bGUvbmV0dGxlLmhhc2ggfCA0ICsr
LS0KPiAgcGFja2FnZS9uZXR0bGUvbmV0dGxlLm1rICAgfCAyICstCj4gIDIgZmlsZXMgY2hhbmdl
ZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9wYWNr
YWdlL25ldHRsZS9uZXR0bGUuaGFzaCBiL3BhY2thZ2UvbmV0dGxlL25ldHRsZS5oYXNoCj4gaW5k
ZXggMTQ0Njc5NzdiLi5kNzI2Y2I5NGMgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9uZXR0bGUvbmV0
dGxlLmhhc2gKPiArKysgYi9wYWNrYWdlL25ldHRsZS9uZXR0bGUuaGFzaAo+IEBAIC0xLDYgKzEs
NiBAQAo+ICAjIExvY2FsbHkgY2FsY3VsYXRlZCBhZnRlciBjaGVja2luZyBwZ3Agc2lnbmF0dXJl
Cj4gLSMgaHR0cHM6Ly9mdHAuZ251Lm9yZy9nbnUvbmV0dGxlL25ldHRsZS0zLjgudGFyLmd6LnNp
Zwo+IC1zaGEyNTYgIDc1NzZjNjg0ODFjMTk4ZjY0NGIwOGMxNjBkMWE0ODUwYmE5NDQ5ZTMwODA2
OTQ1NWI1MjEzMzE5ZjIzNGU4ZTYgIG5ldHRsZS0zLjgudGFyLmd6Cj4gKyMgaHR0cHM6Ly9mdHAu
Z251Lm9yZy9nbnUvbmV0dGxlL25ldHRsZS0zLjguMS50YXIuZ3ouc2lnCj4gK3NoYTI1NiAgMzY0
ZjNlMmI3N2NkN2RjZGU4M2ZkN2M0NTIxOWM4MzRlNTRiMGM3NWU0MjhiNmY4OTRhMjNkMTJkZDQx
Y2JmZSAgbmV0dGxlLTMuOC4xLnRhci5nego+ICAjIExvY2FsbHkgY2FsY3VsYXRlZAo+ICBzaGEy
NTYgIGE4NTNjMmZmZWMxNzA1Nzg3MjM0MGVlZTI0MmFlNGQ5NmNiZjJiNTIwYWUyN2Q5MDNlMWIy
ZmVmMWE1ZjlkMWMgIENPUFlJTkcuTEVTU0VSdjMKPiAgc2hhMjU2ICA4MTc3Zjk3NTEzMjEzNTI2
ZGYyY2Y2MTg0ZDhmZjk4NmM2NzVhZmI1MTRkNGU2OGE0MDQwMTA1MjFiODgwNjQzICBDT1BZSU5H
djIKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9uZXR0bGUvbmV0dGxlLm1rIGIvcGFja2FnZS9uZXR0
bGUvbmV0dGxlLm1rCj4gaW5kZXggMDViOGIwYmVhLi5kZDRkZmJiZTMgMTAwNjQ0Cj4gLS0tIGEv
cGFja2FnZS9uZXR0bGUvbmV0dGxlLm1rCj4gKysrIGIvcGFja2FnZS9uZXR0bGUvbmV0dGxlLm1r
Cj4gQEAgLTQsNyArNCw3IEBACj4gICMKPiAgIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKPiAgCj4g
LU5FVFRMRV9WRVJTSU9OID0gMy44Cj4gK05FVFRMRV9WRVJTSU9OID0gMy44LjEKPiAgTkVUVExF
X1NJVEUgPSBodHRwczovL2Z0cC5nbnUub3JnL2dudS9uZXR0bGUKPiAgTkVUVExFX0RFUEVOREVO
Q0lFUyA9IGdtcAo+ICBORVRUTEVfSU5TVEFMTF9TVEFHSU5HID0gWUVTCj4gLS0gCj4gMi4zNC4x
Cj4gCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBi
dWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4gYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKPiBodHRwczov
L2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QKCi0tIAouLS0t
LS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLi0t
LS0tLS0tLS0tLS0tLS0tLS0tLgp8ICBZYW5uIEUuIE1PUklOICB8IFJlYWwtVGltZSBFbWJlZGRl
ZCB8IC8iXCBBU0NJSSBSSUJCT04gfCBFcmljcycgY29uc3BpcmFjeTogfAp8ICszMyA2NjIgMzc2
IDA1NiB8IFNvZnR3YXJlICBEZXNpZ25lciB8IFwgLyBDQU1QQUlHTiAgICAgfCAgX19fICAgICAg
ICAgICAgICAgfAp8ICszMyA1NjEgMDk5IDQyNyBgLS0tLS0tLS0tLS0tLi0tLS0tLS06ICBYICBB
R0FJTlNUICAgICAgfCAgXGUvICBUaGVyZSBpcyBubyAgfAp8IGh0dHA6Ly95bW9yaW4uaXMtYS1n
ZWVrLm9yZy8gfCBfLypcXyB8IC8gXCBIVE1MIE1BSUwgICAgfCAgIHYgICBjb25zcGlyYWN5LiAg
fAonLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0tLS1eLS0tLS0tLS0tLS0tLS0t
LS0tXi0tLS0tLS0tLS0tLS0tLS0tLS0tJwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJv
b3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxk
cm9vdAo=
