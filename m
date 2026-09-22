Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5E54C982F1
	for <buildroot@archiver.kernel.org>; Tue, 22 Sep 2026 09:56:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D10EF40AFC;
	Tue, 22 Sep 2026 09:56:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b_WF1Cucw_8V; Tue, 22 Sep 2026 09:56:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 91E3A40744
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790070962;
	b=ot43u9RxpFXBZsm7hKDg1k/gX5uEfCXpIFSsnZ1ZVDotf6CCKTuSB5sgf/HDN6r/RnFJ
	 z+8X00yLgFFPwSWO36QKL7KXnZj+eUI431o8l/MncdftRwLvC80/Hlq4KsYIuMVjmTP29
	 LST2u67Uzrv3Llo8fl1aO/rDwHL7Ek6go0tz25vfc+JKvpDR/T0V0MYFLCRaqoLYY2JF/
	 xhZfWBgATidnrOi1uatGHQB8ZXl/ZwYnQFa2XHlwyFtsrxuqXypBF7vUlNLv7kPPyz9P/
	 6INYwmF5hSrVymI0GsgieqmdSgpdmXUvc1SF0DpbuSk3wwr8bgFdcEMtPp+Y9OqHZvA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790070962;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:To:
	 Cc:In-Reply-To:References:User-Agent:Date:Message-ID:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=VDOVYrjJAle+P88B4UNz29CfFk8r7h9wRruJnWfq1Kc=;
	b=b6+xMsBmkvlS0dS+tZ+RU12KNuFj8s4OLx5pB/W37eLnOOo9kBoZuDS+rvrEH70dKVxL
	 1BP2Lt7EnK/dtLEDMqug6PmQNSsPZrI8n9tnBT2V3FvJgq+hoNILe4ankF1GQBiNwDK5f
	 75ktT/MRdd2VEy9tig8N6gIwM6gkJObfL4oVZv4hH6GInkfI1lrXnNYCPsZdejpvwSu00
	 ecbDNt+12IxY+yXoIE9DD2eHlTCxLbfFLOL7fl/PGyz7tTVDuYS4fRUO5d/0ad/7ne9e8
	 hQ91nAb/A/hLiphhZZZyTuqDIFrkQlOYDGFpR8o6HsTVdVye+L95dxoNKJKoAxzEgyA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790070962;
	bh=VDOVYrjJAle+P88B4UNz29CfFk8r7h9wRruJnWfq1Kc=;
	h=To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=GT+6Fn7FpSJwLjZSHk6UJwWGpqidHd3if9TROdyslyfEzpsbhtDo7J80vnfbtDp3M
	 yJ2bJU7/TwmLkunpSjWZZWIDon5mdOaOaU3Ak3TFjJgx+tAIdiTsOCeR094fZ+UNJA
	 GGJbFKXKMOg9ucPPBlye8qQSScXwtKVhSMYdHy8RddtCIzOqxE/jZvODczZDvX8OGg
	 1m+SCpdhQu8qXajX1JtN95F5eHiYqcUUDpWseZyUnex9f2Tv3zgttBCvdKIesKo+NA
	 gdY0iO1J6eXgtorGrDVP+PuTISbpjrCSIi2QrQc6NPDgfLSYM+s2JcMzOWqdkqyHOD
	 9LQhn2kMNw+RA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 91E3A40744;
	Tue, 22 Sep 2026 09:56:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2796412C
 for <buildroot@buildroot.org>; Tue, 22 Sep 2026 09:56:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1965C6068D
 for <buildroot@buildroot.org>; Tue, 22 Sep 2026 09:56:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0XfxyhXYNGkm for <buildroot@buildroot.org>;
 Tue, 22 Sep 2026 09:55:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 85BD360674
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790070959;
 b=mt8pyoe6slukC5VVw6jaJvkJVnZivcjiys6PgMbV4OfZg2X9UmJ8j9us2nVGug7a6tzJ
 ABiLl48eLSNvDEJi/gS7zyoaW8NXLvwyLz2bPootF/I2kb/ceLtLNkqyE47KNLl6/gICW
 4bnvhvYSqIDMKKwYJPQSBbKD7cZ4HpuWgbieHSRzhNA3zbPiszykmDyfLElNRc4n/Lnjp
 LorbaeULYSMmQSR6Doq1XS8mz4TSeBZF9+zbCpuXlVmHoobK4QYWmPHwLYUUPzqS+0Tkj
 sp9R5yCxXHphvn5q1pma6tZQN+zwRNUAPby2JETesl7hs44fGemFCnSDXae9RMTHtZA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790070959;
 h=Received-SPF:Received:DKIM-Signature:From:To:Cc:Subject:In-Reply-To:
 References:User-Agent:Date:Message-ID:MIME-Version:Content-Type;
 bh=kcfHkelPiDnmpai+rTpuxMXGMJxncfQZLzhR58R2YYM=;
 b=Ants8SWcIaYK3JAmtnR79s5l0FukvCUvpoq7IQ0CYi3iu+m0kTuvnAzibGwaDNknrODa
 zb8jHpoyEL6DRzNFIILCjCIL65EDdZVsu+U2y1gIbvyHfVYPFmmRigVckx99Z5tmlT7VG
 U4sdF5SAm6AFbtKmKS+gJwqJNbWvCCUQINc71BfU9nKzsRJymeYnT9If7XP+zptjQbcax
 vb0zWXSQcfhFv7E8Wr5IHfRZzzI9RnTQUn0m5Ib8hQiUMBNEtHwEZFnCiBZFVLqsL6mrc
 fhl/QT1mtnNy9HH6P3SP1pcqowDQIqP/VDc/9VAn/k8GQDb22QD0qHbQ400TWzxY1Rw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=tkos.co.il; 
 dkim=pass header.d=tkos.co.il header.i=@tkos.co.il header.a=rsa-sha256
 header.s=default header.b=Qg5StXeu; 
 arc=none smtp.remote-ip=84.110.109.230
