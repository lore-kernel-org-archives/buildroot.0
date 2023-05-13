Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5675AC77B7A
	for <buildroot@archiver.kernel.org>; Sat, 13 May 2023 19:33:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 044046150C;
	Sat, 13 May 2023 19:33:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 044046150C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Uy4VypWuZy2I; Sat, 13 May 2023 19:33:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4F80E60AE5;
	Sat, 13 May 2023 19:33:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4F80E60AE5
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BA1911BF5B4
 for <buildroot@lists.busybox.net>; Sat, 13 May 2023 19:33:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 91B65614AA
 for <buildroot@lists.busybox.net>; Sat, 13 May 2023 19:33:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 91B65614AA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9qDpmITouj-I for <buildroot@lists.busybox.net>;
 Sat, 13 May 2023 19:33:30 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9433F60740
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9433F60740
 for <buildroot@buildroot.org>; Sat, 13 May 2023 19:33:30 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:b62a:d745:2556:f18])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id B173C19F73D;
 Sat, 13 May 2023 21:33:24 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 13 May 2023 21:33:24 +0200
Date: Sat, 13 May 2023 21:33:24 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: =?utf-8?B?UmFwaGHDq2wgTcOpbG90dGU=?= <raphael.melotte@mind.be>
Message-ID: <20230513193324.GC2582048@scaer>
References: <20230418094317.2236091-1-raphael.melotte@mind.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230418094317.2236091-1-raphael.melotte@mind.be>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1684006407;
 bh=CE9x1sHiz4HLAsnON13e2JWV6USzpghWx+ToAfu7r9g=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=G90Q2mJforxQCpmXHEfmKrWW+Q0nJpD8PT+pjdpdSSkGa1tFOo1Ws6/eYsArie5V2
 wlIegS/RIeQRSbZsAG+dlc8AvnYZxd4rlqP30c8/5FN2wU4kk5z4zgqJKiwdOWRb73
 MbgJK/oIdmv8ITe2krRzke+Wl2HhlLdh2kp8illSC4lu/FDs2TTjLbdek9o4tJB6RB
 Lx2hFdn0yWLuCsdJs5VCHuJHZbllGMTKr3YLcB2ssjI77YF5kb6hz3IMuTBT03G81U
 muThVMaIiLAhCnzE77ITFFnFLw0NNqXjTVBErLz0DqYtD4C8fAJdt9JFYY8p2nGF0u
 bu1Y9lL26lIQQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=G90Q2mJf
Subject: Re: [Buildroot] [PATCH 1/2] package: python-botocore: bump to
 1.29.115
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
Cc: Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

