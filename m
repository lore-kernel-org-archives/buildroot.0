Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01916C4332F
	for <buildroot@archiver.kernel.org>; Thu, 13 Oct 2022 12:17:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5FB4B83E88;
	Thu, 13 Oct 2022 12:17:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5FB4B83E88
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id f68R60Upb2Ly; Thu, 13 Oct 2022 12:17:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 87D5083A47;
	Thu, 13 Oct 2022 12:17:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 87D5083A47
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 59CBB1BF473
 for <buildroot@lists.busybox.net>; Thu, 13 Oct 2022 12:17:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3554083A47
 for <buildroot@lists.busybox.net>; Thu, 13 Oct 2022 12:17:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3554083A47
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ejJZ5N56b5cj for <buildroot@lists.busybox.net>;
 Thu, 13 Oct 2022 12:17:32 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1217082B1B
Received: from delivery19.mailspamprotection.com
 (delivery19.mailspamprotection.com [185.56.85.137])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1217082B1B
 for <buildroot@buildroot.org>; Thu, 13 Oct 2022 12:17:31 +0000 (UTC)
Received: from 6.247.214.35.bc.googleusercontent.com ([35.214.247.6]
 helo=es87.siteground.eu)
 by se19.mailspamprotection.com with esmtps (TLSv1.2:AES128-GCM-SHA256:128)
 (Exim 4.92) (envelope-from <dimi@tpm.dev>)
 id 1oix9T-000ByA-MJ; Thu, 13 Oct 2022 07:17:30 -0500
Received: from [127.0.0.1] (port=34106 helo=es87.siteground.eu)
 by es87.siteground.eu with esmtpa (Exim 4.96)
 (envelope-from <dimi@tpm.dev>) id 1oix9R-000BlR-0t;
 Thu, 13 Oct 2022 12:17:25 +0000
MIME-Version: 1.0
Date: Thu, 13 Oct 2022 15:17:25 +0300
From: Dimi Tomov <dimi@tpm.dev>
To: buildroot@buildroot.org, Arnout Vandecappelle <arnout@mind.be>
In-Reply-To: <20221012075423.14729-1-dimi@tpm.dev>
References: <20221012075423.14729-1-dimi@tpm.dev>
Message-ID: <e73bd6d54b78f5c25a78edc765ef0488@tpm.dev>
X-Sender: dimi@tpm.dev
Organization: TPM.dev
X-Originating-IP: 35.214.247.6
X-SpamExperts-Domain: es87.siteground.eu
X-SpamExperts-Username: 35.214.247.6
X-SpamExperts-Outgoing-Class: ham
X-SpamExperts-Outgoing-Evidence: Combined (0.07)
X-Recommended-Action: accept
X-Filter-ID: Pt3MvcO5N4iKaDQ5O6lkdGlMVN6RH8bjRMzItlySaT9wIuSk2rt2hZzasoEGvUVRPUtbdvnXkggZ
 3YnVId/Y5jcf0yeVQAvfjHznO7+bT5xKipkaFeQDP2JiLCjsOSqCBHoJjdDPbdunZvlh+03gEw5s
 aSMGpTXAKBoFGAg4ZiMVbcDKoUfza6pSNgfpWY7yGJEAH+S4JNeGeFOXMCdpqk1/gzQfM88V/+BY
 6rSZm+Qj51mqR68zkucIUlh/H2o6Ac0uXzxyDVCcVc2YNWS6fVs4f1eHeuisgbW+ciS9BiAwXXOy
 eRCHfL/TfRkEbd0PjeOe89qqAPYB8KkaTUmkvIWS+2paz83GAkd5r3LUGD/gZm53zFmbMRgWQtfn
 IzQri+B4to/hiwa93rrwDLzDIxEwFSVmN4kUqROYRGFsPbMlg3oKuH0NdQMS1ZayOw1R9KGJrphS
 cNVjzoI0AFJgyaJFOBQd/+3TJrLDB1JgixqAd9sXdiOHyQc5jb5UsXBPtIMjc0HvrCoIShx9Egj+
 5dyvq1d/fG4ctwESmKna9KeaCMJrxDTPjXUK0HVTvhRvhJsTWXSMJKrCqIRucviVPtyr9Rglsxco
 ZOkyzL3iNNINimWHGM3ULAME6TarHH9wNLb6DTt4pOBdwCGfoyTJlbwqyT5p50x81ZKcmzCu2U2N
 EDLVYhQQkFJTbAzgn6pzs0BoW+zAoj3wlYkyQAvqJSmf9yNhxcrJR4bgfS2wGtjq3Xht9OeQCftb
 pWUle2yeR2XWF6vZ2wfWC27hHZWRh+cQtGmoJkZh7BLMXqoNJQEi99LkB2wJoejiNdTxxBHZtnDd
 Hw4EmQt77dULwOAayfiQ+inKmIZo/0XvFx1qM0d5DU1UWt0RFwR6QVEZyzVn08XQHNkzQoNenSkH
 w/YLso9y7ZZuUeOGm+4qk1nHR1YRFZ4oobg8BBg3Jq+ntzj0ApyAYrPiC/ntzrd2sdDl6UQ4A9yd
 qlBYa841NbfIhIrGMfqrMrNbKmCpgaycLOCigNgnZc+jgPIsBzAL4JbJSnPBpjU5XTnf1Milkk0C
 QoVRXxKF5tPxTxfD0dMN+t5ZDrmwI6Sz3pudVUlAr8ihlUzyN54lLK0b9Z/zyvaQG5ufTxQvtzPo
 sXK1HymJtQBeVoeLoyUqu6s0FY/zOXyKIk5q2/3SfzNUUfbZYhEz20ELxN0Dm6+b5joKnx+pjyIF
 BAJYVhaheNMwoI2NwAlGP4YQNDSIrDrcq8g4ZnZOtnop7EnsAWjAzC/T+LOhKV9CMS+4ayUpOtEh
 dxekWDmK9g==
