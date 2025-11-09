Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A8A2CCF9F8
	for <buildroot@archiver.kernel.org>; Sun,  9 Nov 2025 21:47:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 609E9406F3;
	Sun,  9 Nov 2025 21:47:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0ExuJzASWXYR; Sun,  9 Nov 2025 21:47:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EE2AA405AD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EE2AA405AD;
	Sun,  9 Nov 2025 21:47:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6DBA41CD
 for <buildroot@buildroot.org>; Sun,  9 Nov 2025 21:47:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6010140400
 for <buildroot@buildroot.org>; Sun,  9 Nov 2025 21:47:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H3xehX6tLaLC for <buildroot@buildroot.org>;
 Sun,  9 Nov 2025 21:46:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5E0AC403F8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5E0AC403F8
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5E0AC403F8
 for <buildroot@buildroot.org>; Sun,  9 Nov 2025 21:46:59 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 37FF72003C3;
 Sun,  9 Nov 2025 22:46:55 +0100 (CET)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 09 Nov 2025 22:46:55 +0100
MIME-Version: 1.0
Date: Sun, 09 Nov 2025 22:46:55 +0100
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org, Eric Le Bihan <eric.le.bihan.dev@free.fr>
In-Reply-To: <20251109160205.612498-1-dario.binacchi@amarulasolutions.com>
References: <20251109160205.612498-1-dario.binacchi@amarulasolutions.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <734f530715ffb974dc54990dba22e6f5@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1762724817;
 bh=hQyI73uGey9C4g9kfDdWCdQmMoXdQg8OWc6oHGPmNoU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ghuR6ue7SJu9BlxdpLz2kYhNeUefqG3i/hAMPwTILYGlT5qe+QZSfoD5cYLHiDCa8
 2f+uHEqHrjcxJi09xBjuzxxNzRIX68VyU+V4ov2+grmhfrA2A/ve1+rBbdk0yQ3Hud
 TVA0Iqn/ckMaJp7rx60SFYOu8Js+88dAiJIUVs+Diz7ud4cFijPQsNgYzGMkVPHfS1
 L3/cYk6eXJhjc57MMVmq7G03K+Mxi+vB2vWCXQJYqK1vMgtmjfsWfU+VARYwdCqkyG
 7di72HJlszAtwedmbdetVis9nX7mSSLKP2tNvcxQ29BWAGse3t8NwZWkNG6+znA47p
 EW9gQksE72KqA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ghuR6ue7
Subject: Re: [Buildroot] [PATCH 1/1] package/darkhttpd: bump to version 1.17
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

On 09/11/2025 17:02, Dario Binacchi wrote:
> The license hash file changed because It was added copyright notice
> taken directly from darkhttpd.c.
> 
> Release notes:
> https://github.com/emikulic/darkhttpd/releases/tag/v1.17
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
