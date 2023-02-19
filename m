Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CF66C05027
	for <buildroot@archiver.kernel.org>; Sun, 19 Feb 2023 13:18:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 02C9F81244;
	Sun, 19 Feb 2023 13:18:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 02C9F81244
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id THET-Ezley7U; Sun, 19 Feb 2023 13:18:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4F71180F60;
	Sun, 19 Feb 2023 13:18:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4F71180F60
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3BB991BF285
 for <buildroot@lists.busybox.net>; Sun, 19 Feb 2023 13:18:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 14FA380BFC
 for <buildroot@lists.busybox.net>; Sun, 19 Feb 2023 13:18:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 14FA380BFC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oHKNv-9YwklA for <buildroot@lists.busybox.net>;
 Sun, 19 Feb 2023 13:18:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A6F2A81B26
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A6F2A81B26
 for <buildroot@buildroot.org>; Sun, 19 Feb 2023 13:17:59 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [171.22.1.1])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id A9C9F5FFA2;
 Sun, 19 Feb 2023 14:17:53 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 19 Feb 2023 14:17:53 +0100
Date: Sun, 19 Feb 2023 14:17:53 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Sourabh Hegde <hrsourabh011@gmail.com>
Message-ID: <20230219131753.GE2718518@scaer>
References: <CADYjeStG8bZEBprwqez+_3+n-HZ5pG9p8mBySxV+4FU7GM0r3g@mail.gmail.com>
 <20230218121940.7442410e@windsurf>
 <CADYjeSuzT5ueq5F5SQvib87d1HCKXLj565mW-Rm91N7Na1KrDQ@mail.gmail.com>
 <20230218141937.60c307f7@windsurf> <20230218142115.GC2718518@scaer>
 <20230218153216.GD2718518@scaer>
 <CADYjeStKgyabCLrM8QaoU3fsUZ3KChGxzYw6mr2tMmPgYBxYFw@mail.gmail.com>
 <CADYjeSt_z3340YvtL26u=R2u9ofosbO=RTqsYEZdoSL8AUkfYw@mail.gmail.com>
 <CADYjeSvNkOYY=RCeC9Jg2aX610XyzB5YN2aCq1nYo8U-LGAfTA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CADYjeSvNkOYY=RCeC9Jg2aX610XyzB5YN2aCq1nYo8U-LGAfTA@mail.gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1676812676;
 bh=8E7gc8l6+cyG8V32ReexPnrU4Wpre3B2DnlIaEPhWkE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=oksLjn7ndjjoCmlAhHKQ4QN2R89aNHSxbIZO/NkYTqDvmK30LwDsBmeYqi2AFeSLy
 Ppnh5me1qYJEoxw0SpILrhL9qUqj4cyNOZA8UPFUZIAbeGHWArZt8YQAQ5zWaS6mvh
 BCoxNwxF6idIr5HJxKoFGb6qCne5rAwJAb2aHcaFZAjDmbM67h5/7AekRQGIlJGN6z
 H0d/suLPu90x53q2XfMt4LaylxCQOwAIAzc8H7aZQfNvcuFdfRR43stLTcQunAYHio
 oG70nyycFC9fajdtRPGcurL/P+yvequYZIMoi2VY0AthWIHohLdTbxCwSuAO/1HyW5
 hqkIwwsTAdcwg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=oksLjn7n
Subject: Re: [Buildroot] Updating trust store using update-ca-certificates
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

U291cmFiaCwgQWxsLAoKT24gMjAyMy0wMi0xOSAxMzo1MyArMDEwMCwgU291cmFiaCBIZWdkZSBz
cGFrZSB0aHVzbHk6Cj4gSSB0aGluayB0aGUgaXNzdWUgaXMgZHVyaW5nIGJ1aWxkLCB0aGUgWzFd
Y2EtY2VydGlmaWNhdGVzLm1rIGlzIG5vdCBhdmFpbGFibGUgaW4gdGhlIG91dHB1dC9idWlsZC9j
YS1jZXJ0aWZpY2F0ZXMvIGRpci4gT25seQo+IE1ha2VmaWxlIGFuZCBjYS1jZXJ0aWZpY2F0ZXMu
Y3J0IGZpbGUgaXMgcHJlc2VudC4KPiBTbyBob3cgY2FuIEkgcGF0Y2ggdGhlIG1ha2VmaWxlP8Kg
CgpUaGlzIGlzIGEgcGF0Y2ggYWdhaXNudCBCdWlsZHJvb3QgaXRzZWxmLiBBcHBseSBpdCB0byBC
dWlsZHJvb3QuCgpSZWdhcmRzLApZYW5uIEUuIE1PUklOLgoKLS0gCi4tLS0tLS0tLS0tLS0tLS0t
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
