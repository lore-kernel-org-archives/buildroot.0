Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17078E83EE7
	for <buildroot@archiver.kernel.org>; Wed,  4 Feb 2026 08:26:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B8E5C406B8;
	Wed,  4 Feb 2026 08:26:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5flA8m0Xr_ds; Wed,  4 Feb 2026 08:26:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DF22B406BA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770193611;
	bh=EwXVE9OuCUw3lVo9WKOjTt77i5fZUZaWE5lKTDIuRTY=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=O/gw04DRqM5tzP/pQkSRThQ9V159XXMy+1sZWMhA/3JsBHOklu4UvEcUfcGDyMjI8
	 lNDd7Gy0clgV590uH1KferA2tF+0vc+ent8PQFQTAuhbG82blKuG28PspWTXy4bhbB
	 TftC0D7HFU6Kej4BMRN5HiaFJCFGI/1QDBwJw9OqE6thlzYuH/tWZWI45ejb/19GgD
	 ws8VDUf8k4kpvhd6wBmjgvR21ueEeg11XU6CBYyTimopzRv7k7vjpAXuoGOul2Cg8o
	 hNZAf1cnKXxfLwQ5pggIkbpocwarnDowKak1MGJVsCvAhfXQTU+IZUF65dXFVBtIBl
	 QohiC1frhayXg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DF22B406BA;
	Wed,  4 Feb 2026 08:26:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id BFEABF5
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 08:26:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id ABA66403ED
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 08:26:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qoF4N7OagcJF for <buildroot@buildroot.org>;
 Wed,  4 Feb 2026 08:26:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C43EA402EA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C43EA402EA
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C43EA402EA
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 08:26:46 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id D0E52C24391;
 Wed,  4 Feb 2026 08:26:49 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 44E3160745;
 Wed,  4 Feb 2026 08:26:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 2B10B119A88FC; Wed,  4 Feb 2026 09:26:27 +0100 (CET)
Date: Wed, 4 Feb 2026 09:26:25 +0100
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org, Sen Hastings <sen@hastings.org>
Message-ID: <aYMCn79-iQ4e1nro@windsurf>
References: <20260125122938.260135-1-ju.o@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260125122938.260135-1-ju.o@free.fr>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1770193589; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 in-reply-to:references; bh=/PDsD7kZohiR5xxlv2aXQEjKPlGE+XlikSfHyJR/Kc4=;
 b=GjRn/UGBC16Lxkpg8lXJy2vHWuOcs05pJ9wLsxbRQcrXmIZ2cYQz+8ESaeL8wRZAMnnG97
 5MMAoTDFmT7NcaQ2kJ+PiHfxvD9vOf6O/IO3ygM7ZQ1PhSXZSVHtmV+lxm81gVHpZdce0h
 OPF2D4FmR+LCBNk79ib8OBBVJjz/B4H9Zq4R4FyOzGf2bmV7xy8ONr2CCs4FIGHqp69qP6
 1+ujrIm6x6QSS0Uv70PgFM/jwxrp5bj92+B/3MJ9REfSjnc/eDOs1tIZKJwr9zlWjtExp3
 p3jAJp2yHHfccxCHO5Rz/6VqxTtNhz4hgGgoo3bhRuUpQ6MRVZnd6JTgzRUNrg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=GjRn/UGB
Subject: Re: [Buildroot] [PATCH 1/1] support/scripts/pkg-stats: fix
 RuntimeError with python 3.14 asyncio
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

On Sun, Jan 25, 2026 at 01:29:38PM +0100, Julien Olivain via buildroot wrote:
> When running "make pkg-stats" on a host with Python 3.14 (e.g.
> Fedora 43 for example), the execution fails with the error:

Thanks for the patch, applied!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
