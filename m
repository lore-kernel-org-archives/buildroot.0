Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF1A7CA1017
	for <buildroot@archiver.kernel.org>; Sun,  7 Sep 2025 16:43:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AAA3C421E6;
	Sun,  7 Sep 2025 16:43:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ld9aaQq61_Rq; Sun,  7 Sep 2025 16:43:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C6559421B6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C6559421B6;
	Sun,  7 Sep 2025 16:43:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9D98F9E4
 for <buildroot@buildroot.org>; Sun,  7 Sep 2025 16:43:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 80E5B421B6
 for <buildroot@buildroot.org>; Sun,  7 Sep 2025 16:43:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3_kLC9ilIa9Z for <buildroot@buildroot.org>;
 Sun,  7 Sep 2025 16:43:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7799241A48
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7799241A48
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7799241A48
 for <buildroot@buildroot.org>; Sun,  7 Sep 2025 16:43:23 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 9CFD413F86A;
 Sun,  7 Sep 2025 18:43:17 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 07 Sep 2025 18:43:17 +0200
MIME-Version: 1.0
Date: Sun, 07 Sep 2025 18:43:17 +0200
To: Arnout Vandecappelle <arnout@rnout.be>
Cc: buildroot@buildroot.org, Vincent Fazio <vfazio@xes-inc.com>, James
 Hilliard <james.hilliard1@gmail.com>
In-Reply-To: <20250829092055.518106-1-arnout@rnout.be>
References: <20250829092055.518106-1-arnout@rnout.be>
User-Agent: Webmail Free/1.6.11
Message-ID: <0d35c05506c5e0b88d8017d179420e4f@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1757263401;
 bh=UgQxwbfahDJIaPLYLr0Oxtu1UW4jHZpOH/EXpoeLUQo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=fbYgrSs6Qt5DrAJ/lMEj8lmrPCe2h0ZH2hdopW86a3KIc+/oRg+CROVHjhJ+PinDm
 TppvGdCQODSTACI82FKW9ZqmfgRvmCLfqzuUf45aeQEuPgZZjG0iIQkMyEM8MUYnX3
 k26ja8Fcr1cdYXg3/ujwfXD7XvCZDeBdq8FptX6m0nG4pJZz0Z7peImJkI6MCLLVhS
 TqHc+OB9tGrKkr1mi8NxNr8BPZLm+9U/9Z2gfL2VIBjWikM0TGwW8TxuNKctEiPWI1
 m1FcbbPnjElxmOULNVgsBEtAjbdX3n0If7cYZykSs5x6xu6ktoZdYQ8VayEOK11yjw
 xvFqRkbguBvtQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=fbYgrSs6
Subject: Re: [Buildroot] [PATCH v2] package/python3: do build-time detection
 of non-working toolchain
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

On 29/08/2025 11:20, Arnout Vandecappelle via buildroot wrote:
> Since the bump to Python 3.13.2 in commit
> d63e207eb869063f82c867658676c2903beb08cb, there is a runtime assertion
> in Python when the toolchain doesn't support time64 [1]. The only such
> toolchain is one with uClibc and linux headers < 5.1.
> 
> Encoding this dependency in Config.in was deemed to complicated (cfr.
> commit ffd00280315e60908d0d317b1dfb4c714590a03e).
> 
> Instead, do a build-time check of the same condition. The check itself
> is a bit complicated, but it is localized to python3.mk and doesn't 
> need
> to be propagated to all reverse dependencies.
> 
> Testing such a corner case toolchain is a bit complicated. It can be
> done with the following configuration.
> 
> BR2_arm=y
> BR2_cortex_a9=y
> BR2_ARM_ENABLE_VFP=y
> BR2_TOOLCHAIN_EXTERNAL=y
> BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
> BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
> BR2_TOOLCHAIN_EXTERNAL_URL="http://toolchains.bootlin.com/downloads/releases/toolchains/armv7-eabihf/tarballs/armv7-eabihf--uclibc--stable-2018.02-1.tar.bz2"
> BR2_TOOLCHAIN_EXTERNAL_GCC_6=y
> BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_1=y
> BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
> BR2_TOOLCHAIN_EXTERNAL_CXX=y
> BR2_PACKAGE_PYTHON3=y
> 
> It needs to be built in an environment that has libmpfr.so.4 installed
> as the pre-built toolchain from that era did not include it. An easy
> way to achieve this is to build this configuration under an old
> Buildroot Docker container:
> 
> IMAGE=buildroot/base:20180205.0730 ./utils/docker-run make python3
> 
> With a build-time check, the autobuilders could get build failures when
> generating such a config. However, the autobuilders cannot use a
> toolchain with this configuration (they only use more recent
> toolchains). Therefore, no update to genrandconfig is needed.
> 
> [1] 
> https://gitlab.com/buildroot.org/buildroot/-/issues/95#note_2348479811
> 
> Cc: Vincent Fazio <vfazio@xes-inc.com>
> Cc: James Hilliard <james.hilliard1@gmail.com>
> Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
