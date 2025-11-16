Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40F1ACD4F3E
	for <buildroot@archiver.kernel.org>; Sun, 16 Nov 2025 18:52:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0123F60B92;
	Sun, 16 Nov 2025 18:52:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TQMlBCpFUZIQ; Sun, 16 Nov 2025 18:52:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1B77160B69
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1B77160B69;
	Sun, 16 Nov 2025 18:52:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7B26BD5
 for <buildroot@buildroot.org>; Sun, 16 Nov 2025 18:52:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 79079404BD
 for <buildroot@buildroot.org>; Sun, 16 Nov 2025 18:52:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 97sU02ooJtqS for <buildroot@buildroot.org>;
 Sun, 16 Nov 2025 18:52:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A1A59401AD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A1A59401AD
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A1A59401AD
 for <buildroot@buildroot.org>; Sun, 16 Nov 2025 18:52:27 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 4B6A120039E;
 Sun, 16 Nov 2025 19:52:22 +0100 (CET)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 16 Nov 2025 19:52:22 +0100
MIME-Version: 1.0
Date: Sun, 16 Nov 2025 19:52:22 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Eric Le Bihan <eric.le.bihan.dev@free.fr>
In-Reply-To: <20251116085612.5120-1-bernd@kuhls.net>
References: <20251116085612.5120-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <7ddcd59e68ba523041b5ba5b3f78abfb@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1763319144;
 bh=lGwm4v3cq4PwA6j/EYucjMV38nG8fr+uHfvaV/EadX8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=NLWcj9zIVHZR2vrfDulzlX3MpyhA0YnHddauAdjLmMcB4bF1VuglQEBRIVSeXBbWR
 EkD7CI7INL6lHyo6U9UP05D3vTN++/zdI6m62Cp0/c3ive0di3CUeMpJ245stko4lF
 /Qfts/OjnJ+DR0z5M5oB+75/8Q9SFsrioRecNtm2E7m6LeufM5zmAh9nPrb8oujJUJ
 wO/MvXwwsH5spm/uDyz/C8ah1iRpoHQa1v7TC/qvin//oeEfT/BHOdDufRPy6mz3u4
 1HlhWfJT/E8IvKJodqiJi0fanH6b3r+drNPML7Xf7tSMLlAz2koohmknfDVfYnVwcP
 sUlWrhCOXdXJg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=NLWcj9zI
Subject: Re: [Buildroot] [PATCH 1/3] package/libdvdcss: bump version to 1.5.0
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

On 16/11/2025 09:56, Bernd Kuhls wrote:
> Release notes:
> https://code.videolan.org/videolan/libdvdcss/-/blob/1.5.0/NEWS
> 
> Added patch to fix build errors.
> 
> Updated _SITE, switched tarball to xz and build system to meson.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