Received-SPF: Permerror (mailfrom) identity=mailfrom; client-ip=84.110.109.230;
 helo=mail.tkos.co.il; envelope-from=baruch@tkos.co.il; receiver=<UNKNOWN> 
Received: from mail.tkos.co.il (mail.tkos.co.il [84.110.109.230])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 85BD360674
 for <buildroot@buildroot.org>; Tue, 22 Sep 2026 09:55:58 +0000 (UTC)
Received: from localhost (unknown [10.0.8.2])
 by mail.tkos.co.il (Postfix) with ESMTP id C8AD8440844;
 Tue, 22 Sep 2026 12:55:12 +0300 (IDT)
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org,  Petr Vorel <petr.vorel@gmail.com>
In-Reply-To: <20260922094913.3261554-1-giulio.benetti@benettiengineering.com>
 (Giulio Benetti's message of "Tue, 22 Sep 2026 11:49:13 +0200")
References: <20260922094913.3261554-1-giulio.benetti@benettiengineering.com>
User-Agent: mu4e 1.14.2; emacs 30.2
Date: Tue, 22 Sep 2026 12:55:53 +0300
Message-ID: <8733v1r4nq.fsf@tarshish>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/nfs-utils: bump version to 3.3.1
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
From: Baruch Siach via buildroot <buildroot@buildroot.org>
Reply-To: Baruch Siach <baruch@tkos.co.il>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Giulio,

On Tue, Sep 22 2026, Giulio Benetti wrote:
> Remove patches upstreamed in this release.
>
> Release announce:
> https://lore.kernel.org/linux-nfs/5717a803-805c-409f-a9cc-d0c33a365570@redhat.com/
>
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---

[...]

> diff --git a/package/nfs-utils/nfs-utils.mk b/package/nfs-utils/nfs-utils.mk
> index 6e0fb1a04c..3959b90cc2 100644
> --- a/package/nfs-utils/nfs-utils.mk
> +++ b/package/nfs-utils/nfs-utils.mk
> @@ -4,10 +4,10 @@
>  #
>  ################################################################################
>  
> -NFS_UTILS_VERSION = 2.9.2
> +NFS_UTILS_VERSION = 3.1.1
>  NFS_UTILS_SOURCE = nfs-utils-$(NFS_UTILS_VERSION).tar.xz
>  NFS_UTILS_SITE = https://www.kernel.org/pub/linux/utils/nfs-utils/$(NFS_UTILS_VERSION)
> -NFS_UTILS_LICENSE = GPL-2.0+
> +NFS_UTILS_LICENSE = GPL-2.0+q

This doesn't look like a valid license identifier.

baruch

>  NFS_UTILS_LICENSE_FILES = COPYING
>  NFS_UTILS_DEPENDENCIES = host-nfs-utils host-pkgconf libevent libnl libtirpc sqlite util-linux
>  NFS_UTILS_CPE_ID_VENDOR = linux-nfs

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
