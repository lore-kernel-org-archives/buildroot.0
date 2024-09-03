Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06680CD3440
	for <buildroot@archiver.kernel.org>; Tue,  3 Sep 2024 21:12:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C60F140267;
	Tue,  3 Sep 2024 21:12:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k9XQD4CFwFP3; Tue,  3 Sep 2024 21:12:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 61BD54029A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 61BD54029A;
	Tue,  3 Sep 2024 21:12:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id ECE3B1BF48B
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 21:12:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CD053402A1
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 21:12:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Tz11m9DhaE6b for <buildroot@lists.busybox.net>;
 Tue,  3 Sep 2024 21:12:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5FF8E4029C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5FF8E4029C
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5FF8E4029C
 for <buildroot@buildroot.org>; Tue,  3 Sep 2024 21:12:04 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 914BD13F8A2;
 Tue,  3 Sep 2024 23:11:57 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 03 Sep 2024 23:11:57 +0200
Date: Tue, 3 Sep 2024 23:11:57 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: =?utf-8?Q?Fl=C3=A1vio_Tapaj=C3=B3s?= <flavio.tapajos@newtesc.com.br>
Message-ID: <Ztd7nWgxI5ZoJ5St@landeda>
References: <20240903202153.346589-1-flavio.tapajos@newtesc.com.br>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240903202153.346589-1-flavio.tapajos@newtesc.com.br>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1725397921;
 bh=ixjlBwABfpqKQbvTgTHEAGwQMCqQDWaqiUucu8n5UW8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cQuPMqVwLzHuVUA9n1k5UCoktODpwGKsAQcytNO8MI3n90Sf9/y2gpzd5Cgjuf+re
 iQNKgBWaF/Wx0IgNcAp5rLOvmXF/+Sc8hD2CiqnBCBvl2xA/tkN8V7MZdAQQB7rAby
 UKP4V6uteb264um86RVFOqwgE2OohsfILXejy3Tu95VkUGgfNvihMJi4xBGOAZXDsL
 AbGs/8J7Wqw/lo08ftSkbWGclXD8dDHK4EhMzjQ80P2ZXV/pffQuaKdnXpKMCjSx8b
 jz6ZmHZQbBX8zMkRvBg1guMOAJYTdXoFv1dSRoTYTaYfEyWnmuC4I7mrgfteXIfFr8
 bP9GeKyAxRDPw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=cQuPMqVw
Subject: Re: [Buildroot] [PATCH 1/1] package/python-sqlalchemy: bump version
 to 2.0.33
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

