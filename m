Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E13AC433FE
	for <buildroot@archiver.kernel.org>; Tue,  1 Nov 2022 17:42:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E1B8B8197D;
	Tue,  1 Nov 2022 17:42:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E1B8B8197D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oY7RYvUXXVcg; Tue,  1 Nov 2022 17:42:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7B179813C4;
	Tue,  1 Nov 2022 17:42:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7B179813C4
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8D45E1BF831
 for <buildroot@lists.busybox.net>; Tue,  1 Nov 2022 17:42:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6255B4010D
 for <buildroot@lists.busybox.net>; Tue,  1 Nov 2022 17:42:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6255B4010D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id F5vTSKqMDuZQ for <buildroot@lists.busybox.net>;
 Tue,  1 Nov 2022 17:42:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DB0D1400D2
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DB0D1400D2
 for <buildroot@buildroot.org>; Tue,  1 Nov 2022 17:42:09 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:50d3:260a:b461:e6c4])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 5629519F5AF;
 Tue,  1 Nov 2022 18:42:01 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 01 Nov 2022 18:42:01 +0100
Date: Tue, 1 Nov 2022 18:42:00 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Angelo Compagnucci <angelo@amarulasolutions.com>
Message-ID: <20221101174200.GJ2992523@scaer>
References: <20221018234617.225947-1-giulio.benetti@benettiengineering.com>
 <20221031132519.4e5ebc69@windsurf> <20221031125405.GC1058960@scaer>
 <1e71c677-05cf-89b1-419f-df8e0f73ae63@benettiengineering.com>
 <20221101083206.GI2992523@scaer>
 <CA+_SqVZMnZvF2-n4HvrUUg1=k-VT4QBZGNAHZpoGM86y37fyuw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CA+_SqVZMnZvF2-n4HvrUUg1=k-VT4QBZGNAHZpoGM86y37fyuw@mail.gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1667324526;
 bh=9KAof3ytBP3e0O6ik+DCGx4ERWR3csCBvpPNzYwjfyM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NI1q/pGlHmsgkEZVhbDRSzGFk16f3OF42d6BG/D8QtDrKEqrtvxakINoCrwQteJvS
 e9BqhOeCN6O1kLLHCbBWUVSlp6OXca6BtLbCd4QTXV2RPwako8pwNO+e/3prCoaNWo
 4O23L74ws8414Yo5CLh4LkWgSlgD4dWR2XRGgyOZY3vksb5/2mqo1mJlKaxTQa+2cI
 rscTk3ylckth2XuqxX29cJxB3CWYoea3h2T2/TEq6u04ZtNMINyzYaXztUHu+wZIaS
 xofRwRRT4dWBKl1u5yGFoG/ZTWUoRY4MiM9FBjUd4Z8LC/PfzBAEfxbagunJs0aJ8o
 DEjXVLXoOHIXg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=NI1q/pGl
Subject: Re: [Buildroot] [PATCH] package/mono: allow to select which folders
 to install to target
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QW5nZWxvLCBBbGwsCgpPbiAyMDIyLTExLTAxIDEwOjE5ICswMTAwLCBBbmdlbG8gQ29tcGFnbnVj
Y2kgc3Bha2UgdGh1c2x5OgpbLS1TTklQLS1dCj4gTXkgdHdvIGNlbnRzLiBIaXN0b3JpY2FsbHks
IHRoZSBtb25vIGNvbmZpZ3VyZSB3YXMgb2ZmZXJpbmcgc29tZQo+IG9wdGlvbnMgdG8gZW5hYmxl
IG9ubHkgc29tZSB2ZXJzaW9ucyBvZiB0aGUgQVBJIHdoaWNoIHdhcyBsYXRlbHkKPiByZW1vdmVk
wqAKPiBTbywgcmVtb3Zpbmcgb2xkZXIgY29tcGF0aWJpbGl0eSBBUEkgZm9sZGVycyBzaG91bGQg
YmUgcGVyZmVjdGx5Cj4gZmluZS4KClRoYW5rcyBmb3IgdGhlIGNvbmZpcm1hdGlvbiEgOi0pCgpN
eSB1bmRlcnN0YW5kaW5nLCB0aG91Z2gsIHdvdWxkIGJlIHRoYXQgd2UgbWF5IG5lZWQgbW9yZSB0
aGFuIG9uZSBzdWNoCnZlcnNpb25uZWQgQVBJLiBGb3IgZXhhbXBsZSwgSSB3b3VsZCAoaHlwb3Ro
ZXRpY2FsbHkhKSBkZXZlbG9wZSBteSBhcHAKYWdhaW5ncyBjdXJyZW50IHZlcnNpb24sIHNheSA0
LjgtYXBpLCBzbyBJIGFtIHVzaW5nIEFQSXMgZnJvbSB0aGF0CnZlcnNpb24uIFRoZW4gSSB1cGRh
dGUgdG8gYSBuZXdlciBtb25vLCBhbmQgSSBzdGFydCB1c2luZyB0aGUgbmV3IEFQSXMsCmUuZy4g
NS4zLWFwaSwgaW4gdGhlIG5ldyBwYXJ0cyBvZiBteSBhcHAsIGJ1dCB0aGUgZXhpc3RpbmcgcGFy
dHMgYXJlCnN0aWxsIHVzaW5nIDQuOC1hcGksIHNvIEkgbmVlZCBib3RoLgoKSXMgdGhhdCBzZW5z
aWJsZSwgb3IgZGlkIEkgbWlzLXVuZGVyc3Rvb2Q/CgpJZiBjb3JyZWN0LCB0aGVuIHdlIG5lZWQg
dG8gYmUgYWJsZSB0byBzZWxlY3QgbW9yZSB0aGFuIG9uZSB2ZXJzaW9uZWQKQVBJLgoKPiBXZSBj
YW5ub3QgcmVtb3ZlIHRoZSBHbG9iYWwgQXNzZW1ibHkgQ2FjaGUgKEdBQykuCgpTbywgd2UgYW4n
IHJlbHkgb24gaXQgYmVpbmcgbGlzdGVkIGJ5IHRoZSB1c2VyOyB3ZSBtdXN0IGV4cGxpY2l0bHkK
aW5zdGFsbCBpdC4KCiAgICBNT05PX0lOU1RBTExfRElSUyA9IFwKICAgICAgICBnYWMgXAogICAg
ICAgICQoZml0bGVyLW91dCBnYWMsJChjYWxsIHFzdHJpcCwkKEJSMl9QQUNLQUdFX01PTk9fQVBJ
X0RJUlMpKSkKCiAgICAkKGZvcmVhY2ggZGlyLCQoTU9OT19JTlNUQUxMX0RJUlMpLGNvcHkgdGhl
ICQoZCkgZGlyKQoKPiBGb3IgdGhlIHJlc3QsIGl0IHdvdWxkIGJlIG5pY2UgaWYgR2l1bGlvIGNv
dWxkIGRvIHNvbWUgdGVzdGluZyAoSSBjYW4KPiB0cnkgaXQgdG9vKSB0byB1bmRlcnN0YW5kIGF0
IHdoYXQgZXh0ZW50IHdlIGNhbiByZW1vdmUgYW55IG90aGVyCj4gZm9sZGVyLgoKVGhhdCB3b3Vs
ZCBiZSBhd2Vzb21lLCB0aGFua3MhCgpSZWdhcmRzLApZYW5uIEUuIE1PUklOLgoKLS0gCi4tLS0t
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
