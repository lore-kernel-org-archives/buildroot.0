Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1531CC021A4
	for <buildroot@archiver.kernel.org>; Sun, 16 Feb 2025 10:19:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B98148408D;
	Sun, 16 Feb 2025 10:19:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 71GjJaCNwYyG; Sun, 16 Feb 2025 10:19:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D0AE084076
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D0AE084076;
	Sun, 16 Feb 2025 10:19:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id CDFF2C8
 for <buildroot@buildroot.org>; Sun, 16 Feb 2025 10:19:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B234A40F48
 for <buildroot@buildroot.org>; Sun, 16 Feb 2025 10:19:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lY470pTySK_b for <buildroot@buildroot.org>;
 Sun, 16 Feb 2025 10:19:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 63FEB40F46
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 63FEB40F46
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 63FEB40F46
 for <buildroot@buildroot.org>; Sun, 16 Feb 2025 10:18:59 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 3A82713F89C;
 Sun, 16 Feb 2025 11:18:54 +0100 (CET)
Received: from 2a01:e0a:485:b220:8213:2270:4a8d:a1d5
 via 2a01:e0a:485:b220:8213:2270:4a8d:a1d5 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 16 Feb 2025 11:18:54 +0100
MIME-Version: 1.0
Date: Sun, 16 Feb 2025 11:18:54 +0100
From: Julien Olivain <ju.o@free.fr>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: buildroot@buildroot.org, Simon Dawson <spdawson@gmail.com>
In-Reply-To: <20250215212234.1840388-1-yann.morin.1998@free.fr>
References: <20250215212234.1840388-1-yann.morin.1998@free.fr>
User-Agent: Webmail Free/1.6.9
Message-ID: <05129cf7319b5642c7cbf08359390a9e@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1739701136;
 bh=D1a6o3xKZ8DSTO8p8CUxh+Xtz8SD6atHkjT3NCc6sQQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=mhV+lBDtLLvTJRHuN2IOtXWcrTw8UWXcBxlEsesGbmvEnIeGb0S+jHlkJj19CG5uV
 iHbbuyjPga7Kge4GPu1+LTX9sMrxOHXWKfWBSZvYu3NWuwBy1hbcHX0HfIIKCh6gy5
 RrxhAanYIITkbfmnZawJjwVc0N1SuMyr8sUnuh/6UYPnP6m030QAj5GCqO54pua+dB
 7kZ7Q6+OLiZNRG+kq42vsezItW+OZkMy6GJmBei0lCz6uzhzyxqwuhQ2gD3jQH1DUh
 yRyTnakMgRyQ1yfrKa5fOqKgIJkK8+ToNQjRZDTKSjaa+wqDNF3z7MPbN1kp55yF+c
 C9dpQf3jF7aPA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=mhV+lBDt
Subject: Re: [Buildroot] [PATCH] package/zmqpp: unbreak indentation of
 option in menuconfig
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

On 15/02/2025 22:22, Yann E. MORIN wrote:
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Simon Dawson <spdawson@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
