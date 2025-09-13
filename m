Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47FC2CAC587
	for <buildroot@archiver.kernel.org>; Sat, 13 Sep 2025 22:26:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1E87840EF3;
	Sat, 13 Sep 2025 22:26:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ANNYNzxRF5Cq; Sat, 13 Sep 2025 22:26:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4FA9E40E42
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4FA9E40E42;
	Sat, 13 Sep 2025 22:26:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 340C6117
 for <buildroot@buildroot.org>; Sat, 13 Sep 2025 22:26:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3181840373
 for <buildroot@buildroot.org>; Sat, 13 Sep 2025 22:26:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GVp4f7wNTYQk for <buildroot@buildroot.org>;
 Sat, 13 Sep 2025 22:26:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4529940058
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4529940058
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4529940058
 for <buildroot@buildroot.org>; Sat, 13 Sep 2025 22:26:50 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id C359119F54D;
 Sun, 14 Sep 2025 00:26:46 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 14 Sep 2025 00:26:46 +0200
MIME-Version: 1.0
Date: Sun, 14 Sep 2025 00:26:46 +0200
To: Romain Naour <romain.naour@smile.fr>
Cc: buildroot@buildroot.org
In-Reply-To: <20250913163458.2608400-1-romain.naour@smile.fr>
References: <20250913163458.2608400-1-romain.naour@smile.fr>
User-Agent: Webmail Free/1.6.11
Message-ID: <e718403b19f36f522fafb207d709b798@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1757802407;
 bh=Q/Q3P09ZObx+qv/deOdNEpUHq4fNoYV3pLc3anu+ZhU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=CLlcsxJpVS9rKfmNY9oxhD5rmaYwoqwf3zpWBJQ3TD0XdR8vJRrIYJtCIzpfd+P1e
 PQxpk3w1cJluVDM1RHmbrLB8frYosMOpdUAqPZjEQ1a4YpYfdK6VRBHl0HaHGAS/Gw
 DNgPIIq68rnYKx4K/saIG5sDGttqlgJubxFelCMmdJgWOTf5tIjahA20pdPDS4LTNG
 HkC/ilqrS4CGS67N6f72NE3f/X5EbdjBjoCxy0KNFGSf1HlLjivsQ2kEvycgHeiBFx
 fFwQeUctSOZStYjEmIwWdjOJh0ZgbRL8nT6XBDqNmGAJjh5zgm0Gg8/TZdmK+BChlw
 7JWxkbvRemmhQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=CLlcsxJp
Subject: Re: [Buildroot] [PATCH] package/mariadb: workaround cmake < 3.30
 check TRY_RUN issue
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

On 13/09/2025 18:34, Romain Naour via buildroot wrote:
> The last mariadb version bump [1] added -DHAVE_SYSTEM_LIBFMT_EXITCODE=0
> to workaround cross-compiling issue during libfmt cmake check.
> But it actually requies at least cmake >= 3.30 to work.
> Indeed, our docker image used by Gitlab-CI uses cmake 3.25.1 and
> segfault while testing for libfmt.
> 
>   -- Performing Test HAVE_SYSTEM_LIBFMT
>   /bin/bash: line 1: 163369 Segmentation fault
> 
>   $ cmake --version
>   cmake version 3.25.1
> 
> Using the same TestPerlDBDmysql configuration locally with
> cmake 3.30.8 installed build fine.
> 
> Looking at cmake cmTryRunCommand.cxx history from 3.30.x show that
> several fixes about cross-compiling isses were applied to cmake 3.26.x
> [2] probably solving the issue. Requires BR2_HOST_CMAKE_AT_LEAST_3_30
> for now, since only cmake 3.30.8 installed locally was tested.
> 
> Fixes:
> https://gitlab.com/buildroot.org/buildroot/-/jobs/11271124486 
> (TestPerlDBDmysql)
> https://gitlab.com/buildroot.org/buildroot/-/jobs/11271124439 
> (TestMariaDB)
> 
> [1] 6cd8f95346 ("package/mariadb: bump version to 10.11.11")
> [2] 
> https://gitlab.kitware.com/cmake/cmake/-/commits/v3.30.9/Source/cmTryRunCommand.cxx?ref_type=tags
> 
> Signed-off-by: Romain Naour <romain.naour@smile.fr>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
