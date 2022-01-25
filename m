Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD7BFC433F5
	for <buildroot@archiver.kernel.org>; Tue, 25 Jan 2022 18:42:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 91CB682A28;
	Tue, 25 Jan 2022 18:42:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RrdVMsQKoZjN; Tue, 25 Jan 2022 18:42:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BE9CE81BF5;
	Tue, 25 Jan 2022 18:42:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 22BA61BF2C8
 for <buildroot@lists.busybox.net>; Tue, 25 Jan 2022 18:42:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0DEF3401A3
 for <buildroot@lists.busybox.net>; Tue, 25 Jan 2022 18:42:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Cil-INNBdSBj for <buildroot@lists.busybox.net>;
 Tue, 25 Jan 2022 18:42:16 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D899F4013B
 for <buildroot@buildroot.org>; Tue, 25 Jan 2022 18:42:15 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:40e2:478e:9a26:9cef])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 68E285FFA9;
 Tue, 25 Jan 2022 19:42:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1643136132;
 bh=9srpT37xiMrqyV48TyloOTQhMPW7aPNP39Ux3QKRTaw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=s/1tanocw9hYTCYk4ggDUnuDo5P6Bw9Ku69UJgySDPTE87eft4qkwQrFKBD3rukAn
 M43n0Wz1cQ8PkQsxnOtYrMlTzj3oL9u32zrz4teHzhIS7JEM9J7MPw2LWxKwTNFSRA
 nvpLPP6IF24oJ72i6AHrZTjqBCqUSvA5BBa4Yoa+edptffVum71HEaPydkV9Wwqlj+
 csxFxdKJk42TCpOLPXkJesHcj2MkbXhjNUojoyipcbtRh6SQxLvnYH0OK5MYG5lOJZ
 +4Cikj850jpKT5wTXrbTLa9KWkHzBL60nqL5Z6w27OFyhrf8wbp5UGbuxrBRpVNNHy
 i6/e2dnlXf1bg==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 25 Jan 2022 19:42:09 +0100
Date: Tue, 25 Jan 2022 19:42:09 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220125184209.GF457876@scaer>
References: <20220123220731.787537-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220123220731.787537-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/python-pytz: bump to version
 2021.3
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

Fabrice, All,

On 2022-01-23 23:07 +0100, Fabrice Fontaine spake thusly:
> - Update hash of LICENSE.txt (year updated)
> - Update indentation in hash file (two spaces)
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

This, and the three followimng python updates, applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/python-pytz/python-pytz.hash | 6 +++---
>  package/python-pytz/python-pytz.mk   | 4 ++--
>  2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/package/python-pytz/python-pytz.hash b/package/python-pytz/python-pytz.hash
> index d1ce81e590..e0f253902c 100644
> --- a/package/python-pytz/python-pytz.hash
> +++ b/package/python-pytz/python-pytz.hash
> @@ -1,5 +1,5 @@
>  # md5, sha256 from https://pypi.org/pypi/pytz/json
> -md5	c3d84a465fc56a4edd52cca8873ac0df  pytz-2019.3.tar.gz
> -sha256	b02c06db6cf09c12dd25137e563b31700d3b80fcc4ad23abb7a315f2789819be  pytz-2019.3.tar.gz
> +md5  d7b7060bbac4970afa2050c139c9fcb6  pytz-2021.3.tar.gz
> +sha256  acad2d8b20a1af07d4e4c9d2e9285c5ed9104354062f275f3fcd88dcef4f1326  pytz-2021.3.tar.gz
>  # Locally computed sha256 checksums
> -sha256	39f07c72a1bfda349cbd27bac9bcb1e6f8c5b4e5cc3fadf56900406e8cc0b792  LICENSE.txt
> +sha256  be8b1a37ebe26c592a90f6c0eb33103a7f383ce2f4d7498c0af9a526990a07b8  LICENSE.txt
> diff --git a/package/python-pytz/python-pytz.mk b/package/python-pytz/python-pytz.mk
> index 888f3c4556..d606750699 100644
> --- a/package/python-pytz/python-pytz.mk
> +++ b/package/python-pytz/python-pytz.mk
> @@ -4,9 +4,9 @@
>  #
>  ################################################################################
>  
> -PYTHON_PYTZ_VERSION = 2019.3
> +PYTHON_PYTZ_VERSION = 2021.3
>  PYTHON_PYTZ_SOURCE = pytz-$(PYTHON_PYTZ_VERSION).tar.gz
> -PYTHON_PYTZ_SITE = https://files.pythonhosted.org/packages/82/c3/534ddba230bd4fbbd3b7a3d35f3341d014cca213f369a9940925e7e5f691
> +PYTHON_PYTZ_SITE = https://files.pythonhosted.org/packages/e3/8e/1cde9d002f48a940b9d9d38820aaf444b229450c0854bdf15305ce4a3d1a
>  PYTHON_PYTZ_SETUP_TYPE = setuptools
>  PYTHON_PYTZ_LICENSE = MIT
>  PYTHON_PYTZ_LICENSE_FILES = LICENSE.txt
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
