Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F787CD4F21
	for <buildroot@archiver.kernel.org>; Wed, 13 May 2026 00:29:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CDF93411BB;
	Wed, 13 May 2026 00:29:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lDBih41DYVhw; Wed, 13 May 2026 00:29:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A660841199
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778632183;
	bh=LV+DgJah91Ub61YEs8+vuYNMgz4UlX50+Yv2an+QPLA=;
	h=Date:From:To:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=E0MXa9HP6pJOjfIVKzHqBJAVnNy7lJveVDe2h3HPMMgodzox9/WjwtLw+LaH4CD2m
	 I0xou4LoB6ktjlOH6NzPjD65F4k1P/CxWJnTAXYzfCpxdBpiO8rRQgY1is+NMH4SEf
	 JeWqdhPHIhy8P29Xnpc75umOnnZvxOMHebMhahs01ooyV24CeUPiF1+iKSQ5JxTHVu
	 aWD32n+GDds9LB/IlxMaWQWU5c4ui96XOFWPQuJ9MDOVgSJsqNvyFkBfZ3nsIR3bx3
	 ZZbYMeX2L17TWHD1bUuWAf2qUYIHoSZLS4Qz9ggmkL2lU66vtpaJofPLv0Ngc9y6SH
	 ujYxZIR8NQPtQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A660841199;
	Wed, 13 May 2026 00:29:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 31664223
 for <buildroot@buildroot.org>; Wed, 13 May 2026 00:29:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 22B4783487
 for <buildroot@buildroot.org>; Wed, 13 May 2026 00:29:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aY1NbsboPt9C for <buildroot@buildroot.org>;
 Wed, 13 May 2026 00:29:41 +0000 (UTC)
