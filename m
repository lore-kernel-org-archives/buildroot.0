Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA8D6CA9EBE
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 17:42:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 541A0408CD;
	Sat, 10 Oct 2026 17:42:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tEP0xauqqc1m; Sat, 10 Oct 2026 17:42:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 7A69D4087E
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791654139;
	b=UCIzRrdCv6oltip+/YAdgu25zt1EporRvww0h6S0vi8OW333bn1WWdG8dfOpkO6GsY6+
	 mNOp5yAndPJK+FU6Ou7HWzAWigDzLEWz1k8BoejsVhwufx/Y0J9z/gB8LUn3zmZy4bE6M
	 pOmLJlNnBPOMggszyXpC1CG+fxMHWi6ZMPK7Q+RfP8tKHGjFCuTRiIwhuYWGgcZ0Y2mKw
	 PAK7MoFZz1CBxvo+3CRLu54ruXqd2MLJigBO8qfAcofMlInVn0v4nJ67+dCpsLz6k1dxU
	 g+SrU82nVMhfBc1PDu07NBalHa1IvjIOv3pS7hQM919LxZYv3L2it4AlGO6U7RulloQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791654139;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=kk2VklYlo0OHdlNSj3CFcGxcUuRil80Wl3WzPd3IO0M=;
	b=GWWtKXZsKNGmMtn2SQUKxpJ1vT4JEKuBzq7bDpApnoZaxwKUmUR40BHWlxurDao8vclt
	 SN8B2hxj9bpMPHocHh1Wz6wA3HLB8jBJy3RB15WZny6rKQYsw8g3PkD0/YvU8pC1JIEV/
	 Rn7HSDyDmMEyph+LjJ82S0LkvEWhAFxILS8aQMBTrN9pAEFAWSbyB5zIZ00VckNDb9Nfh
	 jLj21j/ipfCxlP+b2xbj42jdysu+BaT+L/VuL00FvPbpj7iIX0kC4uuPZkG2fs071lr6i
	 xkwthoQX97W3geAjeMrftsRr/brbzhcDxoPDRjzIhWpomGi+Tti8/tM8ZSoa6Msmavg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791654139;
	bh=kk2VklYlo0OHdlNSj3CFcGxcUuRil80Wl3WzPd3IO0M=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=WWNmv5SM03km8nBqs1uR54KYTydsBxvNmD2+18dS75Ts/25zEoy4JMa8twGP561RJ
	 bjTkJU+LYP6lim9lWHr4u7vm8l5DyuToCFaMs8jNJHONeXKPrwr6nACoPbjvtLSIHS
	 Ioi2cc61iSGmmpG2jtJqEPiBxHl/RiuA9t+J6M5pQo/K5fZgh/cpgabOWh2jMtH6LP
	 /ZEIkAHTV8i1dt8TfBuz//r3zWHD5xlb2lvNeqbcT1STVgbGcv4L0zg4QJ8YScCE0C
	 HChUcOW2KP9YVzr/EPdm7j38gCZmEIxT8khEFjOFcXE8VDPwmddkxZXvxRw64Qq+GI
	 AnGG2rJEFC9bg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7A69D4087E;
	Sat, 10 Oct 2026 17:42:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id D7B76105
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 17:42:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BDDD080AA3
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 17:42:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uBLmB_fTiO3A for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 17:42:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 6D2E480756
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791654136;
 b=cPlvLJKDGxGOY7HoEdRP4QXD3KiaeGO+B1EcaUY9LFlUGbXxqBSt7h/3o/g6ZF5l4DQK
 CisgyQ9iVY5TWJiPbFWK8mt1B8UnstmSAj8GHg7k25R77NWBkXd0BnfQhRVN35ATZphN4
 nQsJfKdYaI2YtGFxv9lsTGviIX7LxaYo5MoGq1f5zspvQEG/d+D37ItTFk2YzZBqj4m1t
 Hclunf4jFrZpnQcdxW2cIBcFTOGDzW5ysA8Qq+r5FLryvd2aaD/Fl0nxN6p6Rw5ZxTNDl
 KzFUX55bNMAR+HH8TFcWkyxbDZ6pMk7N3/geLG+47Cp7hfIchHDl1tNu63XOznbeubg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791654136;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=Yj9Qx0QUxCpUB1Faf0kflBR7VAvvb0mlaf88B1Kpi/M=;
 b=SbHTmu6b5R0cx4CtWpCaGtIZ1Lczrj98MbjSk3k7Vv4LP9hiFWwBQbDiqKwqZOzQ0glc
 HHKbfaJA9UN07JhysPVWRCuEI2zi9HAR9BlLLTdOVpCYawu+VmzFboc4LrATY0ETg7aZO
 X3RiJHkbDRKW4U7C8Onc8g1AvfNUCmWSXtjMHbzI/H8aipGaNxj44nD5LlfXiyYCmIVdq
 2Q51lixOPtb5lvqC0TpTlbJ4fSZ7QN7G6Hto5Ly3lqGFpf+BBlkKO8KQWWr0q3VFcKem6
 omlcai9COjQKZM0jImoarQGizv8JRB2TF+iimr9BKA4k9EamDe7Hv0oD7wuuHfYaUTQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=Ts0Klt5S; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6D2E480756
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 17:42:15 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 31A684E411CC
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 17:42:13 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 076B06075C;
 Sat, 10 Oct 2026 17:42:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id D09EA11D706A3; 
 Sat, 10 Oct 2026 19:42:11 +0200 (CEST)
Date: Sat, 10 Oct 2026 19:42:09 +0200
To: Yegor Yefremov <yegorslists@googlemail.com>
Cc: buildroot@buildroot.org
Message-ID: <asp4qInIYNj-7JlB@windsurf>
References: <20260903114721.984785-1-yegorslists@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260903114721.984785-1-yegorslists@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH] package/ncftp: fix cross compilation
 detection
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Thu, Sep 03, 2026 at 01:47:21PM +0200, Yegor Yefremov via buildroot wrote:

> So add a patch making the generated configure script follow what
> autoconf has been doing since 2.50, and consider the build cross
> compilation as soon as --host is given and differs from --build,
> regardless of whether the produced binaries happen to be runnable.

Instead of patching the generated configure script, have you tried
using AUTORECONF = YES to fully regenerate the configure script from
the configure.in? Or perhaps this is hopeless as the configure.in is
ancient and any modern autoconf while not accept this ancient
configure.in?

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
