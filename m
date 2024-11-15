Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28965D68BDC
	for <buildroot@archiver.kernel.org>; Fri, 15 Nov 2024 23:19:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 87C5984915;
	Fri, 15 Nov 2024 23:19:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4D4i5BEK5Rqy; Fri, 15 Nov 2024 23:19:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A3F3284916
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A3F3284916;
	Fri, 15 Nov 2024 23:19:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 86FB51EB8
 for <buildroot@buildroot.org>; Fri, 15 Nov 2024 23:19:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 71D78431A4
 for <buildroot@buildroot.org>; Fri, 15 Nov 2024 23:19:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eicVfzQEI0lG for <buildroot@buildroot.org>;
 Fri, 15 Nov 2024 23:19:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=vjardin@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4CBAC4319E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4CBAC4319E
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4CBAC4319E
 for <buildroot@buildroot.org>; Fri, 15 Nov 2024 23:18:59 +0000 (UTC)
Received: from L25025.local (unknown
 [IPv6:2a01:e0a:2af:22b0:c8e6:f99:ce4c:c68])
 (Authenticated sender: vjardin@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id B9D78B00548;
 Sat, 16 Nov 2024 00:18:55 +0100 (CET)
Date: Sat, 16 Nov 2024 00:18:55 +0100
From: Vincent Jardin <vjardin@free.fr>
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org
Message-ID: <3p3msfetc3jylca2ftxqaeyczkzu45zvlt3honpq5hhdljfs2n@hbwlt7bigm5q>
References: <20241115220215.1057916-1-ju.o@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241115220215.1057916-1-ju.o@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1731712737;
 bh=1N/e2xlhq87Yq1D3aeB8r9PVEOtlIu27D2ojumQ4UUo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WUelmclNAwREwHfViXUId1pwbB0WjfViuQXa/j27Iy37uloBjHwrkjn2iQ9UkufVD
 QQFvdk/yfeCIKkphI/P/eAvrAcgpzU5oYSThzJc/7gtQc5UKkHz5IfEbmSONYnb8lr
 SrWD/pH0LJmdU65lFvbSGqa66RhW7q9gZjvTMQzWHXiYfBojp1tk/YFSgtLOJK1GqQ
 0fMvWWGY4ob66blgSOkJOe8nhdJf6VykLmj2zuDYQgdbCe7a8gp0U9TpHNTFrC4wgu
 1eJeGg4Es+He5zlldEdCFYZr/C40TffBczBGt01OUMkoZZ7IJysk3EfV7cVxvMPhW0
 7XdIEWMnWKRKg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=WUelmclN
Subject: Re: [Buildroot] [PATCH next 1/1] Config.in: switch GNU mirrors URL
 to https
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, Nov 15, 2024 at 11:02:15PM UTC, Julien Olivain wrote:
> As explained on [1], the primary GNU mirrors URL is https.
> This commit updates BR2_GNU_MIRROR to switch to it.
> 
> [1] https://www.gnu.org/prep/ftp.html
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>

OK

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
