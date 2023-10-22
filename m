Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72AFAC0032E
	for <buildroot@archiver.kernel.org>; Sun, 22 Oct 2023 11:59:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 01927402A7;
	Sun, 22 Oct 2023 11:59:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 01927402A7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QTnDVPLAF05k; Sun, 22 Oct 2023 11:59:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 34D064027B;
	Sun, 22 Oct 2023 11:59:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 34D064027B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 299EE1BF4DA
 for <buildroot@lists.busybox.net>; Sun, 22 Oct 2023 11:59:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F1C9170A36
 for <buildroot@lists.busybox.net>; Sun, 22 Oct 2023 11:59:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F1C9170A36
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hG3ttO1J_R_C for <buildroot@lists.busybox.net>;
 Sun, 22 Oct 2023 11:59:51 +0000 (UTC)
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C313B60E11
 for <buildroot@buildroot.org>; Sun, 22 Oct 2023 11:59:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C313B60E11
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:fb1e:781c:6f9a:fbfd])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id EE1526012F;
 Sun, 22 Oct 2023 13:59:45 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 22 Oct 2023 13:59:45 +0200
Date: Sun, 22 Oct 2023 13:59:45 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: =?utf-8?B?R2HDq2w=?= PORTAY <gael.portay@rtone.fr>
Message-ID: <20231022115945.GH2607@scaer>
References: <20231020090949.2839604-1-gael.portay@rtone.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231020090949.2839604-1-gael.portay@rtone.fr>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1697975989;
 bh=/wsBK/Ga4IWLRRvNvZ/ByBn2pIUiEb5bsgXThh2Pd5E=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MxqcWqXq6+Yx3aNHcDGNDZUgW/t5wZ3vErJh1c4Gbl7dSqC1HxPgfbCLTuyjcqRF0
 +iVdO8RF3OnQt18GpWX0rtpP76cP/NofIG3gerOvhXV61lII0rAgjJRLDN5jakUtDd
 6m5F/nV9Nnk+ZTqNV6eC4VeuaXtAWWdK3eaIp5FVbmccFw9OimghE48Gx5tcgglECm
 ei2HxFEOf6lQewSak/drpq4Qv8vv/Tv9xXaD2JhUf1WV8c/iGFBVDAwtGpg9ojI+Gw
 7UFHWzUFfI0WyUxUhmjFh/07hIPS3AcEmFUyeBLBVvdzLaU4FqIZPjXZWqPIrLiobG
 n+cJ7e+mMbAEg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=MxqcWqXq
Subject: Re: [Buildroot] [PATCH 1/1] package/libxmlrpc: bump version to
 1.60.00 (code/advanced@r3162)
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
Cc: "Alvaro G . M" <alvaro.gamez@hazent.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

