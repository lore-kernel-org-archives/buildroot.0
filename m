Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EF5A606A31A
	for <buildroot@archiver.kernel.org>; Thu, 29 Oct 2026 19:25:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Ba9ORVJi
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3EC7E80F47;
	Thu, 29 Oct 2026 19:25:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id weMrwPAjdchn; Thu, 29 Oct 2026 19:25:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 3DC7580FA1
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793301905;
	b=ZjJG+Te+pCkSPdS7m7hi0tDz80KcOO3VWR02aSyFm3w73iqCu0VSb3cDs2HgycaEtDx0
	 m3VFX77MGf8hkDqLPzEhoAQee9elwesSOhs6QShdvID1bz1yyXqhpp3PD7NIoFO67MtRh
	 LrJiu7kCPihiRRHkp3TwBNLDf/D6L3Ggm1Q7eyDsWPgC3SXXZPDf9/DtwyMK8jsX1hJ8K
	 oTPzs1SKjM0es3Qw/mHJOYRS5hzmVOLAlwKXBQvkOXDNLo/ajssIQuSfG7xe0QlYaY+Tl
	 rua8u2X+3RpWHB8Exk9syzJKAlNUbQTWjgIxlICSVYOT9vvoENm/wdsGhCull8Y+OVw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793301905;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=7Du8wtGCZMYmTACash1S87oEDOBrk3cGqj+Qc6SkNIg=;
	b=nBXbncCLF4+XniD4T9hJcYW+0BedXXqGuqXQdqBonnqjGdU53PT9c43TQK9M5DqsifbZ
	 IqhDPsiO6lRNrqDb1KpBSHkBKcTI1KAc7PO2o3Z+VjVPzRKGc714Sg1BOsQqA5+3zEG8s
	 kgz7VTl2DQGoz0hQFL7mvZMVgkR307n5RX5yalj2juRjOZnPxz/TZNQY9HP73TVmbmJWK
	 qolntyTRgex0I2LXpoZJoBo04l/o+tBjNsgBc0DJCXr4mLqmOFePGfxZ2b7XSKRSZTDap
	 NT5QKjujtnFxIzvLa7gjVj8IVBV3iUgbBqD4XsQnlh4YmhnPseCY/MZTPCccewGwVUQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793301905;
	bh=7Du8wtGCZMYmTACash1S87oEDOBrk3cGqj+Qc6SkNIg=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Ba9ORVJi8VIAMpdIXxGomf6BalmaDZHHFwCX2yHZCvCL9oz4DQAiVV8QGtkL0ej3z
	 EoFiSPv/I4aZ8oA9bPnHrXBhZRIiea8QVs0cqNA9YB2BtuK3IUw4f1OEKigbYtq3mN
	 MU+u/ckGV7CACbkI/uek/M2LQD6853mrtX+1B36nFOhhuCUAQ37jpnEFLDJBqjUM4R
	 /oZ3Eg0WpcScp02BM+Fv2rJztylVIIhAIkCoiFUfjxQ7FvS3W08lehABMfibwpksCw
	 BJZ4RA4IrlEhDwEMq5+pP0d3LmRt+bY1UDg5Omb64FKTKbisXvbmI99iT/mTI5xl5B
	 kC3pq9IeNmfLQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3DC7580FA1;
	Thu, 29 Oct 2026 19:25:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id AD2381DE
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 19:25:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9F3B580FA7
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 19:25:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y3uWjQ5VmuAZ for <buildroot@buildroot.org>;
 Thu, 29 Oct 2026 19:25:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 48D3880FA1
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793301902;
 b=KKApGiI3GvMji8cJS5v5w8lwo+LDiZl7p9TOCjxA3mJM9DRyhycGmFHFA1nl1xt1hlhl
 EDsuxIcsWR6KVSS7DT6XIDBBHrWloX74uKU57pQ0mLpqv9VnkBUUpDG6Y3QCjzNvNE1/X
 x668/CQdKCGwnGu2XrQKKdKAjDgu95utZd+G6llgASTn/9CkSz881VULOgJdnEc2sg5cs
 8vfQHl7VEU3izBJvhuusCaA1gc3ZWJOHsFy3pwHXrZqUOsenpx0W8/8YpOWjddUTzPr8j
 nzj+4y9T2xnFtEnIVfgaP8uIVOaVOI417ohH6FGd6Yzl2/5QiifokPbdJtz64MwzigQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793301902;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=4l5A0gH1uD1eqsSpAP45PHYkjSfJ938I+d5VjftJpiU=;
 b=gQ7MKH5b/r1WbloJla+AS4loKJ3w726GIxb/vtvOawI0UY2+upKARO79S8OhyxeQuHSA
 2hmdNplYhPLC17uMV9Gs2lxj8np1cE89b34FKcYwJ1z3GeQ8vb7JniEe+TXfRykKVfm45
 bEg3pq+YTl6xhPhDx/0qpxPWv54PGISPkweQrtLcz/47St9yjwUgFiyvX7ynfDjBmNcPe
 hu6IReaTwntAjk7IL2olzFChHh02yoJJVA/GOIszLjzAsZlhP/uXJD09rEYNcuQwLHY6Y
 BLpq7w4L4q6Xbz3pszctivn3bqLac0OezuVcthko0ZqXL4A4k+toiYIRl2l2tOwaj+A==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=free.fr;
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=oggF060b; 
 arc=none smtp.remote-ip=212.27.42.6
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 48D3880FA1
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 19:25:01 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.4])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 61A9178034E;
 Thu, 29 Oct 2026 20:24:58 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 via
 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr with HTTP (HTTP/1.0
 POST); Thu, 29 Oct 2026 20:24:58 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Thu, 29 Oct 2026 20:24:58 +0100
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20261028173145.767705-1-giulio.benetti@benettiengineering.com>
References: <20261028173145.767705-1-giulio.benetti@benettiengineering.com>
User-Agent: Webmail Free/1.6.20
Message-ID: <82604dd7641c5e139998f9ee4a631b22@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/swugenerator: bump to version 0.8
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Giulio,

