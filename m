Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7087FC4345F
	for <buildroot@archiver.kernel.org>; Tue, 30 Apr 2024 18:08:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2D8A380B9E;
	Tue, 30 Apr 2024 18:08:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ib72DIhaYWtI; Tue, 30 Apr 2024 18:08:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3B5E580BBC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3B5E580BBC;
	Tue, 30 Apr 2024 18:08:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 14FFB1BF29A
 for <buildroot@lists.busybox.net>; Tue, 30 Apr 2024 18:08:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 01045401D5
 for <buildroot@lists.busybox.net>; Tue, 30 Apr 2024 18:08:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pMKQVFLzuLK0 for <buildroot@lists.busybox.net>;
 Tue, 30 Apr 2024 18:08:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E27864012D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E27864012D
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E27864012D
 for <buildroot@buildroot.org>; Tue, 30 Apr 2024 18:08:44 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 9403013F8CF;
 Tue, 30 Apr 2024 20:08:40 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 30 Apr 2024 20:08:39 +0200
Date: Tue, 30 Apr 2024 20:08:39 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: =?utf-8?Q?Fl=C3=A1vio_Tapaj=C3=B3s?= <flavio.tapajos@newtesc.com.br>
Message-ID: <ZjEzp9eeghVD4Pku@landeda>
References: <20220917205253.3737d1c6@windsurf>
 <6338e428-df6e-40db-8a99-9390d150131d@newtesc.com.br>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6338e428-df6e-40db-8a99-9390d150131d@newtesc.com.br>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1714500522;
 bh=hqnI+h3HBJdsrAIx4A+mS01uHJRcksXLn8+0FnoLXmc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=thDhyX9Viu+cHiINzC1kqLebu8wnkg6rMDhXIUS3Wf4JAKBmxE5H9v9svUxw94STL
 12cNwq5BU1o2/roTkrlSQ1YlrivM79X3C3gyiYG0TvthWTs/L4i+cG+psQq8XaB01s
 uL2sNwxpy0O1eIbv71oN1jFR6rnV2R58pty3jOFh5rE7sQ5gHeCSd2nAwEdm/gpuw8
 M8Gx9T7gSwb6Ve3pEYsqp4eC79NIUMfkqvEG895RWLz69J6pJo/LjnRjpgcdJZmMio
 uOwCoP1r41Xr2FXpyqidrxIDZb03pz4mcrqD2dOQYgSl/pSgjHFpf1A7SD9KaEGUV/
 wxBdgKfOqK8qQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=thDhyX9V
Subject: Re: [Buildroot] [PATCH 1/1] package/pkg-download: add per package
 download fallback disable
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

RmzDoXZpbywgQWxsLAoKT24gMjAyNC0wNC0zMCAxNDo1NiAtMDMwMCwgRmzDoXZpbyBUYXBhasOz
cyBzcGFrZSB0aHVzbHk6Cj4gU29ycnkgdG8gbmVjcm9idW1wLCBidXQgc3VjaCBhIGZlYXR1cmUg
d291bGQgYmUgaGFuZHkgd2hlbiB1c2luZyBGT09fRExfT1BUUwo+IHRvIGVuc3VyZSBodHRwIGF1
dGhlbnRpY2F0aW9uLgo+IAo+IFRva2VucywgdXNlcm5hbWVzIG9yIHBhc3N3b3JkcyB3aWxsIGJl
IGxlYWtlZCB0byB0aGUgZmFsbGJhY2sgc2VydmVyIGluIGNhc2UKPiBvZiBmYWlsdXJlIG9mIHRo
ZSBwcmltYXJ5IHNvdXJjZS4gVGhpcyBjb3VsZCBiZSBzb21lIHNvdXJjZSBvZiB2dWxuZXJhYmls
aXR5CgpZb3UndmUgaGFkIGZlZWRiYWNrIGZyb20gYm90aCBUaG9tYXMgYW5kIEkgYWJvdXQgdGhh
dCBwYXRjaDoKCiAgICBodHRwczovL2xvcmUua2VybmVsLm9yZy9idWlsZHJvb3QvMjAyMjA5MTEw
NzQ3MzQuR0YyNjQyMTRAc2NhZXIvCiAgICBodHRwczovL2xvcmUua2VybmVsLm9yZy9idWlsZHJv
b3QvMjAyMjA5MTcyMDUyNTMuMzczN2QxYzZAd2luZHN1cmYvCgpTbyBJIGRvbid0IHNlZSB3aGF0
IHJlYXNvbiB0aGVyZSBpcyB0byBwb2tlIGFib3V0IHRoaXMgcGF0Y2guCgpSZWdhcmRzLApZYW5u
IEUuIE1PUklOLgoKLS0gCi4tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4t
LS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0uCnwgIFlhbm4gRS4gTU9SSU4g
IHwgUmVhbC1UaW1lIEVtYmVkZGVkIHwgLyJcIEFTQ0lJIFJJQkJPTiB8IEVyaWNzJyBjb25zcGly
YWN5OiB8CnwgKzMzIDY2MiAzNzYgMDU2IHwgU29mdHdhcmUgIERlc2lnbmVyIHwgXCAvIENBTVBB
SUdOICAgICB8ICBfX18gICAgICAgICAgICAgICB8CnwgKzMzIDU2MSAwOTkgNDI3IGAtLS0tLS0t
LS0tLS0uLS0tLS0tLTogIFggIEFHQUlOU1QgICAgICB8ICBcZS8gIFRoZXJlIGlzIG5vICB8Cnwg
aHR0cDovL3ltb3Jpbi5pcy1hLWdlZWsub3JnLyB8IF8vKlxfIHwgLyBcIEhUTUwgTUFJTCAgICB8
ICAgdiAgIGNvbnNwaXJhY3kuICB8CictLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS1eLS0t
LS0tLV4tLS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0tLS0nCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxp
c3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21h
aWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
