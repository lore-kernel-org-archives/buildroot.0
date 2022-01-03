Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09535C433F5
	for <buildroot@archiver.kernel.org>; Mon,  3 Jan 2022 20:46:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AAAF6405BE;
	Mon,  3 Jan 2022 20:46:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cGtIRMiWLnqI; Mon,  3 Jan 2022 20:46:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AA626405A2;
	Mon,  3 Jan 2022 20:46:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7B9991BF309
 for <buildroot@lists.busybox.net>; Mon,  3 Jan 2022 20:46:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 78AF980C37
 for <buildroot@lists.busybox.net>; Mon,  3 Jan 2022 20:46:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id v3fTASpTY_3N for <buildroot@lists.busybox.net>;
 Mon,  3 Jan 2022 20:46:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9B39980C2F
 for <buildroot@busybox.net>; Mon,  3 Jan 2022 20:46:27 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:6d4f:8674:7dd0:6c06])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 5C65513F879;
 Mon,  3 Jan 2022 21:46:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1641242785;
 bh=ciBgVlL4Fe2tQAkxP6zbUiOJCQkwNuYTWEfXvAG8fHw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HHvrnG83tzIAnYHzST5rlmHk5TSvllHob0Vrjam3gTIy5Fr0mvhcBPG9QwWuxsql/
 HudQzpyR1onFBNfiZZC2GUJBeBu9S/edWBQyiKUTQz85t3cPxsI8u0ZI2FP9zaws15
 ZivNx4ArlA5dHr1ri5581Fqw/uap7yfv20dj0nWTHv65AEFvV/L6VYcKTydKPIBptU
 dhWcO+3VU3gcAaEwKP+6b4SChBLLPp8LLdrdXXpKVWr669di8o6ouN5wkXE4fJrQOS
 ZDnWHIKKjRVh8hsM4FqW3QxjcSQ8uJQckjfKF+V7ghSj4wCGfFnPBRDijDMUIAFLxJ
 V2dI9ZfcKW99g==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 03 Jan 2022 21:46:21 +0100
Date: Mon, 3 Jan 2022 21:46:21 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Francois Perrad <fperrad@gmail.com>
Message-ID: <20220103204621.GK69135@scaer>
References: <20220103104343.15975-1-francois.perrad@gadz.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220103104343.15975-1-francois.perrad@gadz.org>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH] package/ethtool: bump to version 5.15
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

