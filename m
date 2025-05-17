Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD79AC3ABDA
	for <buildroot@archiver.kernel.org>; Sat, 17 May 2025 10:42:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7EE1C81E1F;
	Sat, 17 May 2025 10:42:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qxZv6FCIi8ml; Sat, 17 May 2025 10:42:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C7F6B81992
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C7F6B81992;
	Sat, 17 May 2025 10:42:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6C130223
 for <buildroot@buildroot.org>; Sat, 17 May 2025 10:42:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5234C40529
 for <buildroot@buildroot.org>; Sat, 17 May 2025 10:42:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nOMXdD3ilIZb for <buildroot@buildroot.org>;
 Sat, 17 May 2025 10:42:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3222640409
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3222640409
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3222640409
 for <buildroot@buildroot.org>; Sat, 17 May 2025 10:42:26 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 5F41E60145;
 Sat, 17 May 2025 12:42:18 +0200 (CEST)
Received: from 2a02-842a-45ac-9401-0517-4590-b867-5f74.rev.sfr.net
 (2a02:842a:45ac:9401:517:4590:b867:5f74)
 via 2a02-842a-45ac-9401-0517-4590-b867-5f74.rev.sfr.net
 (2a02:842a:45ac:9401:517:4590:b867:5f74) by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 17 May 2025 12:42:18 +0200
MIME-Version: 1.0
Date: Sat, 17 May 2025 12:42:18 +0200
From: Julien Olivain <ju.o@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, Daniel Lang <dalang@gmx.at>, Joseph Kogut
 <joseph.kogut@gmail.com>, Romain Naour <romain.naour@gmail.com>, Valentin
 Korenblit <valentinkorenblit@gmail.com>
In-Reply-To: <20250514184824.678318-1-james.hilliard1@gmail.com>
References: <20250514184824.678318-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <b0652220f2da8729b22a8d2ecb72b453@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1747478543;
 bh=nL55vpjT/L0B7gMi46WaG3JKivpSBZmhLcAkVJU6wxI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=dqVHDqoEdHpLZMjc5zZsn7wL2Q/xlJOknK7ImuMrX/ykSj0oqAvLgS2ix8sa/Yn8z
 q7mxPTI4mGU/i1629xdaiYdYBdcLTqMes0wlI8A4V8kNn3j22z9o4Lo4amfflH28za
 Fl2BSHaedKwPDZPCvRJEEhYJLnPannkVlCFWUzbFyL1O6nBtOnfJ5MtkYrrsqefK5o
 3ozQ5Rc32afQAnurDqlSIQibJ+Cd1JaVPSENbsGGEi70B3wqtpzb2id8yqXcgtP7eD
 xOxQ7DhKzaRO7uSpq9KFAxpg724Eqf9jFkDSEFy3CF1ZzvUShGhmsfm1X66BT9+hdH
 xrJvzVXQSRqQg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=dqVHDqoE
Subject: Re: [Buildroot] [PATCH 1/1] package/llvm-project: bump to version
 15.0.7
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

On 14/05/2025 20:48, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.

I also added links to release notes. See:
https://gitlab.com/buildroot.org/buildroot/-/commit/9aa966863f382e7eddd8101b42599cdd585f9ce9

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