UmFwaGHDq2wsIEFsbCwKCk9uIDIwMjMtMDQtMTggMTE6NDMgKzAyMDAsIFJhcGhhw6tsIE3DqWxv
dHRlIHNwYWtlIHRodXNseToKPiBTaWduZWQtb2ZmLWJ5OiBSYXBoYcOrbCBNw6lsb3R0ZSA8cmFw
aGFlbC5tZWxvdHRlQG1pbmQuYmU+CgpCb3RoIGFwcGxpZWQgdG8gbWFzdGVyLCB0aGFua3MuCgpS
ZWdhcmRzLApZYW5uIEUuIE1PUklOLgoKPiAtLS0KPiAgcGFja2FnZS9weXRob24tYm90b2NvcmUv
cHl0aG9uLWJvdG9jb3JlLmhhc2ggfCA1ICsrKy0tCj4gIHBhY2thZ2UvcHl0aG9uLWJvdG9jb3Jl
L3B5dGhvbi1ib3RvY29yZS5tayAgIHwgNiArKystLS0KPiAgMiBmaWxlcyBjaGFuZ2VkLCA2IGlu
c2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvcHl0
aG9uLWJvdG9jb3JlL3B5dGhvbi1ib3RvY29yZS5oYXNoIGIvcGFja2FnZS9weXRob24tYm90b2Nv
cmUvcHl0aG9uLWJvdG9jb3JlLmhhc2gKPiBpbmRleCA1N2QwN2E2NzExLi44OWY0YzA2ZGU4IDEw
MDY0NAo+IC0tLSBhL3BhY2thZ2UvcHl0aG9uLWJvdG9jb3JlL3B5dGhvbi1ib3RvY29yZS5oYXNo
Cj4gKysrIGIvcGFja2FnZS9weXRob24tYm90b2NvcmUvcHl0aG9uLWJvdG9jb3JlLmhhc2gKPiBA
QCAtMSw1ICsxLDYgQEAKPiAgIyBtZDUsIHNoYTI1NiBmcm9tIGh0dHBzOi8vcHlwaS5vcmcvcHlw
aS9ib3RvY29yZS9qc29uCj4gLW1kNSAgYzYwODcwOWE1Y2YzZTY3NDQyZjQyNTRhMzRkMWZhYWIg
IGJvdG9jb3JlLTEuMjkuOTYudGFyLmd6Cj4gLXNoYTI1NiAgYjk3ODExMDg4MTBlMzNmODQwNjk0
MmMzZTNhYWI3NDg2NTBjNTlkNWNkZGI3YzlkMzIzZjRlMjY4MmU3YjBiNiAgYm90b2NvcmUtMS4y
OS45Ni50YXIuZ3oKPiArbWQ1ICA4MDVlNjM4YzM1M2M1MzJjMmFmN2E3NTM4ZDViZDRkNiAgYm90
b2NvcmUtMS4yOS4xMTUudGFyLmd6Cj4gK3NoYTI1NiAgNThlZWU4Y2Y4ZjRmM2U1MTVkZjI5ZjZk
YzUzNWRkODZlZDNmNGNlYTQwOTk5YzViYzc0NjQwZmY0MGJkYzcxZiAgYm90b2NvcmUtMS4yOS4x
MTUudGFyLmd6Cj4gICMgTG9jYWxseSBjb21wdXRlZCBzaGEyNTYgY2hlY2tzdW1zCj4gIHNoYTI1
NiAgMGQ1NDJlMGM4ODA0ZTM5YWE3ZjM3ZWIwMGRhNWE3NjIxNDlkYzY4MmQ3ODI5NDUxMjg3ZTEx
YjkzOGU5NDU5NCAgTElDRU5TRS50eHQKPiArc2hhMjU2ICBjZmM3NzQ5Yjk2ZjYzYmQzMWMzYzQy
YjVjNDcxYmY3NTY4MTQwNTNlODQ3YzEwZjNlYjAwMzQxN2JjNTIzZDMwICB0ZXN0cy91bml0L2F1
dGgvYXdzNF90ZXN0c3VpdGUvTElDRU5TRQo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3B5dGhvbi1i
b3RvY29yZS9weXRob24tYm90b2NvcmUubWsgYi9wYWNrYWdlL3B5dGhvbi1ib3RvY29yZS9weXRo
b24tYm90b2NvcmUubWsKPiBpbmRleCA2ZDA3NDdjMGRmLi4zZTgyOGZlZjc4IDEwMDY0NAo+IC0t
LSBhL3BhY2thZ2UvcHl0aG9uLWJvdG9jb3JlL3B5dGhvbi1ib3RvY29yZS5tawo+ICsrKyBiL3Bh
Y2thZ2UvcHl0aG9uLWJvdG9jb3JlL3B5dGhvbi1ib3RvY29yZS5tawo+IEBAIC00LDExICs0LDEx
IEBACj4gICMKPiAgIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKPiAgCj4gLVBZVEhPTl9CT1RPQ09S
RV9WRVJTSU9OID0gMS4yOS45Ngo+ICtQWVRIT05fQk9UT0NPUkVfVkVSU0lPTiA9IDEuMjkuMTE1
Cj4gIFBZVEhPTl9CT1RPQ09SRV9TT1VSQ0UgPSBib3RvY29yZS0kKFBZVEhPTl9CT1RPQ09SRV9W
RVJTSU9OKS50YXIuZ3oKPiAtUFlUSE9OX0JPVE9DT1JFX1NJVEUgPSBodHRwczovL2ZpbGVzLnB5
dGhvbmhvc3RlZC5vcmcvcGFja2FnZXMvMmQvYjUvNGE5ODZhZWI0ZTNkMTgyZjdlZjExNjcwNTk2
MmQzYzk4YzAyNjNiZWFmODdjNDk4MzZiN2RmYjkxODM3Cj4gK1BZVEhPTl9CT1RPQ09SRV9TSVRF
ID0gaHR0cHM6Ly9maWxlcy5weXRob25ob3N0ZWQub3JnL3BhY2thZ2VzLzllLzAwLzQ1NjAwODFh
NDMxYWFhMTRjMjI1NzA0MGQ0M2Y1NmMyY2NiYTgxNmQ4YmNlM2I4ZTE1NzdhMTlmNDA3Ngo+ICBQ
WVRIT05fQk9UT0NPUkVfU0VUVVBfVFlQRSA9IHNldHVwdG9vbHMKPiAgUFlUSE9OX0JPVE9DT1JF
X0xJQ0VOU0UgPSBBcGFjaGUtMi4wCj4gLVBZVEhPTl9CT1RPQ09SRV9MSUNFTlNFX0ZJTEVTID0g
TElDRU5TRS50eHQKPiArUFlUSE9OX0JPVE9DT1JFX0xJQ0VOU0VfRklMRVMgPSBMSUNFTlNFLnR4
dCB0ZXN0cy91bml0L2F1dGgvYXdzNF90ZXN0c3VpdGUvTElDRU5TRQo+ICAKPiAgJChldmFsICQo
cHl0aG9uLXBhY2thZ2UpKQo+IC0tIAo+IDIuMzcuMwo+IAo+IF9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+IGJ1
aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4gaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxt
YW4vbGlzdGluZm8vYnVpbGRyb290CgotLSAKLi0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0t
LS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4KfCAgWWFu
biBFLiBNT1JJTiAgfCBSZWFsLVRpbWUgRW1iZWRkZWQgfCAvIlwgQVNDSUkgUklCQk9OIHwgRXJp
Y3MnIGNvbnNwaXJhY3k6IHwKfCArMzMgNjYyIDM3NiAwNTYgfCBTb2Z0d2FyZSAgRGVzaWduZXIg
fCBcIC8gQ0FNUEFJR04gICAgIHwgIF9fXyAgICAgICAgICAgICAgIHwKfCArMzMgNTYxIDA5OSA0
MjcgYC0tLS0tLS0tLS0tLS4tLS0tLS0tOiAgWCAgQUdBSU5TVCAgICAgIHwgIFxlLyAgVGhlcmUg
aXMgbm8gIHwKfCBodHRwOi8veW1vcmluLmlzLWEtZ2Vlay5vcmcvIHwgXy8qXF8gfCAvIFwgSFRN
TCBNQUlMICAgIHwgICB2ICAgY29uc3BpcmFjeS4gIHwKJy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLV4tLS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS0tLScK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290
IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxk
cm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
