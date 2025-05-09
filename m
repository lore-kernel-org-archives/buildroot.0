Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAC7BC3ABC3
	for <buildroot@archiver.kernel.org>; Fri,  9 May 2025 13:28:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6A56C83C31;
	Fri,  9 May 2025 13:28:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5Bmr_-VjIhxq; Fri,  9 May 2025 13:28:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7A48583C24
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7A48583C24;
	Fri,  9 May 2025 13:28:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id DFCF41A9
 for <buildroot@buildroot.org>; Fri,  9 May 2025 13:28:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C5C3F405F2
 for <buildroot@buildroot.org>; Fri,  9 May 2025 13:28:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A2y8anXPqy-o for <buildroot@buildroot.org>;
 Fri,  9 May 2025 13:28:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 618F740424
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 618F740424
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 618F740424
 for <buildroot@buildroot.org>; Fri,  9 May 2025 13:28:03 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id ABC92780371;
 Fri,  9 May 2025 15:27:58 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 09 May 2025 15:27:58 +0200
MIME-Version: 1.0
Date: Fri, 09 May 2025 15:27:58 +0200
From: Julien Olivain <ju.o@free.fr>
To: Olivier Benjamin <olivier.benjamin@bootlin.com>
Cc: buildroot@buildroot.org, Phil Eichinger <phil.eichinger@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20250507114042.96291-1-olivier.benjamin@bootlin.com>
References: <20250507114042.96291-1-olivier.benjamin@bootlin.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <5dfc6296ee5eed106bfa325dee29e39d@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1746797282;
 bh=TJAsA/sBJQtcuxyU/hEsk9m9RDJuFqtgsI49G4136l8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=L/C6RZkNoI5lhGu01ziwghTi21ysDHmypx4CHM4eQeVmEV/JeKbmexB05c3LPsFRp
 QIqJxFuOb2A1csx9ACPoXodT12vhnP0M/iimb3K6uZXxHNOGMvNj6VXqxbWlKHtMcC
 mLqXzC/SNkIQm0h1MZG2UuEF6xGk0rsfHmrOHeWRVNYqse31Bpa7BEhHqT+r8jreyZ
 RtdEYlMKL5R3Q9SIkM7HXZ3Umlnqki1xyi10F/c09vHbFHneLuukXJO2RtgJJvXISc
 ZyJt0/8egi5vu5o4OddMwoSWJVtmqkrfFrdsYQm11xN42Jyp8zbGs4zo1VfC/w55mt
 QXC6OrKxWDHzA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=L/C6RZkN
Subject: Re: [Buildroot] [PATCH 1/1] package/psplash: add support for
 fullscreen config option
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Olivier,

On 07/05/2025 13:40, Olivier Benjamin via buildroot wrote:
> Add support for a psplash configure option:
>   --enable-img-fullscreen, via BR2_PACKAGE_PSPLASH_FULL_SCREEN
> 
> The Buildroot option will default to 'n' to be compatible with
> the previous behaviour, as it was disabled by default in psplash.
> 
> Signed-off-by: Olivier Benjamin <olivier.benjamin@bootlin.com>

Applied to master, thanks.

I also see that psplash upstream received few updates, including
gcc15/C23 fixes: https://git.yoctoproject.org/psplash/log/
As a suggestion, could you send a bump to the latest commit please?

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