Thanks for the patch.

On 28/10/2026 18:31, Giulio Benetti wrote:
> For release notes, see:
> https://github.com/sbabic/swugenerator/releases/tag/0.7
> https://github.com/sbabic/swugenerator/releases/tag/0.8
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>  package/swugenerator/swugenerator.hash | 2 +-
>  package/swugenerator/swugenerator.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/swugenerator/swugenerator.hash 
> b/package/swugenerator/swugenerator.hash
> index 75a902f2c4..a9f9fbe8a3 100644
> --- a/package/swugenerator/swugenerator.hash
> +++ b/package/swugenerator/swugenerator.hash
> @@ -1,4 +1,4 @@
>  # Locally calculated
> -sha256  
> 06098c4b3a6c3e5946a11929f95f280baacb512fc4154e16af2262c60a36cbc6  
> swugenerator-0.6.tar.gz
> +sha256  
> 91f1b1cfee110775ab5a9e99ef20f5576f7a33bb1ed3bc467e111502355935e8  
> swugenerator-0.8.tar.gz
>  # Locally computed sha256 checksums
>  sha256  
> 3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  
> LICENSE
> diff --git a/package/swugenerator/swugenerator.mk 
> b/package/swugenerator/swugenerator.mk
> index a892002369..3fbdc1bc99 100644
> --- a/package/swugenerator/swugenerator.mk
> +++ b/package/swugenerator/swugenerator.mk
> @@ -4,7 +4,7 @@
>  #
>  
> ################################################################################
> 
> -SWUGENERATOR_VERSION = 0.6
> +SWUGENERATOR_VERSION = 0.8

With this new version, testing with the commands:

cat >.config <<EOF
BR2_PACKAGE_HOST_SWUGENERATOR=y
EOF
make olddefconfig
make host-swugenerator
output/host/bin/swugenerator

is failing with the error:

ModuleNotFoundError: No module named '_lzma'

Upstream commit
https://github.com/sbabic/swugenerator/commit/679d539c251016afc188757bffa253dad0d3eb87
added this new lzma dependency.

Maybe you need to add in Config.in.host a
select BR2_PACKAGE_HOST_PYTHON3_XZ

Could you have a look please?

If there is a simple way to test this host package, maybe adding a 
simple
host runtime test could help to detect those kind of issue in the 
future.
See for example:
https://gitlab.com/buildroot.org/buildroot/-/blob/2026.08.1/support/testing/tests/package/test_uboot_tools.py#L72

>  SWUGENERATOR_SITE = $(call 
> github,sbabic,swugenerator,$(SWUGENERATOR_VERSION))
>  SWUGENERATOR_LICENSE = GPL-3.0
>  SWUGENERATOR_LICENSE_FILES = LICENSE
> --
> 2.47.3

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
