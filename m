Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36612CA9EBE
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 12:17:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F2110407BE;
	Sat, 10 Oct 2026 12:17:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2BOCwpnXhePB; Sat, 10 Oct 2026 12:17:50 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 2CFEE4076A
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791634670;
	b=OxyU5pvuloYXheFepB6REQv0HHmw8K91Aj5gtlgvNYjRaOaJKLspwQmkNEbwr4Crec1Q
	 HMT/4Fe7f11GQOnsb2A9ysJoOQsFJcJF7hxP4e2nkhq+OT5txXTBLOiW06/4WDkCbo721
	 DUglkMMN8jlijZvwEiKL6MRqoLak76TF/c7IeSfldhyyh7lHdULPkXtLby97ZcGpQaxp1
	 2g9VwH92kjVNxmHQ0Xa+pgEtSD7S1p86jwYKA8VtUB9eAWEX/Y7raJSpDk5HwemYgfAcf
	 jo2TynwOHcyRCyzvRzdVzssaS6p8b81Pc400UMgQRAK0k98USF6bWK4QuYQMYsyXtMA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791634670;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=RmawY/ZUrLQRDcGJX0DFaiBI/wKwbkPkze2PuuMjUqU=;
	b=cVfm5d4fvpP1Ghgd3wj/ZRqj03RTmegz0ewqOYk0UeefnPRWk1kGQ/gvyZPCoa6rq/8D
	 Uk6F8hgs1GLTM+/8oJ+hUICxyGK5NlKdsp5Pl+RPyHDLAE8d1qEemiBOYmJM8bHucCDqW
	 Z6AETTYAqNO5etLnPI+aCDZWdeXkUEI6ftL1Ace72P1a8H+ExQsvKMe60rOjBv5FhMo9h
	 W3MDqPVNSEy1ALSRWHIb9e6bn6cNCBlhu3hO4/pwylmuQyl3HaBlVLuI9cDAhUysOHx1j
	 M1Rvu7TV2XoKJ6hGPjA5d0cYdqU3BRux7J1MHdHT5MJonFWhof/dZ5gXZ5eO/qBGuEA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791634670;
	bh=RmawY/ZUrLQRDcGJX0DFaiBI/wKwbkPkze2PuuMjUqU=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=cL2C/HoWUj2lt6cvcq82ueRztMeBI9hd5g5fZ++6lDevd2CCGl1gFMJK+wqUDw8bo
	 pPCLIem3h61kaoF/uXX7JsACNsx+3RW5LxvL05WCDC5hgEzfEEZyxImlS3y+G4BrCx
	 iLCpI2YEx/aoZFvNUjwDAlik3uBZxqJtnNNMXOP0UuryIXKFPEBnOVxkTINhf8ioCU
	 unkN2iGdWV+0ZiHh6jHKSIa1L3NgzceihnFzUNfgT10sU+tmGfNN3VI6MlLidgix3s
	 Q/V1266uk79ihFpLIFSnjDA7pQSXDkyRne+mwarsomNbY0egEwjHhVH4UD3fP5q14a
	 /kpPJPD6tFBkg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2CFEE4076A;
	Sat, 10 Oct 2026 12:17:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id EC0E5156
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 12:17:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DDB6081203
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 12:17:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DQQBZAUrzDtz for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 12:17:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 88504811E3
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791634667;
 b=LoYnrZXAxOolrbs7Og2E8tOfj0AX3yvtrvRggvVDoU4ONmsWPDsiAC/yZuoJaG/Hdi4X
 E0RZ7YCZ6nbaVceD2NWEdkpA7MoeSXLQedN0nwmyneIN8JIGs4l0oCzx+QL9HFz1KRZnu
 NZWpA7DifyUoHSUGlDDy4anyAohxCD/ffPsDUJhZaL0xTLGDTK9ISojvhsH/gckFCasOC
 bLa2Vmi2lokRV66Cqy44fiekcpzjIPSz7W/1F8UF3vhvwjcKgTvFj0cqGyJxsbotWMU75
 8mU8ssJThwc3Z6LPTbo/0uB/1EXxsjosFY+Ac1iTX1GeQzp6DOXZpqBdbTh0VnJpJhg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791634667;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=JsPqtkTmugCzMCghh431nzKfBMETJeKXJaL7RkrdMCA=;
 b=BhCMo5UMy77djuR7ruMHhdZ8bGfUqKMD5mm4QhxT75mmGYo+oRQpXaNmifqeegSXEJV6
 4xmEQOKDJMv85H6aMZU24pFqFWUGY5Fc+6idaQnReOrQPJbx/rXorUlohApeVY/9PV347
 RuuiLdzUq2xr48QHiC5XRJcb79Jn69QwWoP1jj8mqvEmGJXhs8nyUeshT06tDDfutRsr6
 P8bxNKF6hIwmhCgI4CxHVmA/W4kpzR89qabKDiyEpuiib5pURitNzfX9pj0VS1AdMhVPg
 rRE18k0m7n0v22KgcX6mCdssIcP+2Kvw+OZWKa4iv1maaAQLOjlZclLPN5C7abI+p4Q==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=free.fr;
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=OOlKStbn; 
 arc=none smtp.remote-ip="2a01:e0c:1:1599::10"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 88504811E3
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 12:17:46 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 0F825B0059A;
 Sat, 10 Oct 2026 14:17:43 +0200 (CEST)
Received: from 2001-1aeb-401-dd00-38bd-f619-d5ce-575f.ip6.tmcz.cz
 (2001:1aeb:401:dd00:38bd:f619:d5ce:575f)
 via 2001-1aeb-401-dd00-38bd-f619-d5ce-575f.ip6.tmcz.cz
 (2001:1aeb:401:dd00:38bd:f619:d5ce:575f) by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 10 Oct 2026 14:17:43 +0200
MIME-Version: 1.0
Date: Sat, 10 Oct 2026 14:17:43 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20261003224447.744966-9-james.hilliard1@gmail.com>
References: <20261003224447.744966-9-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.19
Message-ID: <efd1a8be3e37401cccd121d95f323593@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/1] package/python-scapy: bump to version
 2.8.0
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

On 04/10/2026 00:44, James Hilliard wrote:
> Update license hash for CRLF line endings in the PyPI source archive:
> https://files.pythonhosted.org/packages/80/06/f7e09b3240196326fb343d6bd931cafedd26ae1dfdbd7cd0183cae3029d3/scapy-2.8.0.tar.gz
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
