Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C908CCD1BF
	for <buildroot@archiver.kernel.org>; Thu, 23 Oct 2025 20:02:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3C18940D20;
	Thu, 23 Oct 2025 20:02:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id geO0T9o-ckRN; Thu, 23 Oct 2025 20:02:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 07E5240C18
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 07E5240C18;
	Thu, 23 Oct 2025 20:02:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id EC56643F
 for <buildroot@buildroot.org>; Thu, 23 Oct 2025 20:02:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D2DE640BAA
 for <buildroot@buildroot.org>; Thu, 23 Oct 2025 20:02:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lu_rFgBVss_4 for <buildroot@buildroot.org>;
 Thu, 23 Oct 2025 20:02:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2709040B62
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2709040B62
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2709040B62
 for <buildroot@buildroot.org>; Thu, 23 Oct 2025 20:02:50 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id C9E002003C3;
 Thu, 23 Oct 2025 22:02:47 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 23 Oct 2025 22:02:47 +0200
MIME-Version: 1.0
Date: Thu, 23 Oct 2025 22:02:47 +0200
To: Titouan Christophe <titouan.christophe@mind.be>
Cc: buildroot@buildroot.org
In-Reply-To: <20251023140527.544948-2-titouan.christophe@mind.be>
References: <20251023140527.544948-1-titouan.christophe@mind.be>
 <20251023140527.544948-2-titouan.christophe@mind.be>
User-Agent: Webmail Free/1.6.11
Message-ID: <00b0ba43bda2f314437d63ab96541dee@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1761249768;
 bh=Z6MgF2G9KuZDFsX5GkLec66Gl2tBpK3fyqguvT3OGQs=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=XxgJsePzLa4nRxFUcPoH1yDnhynbAntvLRftstZNxgY1TYpWU9ZI28IsCyBxWXX4l
 yrnAVVClrWaXKLTVbWtxE8a+kOs/RtuddpOx8V0WGpHjhihB9uD8Pk0WXVZHtaRZEZ
 C7AjgFDeesqudFhOFF1c9Ehtjjs2XDHDPGJ78u6AVdICV0SOjF8ZwyN+72tRpHBeoK
 jnCNh6Jb54DBnBoy7C/igRklMN+uHwQF7SiJR+36LbqLeQOto0VqjT0EEX760fxM5q
 MYwIZeyT1qqv7hS//7jmOEKWI60c0UlAZsRCweexyh+Wcj/+gM7iohQnhkAzSyEpNS
 BfT3Rspt5HaFA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=XxgJsePz
Subject: Re: [Buildroot] [PATCH 1/4] package/freerdp: ignore CVE-2025-4478
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

On 23/10/2025 16:05, Titouan Christophe via buildroot wrote:
> Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