RmzDoXZpbywgQWxsLAoKT24gMjAyNC0wOS0wMyAxNzoyMSAtMDMwMCwgRmzDoXZpbyBUYXBhasOz
cyBzcGFrZSB0aHVzbHk6Cj4gU2lnbmVkLW9mZi1ieTogRmzDoXZpbyBUYXBhasOzcyA8Zmxhdmlv
LnRhcGFqb3NAbmV3dGVzYy5jb20uYnI+CgpJJ3ZlIGFkZGVkIGEgcG9pbnRlciB0byBhbiBhdXRv
YnVpbGQgZmFpbHVyZSBmb3IgcmVmZXJlbmNlOwogICAgaHR0cDovL2F1dG9idWlsZC5idWlsZHJv
b3Qub3JnL3Jlc3VsdHMvYzUzL2M1MzFiNmU2M2M1MTIxMTM4ZThlOGExYzVkMTUwMWQ5ZDdlMTM5
MWUvCgpBcHBsaWVkIHRvIG5leHQsIHRoYW5rcy4KClJlZ2FyZHMsCllhbm4gRS4gTU9SSU4uCgo+
IC0tLQo+ICBwYWNrYWdlL3B5dGhvbi1zcWxhbGNoZW15L3B5dGhvbi1zcWxhbGNoZW15Lmhhc2gg
fCA0ICsrLS0KPiAgcGFja2FnZS9weXRob24tc3FsYWxjaGVteS9weXRob24tc3FsYWxjaGVteS5t
ayAgIHwgNiArKystLS0KPiAgMiBmaWxlcyBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDUgZGVs
ZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvcHl0aG9uLXNxbGFsY2hlbXkvcHl0
aG9uLXNxbGFsY2hlbXkuaGFzaCBiL3BhY2thZ2UvcHl0aG9uLXNxbGFsY2hlbXkvcHl0aG9uLXNx
bGFsY2hlbXkuaGFzaAo+IGluZGV4IGQ5MjI3ZjA1MjguLjdmZmRmYWYxYjUgMTAwNjQ0Cj4gLS0t
IGEvcGFja2FnZS9weXRob24tc3FsYWxjaGVteS9weXRob24tc3FsYWxjaGVteS5oYXNoCj4gKysr
IGIvcGFja2FnZS9weXRob24tc3FsYWxjaGVteS9weXRob24tc3FsYWxjaGVteS5oYXNoCj4gQEAg
LTEsNSArMSw1IEBACj4gICMgbWQ1LCBzaGEyNTYgZnJvbSBodHRwczovL3B5cGkub3JnL3B5cGkv
c3FsYWxjaGVteS9qc29uCj4gLW1kNSAgZmQ5ZWQzODE0NGZjZTQ3OWVhOTZiNjYxZTA0OGEwMmYg
IFNRTEFsY2hlbXktMi4wLjMyLnRhci5nego+IC1zaGEyNTYgIGMxYjg4Y2M4YjAyYjZhNWYwZWZi
MDM0NWEwMzY3MmQ0Yzg5N2RjN2Q5MjU4NTE3NmY4OGM2NzM0NmY1NjVlYTggIFNRTEFsY2hlbXkt
Mi4wLjMyLnRhci5nego+ICttZDUgIDJkN2MwZGJiNGIyMWExY2IwNTQ2ZDUyMGU3Nzk1MDIyICBz
cWxhbGNoZW15LTIuMC4zMy50YXIuZ3oKPiArc2hhMjU2ICA5MWM5MzMzM2MyYjM3ZmY3MjFkYzgz
YjM3ZTI4YzI5ZGU0YzUwMmI1NjEyZjJkMDkzNDY4MDM3Yjg2YWEyYmUwICBzcWxhbGNoZW15LTIu
MC4zMy50YXIuZ3oKPiAgIyBMb2NhbGx5IGNvbXB1dGVkIHNoYTI1NiBjaGVja3N1bXMKPiAgc2hh
MjU2ICAzYzBmNTlhYjg4N2QwNDFkZTZhNGU1MmZmZTNlOWVkYjVkOTUyMmRlOTA5ZmFlOWE2Y2Q3
YWRiNmU3YmUzMjkzICBMSUNFTlNFCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvcHl0aG9uLXNxbGFs
Y2hlbXkvcHl0aG9uLXNxbGFsY2hlbXkubWsgYi9wYWNrYWdlL3B5dGhvbi1zcWxhbGNoZW15L3B5
dGhvbi1zcWxhbGNoZW15Lm1rCj4gaW5kZXggM2Y0ZTIwZTY2OS4uODQyMDFjZjgzMyAxMDA2NDQK
PiAtLS0gYS9wYWNrYWdlL3B5dGhvbi1zcWxhbGNoZW15L3B5dGhvbi1zcWxhbGNoZW15Lm1rCj4g
KysrIGIvcGFja2FnZS9weXRob24tc3FsYWxjaGVteS9weXRob24tc3FsYWxjaGVteS5tawo+IEBA
IC00LDkgKzQsOSBAQAo+ICAjCj4gICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCj4gIAo+IC1QWVRI
T05fU1FMQUxDSEVNWV9WRVJTSU9OID0gMi4wLjMyCj4gLVBZVEhPTl9TUUxBTENIRU1ZX1NPVVJD
RSA9IFNRTEFsY2hlbXktJChQWVRIT05fU1FMQUxDSEVNWV9WRVJTSU9OKS50YXIuZ3oKPiAtUFlU
SE9OX1NRTEFMQ0hFTVlfU0lURSA9IGh0dHBzOi8vZmlsZXMucHl0aG9uaG9zdGVkLm9yZy9wYWNr
YWdlcy9hZi82Zi85NjdlOTg3NjgzOTA4YWY4MTZhYTMwNzJjMWE2OTk3YWM5OTMzY2YzOGQ2NmIw
NDc0ZmIwM2YyNTMzMjMKPiArUFlUSE9OX1NRTEFMQ0hFTVlfVkVSU0lPTiA9IDIuMC4zMwo+ICtQ
WVRIT05fU1FMQUxDSEVNWV9TT1VSQ0UgPSBzcWxhbGNoZW15LSQoUFlUSE9OX1NRTEFMQ0hFTVlf
VkVSU0lPTikudGFyLmd6Cj4gK1BZVEhPTl9TUUxBTENIRU1ZX1NJVEUgPSBodHRwczovL2ZpbGVz
LnB5dGhvbmhvc3RlZC5vcmcvcGFja2FnZXMvZDUvNzAvNmRjNDM3YWZmMjBlNDU0ZThhYzM1Y2Rj
Yzc0NjIwZmFkNTU5ODViNWVhMjgzMGZhMmQ3M2IwMmQ1ODA1Cj4gIFBZVEhPTl9TUUxBTENIRU1Z
X1NFVFVQX1RZUEUgPSBzZXR1cHRvb2xzCj4gIFBZVEhPTl9TUUxBTENIRU1ZX0xJQ0VOU0UgPSBN
SVQKPiAgUFlUSE9OX1NRTEFMQ0hFTVlfTElDRU5TRV9GSUxFUyA9IExJQ0VOU0UKPiAtLSAKPiAy
LjQ2LjAKPiAKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Xwo+IGJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKPiBidWlsZHJvb3RAYnVpbGRyb290Lm9yZwo+IGh0
dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAoKLS0g
Ci4tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0t
LS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0uCnwgIFlhbm4gRS4gTU9SSU4gIHwgUmVhbC1UaW1lIEVt
YmVkZGVkIHwgLyJcIEFTQ0lJIFJJQkJPTiB8IEVyaWNzJyBjb25zcGlyYWN5OiB8CnwgKzMzIDY2
MiAzNzYgMDU2IHwgU29mdHdhcmUgIERlc2lnbmVyIHwgXCAvIENBTVBBSUdOICAgICB8ICBfX18g
ICAgICAgICAgICAgICB8CnwgKzMzIDU2MSAwOTkgNDI3IGAtLS0tLS0tLS0tLS0uLS0tLS0tLTog
IFggIEFHQUlOU1QgICAgICB8ICBcZS8gIFRoZXJlIGlzIG5vICB8CnwgaHR0cDovL3ltb3Jpbi5p
cy1hLWdlZWsub3JnLyB8IF8vKlxfIHwgLyBcIEhUTUwgTUFJTCAgICB8ICAgdiAgIGNvbnNwaXJh
Y3kuICB8CictLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0tLV4tLS0tLS0tLS0t
LS0tLS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0tLS0nCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1
aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8v
YnVpbGRyb290Cg==
