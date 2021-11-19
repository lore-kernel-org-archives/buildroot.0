Return-Path: <SRS0=y7vk=QG=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3ECEC433EF
	for <buildroot@archiver.kernel.org>; Fri, 19 Nov 2021 16:05:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EA01461B1B
	for <buildroot@archiver.kernel.org>; Fri, 19 Nov 2021 16:05:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EA01461B1B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7E5C140953;
	Fri, 19 Nov 2021 16:05:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hYa9DYwD9L2K; Fri, 19 Nov 2021 16:05:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8A0C14094D;
	Fri, 19 Nov 2021 16:05:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D1B141BF21A
 for <buildroot@lists.busybox.net>; Fri, 19 Nov 2021 16:05:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C151D827C9
 for <buildroot@lists.busybox.net>; Fri, 19 Nov 2021 16:05:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 63LrXgeFP-0C for <buildroot@lists.busybox.net>;
 Fri, 19 Nov 2021 16:05:18 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 822BD827BA
 for <buildroot@buildroot.org>; Fri, 19 Nov 2021 16:05:18 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:8ce3:604:2d0f:2718])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id DE8ED2003CA;
 Fri, 19 Nov 2021 17:05:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1637337915;
 bh=9s3PJtn8o2JNJxv0yIVd6ulReTJa1Co7WfNPMOPUYgI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=U4fG2f4e8cSG0lJMUkRtGHq2qcNcHprfw3bcjmRYHn20tgBWvrusEYWa/mNgRVTC1
 BI/FEaI+8wP8x97QeX44N2FVEliS/my0O/2FYCN5yNvRjTi9z1Fdu8wNcfA57Ime6g
 Z1ZkUaX7Vmwfu0xSv3o0SRNA9JvNn5zUj3lImfo5cAWQG1sOrLoeBfIuutpPrR/H+M
 Jot8lHY4ShSqPazM3kyjZ9a28G9i/kX1bpERzLQ7vbDBG1ZeQVoOag1OBeDfXxMLoo
 mAp0bblkea8j0OQTCVpRNmlw2QJ+o277wI9nYZb9Bas1g6bWUVH9gikJ0TPKOl6vgK
 Wcj27fZS6XMMA==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 19 Nov 2021 17:05:10 +0100
Date: Fri, 19 Nov 2021 17:05:10 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: =?utf-8?Q?S=C3=A9bastien?= Szymanski <sebastien.szymanski@armadeus.com>
Message-ID: <20211119160510.GO247986@scaer>
References: <20211119085902.14877-1-sebastien.szymanski@armadeus.com>
 <20211119101140.GN247986@scaer>
 <47a68b89-d935-59f3-b051-c60c3e2d33d1@armadeus.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <47a68b89-d935-59f3-b051-c60c3e2d33d1@armadeus.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/pcre: fix broken URL
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

U8OpYmFzdGllbiwgQWxsLAoKT24gMjAyMS0xMS0xOSAxMTozNiArMDEwMCwgU8OpYmFzdGllbiBT
enltYW5za2kgc3Bha2UgdGh1c2x5Ogo+IE9uIDExLzE5LzIxIDExOjExLCBZYW5uIEUuIE1PUklO
IHdyb3RlOgo+ID5PbiAyMDIxLTExLTE5IDA5OjU5ICswMTAwLCBTw6liYXN0aWVuIFN6eW1hbnNr
aSBzcGFrZSB0aHVzbHk6Cj4gPj5BcyBzdGF0ZWQgb24gd3d3LnBjcmUub3JnOgo+ID4+Ik5vdGUg
dGhhdCB0aGUgZm9ybWVyIGZ0cC5wY3JlLm9yZyBGVFAgc2l0ZSBpcyBubyBsb25nZXIgYXZhaWxh
YmxlLiIKPiA+Pgo+ID4+VXBkYXRlIF9TSVRFIFVSTCB0byBTb3VyY2Vmb3JnZS4KPiA+Cj4gPlRo
ZSBob21lcGFnZSBzdGF0ZXMgdGhhdCB0aGUgb2ZmaWNpYWwgcmVsZWFzZSBjaGFubmVsIGlzIGdp
dGh1YiwgYW5kCj4gPnRoYXQgc291cmNlZm9yZ2UgaXMgdW5vZmljaWFsOgpbLS1TTklQLS1dCj4g
PlNvIGNvdWxkIHlvdSByZXNwaW4gdXNpbmcgdGhlIHJlbGVhc2UgZnJvbSBnaXRodWIsIHBsZWFz
RT8KPiBObywgSSBjYW4ndCBiZWNhdXNlIHRoZXJlIGFyZSBwY3JlMiAodHdvKSByZWxlYXNlcyBv
bmx5IG9uIGdpdGh1Yi4uLgo+IEFzIGV4cGxhaW5lZCBpbiB3aGF0IHlvdSBjb3BpZWQgLyBwYXN0
ZWQsIG9sZGVyIHJlbGVhc2VzIGFyZSBvbiBTb3VyY2VGb3JnZS4KCkFyZywgdGhpcyBpcyBhYm91
dCB0aGUgb3JpZ2luYWwgcGNyZS4gV2hhdCBnb3QgbWUgY29uZnVzZWQgaXMgdGhlIG1peCBvZgpw
Y3JlLCB1bm1haW50YWluZWQsIDE5OTcsIGZpbmFsIHJlbGVhc2UsIGVuZCBvZiBsaWZlLCBhbGwg
Y29iYmxlZCB0b2dldGhlcgp0byBjb25mdXNlIG1lLiBJdCB3b3JrZWQsIEkgZ290IGNvbmZ1c2Vk
LgoKRGFuZyBpdCwgc29ycnkgZm9yIHRoZSBjb25mdXNpb24uLi4KCkFwcGxpZWQgdG8gbWFzdGVy
LCB0aGFua3MuCgpSZWdhcmRzLApZYW5uIEUuIE1PUklOLgoKLS0gCi4tLS0tLS0tLS0tLS0tLS0t
LS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0t
LS0tLS0uCnwgIFlhbm4gRS4gTU9SSU4gIHwgUmVhbC1UaW1lIEVtYmVkZGVkIHwgLyJcIEFTQ0lJ
IFJJQkJPTiB8IEVyaWNzJyBjb25zcGlyYWN5OiB8CnwgKzMzIDY2MiAzNzYgMDU2IHwgU29mdHdh
cmUgIERlc2lnbmVyIHwgXCAvIENBTVBBSUdOICAgICB8ICBfX18gICAgICAgICAgICAgICB8Cnwg
KzMzIDU2MSAwOTkgNDI3IGAtLS0tLS0tLS0tLS0uLS0tLS0tLTogIFggIEFHQUlOU1QgICAgICB8
ICBcZS8gIFRoZXJlIGlzIG5vICB8CnwgaHR0cDovL3ltb3Jpbi5pcy1hLWdlZWsub3JnLyB8IF8v
KlxfIHwgLyBcIEhUTUwgTUFJTCAgICB8ICAgdiAgIGNvbnNwaXJhY3kuICB8CictLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0tLS0t
LS0tLS0tLS0tLS0nCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6
Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
