Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96A8DC79FB6
	for <buildroot@archiver.kernel.org>; Sat, 12 Sep 2026 13:17:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5F73840729;
	Sat, 12 Sep 2026 13:17:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9b39l4P4W8Jx; Sat, 12 Sep 2026 13:17:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 669D640702
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789219050;
	b=chD8MqbaGrf+rQOwpFj2J36cSTG+3bl0TK/PFJrSixjeqjLRK3uu/risPgXTtRD+lRHz
	 dF5ugwL7AgDJebOn2VbiocP4ntO3NYooaMV4DhJYPlrQTHlICGiUlF2XZLUfj8GDVRO88
	 cuzEq/K2Z8OVS7qezwIfxTyqoBBKJybNW3CA0ozszfwCaD3eSCK6POPw5+59dX70sJ6LQ
	 Qpfcn7gQFATF3Gl3CP0IgX5EuUck26W0pXO44yGGNW9ATEbsQlmPwV8i7lVV+5o+DGxDP
	 XaVKb8xfjMMmKibg8khKxUdTelczbNLW7gU4BK+DapU56YNVeNag+dSuPnWlpbjQa0g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789219050;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=gC62Q/0gDhtTZ3XBOoSv61DRVJo2E5VJkEnVTdSDtwc=;
	b=XE9it8embxKpVKRS/w3GDkYmmwIk6sglFK7+WD/VCt1tVd2ai8JgUQKFeO/50R2p1/X7
	 0TP4jcd27jSjJsfYu23m2qKwM4cA3Lp2Fsvn5KIJC9SGB9TOfNDxomWQk88CHHLv2kZVU
	 Uix8ykgjVgNIANjErKK7CvFHhmzoW7bRCWfEwB0yjmvlRadpslKxCyYgmtN37n+qKwO6+
	 /4ShFADy9MfMPnDbV0LANc8pDH03Pntk3FVZDv6yMyiBvlBceSHxZKY9Y7aXkH+0tnWyp
	 GtD8qt/QDCYJ4PJAbx2WxZmhvhaa8K5QQO99gI2OqjR8sCYdSgl7iYvD2HlMeBXdf/g==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789219050;
	bh=gC62Q/0gDhtTZ3XBOoSv61DRVJo2E5VJkEnVTdSDtwc=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=i0qjloVj8xtkv8jMjE7NSxw1KFHgmHm1KDR5Jl4jRGtC/0y2jnaW2AUju5sLPnNJ1
	 i2lHWuQP/6VngIBSzDgWtZmwthPAE0a0P86XqLEzvD7PiV5Wf+aueEmR7NQIRW2VBB
	 s2gnI7CcxKnwVyDNuqA+g2lzOPk66KxqU4m5CylFcjr6tzFiCVi/M8Bfy9SMM3rcO+
	 ZGTXz1/M/xudujrCPN8lGjWMLI00qoR/zIMUDZmVbDoZq90b30YWiuNbz2BAOw9XA2
	 icwMETLflS9N9r7ERz44sjGR6Ud22PwkGs5TRzljmob3rDfG9qU1KXSwnojSQLqQL8
	 7bfPQNUF9RdsA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 669D640702;
	Sat, 12 Sep 2026 13:17:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 881D42D0
 for <buildroot@buildroot.org>; Sat, 12 Sep 2026 13:17:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 85134406ED
 for <buildroot@buildroot.org>; Sat, 12 Sep 2026 13:17:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YeHN_tDccpnR for <buildroot@buildroot.org>;
 Sat, 12 Sep 2026 13:17:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 4F5AF406E8
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789219047;
 b=dxzwbeuDs6P2PTckDf8vYz/lA+0xnsXrg8j9tXopGdZREJpIozvFQy37Rjxe/bdWrZN6
 XIYf3AqkBdqbFdBcRJtNy3O6apkhjgAVARK5eqK1OoSv21rA5q18rkJ61+hifLXaIcYjE
 x0AXD2nrAVRwnOBwmeWJ+/xk6jgC1yzctTBIuRfAUVZiJaAHz0LM1DiTBAyRtdl/3pLKs
 keJ+zo9gYrCc3PreiAGB5JN/KnVCHvynju6wPVfrqPgos6aT/JsGtonJ5jyjy2fLeksah
 uVZ1GRg84FMg4F6O8SSOl1k/p5FZENO2asDfnK2m+InneMVXa56PGh22d2+HsUBcovg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789219047;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=AVvL2ytFx/BwW4UpleuAayvQuvoKH9z4yvHnf045WX0=;
 b=Pz6ffElC6uNd7WHgqae10pn57B9ylM7atf5qP1YL0D9n096PSDa1fMpUskONWrFvd8o4
 uSps5g7lP/MPFstnXicddtIC+E0n4HMs6mJ0SylAzaG3hlEIlZT0QGoVrWvogm02tnHcU
 FcN2wXhE36ri6HlUWunnYMNPEIYssg55jTh5QBZhEtxBLvkyQhTwWwR/cVyC8rrWirtGW
 AQl6838YGtwDZKWwOKVIcEb4iIJPQemkNr/+66iMVVCj6DU1n1JUWW1o97xt7ryvao8KJ
 rY3sPx5HnDhbM1MtTb55yONgK9ckget854jpEckHydtQ8TRPvt7VH8NSwOM+aMWtEZw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=free.fr; 
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=P23Q2Eo0; 
 arc=none smtp.remote-ip=212.27.42.6
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4F5AF406E8
 for <buildroot@buildroot.org>; Sat, 12 Sep 2026 13:17:26 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id F1F3578034E;
 Sat, 12 Sep 2026 15:17:21 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 12 Sep 2026 15:17:21 +0200
MIME-Version: 1.0
Date: Sat, 12 Sep 2026 15:17:21 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Francois Perrad <francois.perrad.86@gmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>
In-Reply-To: <20260911222701.1047300-1-bernd@kuhls.net>
References: <20260911222701.1047300-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.19
Message-ID: <f1e008977961884bba2fad0f3aef46e7@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/1] package/luaossl: bump version to
 20260910
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 12/09/2026 00:27, Bernd Kuhls wrote:
> https://github.com/wahern/luaossl/releases/tag/rel-20260910
> 
> Updated license hash due to copyright year bump:
> https://github.com/wahern/luaossl/commit/efaf49dc352c221f518305348bdbf89db873d6e3
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
