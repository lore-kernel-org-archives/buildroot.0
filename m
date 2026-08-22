Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFA5EC5DF8C
	for <buildroot@archiver.kernel.org>; Sat, 22 Aug 2026 16:39:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6132780B95;
	Sat, 22 Aug 2026 16:39:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 68DiMc9sACad; Sat, 22 Aug 2026 16:39:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787416794;
	bh=8tWRMnSGNGCOyZAPmujUHA/wbBtihAxmqBBq9KjKtEA=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=WyAT4XIO0rQ2Vo+p2FuBvwNdpXctDjPBLnMxAzwD6omJaB+LE7cLoF/Bl/3GmXHBB
	 WVVNEC74mS1+hOpCdepZs1FAct+pHx1Zl/eoAs4uBwaIYtYfK302BBx+YHY5WZF1F2
	 OeNqN0P/Yzs2rELyGBrgP9T9/E97K1Y/9P34kegwH2fpuHUUR+QmJ89KzBuxF1KYlO
	 Ra5sJeIbDDP/UFD/lvnMmiUg8oO8X+vSakCBiKO/qsjHPThN40KCJgdVqirunebBjv
	 2o/C8UXk1paAtnKkYVXpd+VN0FZFy4vmr6p+7IT2X4JLSmWig1neQPiC03//5jN9tG
	 MIotaEHMw8bRg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 648CD80B8B;
	Sat, 22 Aug 2026 16:39:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 68DFE118
 for <buildroot@buildroot.org>; Sat, 22 Aug 2026 16:39:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 57988405A1
 for <buildroot@buildroot.org>; Sat, 22 Aug 2026 16:39:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6ywkRGnjD_m9 for <buildroot@buildroot.org>;
 Sat, 22 Aug 2026 16:39:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4F31440598
 for <buildroot@buildroot.org>; Sat, 22 Aug 2026 16:39:51 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 981E66012D;
 Sat, 22 Aug 2026 18:39:47 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 22 Aug 2026 18:39:47 +0200
MIME-Version: 1.0
Date: Sat, 22 Aug 2026 18:39:47 +0200
To: Stefan Mueller <stemu86@gmx.ch>
Cc: buildroot@buildroot.org, Bernd Kuhls <bernd@kuhls.net>
In-Reply-To: <20260820094040.543663-1-stemu86@gmx.ch>
References: <20260820094040.543663-1-stemu86@gmx.ch>
User-Agent: Webmail Free/1.6.18
Message-ID: <bb4c56cd10813beb38a2baef5ac3fb8d@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/wget: fix CVE-2026-58470
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gMjAvMDgvMjAyNiAxMTo0MCwgU3RlZmFuIE11ZWxsZXIgdmlhIGJ1aWxkcm9vdCB3cm90ZToK
PiBGcm9tOiBTdGVmYW4gTcO8bGxlciA8c3RlbXU4NkBnbXguY2g+Cj4gCj4gQmFja3BvcnQgdGhl
IHVwc3RyZWFtIGZpeCBmb3IgaW50ZWdlciBvdmVyZmxvd3Mgd2hpbGUgcGFyc2luZyAKPiBDb250
ZW50LVJhbmdlIGhlYWRlcnMsIHRvZ2V0aGVyIHdpdGggdGhlIGZvbGxvdy11cCBmaXggdXNpbmcg
c3RydG9sbCgpIAo+IGZvciB3Z2ludCB2YWx1ZXMuCj4gCj4gQmFja3BvcnQgdG86IDIwMjUuMDIu
eAo+IAo+IFNpZ25lZC1vZmYtYnk6IFN0ZWZhbiBNw7xsbGVyIDxzdGVtdTg2QGdteC5jaD4KCkFw
cGxpZWQgdG8gbWFzdGVyLCB0aGFua3MuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9v
dC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRy
b290Cg==