R2HDq2wsIEFsbCwKCk9uIDIwMjMtMTAtMjAgMTE6MDkgKzAyMDAsIEdhw6tsIFBPUlRBWSBzcGFr
ZSB0aHVzbHk6Cj4gU2lnbmVkLW9mZi1ieTogR2HDq2wgUE9SVEFZIDxnYWVsLnBvcnRheUBydG9u
ZS5mcj4KPiAtLS0KPiAgcGFja2FnZS9saWJ4bWxycGMvbGlieG1scnBjLmhhc2ggfCAyICstCj4g
IHBhY2thZ2UvbGlieG1scnBjL2xpYnhtbHJwYy5tayAgIHwgNCArKy0tCj4gIDIgZmlsZXMgY2hh
bmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9w
YWNrYWdlL2xpYnhtbHJwYy9saWJ4bWxycGMuaGFzaCBiL3BhY2thZ2UvbGlieG1scnBjL2xpYnht
bHJwYy5oYXNoCj4gaW5kZXggNjY1ZWUzMTgzNi4uY2FkNGQwZTM3OSAxMDA2NDQKPiAtLS0gYS9w
YWNrYWdlL2xpYnhtbHJwYy9saWJ4bWxycGMuaGFzaAo+ICsrKyBiL3BhY2thZ2UvbGlieG1scnBj
L2xpYnhtbHJwYy5oYXNoCj4gQEAgLTEsMyArMSwzIEBACj4gICMgTG9jYWxseSBjb21wdXRlZAo+
IC1zaGEyNTYgIDYyNmUzNjI5NWY0M2IzMjAwODJiYzdiZGQ5NjFiNDZmMzlmYmUyNzE5NTM1YjVh
NDE3OTc1YThlNTBjOGY3ZjMgIGxpYnhtbHJwYy1yMzExOS1icjMudGFyLmd6Cj4gK3NoYTI1NiAg
YWM1ZjVlODNjNmZlYWE1Mjc2ZmQwNjEwYjA1NWM2ZTVkMzUwMDg5NzA0YjYwYzE3ZDVhZjMwYWZi
MDg1MDZjNSAgbGlieG1scnBjLXIzMTYyLWJyMy50YXIuZ3oKPiAgc2hhMjU2ICBkYjdhNmQzZjE4
N2IyMThjMzUzNDAxMGE4MzQyNGM2YmNkZWY4OGU2YTBiNmIxYWEzYTg3NjIyMzhiZDY0MmU2ICBk
b2MvQ09QWUlORwo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL2xpYnhtbHJwYy9saWJ4bWxycGMubWsg
Yi9wYWNrYWdlL2xpYnhtbHJwYy9saWJ4bWxycGMubWsKPiBpbmRleCBjMWIwZWFlOGVlLi4yZDNl
ZTY2MDUwIDEwMDY0NAo+IC0tLSBhL3BhY2thZ2UvbGlieG1scnBjL2xpYnhtbHJwYy5tawo+ICsr
KyBiL3BhY2thZ2UvbGlieG1scnBjL2xpYnhtbHJwYy5tawo+IEBAIC00LDggKzQsOCBAQAo+ICAj
Cj4gICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCj4gIAo+IC0jIDEuNTguMDIgKGNvZGUvYWR2YW5j
ZWRAcjMxMTkpCj4gLUxJQlhNTFJQQ19WRVJTSU9OID0gcjMxMTkKPiArIyAxLjYwLjAwIChjb2Rl
L2FkdmFuY2VkQHIzMTYyKQo+ICtMSUJYTUxSUENfVkVSU0lPTiA9IHIzMTYyCj4gIExJQlhNTFJQ
Q19TSVRFID0gaHR0cHM6Ly9zdm4uY29kZS5zZi5uZXQvcC94bWxycGMtYy9jb2RlL2FkdmFuY2Vk
CgpXaHkgZG9uJ3Qgd2UgdXNlIHRoZSAidGFnIiByYXRoZXIgdGhhbiBhIHJldmlzaW9uIGluIHRo
ZSBkZXYgYnJhbmNoOgoKICAgIGh0dHA6Ly9zdm4uY29kZS5zZi5uZXQvcC94bWxycGMtYy9jb2Rl
L3JlbGVhc2VfbnVtYmVyLzAxLjYwLjAwCgpPSywgaXQgbG9va3MgbGlrZSBub3QgYWxsIHZlcnNp
b25zIGdldCBhIHRhZywgYW5kIDAxLjA2LjAxIGlzIGE7cmVhZHkKcmVsZWFzZWQgd2l0aG91dCBh
IHRhZy4uLgoKUmVnYXJkcywKWWFubiBFLiBNT1JJTi4KCj4gIExJQlhNTFJQQ19TSVRFX01FVEhP
RCA9IHN2bgo+ICBMSUJYTUxSUENfTElDRU5TRSA9IEJTRC0zLUNsYXVzZSAoeG1sLXJwYyBtYWlu
IGNvZGUgYW5kIGFieXNzIHdlYiBzZXJ2ZXIpLCBCU0QgbGlrZSAobGliL2V4cGF0KSwgUHl0aG9u
IDEuNS4yIGxpY2Vuc2UgKHBhcnRzIG9mIHhtbHJwY19iYXNlNjQuYykKPiAtLSAKPiAyLjQyLjAK
PiAKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGJ1
aWxkcm9vdCBtYWlsaW5nIGxpc3QKPiBidWlsZHJvb3RAYnVpbGRyb290Lm9yZwo+IGh0dHBzOi8v
bGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAoKLS0gCi4tLS0t
LS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0uLS0t
LS0tLS0tLS0tLS0tLS0tLS0uCnwgIFlhbm4gRS4gTU9SSU4gIHwgUmVhbC1UaW1lIEVtYmVkZGVk
IHwgLyJcIEFTQ0lJIFJJQkJPTiB8IEVyaWNzJyBjb25zcGlyYWN5OiB8CnwgKzMzIDY2MiAzNzYg
MDU2IHwgU29mdHdhcmUgIERlc2lnbmVyIHwgXCAvIENBTVBBSUdOICAgICB8ICBfX18gICAgICAg
ICAgICAgICB8CnwgKzMzIDU2MSAwOTkgNDI3IGAtLS0tLS0tLS0tLS0uLS0tLS0tLTogIFggIEFH
QUlOU1QgICAgICB8ICBcZS8gIFRoZXJlIGlzIG5vICB8CnwgaHR0cDovL3ltb3Jpbi5pcy1hLWdl
ZWsub3JnLyB8IF8vKlxfIHwgLyBcIEhUTUwgTUFJTCAgICB8ICAgdiAgIGNvbnNwaXJhY3kuICB8
CictLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0t
LS1eLS0tLS0tLS0tLS0tLS0tLS0tLS0nCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9v
dC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRy
b290Cg==
