Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A464CCA476
	for <buildroot@archiver.kernel.org>; Tue,  7 Oct 2025 07:23:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 101D5418A1;
	Tue,  7 Oct 2025 07:23:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pHe4HVLC1uzJ; Tue,  7 Oct 2025 07:23:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 28E6041833
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 28E6041833;
	Tue,  7 Oct 2025 07:23:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id F2BFB119
 for <buildroot@buildroot.org>; Tue,  7 Oct 2025 07:23:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F04EE41437
 for <buildroot@buildroot.org>; Tue,  7 Oct 2025 07:23:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ypGoH56GKS9i for <buildroot@buildroot.org>;
 Tue,  7 Oct 2025 07:23:18 +0000 (UTC)
X-Greylist: delayed 430 seconds by postgrey-1.37 at util1.osuosl.org;
 Tue, 07 Oct 2025 07:23:17 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5E5CB413CA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5E5CB413CA
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1828:2000:679::23; helo=helium.openadk.org;
 envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
Received: from helium.openadk.org (helium.openadk.org
 [IPv6:2a00:1828:2000:679::23])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5E5CB413CA
 for <buildroot@uclibc.org>; Tue,  7 Oct 2025 07:23:17 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 0ACC531E0B92; Tue, 07 Oct 2025 09:16:03 +0200 (CEST)
Date: Tue, 7 Oct 2025 09:16:03 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@uclibc.org
Message-ID: <aOS-M2IBT-EF9hS8@waldemar-brodkorb.de>
References: <20251005180108.607235-1-bernd@kuhls.net>
 <123144d001a2c85418ec7f0c25ac45ea__32414.81567254$1759788128$gmane$org@free.fr>
 <pan$d032e$b4c1c5e8$51757159$7a37b176@ID-313208.user.individual.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <pan$d032e$b4c1c5e8$51757159$7a37b176@ID-313208.user.individual.net>
X-Operating-System: Linux 6.12.43+deb13-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1759821364; bh=ju6vDPpivtOIHBp6VwIcuRZlyMYSZTuGVk3h7pF7mO4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OPsCToG++dNkJbw/91adbTv0SCgMU6SLh2fhxV7uR34ovjoh78dCGoNlgHByRnlhe
 L3mUhSoqBEWEg3q5+RDKYExTNRrZdVLB+29XOIfuwt5PwakOvNAnJD5fAZBM2mwdU+
 VUCToI6LUjyMIybr7rzQ1nbXZCZoF8j2Xmh6V1DJi/CJ5j4eN38hm0mkrU7B3dICJp
 UQqXCDqaucZpG5EhQm3E233DAZk557mCnGcCoILw5fA5YgQOHDdbSc8l+fi4mFw7Tt
 mbc2lmLLuBAIvyu4mXuyxCvSgGrlszwg5IOc45lfkH952xyeVa8nbnkpuZmWMqX1BM
 cwiFQDfvP/sbQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256
 header.s=2022 header.b=OPsCToG+
Subject: Re: [Buildroot] [PATCH 1/1] package/php: bump version to 8.4.13
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

Hi,
Bernd Kuhls wrote,

> Am Tue, 07 Oct 2025 00:01:41 +0200 schrieb Julien Olivain via buildroot:
> 
> > This new version introduces build failures in test-pkg. See:
> > https://gitlab.com/jolivain/buildroot/-/pipelines/2084355487
> 
> Hi Julien,
> 
> the build error is caused by this upstream commit
> https://github.com/php/php-src/commit/
> ea4e8d513cdd87c8ac28cd1ae06f7e814c83ae28
> 
> which changes the detection of copy_file_range.
> 
> Both failing toolchains are uclibc-based but other uclibc defconfigs work 
> so I am unsure how to fix the problem.
> 
> The php configure check for copy_file_range with the bootlin-x86-64-uclibc 
> defconfig fails with
> 
> conftest.c:201:9: error: implicit declaration of function 
> 'copy_file_range' [-Wimplicit-function-declaration]
>   201 |   (void)copy_file_range(-1, 0, -1, 0, 0, 0);
> 
> and produces a successful build while br-arm-full-nothread has only a 
> warning, and assumes that copy_file_range is present, most likely due to 
> older gcc being used:
> 
> conftest.c:191:9: warning: implicit declaration of function 
> 'copy_file_range' [-Wimplicit-function-declaration]
>   191 |   (void)copy_file_range(-1, 0, -1, 0, 0, 0);
> 
> Is it save to assume that I can add php_cv_func_copy_file_range=no to 
> _CONF_ENV whenever uclibc is used?

Yes, I think so.
best regards
 Waldemar
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