RnJhbsOnb2lzLCBBbGwsCgpPbiAyMDIyLTAxLTAzIDExOjQzICswMTAwLCBGcmFuY29pcyBQZXJy
YWQgc3Bha2UgdGh1c2x5Ogo+IFNpZ25lZC1vZmYtYnk6IEZyYW5jb2lzIFBlcnJhZCA8ZnJhbmNv
aXMucGVycmFkQGdhZHoub3JnPgoKQXBwbGllZCB0byBtYXN0ZXIsIHRoYW5rcy4KClJlZ2FyZHMs
Cllhbm4gRS4gTU9SSU4uCgo+IC0tLQo+ICBwYWNrYWdlL2V0aHRvb2wvZXRodG9vbC5oYXNoIHwg
MiArLQo+ICBwYWNrYWdlL2V0aHRvb2wvZXRodG9vbC5tayAgIHwgMiArLQo+ICAyIGZpbGVzIGNo
YW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEv
cGFja2FnZS9ldGh0b29sL2V0aHRvb2wuaGFzaCBiL3BhY2thZ2UvZXRodG9vbC9ldGh0b29sLmhh
c2gKPiBpbmRleCA1MzY1Nzk2NzAuLjU5YzY1N2U4NiAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL2V0
aHRvb2wvZXRodG9vbC5oYXNoCj4gKysrIGIvcGFja2FnZS9ldGh0b29sL2V0aHRvb2wuaGFzaAo+
IEBAIC0xLDUgKzEsNSBAQAo+ICAjIEZyb20gaHR0cHM6Ly93d3cua2VybmVsLm9yZy9wdWIvc29m
dHdhcmUvbmV0d29yay9ldGh0b29sL3NoYTI1NnN1bXMuYXNjCj4gLXNoYTI1NiAgZjVkZGZhOWM3
NTA1M2Q4MDExYjhjOGM5OWVjNGUyZDNjODNjZDE5NzJmNjM4NjkyZDYyZTM3ZmEzZWYzNmYwNyAg
ZXRodG9vbC01LjEyLnRhci54ego+ICtzaGEyNTYgIDY4NmZkNjExMDM4OWQ0OWMyYTEyMGYwMGMz
Y2Q1ZGZlNDNkZWJhZGE4ZTAyMWU0MjcwZDc0YmJlNDUyYTExNmQgIGV0aHRvb2wtNS4xNS50YXIu
eHoKPiAgIyBMb2NhbGx5IGNhbGN1bGF0ZWQKPiAgc2hhMjU2ICA4MTc3Zjk3NTEzMjEzNTI2ZGYy
Y2Y2MTg0ZDhmZjk4NmM2NzVhZmI1MTRkNGU2OGE0MDQwMTA1MjFiODgwNjQzICBDT1BZSU5HCj4g
IHNoYTI1NiAgNWQ2MzI5MzQzOTZmOTBjODJkZmViZTNjOTUxMjY0OGJiYjYzMzNiNDA2MTEzZDBj
ZDMzMWIwZTBhYTJkMzRhMSAgTElDRU5TRQo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL2V0aHRvb2wv
ZXRodG9vbC5tayBiL3BhY2thZ2UvZXRodG9vbC9ldGh0b29sLm1rCj4gaW5kZXggZjNlOTUwZjIx
Li5jNGJiOWJkZDkgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9ldGh0b29sL2V0aHRvb2wubWsKPiAr
KysgYi9wYWNrYWdlL2V0aHRvb2wvZXRodG9vbC5tawo+IEBAIC00LDcgKzQsNyBAQAo+ICAjCj4g
ICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCj4gIAo+IC1FVEhUT09MX1ZFUlNJT04gPSA1LjEyCj4g
K0VUSFRPT0xfVkVSU0lPTiA9IDUuMTUKPiAgRVRIVE9PTF9TT1VSQ0UgPSBldGh0b29sLSQoRVRI
VE9PTF9WRVJTSU9OKS50YXIueHoKPiAgRVRIVE9PTF9TSVRFID0gJChCUjJfS0VSTkVMX01JUlJP
Uikvc29mdHdhcmUvbmV0d29yay9ldGh0b29sCj4gIEVUSFRPT0xfTElDRU5TRSA9IEdQTC0yLjAK
PiAtLSAKPiAyLjMyLjAKPiAKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwo+IGJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKPiBidWlsZHJvb3RAYnVpbGRyb290
Lm9yZwo+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxk
cm9vdAoKLS0gCi4tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0t
LS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0uCnwgIFlhbm4gRS4gTU9SSU4gIHwgUmVh
bC1UaW1lIEVtYmVkZGVkIHwgLyJcIEFTQ0lJIFJJQkJPTiB8IEVyaWNzJyBjb25zcGlyYWN5OiB8
CnwgKzMzIDY2MiAzNzYgMDU2IHwgU29mdHdhcmUgIERlc2lnbmVyIHwgXCAvIENBTVBBSUdOICAg
ICB8ICBfX18gICAgICAgICAgICAgICB8CnwgKzMzIDU2MSAwOTkgNDI3IGAtLS0tLS0tLS0tLS0u
LS0tLS0tLTogIFggIEFHQUlOU1QgICAgICB8ICBcZS8gIFRoZXJlIGlzIG5vICB8CnwgaHR0cDov
L3ltb3Jpbi5pcy1hLWdlZWsub3JnLyB8IF8vKlxfIHwgLyBcIEhUTUwgTUFJTCAgICB8ICAgdiAg
IGNvbnNwaXJhY3kuICB8CictLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0tLV4t
LS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0tLS0nCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVp
bGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4v
bGlzdGluZm8vYnVpbGRyb290Cg==
