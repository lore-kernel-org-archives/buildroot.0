Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93B69C369CB
	for <buildroot@archiver.kernel.org>; Wed, 23 Apr 2025 19:11:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6176061297;
	Wed, 23 Apr 2025 19:11:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9jGsnnF2Upf8; Wed, 23 Apr 2025 19:11:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8234361298
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8234361298;
	Wed, 23 Apr 2025 19:11:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 471061BC
 for <buildroot@buildroot.org>; Wed, 23 Apr 2025 19:11:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2D31480F03
 for <buildroot@buildroot.org>; Wed, 23 Apr 2025 19:11:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h2wW5P8TJ2Tw for <buildroot@buildroot.org>;
 Wed, 23 Apr 2025 19:11:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 39B9580EB5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 39B9580EB5
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 39B9580EB5
 for <buildroot@buildroot.org>; Wed, 23 Apr 2025 19:11:52 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 123887803A2;
 Wed, 23 Apr 2025 21:11:47 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 23 Apr 2025 21:11:47 +0200
MIME-Version: 1.0
Date: Wed, 23 Apr 2025 21:11:47 +0200
From: Julien Olivain <ju.o@free.fr>
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org, Joris Lijssens <joris.lijssens@gmail.com>
In-Reply-To: <20250422215249.2222735-1-thomas.perale@mind.be>
References: <20250422215249.2222735-1-thomas.perale@mind.be>
User-Agent: Webmail Free/1.6.10
Message-ID: <3aad30152eeed7812852938717f33a40@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1745435510;
 bh=5B6HS0wfXLiuDY3tYNDmhrjStK3MR2MvhxIawDYeXVs=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ordsS6st/PPBtaiockqIoXI4bDliioiGdRtRXIU1UfGYcUEiEJsYMlukcTBTUV5QN
 zzyrDLNOMzFn1AxSyOOxP40uiuyd2nzPgMbC4+zk8YMpSYt3PnytE5+sfhZDydZ+/N
 p+dS0Dz72axy9OnqNxscTD80cbSQM0VYP+YTGxW6+74xEcp05xGQf7XOx35JOiEitp
 +OgQwPSahjMoqu1qAIylMnmpfpDpmt0ItBVpE8Ws3JByVA91me4YnesyD6zfLQmRaL
 g0Tc3voQFaw+hh1yJ2jc67VhRJBPEU+QJdw6dqsAhEgRJQlj2jNK4itH+aYHcKrvru
 sB9GViAJmui0w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ordsS6st
Subject: Re: [Buildroot] [PATCH 1/1] package/libcoap: fix build for
 toolchains w/o threads
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

On 22/04/2025 23:52, Thomas Perale via buildroot wrote:
> The version bump in [1] introduced the upstream commit [2] which made
> builds using toolchain without thread support fail to build libcoap.
> 
> This patch adds an option check in the libcoap.mk file to verify
> the toolchain has thread support and passes the correct configuration
> options introduced in [2] as well.
> 
> The build can be tested with the following config.
> 
> ```
> BR2_armeb=y
> BR2_cortex_a76_a55=y
> BR2_ARM_EABI=y
> BR2_ARM_SOFT_FLOAT=y
> BR2_TOOLCHAIN_BUILDROOT_UCLIBC=y
> BR2_PTHREADS_NONE=y
> BR2_PACKAGE_LIBCOAP=y
> ```
> 
> Fixes:
> https://autobuild.buildroot.org/results/9c0/9c0b675a64fb2576bc34457043f118cffe5fe555//
> 
> [1] 4df4d1d312 package/libcoap: bump version to 4.3.5
> [2] 
> https://github.com/obgm/libcoap/commit/c69c5d5af0a30859e90756f535e2ca21cdeda0b2
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
