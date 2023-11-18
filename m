Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD396C2BB3F
	for <buildroot@archiver.kernel.org>; Sat, 18 Nov 2023 15:07:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 62435404A1;
	Sat, 18 Nov 2023 15:07:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 62435404A1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kdYAqMDpjCfv; Sat, 18 Nov 2023 15:07:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2D878404B9;
	Sat, 18 Nov 2023 15:07:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2D878404B9
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id F071E1BF2F5
 for <buildroot@lists.busybox.net>; Sat, 18 Nov 2023 15:07:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D25C341846
 for <buildroot@lists.busybox.net>; Sat, 18 Nov 2023 15:07:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D25C341846
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Je4GG_LVn-5w for <buildroot@lists.busybox.net>;
 Sat, 18 Nov 2023 15:07:35 +0000 (UTC)
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B307641841
 for <buildroot@buildroot.org>; Sat, 18 Nov 2023 15:07:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B307641841
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:4173:7e62:c00c:757b])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id E636178035E;
 Sat, 18 Nov 2023 16:07:30 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 18 Nov 2023 16:07:30 +0100
Date: Sat, 18 Nov 2023 16:07:30 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20231118150730.GE996011@scaer>
References: <20231111021428.91649-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231111021428.91649-1-james.hilliard1@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1700320054;
 bh=usyg2KEHl10X6jEUUfDGJmnvvw0NLzIjI5zmZwwyLaM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Kg0MpTZFxm46C2LPvV8WheIRQrs+5mj9Y3EYqCHrFkPR2O37upYV+1eaogSD3MxBN
 PPJsPGxFe+FJctFSrEkV6651yn8hbEool39OxA3FfeE+3aeTbhm6P82o1uQ4OYau8M
 uGAqKTWkLya338oDHLqoNFLiqtKX+vAV4Fd4uqXo6I5wcPB3bvd/Zyea7sMaPX4T5f
 7ZGW/w3iOcDeAPfNlEcbocQ8eT9j12q2UI2qr+GbH2p6JruposAPQ3+HHZ2SbL8oVA
 nNderosjI5NAldZvPGIjgvic3oreGvMLoG+TQA+H4j42tlScAf+/V/J6WjuZcxYpBQ
 L2BTzfryfYXwA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Kg0MpTZF
Subject: Re: [Buildroot] [PATCH 1/1] package/python-logbook: bump to version
 1.7.0.post0
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
Cc: Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

James, All,

On 2023-11-10 19:14 -0700, James Hilliard spake thusly:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to next, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/python-logbook/python-logbook.hash | 4 ++--
>  package/python-logbook/python-logbook.mk   | 5 +++--
>  2 files changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-logbook/python-logbook.hash b/package/python-logbook/python-logbook.hash
> index d77acad76e..8761945de6 100644
> --- a/package/python-logbook/python-logbook.hash
> +++ b/package/python-logbook/python-logbook.hash
> @@ -1,5 +1,5 @@
>  # md5, sha256 from https://pypi.org/pypi/logbook/json
> -md5  719970ea22dd274797bb4328161d700f  Logbook-1.5.3.tar.gz
> -sha256  66f454ada0f56eae43066f604a222b09893f98c1adc18df169710761b8f32fe8  Logbook-1.5.3.tar.gz
> +md5  cbb7e5fb2d6325f42a323b0000127393  Logbook-1.7.0.post0.tar.gz
> +sha256  a5e8016701ca3beea6a390b0ba1541037f663543ca508ccd36cfdc841639cdd7  Logbook-1.7.0.post0.tar.gz
>  # Locally computed sha256 checksums
>  sha256  2ca266337cc6947578654ab0dd6438de4d01fa78b2e6eb554b09757df1178f98  LICENSE
> diff --git a/package/python-logbook/python-logbook.mk b/package/python-logbook/python-logbook.mk
> index 8f02e9b945..e47e78d26e 100644
> --- a/package/python-logbook/python-logbook.mk
> +++ b/package/python-logbook/python-logbook.mk
> @@ -4,11 +4,12 @@
>  #
>  ################################################################################
>  
> -PYTHON_LOGBOOK_VERSION = 1.5.3
> +PYTHON_LOGBOOK_VERSION = 1.7.0.post0
>  PYTHON_LOGBOOK_SOURCE = Logbook-$(PYTHON_LOGBOOK_VERSION).tar.gz
> -PYTHON_LOGBOOK_SITE = https://files.pythonhosted.org/packages/2f/d9/16ac346f7c0102835814cc9e5b684aaadea101560bb932a2403bd26b2320
> +PYTHON_LOGBOOK_SITE = https://files.pythonhosted.org/packages/cc/98/c1d93c1d7593f58515333a6217aa4ae647d9ee9c1aa2dfdf77b28b7bb7c7
>  PYTHON_LOGBOOK_SETUP_TYPE = setuptools
>  PYTHON_LOGBOOK_LICENSE = BSD-3-Clause
>  PYTHON_LOGBOOK_LICENSE_FILES = LICENSE
> +PYTHON_LOGBOOK_DEPENDENCIES = host-python-cython
>  
>  $(eval $(python-package))
> -- 
> 2.34.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
