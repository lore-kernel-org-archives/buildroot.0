Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB48AC61DC4
	for <buildroot@archiver.kernel.org>; Thu, 27 Aug 2026 21:10:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9C26460836;
	Thu, 27 Aug 2026 21:10:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RIZdUpJGo9q3; Thu, 27 Aug 2026 21:10:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787865015;
	bh=8HQx4/Ct11gkJ6zFyT9kDIYYWw0vx8d8uvKI8jZVOZU=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=rs+eSh+blkU2K2u0+e5ku9OAMMThSDLjqsyJYRuDair6NeqK4VUqQOLL5wgL+sAmJ
	 UWDc/nOEmrJ6W/JC5i3FMu9/ce/8/HF4T4XtkZLwV4kIRAm9aPMU4llsrSc/bDYTTK
	 GOW4PJou/MEW47PPzC0KJiCZpia7rokulFtxb1ooDtuVRxLaZbiK912VhxAdRZmC96
	 kLjNSwKHxAvbAf0H24JI5KmNCan9xkOc1C/aH8Do2DoMohmt57XgFnXVqvhw7lc/6v
	 b/PVtB2vqZrgeqFPO0eaMPLyG+wMh8xE1/P8gZ01UFLuHT81Dyc+aJRN8COuGZ+vmw
	 sg2csi/bWbWLA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 84159607E6;
	Thu, 27 Aug 2026 21:10:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1F2B4386
 for <buildroot@buildroot.org>; Thu, 27 Aug 2026 21:10:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 059A080EF1
 for <buildroot@buildroot.org>; Thu, 27 Aug 2026 21:10:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l1xl1APrIW7u for <buildroot@buildroot.org>;
 Thu, 27 Aug 2026 21:10:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 08D6980EEF
 for <buildroot@buildroot.org>; Thu, 27 Aug 2026 21:10:12 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 8CB872003BE;
 Thu, 27 Aug 2026 23:10:09 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 27 Aug 2026 23:10:09 +0200
MIME-Version: 1.0
Date: Thu, 27 Aug 2026 23:10:09 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260827204132.1488224-1-bernd@kuhls.net>
References: <20260827204132.1488224-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.18
Message-ID: <6f88ef25cec48e8e24e9c9f80ba06df0@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/1] {linux, linux-headers}: bump 6.12.x,
 6.6.x, 6.1.x, 5.15.x, 5.10.x, 7.1.x, 6.18.x series
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

On 27/08/2026 22:41, Bernd Kuhls wrote:
> Update the latest kernel releases to:
>  - 6.12.105 -> 6.12.106
>  - 6.6.153 -> 6.6.154
>  - 6.1.184 -> 6.1.185
>  - 5.15.217 -> 5.15.218
>  - 5.10.266 -> 5.10.267
>  - 7.1.10 -> 7.1.11
>  - 6.18.46 -> 6.18.47
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
