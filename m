Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C0AEC3601E
	for <buildroot@archiver.kernel.org>; Sun, 13 Apr 2025 14:04:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D5C0180AD8;
	Sun, 13 Apr 2025 14:04:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WViEOMowYFYs; Sun, 13 Apr 2025 14:04:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 195A780E26
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 195A780E26;
	Sun, 13 Apr 2025 14:04:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id AFEBADE
 for <buildroot@buildroot.org>; Sun, 13 Apr 2025 14:04:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 96665404B6
 for <buildroot@buildroot.org>; Sun, 13 Apr 2025 14:04:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xIA1DoGYdZVl for <buildroot@buildroot.org>;
 Sun, 13 Apr 2025 14:04:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org AE70F409B4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AE70F409B4
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AE70F409B4
 for <buildroot@buildroot.org>; Sun, 13 Apr 2025 14:04:55 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 932155FFB4;
 Sun, 13 Apr 2025 16:04:45 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 13 Apr 2025 16:04:45 +0200
MIME-Version: 1.0
Date: Sun, 13 Apr 2025 16:04:45 +0200
From: Julien Olivain <ju.o@free.fr>
To: Vladimir Oltean <olteanv@gmail.com>
Cc: buildroot@buildroot.org, Ioana Ciornei <ciorneiioana@gmail.com>, Brandon
 Maier <Brandon.Maier@collins.com>, Vincent Jardin <vjardin@free.fr>, Romain
 Naour <romain.naour@smile.fr>, Akhilesh Nema <nemaakhilesh@gmail.com>
In-Reply-To: <20250328180427.3434693-14-olteanv@gmail.com>
References: <20250328180427.3434693-1-olteanv@gmail.com>
 <20250328180427.3434693-14-olteanv@gmail.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <b027bb6f7346983bc0f93966d04e8fd8@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1744553092;
 bh=S995PRlJW+gEWSw1CdhFILaIIKePs9CO6YYT7etD4u8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=DoHNXFwEJkjjE4Gtw6qs0N2vK6vCN4WUUwtm0aHvBQIRBfEK+mw5cg2WXlDJd5NXo
 L7auJ9haot6QnjHFTKGH5sU01HiDapt1jj7MAEcDp9MeLE04upKfCmbYqN1Eu0fd8D
 yoCI5nubc427ATKbuPArTZpAmDiwgBoLpNpNChZFc+cA+t2MY055F2GZpcbIWc3wBN
 Uff/ueYZVASxKgtVX6NZyUd09MuxPqG38UsL0boTi1VeStYwLCCtI6SXC/GnCa1FjZ
 Ufv3DPJXWX0oY9nEcW1vlaClfsDaHjjhaRJoC3IpVVd6flZdqhUccecCXpTG8jgJXT
 DXymsOOWr2qbg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=DoHNXFwE
Subject: Re: [Buildroot] [PATCH v2 13/18] package/qoriq-ddr-phy-binary: new
 package
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

On 28/03/2025 19:04, Vladimir Oltean wrote:
> The DDR PHY on the NXP LX2160A SoC needs firmware. This is distributed
> as prebuilt binaries by NXP through GitHub.
> 
> There have been discussions and other opinions on previous revisions of
> the patch on how it should be integrated:
> https://lore.kernel.org/buildroot/20250318163228.9989-1-vjardin@free.fr/
> 
> But I haven't integrated any of that feedback. It is a simple package
> which copies the pre-built FIP image containing DDR PHY firmware files
> to the images/ folder, to be used by post-image scripts.
> 
> Signed-off-by: Vladimir Oltean <olteanv@gmail.com>
> Reviewed-by: Romain Naour <romain.naour@smile.fr>
> Reviewed-by: Vincent Jardin <vjardin@free.fr>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
