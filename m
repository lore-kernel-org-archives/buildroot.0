Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60261CCF2C4
	for <buildroot@archiver.kernel.org>; Sun, 18 Oct 2026 13:40:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0D49240600;
	Sun, 18 Oct 2026 13:40:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mlyT-EENyWos; Sun, 18 Oct 2026 13:40:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 3E75B40637
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792330820;
	b=dxj5bwkOUo/lvRjCDWiVHHEHVo+w3AQmhnFE7O3KHVjAnhncUhlkTEjt1NCZHLZCbk8y
	 ZlvGYglNdsVSrqLAQiMNIyskXoqEGiEucXxdFUGIZwmgGjDd8dTsTudFTuNqtQ6wIzLb2
	 R6i7QOa05i2BGIObdPEwIvQP0Z94dWQ2GHNV1TbqQh+5c86yKa700JOJPe1WkrpvHo02C
	 gPQoKUE7L89CZ2fOlTaWOsZ7TUtVZ55SrpIkSmVjxlqQPpLZ+pYNNq4GK9kkUEI8hrkKQ
	 lf67EA8j3WpkmLSJWzJauA3yPEDxnpU2/zGXjPS3qaFh6la6WFmJwh5hsqSD86oDvpA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792330820;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=7odnz6mG8PDlNcWk6a1ELQtn0NVcrmmu0FLAoOwuP9M=;
	b=pSTtWvM1D6C6uiPWiQZ5WrCAxWrc//grHiil2WCHLR/BwzV0sRYmOWG+s+M/lqgKN7vc
	 mlG/1mP1oCJ1H5McikwFWNnJzqw8zljNi/me8FykNEstCsKuxPTs+/8aY3FVHe/8MrwWZ
	 J4RYK0ApuVZSnglWxgwXVOPSQAPhhy1Nb9egoAYHySmuOfseoR6fXNbmHdH6gOEeXeAsS
	 npiC0AlLanhQoW44f3s1qDZjsvkGp4uQBoK43Pt6aNCIC9AAmw+KszZjN0yeA4m0Vxf63
	 c93xjCxxvIX2vr8KS6GSbcmeCeqW/aZJOYzQDndMmBZyR4F3B6DorUjILN450ego77A==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792330820;
	bh=7odnz6mG8PDlNcWk6a1ELQtn0NVcrmmu0FLAoOwuP9M=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=oEyA+mrchTba4n1auRbiuVjtylH4l/LSaHwtl1G6wNlt3iupBN7ERrPE2dBO1FUJt
	 KAWIQlhp9RrrAzlzpMaV0hf0c/GX62N94rixoqgt03im7onWaEyOq3MOGIqr/UTPW2
	 q5yp2zV+QHtOL6TT1Hwla8KG2nOlVJzPBQuqrFCJDRB6eBbPicTfoKDRtYT+vsnaIP
	 ggVXHyQWv5NOUuowvYO9PntmUAmjCSJUP1Vu5s7qr2VwTsypWkdBqyZadsVDBu+9KB
	 hcSVRhfO71/cxFvJM9UfYvJnNVl20QEIC1ODjSlFYI7X6BLswGyF/toIDBfQVRb7za
	 DsdaLrQ4yIkyQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3E75B40637;
	Sun, 18 Oct 2026 13:40:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id A38F361
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 13:40:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 899C140637
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 13:40:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qEKSMBN8i9MD for <buildroot@buildroot.org>;
 Sun, 18 Oct 2026 13:40:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 5697D40608
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792330817;
 b=p+CD1ZsTEkPKfu2enKvPERgAAobyGjuioT+6k967xsK9j3z+XWMgMMQu5NMVmYD94+U7
 N/ubrJTMXAGsucwqsfdG1jlylSixR5o+ATKs2hPg3nVNYeEqelnHoyYbWPN6c8EP57rZP
 9fTTfzHtH69ERuAB6Q8z+DFzVAnwZiWEMRkCBeoTUR2tWHxXu6vn0UKc/f2GlRwveKW4H
 qgUEkbmgb8CdWlj5jvT1aLefxa4IiT14ZaYdaqaX2Mbz64MdkkXW7m+oQYu/68BvDDmwe
 G7hhTHAGakVYQ4BhdP+7FFWqgWPJquzUdfCjZx8oGg37UQHPjAOEfkWBSWzUVJMidCQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792330817;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=ps3KUGqJ/pyUSPa4YPw5D/Dd/GH4N8rXm3n9Oo7L6Kk=;
 b=YqaHAdNdp2ux9/PMwsHe6lv4RDGotc9SQi+59sEo2yexDEq0Db6LoDpSt+dKadBOGR4w
 2rhES+QmLrOvC/1KqIsl47o68JgovVxdB2Arf4d35ikvIcRqq+RNvOUhbE1tJsH3P7a4I
 K08hCASDp7OzZ6D0lY6GTkaOuI0vc0+h09cZsdrdvzWzcJtvV7aPM5b0/iect3Xo077EW
 kq6z6I+N8mgq+Tk8FAA50qcIIa4EDb1TfXIkiYMgX8JyXbehL1XDuziZOVy9wMni0ErvG
 xSFbEEc0iwmg4/3n1o+zRnJK5rQEuoTwC25d1ThErQb4aEEk001BCPuugNvS8J4ukLA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=free.fr;
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b="h/lcHcVV"; 
 arc=none smtp.remote-ip=212.27.42.6
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5697D40608
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 13:40:16 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id F2C9D780368;
 Sun, 18 Oct 2026 15:40:13 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 18 Oct 2026 15:40:13 +0200
MIME-Version: 1.0
Date: Sun, 18 Oct 2026 15:40:13 +0200
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20261015071935.1063187-1-dario.binacchi@amarulasolutions.com>
References: <20261015071935.1063187-1-dario.binacchi@amarulasolutions.com>
User-Agent: Webmail Free/1.6.19
Message-ID: <f5f9f6dc0391762bdd73564212640ce5@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/1] configs/stm32f769_disco_sd: bump Linux
 to 5.15.222 and U-Boot to 2026.10
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

On 15/10/2026 09:19, Dario Binacchi wrote:
> The patch bumps the Linux kernel to version 5.15.222 and U-Boot to
> version 2026.10.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
