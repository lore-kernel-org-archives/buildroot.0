Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B944DC433EF
	for <buildroot@archiver.kernel.org>; Wed, 16 Mar 2022 22:16:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 640FA408DB;
	Wed, 16 Mar 2022 22:16:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MaNRzgrzl4W9; Wed, 16 Mar 2022 22:16:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 821484034F;
	Wed, 16 Mar 2022 22:16:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EBD811BF3DB
 for <buildroot@lists.busybox.net>; Wed, 16 Mar 2022 22:13:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D3EA380BE3
 for <buildroot@lists.busybox.net>; Wed, 16 Mar 2022 22:13:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gfrBT_ioRwK0 for <buildroot@lists.busybox.net>;
 Wed, 16 Mar 2022 22:13:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EE45580BA8
 for <buildroot@busybox.net>; Wed, 16 Mar 2022 22:13:30 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:6da3:2756:3f87:4127])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 3DC4213F85F;
 Wed, 16 Mar 2022 23:13:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1647468809;
 bh=6AOw5ixLx0tY6boPMYx7Qjf+nVDf4XctF9sb+2AlHg4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nQ89UQh0nIDf0IurKVa9lPrS/wFXm/YDEAFfOCU744BDWvnTdK3RbN/RbfuZ7K+CU
 wli/7uPkwzLoubuAKdqAgU4TohRXNsIYA2PaGe3gqA3qL1s4cRIAm/0M2Bn+j/AVQB
 PORzjB54qEjkLyJgXRXsNbze9nQ9ur+s3lt2W5HO/0nin9bW/1uBysaM8TWWDVaoKH
 lZBGJNhUPKJ99ERo16SH3weqbL4b+edPTMHCXC+lWa5qD4Rx26SIxKsqGYSZjAox1y
 k9xdW206yPDHHWTywZXkXeKd4W4JNTT7oYpPnP5UjgxFSN+huDQCudP//M/7ahElSI
 hyzrGLPHnvfbQ==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 16 Mar 2022 23:13:26 +0100
Date: Wed, 16 Mar 2022 23:13:26 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Francois Perrad <fperrad@gmail.com>
Message-ID: <20220316221326.GF283544@scaer>
References: <20220316105753.1134088-1-francois.perrad@gadz.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220316105753.1134088-1-francois.perrad@gadz.org>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH] package/libressl: security bump to 3.4.3
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

