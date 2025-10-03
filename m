Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52B30CAC5B0
	for <buildroot@archiver.kernel.org>; Fri,  3 Oct 2025 20:04:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0FE0E4121D;
	Fri,  3 Oct 2025 20:04:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xAKLHU8f_3ca; Fri,  3 Oct 2025 20:04:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D25D74120F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D25D74120F;
	Fri,  3 Oct 2025 20:04:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id C06A1118
 for <buildroot@buildroot.org>; Fri,  3 Oct 2025 20:04:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B223840E92
 for <buildroot@buildroot.org>; Fri,  3 Oct 2025 20:04:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uDyFCvdwPUcA for <buildroot@buildroot.org>;
 Fri,  3 Oct 2025 20:04:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D831F40E91
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D831F40E91
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D831F40E91
 for <buildroot@buildroot.org>; Fri,  3 Oct 2025 20:04:51 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 6240C13F88D;
 Fri,  3 Oct 2025 22:04:47 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 03 Oct 2025 22:04:47 +0200
MIME-Version: 1.0
Date: Fri, 03 Oct 2025 22:04:47 +0200
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org, linux-amarula@amarulasolutions.com
In-Reply-To: <20251003173659.1405230-1-dario.binacchi@amarulasolutions.com>
References: <20251003173659.1405230-1-dario.binacchi@amarulasolutions.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <c370e34afbf3c98d7a60b08a261f117d@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1759521889;
 bh=JDAg5U4j4v6I1YVNvF8eKxWT3ewkHCsE/4As4cDuKWY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=BkA9MpSwzvVL6JY43fl6t+AkDJdSSiLxvvVnsXPEvIJ7EWHlZYaod5KcFOIreygBd
 i85dNhQ4Lc71tQo6E8IqMTOJOvaolcT/bT5+P+YU0SU9JctNRhMxsFzZeShhxK6lF/
 GqthJwlxwt5oArakF6pTLlOFI7nZjrSvG7Keup6EEBiuJ0JCY/aNOjrhOkUr4LTMSe
 fB7X9WNUoMGr0t0L5Twvw38ILKuGB8bGnhNCRdJHpIahocSJxhnWV96mEWk5dU2HiW
 HU2w/4f7kg+auwehmCv7QsGzaGGYEo1XiowzVH81Yra4udQ9g30jV6BB4u616U9f/R
 gAl3poECfKDMA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=BkA9MpSw
Subject: Re: [Buildroot] [PATCH 1/1] package/faketime: bump to version 0.9.12
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

On 03/10/2025 19:36, Dario Binacchi wrote:
> Release notes:
> https://github.com/wolfcw/libfaketime/releases/tag/v0.9.11
> https://github.com/wolfcw/libfaketime/releases/tag/v0.9.12
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
