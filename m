Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BAF8C5472D
	for <buildroot@archiver.kernel.org>; Wed, 28 Aug 2024 07:01:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3D42D40AE7;
	Wed, 28 Aug 2024 07:01:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Hm4Vb4qttlkQ; Wed, 28 Aug 2024 07:01:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1903D40568
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1903D40568;
	Wed, 28 Aug 2024 07:01:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8E40E1BF868
 for <buildroot@lists.busybox.net>; Wed, 28 Aug 2024 07:01:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7A80E40568
 for <buildroot@lists.busybox.net>; Wed, 28 Aug 2024 07:01:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YcoZkbP2Y__p for <buildroot@lists.busybox.net>;
 Wed, 28 Aug 2024 07:01:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1828:2000:679::23; helo=helium.openadk.org;
 envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 84DAA40492
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 84DAA40492
Received: from helium.openadk.org (helium.openadk.org
 [IPv6:2a00:1828:2000:679::23])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 84DAA40492
 for <buildroot@buildroot.org>; Wed, 28 Aug 2024 07:01:39 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 36F21352142F; Wed, 28 Aug 2024 09:01:36 +0200 (CEST)
Date: Wed, 28 Aug 2024 09:01:36 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: Peter Korsgaard <peter@korsgaard.com>
Message-ID: <Zs7LUF4x+O8+Z1ud@waldemar-brodkorb.de>
References: <ZsYt+jha8qZGaSEB@waldemar-brodkorb.de>
 <87bk1e9okv.fsf@dell.be.48ers.dk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87bk1e9okv.fsf@dell.be.48ers.dk>
X-Operating-System: Linux 5.10.0-31-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1724828496; bh=4fbn2wbZalG+9CHwR6XHjnuV99a/3dbhZHZRl9UQUgM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kT6Sc1GveoiJTfslPYG5EKRjeote7lkbxXWPFFKcvFNsmt52yo26JubYwelRAGIlh
 aglax0HmgcDDQSLYzBXbGPSEEsXa5R+jVrBubfp7MOk3JJMmPl4ZbA2cmhgPInUu4C
 0OP7ltbsGNHsswQH9zBFimsEjWynQ+1ahBjmSSzA8rqEKC2Cpc2cJofSLPFu5Res1N
 eWRKJEvA2clteJwPB4uXDD+y7P4L7HX0W+o0Smpabjdfc07Rr205yruLyto2Lci6i/
 CiVKX76sYTC4ByrKNws4VY/verFmBuEPsgt6P9oWy9ykJB1bocS8H6s7zPxrUWBo64
 IZmwvC/Uln+6w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256
 header.s=2022 header.b=kT6Sc1Gv
Subject: Re: [Buildroot] [PATCH] package/zabbix: fixup download URL
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: skif@skif-web.ru, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Peter, all,
Peter Korsgaard wrote,

> >>>>> "Waldemar" == Waldemar Brodkorb <wbx@openadk.org> writes:
> 
>  > Fixes:
>  >  http://autobuild.buildroot.org/results/9ff/9ffb4a9e3b2291498d0ccf3c9124bebc466860bc
> 
> Committed after extending the commit message to mention that 6.2.x is
> EOL, thanks.
> 
> Do you use Zabbix? Given that 6.2.x was EOL'ed more than 1 year ago (and
> 6.2.8 / 6.2.9 have fixes mentioning security issues) it sounds like it
> is pretty unmaintained in Buildroot.

It looks like.
May be I adopt the package.

> We should move to the recently released 7.0.x series or alternatively
> drop the package.
> 
> https://www.zabbix.com/life_cycle_and_release_policy

I am working on it. I had some hard time to start the zabbix-server
with systemd, but I am now optimistic. I want to test the webui now,
before sending the update.

best regards
 Waldemar
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
