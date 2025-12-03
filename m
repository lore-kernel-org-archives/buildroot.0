Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55C88D1CDA8
	for <buildroot@archiver.kernel.org>; Wed,  3 Dec 2025 22:47:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1969983E1C;
	Wed,  3 Dec 2025 22:47:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lI6Hd5bzDU4g; Wed,  3 Dec 2025 22:47:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3EB3B83E2A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1764802048;
	bh=/9i/wPG4U6eGQ3KxgIup+oskyleIXzd4wRm22EJIScQ=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=p9I5L3SynIIsyyPxCyoUiCDVjBot0KmdqeKoiLSlmMBeew4HAmq190gceZeghi6xM
	 WksE0DbbXs9kvK1sZNFlhvBsXwelf7mBqcGj/k3fUnrVeGtGfcOJS0AcM5k9gZqRI+
	 cnKya2ZY6cdmyprgqvEqFiHcLyUJN6mj1N6D/nv3OEEkwFSffRH6N/TaEu9Brou4g1
	 3VvtMMyMcExw9zDKLVXJBM1WQsfs3oZi7PPJtZ8lwMUdZ4f5pegZGPGvqin9mQrPH9
	 xmosgMrBrQJ4k4ZR5VRqDMAryYOsqP0GDrNo82h1Ia7T09qjo+tId/rSH33WLDFrNx
	 Rpyd60CxLoURw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3EB3B83E2A;
	Wed,  3 Dec 2025 22:47:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id C1422E7
 for <buildroot@buildroot.org>; Wed,  3 Dec 2025 22:47:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A6DB360A51
 for <buildroot@buildroot.org>; Wed,  3 Dec 2025 22:47:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A1FLDAsrkdH0 for <buildroot@buildroot.org>;
 Wed,  3 Dec 2025 22:47:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C886D6086F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C886D6086F
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C886D6086F
 for <buildroot@buildroot.org>; Wed,  3 Dec 2025 22:47:25 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 1AD46780505;
 Wed,  3 Dec 2025 23:47:19 +0100 (CET)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 03 Dec 2025 23:47:19 +0100
MIME-Version: 1.0
Date: Wed, 03 Dec 2025 23:47:19 +0100
To: Pierre-Yves Kerbrat <pkerbrat@free.fr>
Cc: buildroot@buildroot.org, Kieran Bingham
 <kieran.bingham@ideasonboard.com>, Marcus Folkesson
 <marcus.folkesson@gmail.com>
In-Reply-To: <20251203132244.3015511-1-pkerbrat@free.fr>
References: <20251203132244.3015511-1-pkerbrat@free.fr>
User-Agent: Webmail Free/1.6.11
Message-ID: <14c4395b25ae553ac757bb055f24947e@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1764802042;
 bh=+0EDVRY8wOrCuxOh8UC9pt3tSIsE9/esuD7NRQv6HOU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=j06ZCEYoWGx/O+iT8u3CZfS0dFur3FGqy8PblHty4qMT9yvWtpGKCyi4Fn3bXi7O1
 2VCZTPH3dUmlVnTEBfAYN3dctirLk+1AyolZ87dzJfjALhtxuzCZupYCRyk6hDbDsi
 6xVjdDYaTdRRSPMm1UySIJJ31iMlTXmyQohbDDfl6l+qTaqdtiHSVN1RzKtsP7nQ/S
 xgj4W89IP+qdDS0XUEVX7tRubeQ1Y1hfexRzI/xk5TJDoRkuAAhGqdZPu+0CGjkXIF
 kNOBwHaClqecqS3mUql3ObYaQJKHH9wuJJmIBn4Sf5vv220VQc5d43BydJPwKmqVcT
 mtXRpBs0arUSA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=j06ZCEYo
Subject: Re: [Buildroot] [PATCH 1/2] package/libcamera: bump to v0.6.0
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

On 03/12/2025 14:22, Pierre-Yves Kerbrat via buildroot wrote:
> Add dependency on 5.3 headers as libcamera is now
> making use of clone3 syscall that was added in 5.3 [1]
> 
> [1] 
> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=7f192e3cd316ba58c88dfa26796cf77789dd9872
> 
> Changes between v0.5.2 and v0.6.0:
> https://git.linuxtv.org/libcamera.git/tag/?h=v0.6.0
> 
> Changes between v0.5.1 and v0.5.2:
> https://git.linuxtv.org/libcamera.git/tag/?h=v0.5.2
> 
> Signed-off-by: Pierre-Yves Kerbrat <pkerbrat@free.fr>

Applied to next, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