RnJhbsOnb2lzLCBBbGwsCgpPbiAyMDIyLTAzLTE2IDExOjU3ICswMTAwLCBGcmFuY29pcyBQZXJy
YWQgc3Bha2UgdGh1c2x5Ogo+IHNlZSBodHRwczovL21hcmMuaW5mby8/bD1vcGVuYnNkLWFubm91
bmNlJm09MTY0NzM2NTMxNzE0NTQ5Jnc9Mgo+IAo+IFNpZ25lZC1vZmYtYnk6IEZyYW5jb2lzIFBl
cnJhZCA8ZnJhbmNvaXMucGVycmFkQGdhZHoub3JnPgoKQXBwbGllZCB0byBtYXN0ZXIsIHRoYW5r
cy4KClJlZ2FyZHMsCllhbm4gRS4gTU9SSU4uCgo+IC0tLQo+ICBwYWNrYWdlL2xpYnJlc3NsL2xp
YnJlc3NsLmhhc2ggfCAyICstCj4gIHBhY2thZ2UvbGlicmVzc2wvbGlicmVzc2wubWsgICB8IDIg
Ky0KPiAgMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4g
Cj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvbGlicmVzc2wvbGlicmVzc2wuaGFzaCBiL3BhY2thZ2Uv
bGlicmVzc2wvbGlicmVzc2wuaGFzaAo+IGluZGV4IDk5MGVjOGJkYS4uZTkyMzk5ODcxIDEwMDY0
NAo+IC0tLSBhL3BhY2thZ2UvbGlicmVzc2wvbGlicmVzc2wuaGFzaAo+ICsrKyBiL3BhY2thZ2Uv
bGlicmVzc2wvbGlicmVzc2wuaGFzaAo+IEBAIC0xLDQgKzEsNCBAQAo+ICAjIEZyb20gaHR0cHM6
Ly9mdHAub3BlbmJzZC5vcmcvcHViL09wZW5CU0QvTGlicmVTU0wvU0hBMjU2Cj4gLXNoYTI1NiAg
Y2I4MmNhN2Q1NDczMzY5MTczNTJmYmQyM2RiMmZjNDgzYzZjNDRkMzUxNTdiMzI3ODAyMTRlYzc0
MTk3YjNjZSAgbGlicmVzc2wtMy40LjIudGFyLmd6Cj4gK3NoYTI1NiAgZmY4OGJmZmUzNTQ4MThi
M2NjZjU0NWUzY2FmZTQ1NGM1MDMxYzdhNzcyMTcwNzRmNTMzMjcxZDYzYzM3ZjA4ZCAgbGlicmVz
c2wtMy40LjMudGFyLmd6Cj4gICMgTG9jYWxseSBjb21wdXRlZAo+ICBzaGEyNTYgIDVjNjM2MTNm
MDA4ZjE2YTljMDAyNWMwOTZiYmQ3MzZjZWNmNzIwNDk0ZDEyMWI1YzUyMDNlMGVjNmU1OTU1YjEg
IENPUFlJTkcKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9saWJyZXNzbC9saWJyZXNzbC5tayBiL3Bh
Y2thZ2UvbGlicmVzc2wvbGlicmVzc2wubWsKPiBpbmRleCA2ZWVlODZkZGEuLjBiYjQ2OGNlZCAx
MDA2NDQKPiAtLS0gYS9wYWNrYWdlL2xpYnJlc3NsL2xpYnJlc3NsLm1rCj4gKysrIGIvcGFja2Fn
ZS9saWJyZXNzbC9saWJyZXNzbC5tawo+IEBAIC00LDcgKzQsNyBAQAo+ICAjCj4gICMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjCj4gIAo+IC1MSUJSRVNTTF9WRVJTSU9OID0gMy40LjIKPiArTElCUkVT
U0xfVkVSU0lPTiA9IDMuNC4zCj4gIExJQlJFU1NMX1NJVEUgPSBodHRwczovL2Z0cC5vcGVuYnNk
Lm9yZy9wdWIvT3BlbkJTRC9MaWJyZVNTTAo+ICBMSUJSRVNTTF9MSUNFTlNFID0gSVNDIChuZXcg
YWRkaXRpb25zKSwgT3BlblNTTCBvciBTU0xlYXkgKG9yaWdpbmFsIE9wZW5TU0wgY29kZSkKPiAg
TElCUkVTU0xfTElDRU5TRV9GSUxFUyA9IENPUFlJTkcKPiAtLSAKPiAyLjMyLjAKPiAKPiBfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGJ1aWxkcm9vdCBt
YWlsaW5nIGxpc3QKPiBidWlsZHJvb3RAYnVpbGRyb290Lm9yZwo+IGh0dHBzOi8vbGlzdHMuYnVp
bGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAoKLS0gCi4tLS0tLS0tLS0tLS0t
LS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0t
LS0tLS0tLS0uCnwgIFlhbm4gRS4gTU9SSU4gIHwgUmVhbC1UaW1lIEVtYmVkZGVkIHwgLyJcIEFT
Q0lJIFJJQkJPTiB8IEVyaWNzJyBjb25zcGlyYWN5OiB8CnwgKzMzIDY2MiAzNzYgMDU2IHwgU29m
dHdhcmUgIERlc2lnbmVyIHwgXCAvIENBTVBBSUdOICAgICB8ICBfX18gICAgICAgICAgICAgICB8
CnwgKzMzIDU2MSAwOTkgNDI3IGAtLS0tLS0tLS0tLS0uLS0tLS0tLTogIFggIEFHQUlOU1QgICAg
ICB8ICBcZS8gIFRoZXJlIGlzIG5vICB8CnwgaHR0cDovL3ltb3Jpbi5pcy1hLWdlZWsub3JnLyB8
IF8vKlxfIHwgLyBcIEhUTUwgTUFJTCAgICB8ICAgdiAgIGNvbnNwaXJhY3kuICB8CictLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0t
LS0tLS0tLS0tLS0tLS0nCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0
cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
