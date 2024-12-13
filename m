Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F9C9E7717F
	for <buildroot@archiver.kernel.org>; Fri, 13 Dec 2024 22:19:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3037A403E0;
	Fri, 13 Dec 2024 22:19:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hCkiOzz-cFZx; Fri, 13 Dec 2024 22:19:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 023B44146F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 023B44146F;
	Fri, 13 Dec 2024 22:19:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 30685ECD
 for <buildroot@buildroot.org>; Fri, 13 Dec 2024 22:19:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 11088400D3
 for <buildroot@buildroot.org>; Fri, 13 Dec 2024 22:19:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Seqkm5RR9ng3 for <buildroot@buildroot.org>;
 Fri, 13 Dec 2024 22:19:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D340D400DC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D340D400DC
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D340D400DC
 for <buildroot@buildroot.org>; Fri, 13 Dec 2024 22:19:28 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 33FA378034E;
 Fri, 13 Dec 2024 23:19:22 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:52456])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 13 Dec 2024 23:19:22 +0100
MIME-Version: 1.0
Date: Fri, 13 Dec 2024 23:19:22 +0100
From: Julien Olivain <ju.o@free.fr>
To: yegorslists@googlemail.com
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20241213074031.2674579-1-yegorslists@googlemail.com>
References: <20241213074031.2674579-1-yegorslists@googlemail.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <bc1ed0f3a1ff36c2fd81ac95773d0de4@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1734128365;
 bh=sc3TB0SZtna49i9NvX1leQBNsbZ6CU0/dWkmhAN0Ek8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=PEcV85vcP90PxbCD8t2Koxcllk7u76Lq2h9y7vw1myxwJkKegDCWxjH5L+Dsl49hn
 VtSNx7Xq/XLyv5SLnqlHfgG2mK5eyTpNlE9AoKXNUXqLJ/hPjc/bUpDkAAiOgu0mJP
 Kfx2pIqC2Gnazrw9XGr7IQ5b8BNJoRA6SjalF77HjII9lVlesy2ZXO9YproUvSY9R3
 ofhETEMLHLldGNMWRNdicvNwd2hHem8V8iVm2Vz8YFgHkPLpk//aCE2Qqe8liJy8eo
 KjxT18FHa/JSNSjJuafoUBszJ6Tq2xFibfWLfnv20j8Hv72O9Y+KzYdl28c/QmP7rH
 FSYC8DrH/uu3g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=PEcV85vc
Subject: Re: [Buildroot] [PATCH 1/3] package/python-semver: enable host
 variant
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

On 13/12/2024 08:40, yegorslists--- via buildroot wrote:
> From: Yegor Yefremov <yegorslists@googlemail.com>
> 
> The host variant is required to build the python-changelog-chug
> package.
> 
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>

Series applied to master, thanks.

> ---
>  package/python-semver/python-semver.mk | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/python-semver/python-semver.mk 
> b/package/python-semver/python-semver.mk
> index 29d7ba46b1..65faa8a851 100644
> --- a/package/python-semver/python-semver.mk
> +++ b/package/python-semver/python-semver.mk
> @@ -11,5 +11,7 @@ PYTHON_SEMVER_SETUP_TYPE = setuptools
>  PYTHON_SEMVER_LICENSE = BSD-3-Clause
>  PYTHON_SEMVER_LICENSE_FILES = LICENSE.txt
>  PYTHON_SEMVER_DEPENDENCIES = host-python-setuptools-scm
> +HOST_PYTHON_SEMVER_DEPENDENCIES = host-python-setuptools-scm
> 
>  $(eval $(python-package))
> +$(eval $(host-python-package))
> --
> 2.34.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