X-Report-Abuse-To: spam@quarantine2.mailspamprotection.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=tpm.dev; 
 s=default; h=Subject:Cc:To:From:Date:list-help:list-unsubscribe:
 list-subscribe:list-post:list-owner:list-archive;
 bh=yyJujQX8kjW20p8A+SKc3WPjHP+m6xOxmuBcHRj+5yU=; b=qVRDIXeMKztcNFg+7Cx92Ju6wZ
 F4c/BKo6ngGv49iomXn+pvNjZ02NKY3Jce4pPWpXgFgc22ralmD8isk1AtliZDiMbUL9BCbfNkXpB
 czjiu2wHrM5l+vvb1RKPpdqlW3lpbMFK+GL54WOkmJTTcOqC+tDcAt2CSisTokdjHbjwxroCpzFUK
 znNIVXEMiRLTjjxpqFkOmL9fwKwoQWc2uWCoC4YjEKxOzZAjfUGiB7ra4lsIbgtlnS3v2nJosbGgZ
 grQlgKV+t6pk5FE5wJSSaSSiULCITLDEkHEov1SXqlZmDmMX65Nw8qVOt+SFWbxRNh9cpIfSOjCRy
 uPvthQ9g==;
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=tpm.dev header.i=@tpm.dev
 header.a=rsa-sha256 header.s=default header.b=qVRDIXeM
X-Mailman-Original-Authentication-Results: mailspamprotection.com; auth=pass
 smtp.auth=35.214.247.6@es87.siteground.eu
Subject: Re: [Buildroot] [PATCH 1/2] package/wolftpm: Update version to
 v2.6.0
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Arnout,

Please review this version bump.

Thanks,
Dimi

On 2022-10-12 10:54 AM, Dimi Tomov wrote:
> From: Dimitar Tomov <dimi@tpm.dev>
> 
> This patch series bumps the wolftpm version to the latest available and
> adds one new config option for controlling debug messages in wolftpm.
> 
> Signed-off-by: Dimitar Tomov <dimi@tpm.dev>
> ---
>  package/wolftpm/wolftpm.hash | 2 +-
>  package/wolftpm/wolftpm.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/wolftpm/wolftpm.hash 
> b/package/wolftpm/wolftpm.hash
> index d24df58eaa..e256967a01 100644
> --- a/package/wolftpm/wolftpm.hash
> +++ b/package/wolftpm/wolftpm.hash
> @@ -1,4 +1,4 @@
>  # Hash from 
> https://github.com/wolfSSL/wolfTPM/archive/refs/tags/v2.4.0.tar.gz
> -sha256
> 31d1a5f5d60af14c4d07e14a9b0667404d4801fed32afd3fc0649749020ad17b
> wolftpm-2.4.0.tar.gz
> +sha256
> 78331cc2d98339247857f5ceb3e7cd3c4f5773e3d81bf1d73e8df9446e37472b
> wolfTPM-2.6.0.tar.gz
>  # Locally calculated
>  sha256
> 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643
> LICENSE
> diff --git a/package/wolftpm/wolftpm.mk b/package/wolftpm/wolftpm.mk
> index 7e8a108585..f217322545 100644
> --- a/package/wolftpm/wolftpm.mk
> +++ b/package/wolftpm/wolftpm.mk
> @@ -4,7 +4,7 @@
>  #
> 
> ################################################################################
> 
> -WOLFTPM_VERSION = 2.4.0
> +WOLFTPM_VERSION = 2.6.0
>  WOLFTPM_SITE = $(call github,wolfSSL,wolfTPM,v$(WOLFTPM_VERSION))
>  WOLFTPM_INSTALL_STAGING = YES
>  WOLFTPM_LICENSE = GPL-2.0+

-- 
Founder of TPM.dev
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