X-Greylist: delayed 904 seconds by postgrey-1.37 at util1.osuosl.org;
 Wed, 13 May 2026 00:29:41 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5063D83459
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5063D83459
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=136.143.188.15;
 helo=sender4-op-o15.zoho.com; envelope-from=dev@matt-silva.com;
 receiver=<UNKNOWN> 
Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com
 [136.143.188.15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5063D83459
 for <buildroot@buildroot.org>; Wed, 13 May 2026 00:29:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1778631273; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=mbikez5BIGd8yoKHT4VHALgfwccQueVJTyb8WZUSLIQ8sptKvCD6DGzq/lFknvbpecNG2fmusoklHBarNuRZLW10Z/xLdrtq4BeQ3lhNL5ZWBdfIq36LyDHu1bDmDutgaILx9+iFbGmkZFKsGZV6oqVm5n/74X8FyQkgFIbuwrM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1778631273;
 h=Content-Type:Content-Transfer-Encoding:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To:Cc;
 bh=RIS5LBkcE/8Rl14WSb+09pk+sTPJhm5lRAJeypJcyo0=; 
 b=ZgHvWPfqqgWP9n3EZqbhIstUTVxyTEAFhQENmAQwez7Wy5LYbA5wYDVKHsUSTvOo2Z/Af0mvKDvReuVgwdCnMZr9/sDD1eGXWVI1L7Lt4GSs9vigf5/AOezh1c8CeMTrkAcPwHoao11KpBFimOz7cpm+Tsp+VHa5Ql4+lm/34n0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=matt-silva.com;
 spf=pass  smtp.mailfrom=dev@matt-silva.com;
 dmarc=pass header.from=<dev@matt-silva.com>
Received: by mx.zohomail.com with SMTPS id 1778631270175427.0669796235742;
 Tue, 12 May 2026 17:14:30 -0700 (PDT)
Mime-Version: 1.0
Date: Tue, 12 May 2026 20:14:29 -0400
Message-Id: <DIH45X0P1THJ.GDBXVFRNLCOA@matt-silva.com>
From: "Matthew Silva" <dev@matt-silva.com>
To: "Dowan GULLIENT" <dowan.gullient@smile.fr>, <buildroot@buildroot.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <CAARUF11ZKthafBn=mLswxnFp==oK=KJXD0PCmqj=JoP8FCbYrw@mail.gmail.com>
In-Reply-To: <CAARUF11ZKthafBn=mLswxnFp==oK=KJXD0PCmqj=JoP8FCbYrw@mail.gmail.com>
X-ZohoMailClient: External
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; t=1778631273; 
 s=zoho; d=matt-silva.com; i=dev@matt-silva.com;
 h=Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Date:Message-Id:Message-Id:Subject:Subject:From:From:To:To:References:In-Reply-To:Reply-To:Cc;
 bh=RIS5LBkcE/8Rl14WSb+09pk+sTPJhm5lRAJeypJcyo0=;
 b=i0MsbVuREwVBKEIV8hn6HilvaxWRDVD/Ij+4lGyqhyJD2Gxh7bk2Svlxbgqt7oKU
 qcInhpQyH+W+Wsu0jvHFVTQGIiAY0ya38yA7HNPsYZzxKggrqRa5yVmv4YQMzfOMQ09
 rE7xyjx0L7qgHtG3fyNrY6TCO8EL+iU6fBTM0P4Y=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=matt-silva.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=matt-silva.com header.i=dev@matt-silva.com
 header.a=rsa-sha256 header.s=zoho header.b=i0MsbVuR
Subject: Re: [Buildroot] [PATCH 1/1] package/partclone: new package
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

Hi Dowan.

Thank you for taking the time to review this, and I appreciate your
patience with my beginner mistakes. Going through to correct the issues
you pointed out has clarified a lot of things for me; I've learned quite
a bit from the experience.

I have addressed all your comments except for number 5. I am
investigating the different ssl providers and then will submit a v2.

A couple quick follow up questions if you don't mind answering:

On Thu Mar 19, 2026 at 6:05 AM EDT, Dowan GULLIENT wrote:
> 1. Architecture dependency:
> The build fails on no-MMU platforms (like ARMv7-M) because partclone
> depends  on util-linux (libuuid) which requires pthread_atfork, which is
> unavailable there.
> Please add "depends on BR2_USE_MMU" in Config.in.

It appears that in util-linux/Config.in, neither the base util-linux
Kconfig option, nor the util-linux libuuid Kconfig option specify a
depends on BR2_USE_MMU. Is there something I am missing something here,
or is this a bug with the Config.in for util-linux? If so, I'll happily
send in a patch.

> 3. Verify the dependency propagation :
> Kconfig does not support propagation of dependances, so in config.in you
> might have to add "depends on ..." to all the dependencies that require it,
> here is few examples but I did not verified all of them :
> Complete
> "   select BR2_PACKAGE_NTFS_3G"
> with
> "   depends on BR2_USE_WCHAR
>     depends on BR2_TOOLCHAIN_HAS_THREADS
>     depends on BR2_USE_MMU
>     depends on !BR2_STATIC_LIBS
>     select BR2_PACKAGE_NTFS_3G"
>
> and modify
> "   depends on BR2_PACKAGE_XFSPROGS"
> with
> "   depends on BR2_PACKAGE_LIBURCU_ARCH_SUPPORTS # xfsprogs
>     depends on BR2_USE_MMU # xfsprogs
>     depends on BR2_TOOLCHAIN_HAS_THREADS # xfsprogs
>     depends on BR2_INSTALL_LIBSTDCPP # xfsprogs
>     depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_9 # xfsprogs
>     select BR2_PACKAGE_XFSPROGS"
>
> That way you will not break the package if you select those features and
> the user only have to select one option.

Is there a reason you didn't mark the NTFS_3G depends with comments like
you did in the XFSPROGS? Right now in my adjustments I have included the
comments for both.

Additionally, I've added Kconfig comments indicating the toolchain
dependencies as mentioned in the docs.

> With these changes, the package passes all 6 toolchains in test-pkg.
> Once you send a v2, I'll be happy to provide my "Tested-by" tag.

I'm curious as to how this works. I see that it is appended to the
commit message. Is this something added by me, you, or the maintainer
who accepts the patch?
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
