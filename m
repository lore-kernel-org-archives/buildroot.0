Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5D07C46467
	for <buildroot@archiver.kernel.org>; Wed, 11 Jan 2023 16:44:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0DAB64194F;
	Wed, 11 Jan 2023 16:44:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0DAB64194F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jSKXMX2WQZc4; Wed, 11 Jan 2023 16:44:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BE92E41861;
	Wed, 11 Jan 2023 16:44:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BE92E41861
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 943641BF3DE
 for <buildroot@lists.busybox.net>; Wed, 11 Jan 2023 16:44:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6BE44817A6
 for <buildroot@lists.busybox.net>; Wed, 11 Jan 2023 16:44:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6BE44817A6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8kB8E5X-iXGs for <buildroot@lists.busybox.net>;
 Wed, 11 Jan 2023 16:44:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E96EF8193E
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E96EF8193E
 for <buildroot@buildroot.org>; Wed, 11 Jan 2023 16:44:25 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [171.22.1.1])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id C04AF5FFA6;
 Wed, 11 Jan 2023 17:44:16 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 11 Jan 2023 17:44:16 +0100
Date: Wed, 11 Jan 2023 17:44:16 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
Message-ID: <20230111164416.GQ151997@scaer>
References: <20220728014402.142320-1-james.hilliard1@gmail.com>
 <c01c67cd-b4ce-a054-2b6b-47fbfcbf513a@smile.fr>
 <2ac975d4-3451-ec20-9987-a56be5ea36e4@green-communications.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2ac975d4-3451-ec20-9987-a56be5ea36e4@green-communications.fr>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1673455463;
 bh=TvcUbN325DKDwTtAAcuN9oiWI9DNeTiRw9MZyTfTncg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QIt6/84YgO5/wGADv1QHorTTO3JbKItk0VoMMUhjezqeC0MkkpTvm0o7bMmguUQ2H
 WH45DTnOQPKA7xBMVj8/pBOfRnW5hoM9uU/C8p6RTV/MO0l5uyvNLiJ2zWnbHkiPqU
 SdIazn9l0QPyIXRXRNnBEAfXdt5GTWD4l8NLBBDb+x4M3raP+hlOZiiffb3R0C8z2u
 wjnQAYyqoNH3PTT4SEvWima+riKAJE7ndySKOPDtHM0Xo/wRo8kvowOnG/mSTf2dh8
 oMYjrM854Vy2tiV3k21ikekjpiQtNEiErXPA/E/5M2jV8riPzs3At3P2sjbClzWACw
 zwNvNgnERnGEA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=QIt6/84Y
Subject: Re: [Buildroot] [PATCH 1/2] support/misc/toolchainfile.cmake.in:
 set PKG_CONFIG/CMAKE prefix paths
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Romain Naour <romain.naour@smile.fr>, Samuel Martin <s.martin49@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Tmljb2xhcywgSmFtZXMsIEFsbCwKCk9uIDIwMjMtMDEtMTEgMTc6MDEgKzAxMDAsIE5pY29sYXMg
Q2F2YWxsYXJpIHNwYWtlIHRodXNseToKPiBPbiAxMS8wMS8yMDIzIDE2OjE5LCBSb21haW4gTmFv
dXIgd3JvdGU6Cj4gPkxlIDI4LzA3LzIwMjIgw6AgMDM6NDQsIEphbWVzIEhpbGxpYXJkIGEgw6lj
cml0wqA6Cj4gPj5UaGVzZSBhcHBlYXIgdG8gbm90IGJlIGdldHRpbmcgc2V0IGNvcnJlY3RseSBh
bmQgYXJlIG5lZWRlZCB3aGVuIHVzaW5nCj4gPj5tZXNvbidzIHJlbG9jYXRhYmxlIHBrZ2NvbmZp
ZyBmb3JtYXQuCj4gPkhvdyB0aGlzIGNtYWtlIGZpbGUgKHRvb2xjaGFpbmZpbGUuY21ha2UuaW4p
IGlzIHVzZWQgYnkgYSBtZXNvbiBwYWNrYWdlID8KPiBJIHVuZGVyc3RhbmQgaXQgYXMgImEgY21h
a2UgcGFja2FnZSBuZWVkcyB0aGlzIHRvIHVzZSBhIHBrZ2NvbmZpZyBmaWxlCj4gZ2VuZXJhdGVk
IGJ5IGEgbWVzb24gcGFja2FnZSB3aGVuIG1lc29uIGlzIGNvbmZpZ3VyZWQgdG8gZ2VuZXJhdGUK
PiByZWxvY2F0YWJsZSBwa2djb25maWcgZmlsZXMiLgoKT0ssIGJ1dCB0aGVuIEkgaGF2ZSBhIGZl
dyBxdWVzdGlvbnM6CgogIC0gd2hhdCBhcmUgInJlbG9jYXRhYmxlIHBrZ2NvbmZpZyBmaWxlcyIs
IGFuZCBob3cgZG8gdGhleSBmaXQgaW4gdGhlCiAgICBwa2djb25maWcgc3BlYz8KCiAgLSBob3cg
ZG8gdGhleSBkaWZmZXIgZnJvbSBzdGFuZGFyZCBwa2djb25maWcgZmlsZXM/IEJ5ICJzdGFuZGFy
ZCIsIEkKICAgIG1lYW4gYWxsIHRoZSBwa2djb25maWcgZmlsZXMgd2UgY3VycmVudGx5IGluc3Rh
bGwgYW5kIHVzZSBmcm9tIHRoZQogICAgaHVuZHJlZHMsIGlmIG5vdCB0aG91c2FuZHMsIG9mIHBh
Y2thZ2VzIHRoYXQgcHJvdmlkZWQgdGhlbS4KCiAgLSB3aHkgaXMgbWVzb24gZ2VuZXJhdGluZyB0
aG9zZSBwa2djb25maWcgZmlsZXMsIHJhdGhlciB0aGFuIHN0YW5kYXJkCiAgICBvbmVzPwoKICAt
IGFuZCBmaW5hbGx5LCBpZiB0aGUgInJlbG9jYXRhYmxlIHBrZ2NvbmZpZyBmaWxlcyIgZ2VuZXJh
dGVkIGJ5IG1lc29uCiAgICBhcmUgaW5jb3JyZWN0IHdydCB0aGUgcGtnY29uZmlnIHNwZWMsIGNh
biB3ZSB0ZWxsIG1lc29uIG5vdCB0byBkbwogICAgdGhhdD8KClRoaXMgc2hvdWxkIGJlIGFuc3dl
cmVkIHdpdGggZXhwbGFuYXRpb25zIGluIHRoZSBjb21taXQgbG9nLCByYXRoZXIgdGhhbgpwcm92
aWRpbmcgcmV2aWV3ZXJzIHdpdGggYW4gZWx1c2l2ZSBhbmQgY29uZnVzaW5nICJhcHBlYXIgdG8g
bm90IGJlCmdldHRpbmcgc2V0IGNvcnJlY3RseSIgd2l0aG91dCByZXNlYXJjaCBhbmQgZXhwbGFu
YXRpb25zLi4uCgpSZWdhcmRzLApZYW5uIEUuIE1PUklOLgoKLS0gCi4tLS0tLS0tLS0tLS0tLS0t
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
