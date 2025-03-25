Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4C09C36005
	for <buildroot@archiver.kernel.org>; Tue, 25 Mar 2025 21:50:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A2D2C412E4;
	Tue, 25 Mar 2025 21:50:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 50dPVxmJf3x3; Tue, 25 Mar 2025 21:50:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C097740C52
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C097740C52;
	Tue, 25 Mar 2025 21:50:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id AB0071B8
 for <buildroot@buildroot.org>; Tue, 25 Mar 2025 21:50:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9166D8100D
 for <buildroot@buildroot.org>; Tue, 25 Mar 2025 21:50:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MA5UfhL-UJgK for <buildroot@buildroot.org>;
 Tue, 25 Mar 2025 21:50:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7A69E80EA6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7A69E80EA6
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7A69E80EA6
 for <buildroot@buildroot.org>; Tue, 25 Mar 2025 21:50:26 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 12FF278032A;
 Tue, 25 Mar 2025 22:50:21 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:34930])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 25 Mar 2025 22:50:21 +0100
MIME-Version: 1.0
Date: Tue, 25 Mar 2025 22:50:21 +0100
From: Julien Olivain <ju.o@free.fr>
To: Thomas Devoogdt <thomas@devoogdt.com>
Cc: buildroot@buildroot.org, thomas.petazzoni@bootlin.com
In-Reply-To: <20250325101116.791637-1-thomas@devoogdt.com>
References: <20250205163750.6072f1bc@windsurf>
 <20250325101116.791637-1-thomas@devoogdt.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <efd129cbb45ddaed50394f90fe4e611f@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1742939424;
 bh=FCfTJQVo9A+Q1pZNcSLq0CqF7ruj53BeX5EaNsE8eFk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=M7UtDEOtYfqPDU0Q2KUUqjeHodb3phflqdwGbB7BAW/t9G/GEcqcWSW/I3k4Qi1Ig
 +SqdB0sHq5PpJPD9MjbkB2Ts1juKcLKKdNnnY+pdxVcfHmwmHaXA0EI48+m+oKV/qc
 zXqijF+27n/oKfDNZBDQD9nv1C3kZoQg+b6TAxoFpqVo76eRApjxXiLTTffMiHbgJb
 WlZsZQ1/RvBgWTb63o2+5epPFjHTKOTLhW6S92cUN02YyFmS+Cv9GqavjPUNiXVC9d
 H9o6V+qPsqIHlFM1ppMIFVRL/dCnKpmt3+zsgfB9Ez0KDkXmVgfH9qOANsBq8j5e7m
 MKx72xRm2EJ0Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=M7UtDEOt
Subject: Re: [Buildroot] [PATCH v2] package/wayland-protocols: bump to 1.42
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

On 25/03/2025 11:11, Thomas Devoogdt wrote:
> Announce:
>  - 
> https://lists.freedesktop.org/archives/wayland-devel/2025-January/043966.html
>  - 
> https://lists.freedesktop.org/archives/wayland-devel/2025-February/043980.html
>  - 
> http://lists.freedesktop.org/archives/wayland-devel/2025-March/044027.html
> 
> Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
