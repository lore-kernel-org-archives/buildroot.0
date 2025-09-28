Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F99BCAC5B5
	for <buildroot@archiver.kernel.org>; Sun, 28 Sep 2025 11:30:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3D8D840681;
	Sun, 28 Sep 2025 11:30:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LMtMGmPIh0pL; Sun, 28 Sep 2025 11:30:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7B89240667
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7B89240667;
	Sun, 28 Sep 2025 11:30:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1D01B12D
 for <buildroot@buildroot.org>; Sun, 28 Sep 2025 11:30:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 028DA4065E
 for <buildroot@buildroot.org>; Sun, 28 Sep 2025 11:30:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id awYFp4gcTU-x for <buildroot@buildroot.org>;
 Sun, 28 Sep 2025 11:30:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3A60C40667
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3A60C40667
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3A60C40667
 for <buildroot@buildroot.org>; Sun, 28 Sep 2025 11:30:00 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id F01DB5FFB7;
 Sun, 28 Sep 2025 13:29:56 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 28 Sep 2025 13:29:56 +0200
MIME-Version: 1.0
Date: Sun, 28 Sep 2025 13:29:56 +0200
To: Titouan Christophe <titouan.christophe@mind.be>
Cc: buildroot@buildroot.org, Ricardo Martincoski
 <ricardo.martincoski@datacom.com.br>
In-Reply-To: <20250829144244.154577-1-titouan.christophe@mind.be>
References: <20250829144244.154577-1-titouan.christophe@mind.be>
User-Agent: Webmail Free/1.6.11
Message-ID: <0841b0c0e58fe7a4037cb9b0d8c4ff80@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1759058999;
 bh=x5BrDYNWORXK52lUW76Fcxts0uIvyJnILMQhnW3XfBA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=sPOm4WylKLDNt0IKBJVrl5WAduU38RUsbgg9lD643HzZb6P92w7jPWZqVFmOPWC3g
 yZdd+n5MiO9+89h+1iNlxmUMciJT2Hcd8KftrIbeUcyTJ8JKDkgcO9MWLPDhGeSJvf
 sM9/Vqfhx0HtqVDvK+0gNxM36LaxsfgPd4AwuCnzzlziEWko5372eB1YAt06D6qQQw
 hi3PynZn2ZhN897GbSimQR4IapnwEWKsUMUQY7VXWqAdDMp1AIBHfDFiIkjAVKb+E9
 Fxyqve3EsQQ9WVBk6gb+fECFGK1q2+oLGIhcjJzmyNzDRPRx69iu0gfpPPGg4uUqqZ
 WVK4kc67Tr4Jg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=sPOm4Wyl
Subject: Re: [Buildroot] [PATCH] package/fbtft: remove package
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

On 29/08/2025 16:42, Titouan Christophe via buildroot wrote:
> The fbtft linux extension was only needed for very old kernels (<4.0)
> that are no longer available in Buildroot.
> 
> Let's therefore remove it.
> 
> Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
