Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0D94C624D6
	for <buildroot@archiver.kernel.org>; Sat,  5 Sep 2026 17:07:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8EAB340BEA;
	Sat,  5 Sep 2026 17:07:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0XGPaxhU-9Ck; Sat,  5 Sep 2026 17:07:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 8DF3640B1A
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788628048;
	b=eDKxURev77tcD4pmaxHsiYSlIPnLDTysuT7C8w3URp8qdodfFR9Nj1JuxLy8ro9HUilq
	 5Z6KRBL8OwIQmfYxGH4V7UvAZmau1X07HINWtByPsrcNgB+dQ2iaiktb6KEWjAaY+1ROc
	 Rk6uz2fGKeU2KNZlIyH7QZIfdMCCfv0naBDQuYcQJ7fm17niq7E4TV1XIguPqvC7SI3Gm
	 sxNIrSUPDtplnjLHIlvm6tyzM6xXorNppokZ8tdbdojzXuUxfav7S6E8EWerxxZxbv9AH
	 rAEFI0tonC3gFSAvbx9qcFqFCoAhkQoNmIPxxqeW2L6v05s05f6ahWNQd1CaF3cBcHQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788628048;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=9dNskE1xw86G/90kfzRvn6fBY0UrTi0hltJy1eEb4kQ=;
	b=kkkMBACBnzm3TwjE46iGPOrvcnUP3z4Pobd51ym13LRNrZJbleHuWH1mu8qASMkZXM+T
	 AfL1m/AlgVbcjHLMNIBF0SPnHI6Qg3EeU/QNZgmaGkgvAyaAXGsh1sfO//L664cmSrQpo
	 G29jEnqMfF58JRU3cQDvgABfqmgkMAoNP0h8vhDeVM+ks55NU8RFEm6s4tb+vAveI7nhD
	 0eyPR91ThplwOyWfNVAEFtp2zyh+n5q0DEloLLuw4ALw49KWl7h4Mo1KEl5LURypiP+E9
	 iqbQ4fbwqNo0Qqe31o1j068KGG2uOw7wOlHiLtpANA4NEDHX0uDmdq0bVdrssLNxBkg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788628048;
	bh=9dNskE1xw86G/90kfzRvn6fBY0UrTi0hltJy1eEb4kQ=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Ri0nNqeHZWrb0nylbDxoFeVXnF0PAhLw3EsccLe5aZjD/MuudVYqdWM0am+s2pXBE
	 LIYjZjhKY8a+GyxaVhGPUWG2TaQ9Ib/jbUcahmpE6J5kvylN1X6GgHlhKLqrwzy7A8
	 zBdtWmRTugIp5i9izB24VWukaOb5LOuCGcU8pzqHm8jlCeRKpuSd3huuKuUg0nyXdM
	 v6sWM2p/j9njM3ynryCR9zbQauUtU2oNhnKeB59K+6PIwmdeU962V2SDfvy0UMFIwN
	 D54mZi+J3drzvBbvPJz5LYu7hR1DlmMzcaEDE9ISgK/eN5/lF3IL7eCaZkVa5uW6iY
	 btXyGjOhDCocA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8DF3640B1A;
	Sat,  5 Sep 2026 17:07:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 419F4105
 for <buildroot@buildroot.org>; Sat,  5 Sep 2026 17:07:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 27A0681099
 for <buildroot@buildroot.org>; Sat,  5 Sep 2026 17:07:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tjgtBlEZba41 for <buildroot@buildroot.org>;
 Sat,  5 Sep 2026 17:07:23 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 6697681097
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788628043;
 b=cgDxPp8f7gBTGGHUWkys+9NXfkl5yLo4CIWe8yqtNkcMdvKdoBw8zBi48WnxsLgLmwan
 6X9ru27ko5eVbEiDL5NIhDtc7WOtBkKJ55UOd7VVaIVJq9NCaT2ymNppcRktEISzEAR42
 Zp5VR6i40FzmKZB+9tbuv06SYMDmGK12r3xJhsnfR1Evxw5/5UfUpAsSgnL5+UkQNygWq
 EJVcd2cQ4MofxtUiJWBOp/9qjSrIxf08HdsM4sK2BG3z6N5k78cp44YzY/GM8R/rBLkM4
 SPvF6/f2gsJ5mwURlnUuvbSaYWIcCrU5VaF8+VMjZXnX2dEA3pJYAoMjJn+VHBaePTA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788628043;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=cPd3NebeKMqBTRdW0cXC3K+Xx1lYvsvtAw93jiOoOuM=;
 b=GH1i0hHWCpdvSYMKOFHHz6cVChjhcb/ZvMaeLTlLjqC2yYPobQzqceAFhJ02JHi15ugF
 a50kTrlqQj7+yByuJxd04ANLZLqm8MzUM6lajm50P6QguUxLsDp9I8BRJdRYP7mPyMHJd
 gAiumD7J53wCGk+wrGKf8r18IihxwqUB8jfg6kZaAoB7Tp1QGLOdwpYdlx7W01cWniJmv
 Ac3bla/6UugOBqZaCl/g0gSqX3tIMHqVBvaMlVb8DM++MBtK+JBxwho4wepkWeoGv1zQU
 FiePybRzOzIqqiTUtoe9YHdbWv0rLIp0erBVMFaVxHbWGDDLx1xXjo4hBQbU4lhBaWQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=free.fr; 
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=r5gqzQtT; 
 arc=none smtp.remote-ip=212.27.42.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6697681097
 for <buildroot@busybox.net>; Sat,  5 Sep 2026 17:07:22 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 47C0D19F58A;
 Sat,  5 Sep 2026 19:07:19 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 05 Sep 2026 19:07:19 +0200
MIME-Version: 1.0
Date: Sat, 05 Sep 2026 19:07:19 +0200
To: Francois Perrad <francois.perrad.86@gmail.com>
Cc: buildroot@busybox.net
In-Reply-To: <20260904185910.587850-1-francois.perrad.86@gmail.com>
References: <20260904185910.587850-1-francois.perrad.86@gmail.com>
User-Agent: Webmail Free/1.6.18
Message-ID: <d9f90326112dc41876f59234ae4cb391@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/lua: bump to version 5.4.9
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

On 04/09/2026 20:59, Francois Perrad wrote:
> Signed-off-by: Francois Perrad <francois.perrad.86@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
