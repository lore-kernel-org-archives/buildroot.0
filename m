Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ABF7C46467
	for <buildroot@archiver.kernel.org>; Sat, 14 Jan 2023 08:03:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BA06260806;
	Sat, 14 Jan 2023 08:03:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BA06260806
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id J_y9hP58HJmR; Sat, 14 Jan 2023 08:03:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E577161171;
	Sat, 14 Jan 2023 08:03:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E577161171
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D9C621BF3DF
 for <buildroot@lists.busybox.net>; Sat, 14 Jan 2023 08:03:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B52D261171
 for <buildroot@lists.busybox.net>; Sat, 14 Jan 2023 08:03:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B52D261171
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Jd18WOR7I6Xq for <buildroot@lists.busybox.net>;
 Sat, 14 Jan 2023 08:03:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3804B60BFE
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3804B60BFE
 for <buildroot@buildroot.org>; Sat, 14 Jan 2023 08:03:23 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [171.22.1.1])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id E52CB5FF96;
 Sat, 14 Jan 2023 09:03:17 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 14 Jan 2023 09:03:17 +0100
Date: Sat, 14 Jan 2023 09:03:17 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Ernie Carp <erniecarp2018@gmail.com>
Message-ID: <20230114080317.GW151997@scaer>
References: <CAHdaamN7mawJYf6LAVJXTtptm08u79TucxEbbSoMYHduhUdL3A@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAHdaamN7mawJYf6LAVJXTtptm08u79TucxEbbSoMYHduhUdL3A@mail.gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1673683400;
 bh=w9ecsLOT5bJW1fmZiCbegQJ97LskDz+TTBpNt3zJ46I=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mhLH83uB2wMzmbhHvo8vHgiP28tGiWX6RnqjYqTLuMZVGOhpKduk31OhrvhUH7hpz
 rNi6r7xQTaDoawS+S5zHhRrlXjSZHILUNfUzpwYKZcH3q+VandyUwo0VLdt9ay5euv
 uimW7FHhCmLAtwlZT6U9Y441NrXOdWdA8wlCpEeBWbKM1LiUvbe7TWfo9x0mpL1M/W
 6owIUAHxwKj1/yDhUnFs0rOZ7Am1PhcQuzOPyfM489cQImyFr02eVVKsTjobKyRO19
 ANBBPawcYFxwa9V16J2X2Sh4dq/AnIMmqZF0O+xBmYCz+Ea8ficJGvNKevgBmiyAy4
 +ovxoYkVhtr5A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=mhLH83uB
Subject: Re: [Buildroot] Python 3 bcrypt error
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

RXJuaWUsIEFsbCwKCk9uIDIwMjMtMDEtMTMgMjI6MzEgLTA4MDAsIEVybmllIENhcnAgc3Bha2Ug
dGh1c2x5Ogo+IEhlbGxvLAo+IFdoZW4gY29tcGlsaW5nIHB5dGhvbjMgb24gYnVpbGRyb290IHZl
cnNpb24gMjAyMi0xMSBJIGdldCBhbiBlcnJvciBtZXNzYWdlIGFib3V0IGJjcnlwdC4KCkluIEJ1
aWxkcm9vdCAyMDIyLjExLCBhcyB3ZWxsIGFzIGluIHRoZSAyMDIyLjExLnggbWFpbnRlbmFuY2Ug
YnJhbmNoLAp3ZSBvbmx5IGhhdmUgcHl0aG9uYmNyeXB0IDMuMi4wLCBidXQgdGhlIHRyYWNlcyBi
ZWxvdyByZWZlciB0byA0LjAuMSwKd2hpY2ggaXMgb25seSBpbiBtYXN0ZXIuCgpTbywgYXJlIHlv
dSBzdXJlIHlvdSBhcmUgdXNpbmcgYnVpbGRyb290IDIwMjIuMTE/IElmIHNvLCBob3cgY2FuIHlv
dSBiZQp1c2luZyBweXRob24tYmNyeXB0IDQuMC4xPwoKPiBUaGUgUHlQaS5vcmcgbGlzdHMgdGhl
IHNoYTI1NiBoYXNoIGFzIDI3ZDM3NTkwM2FjODI2MWNmZTQwNDdmNjcwOWQxNmY3ZDE4ZDM5YjFl
YzkyYWFmNzJhZjk4OTU1MmE2NTBlYmQKPiBOZWVkIGEgbGl0dGxlIGhlbHAgdG8gZml4IGl0Lgo+
IFtzb3VyY2UudmVuZG9yZWQtc291cmNlc10KPiBkaXJlY3RvcnkgPSAiVkVORE9SIgo+IEVSUk9S
OiBiY3J5cHQtNC4wLjEudGFyLmd6IGhhcyB3cm9uZyBzaGEyNTYgaGFzaDoKPiBFUlJPUjogZXhw
ZWN0ZWQ6IGQ2NGRhZWUwYWYxYWZlMTM3NzE4Njc0ZTY3YTQ5YjhiYjc5MTg0MmFhYjI2NWI1ODhh
NmQ2OGQ0NGE0NDljNzAKPiBFUlJPUjogZ290wqAgwqAgwqA6IDEwOGFhYTM4MzI2MzYwZDcxNmY0
YTZlMmU5OGJmZTg0OTY5NTQyZTU1OWJkOGJmZTNiMDljY2M5M2U2YzI5NDQKPiBFUlJPUjogSW5j
b21wbGV0ZSBkb3dubG9hZCwgb3IgbWFuLWluLXRoZS1taWRkbGUgKE1JVE0pIGF0dGFjawoKVGhp
cyBoYXMgbm93IHN1cHBvc2VkbHkgYmVlbiBmaXhlZCBpbiBtYXN0ZXIgd2l0aCBjb21taXQgYWMy
YjI2ZmJhMmFkCihzdXBwb3J0L2Rvd25sb2FkOiBmaXggY2FyZ28gdmVuZG9yaW5nKS4KClJlZ2Fy
ZHMsCllhbm4gRS4gTU9SSU4uCgotLSAKLi0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0t
LS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4KfCAgWWFubiBF
LiBNT1JJTiAgfCBSZWFsLVRpbWUgRW1iZWRkZWQgfCAvIlwgQVNDSUkgUklCQk9OIHwgRXJpY3Mn
IGNvbnNwaXJhY3k6IHwKfCArMzMgNjYyIDM3NiAwNTYgfCBTb2Z0d2FyZSAgRGVzaWduZXIgfCBc
IC8gQ0FNUEFJR04gICAgIHwgIF9fXyAgICAgICAgICAgICAgIHwKfCArMzMgNTYxIDA5OSA0Mjcg
YC0tLS0tLS0tLS0tLS4tLS0tLS0tOiAgWCAgQUdBSU5TVCAgICAgIHwgIFxlLyAgVGhlcmUgaXMg
bm8gIHwKfCBodHRwOi8veW1vcmluLmlzLWEtZ2Vlay5vcmcvIHwgXy8qXF8gfCAvIFwgSFRNTCBN
QUlMICAgIHwgICB2ICAgY29uc3BpcmFjeS4gIHwKJy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLV4tLS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS0tLScKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1h
aWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9v
dC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
