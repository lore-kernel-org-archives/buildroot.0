Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF1E6C433F5
	for <buildroot@archiver.kernel.org>; Sat,  1 Oct 2022 20:34:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3191960F79;
	Sat,  1 Oct 2022 20:34:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3191960F79
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7nZQ2QI6LqBV; Sat,  1 Oct 2022 20:34:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 362DF60F68;
	Sat,  1 Oct 2022 20:34:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 362DF60F68
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B65EE1BF330
 for <buildroot@lists.busybox.net>; Sat,  1 Oct 2022 20:34:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9233760F68
 for <buildroot@lists.busybox.net>; Sat,  1 Oct 2022 20:34:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9233760F68
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kOFD6tqun2GY for <buildroot@lists.busybox.net>;
 Sat,  1 Oct 2022 20:34:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6CC2060ECA
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6CC2060ECA
 for <buildroot@buildroot.org>; Sat,  1 Oct 2022 20:34:14 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:9961:1217:61e8:73cc])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 6E24C780304;
 Sat,  1 Oct 2022 22:34:08 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 01 Oct 2022 22:34:08 +0200
Date: Sat, 1 Oct 2022 22:34:08 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20221001203408.GU30794@scaer>
References: <20220927081045.1059596-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220927081045.1059596-1-james.hilliard1@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1664656451;
 bh=Ueekq4LG5BfT0KCIoyT/4RPgC/GIvBVguY3xxD4WrV0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ckHrgJmOlCfMm7wbyrzKSKyMaq3QfGE3G2Fzk291Aja04yzsTJKc3UlpfNzTqhcs8
 ZQXo+5QndSvureauzx823Wix9OjuiOM3l1znxtDm/sP/6nwCVJmEibXH7qMb/kZw6k
 +hqieHaMWsnaEA5K6cPtSGvs34tfoXZELCKxYU0/kkc8A+ZktJJdnuoXDWZITSUmUn
 siouBEp9xg2aCm7YPVmT3GJmbrvYs9l4d5z7YfwgHwaNxXzsfDa4dDCSluQ7dqQsOZ
 B25gtybCjmDfL5FjN0aDTk+K4nd/x9lFI6u8QSuPmyX+FDBK6F+6D4LQACn5KPceB+
 ULeevnKrbI4LQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ckHrgJmO
Subject: Re: [Buildroot] [PATCH 1/1] package/python-maturin: bump to version
 0.13.5
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

On 2022-09-27 02:10 -0600, James Hilliard spake thusly:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/python-maturin/python-maturin.hash | 2 +-
>  package/python-maturin/python-maturin.mk   | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/python-maturin/python-maturin.hash b/package/python-maturin/python-maturin.hash
> index 7babd70111..e2de1123ac 100644
> --- a/package/python-maturin/python-maturin.hash
> +++ b/package/python-maturin/python-maturin.hash
> @@ -1,5 +1,5 @@
>  # Locally calculated after vendoring
> -sha256  33f7cc8cd0a05bdd577afda1482e6bd5e33ad881366b1e9333625e063852cdd7  maturin-0.13.3.tar.gz
> +sha256  c3c80ea7c10817c5fa1862c15ffae85c00db96d33b2b9f8088abe0024b983d84  maturin-0.13.5.tar.gz
>  # Locally computed sha256 checksums
>  sha256  a60eea817514531668d7e00765731449fe14d059d3249e0bc93b36de45f759f2  license-apache
>  sha256  ea7882c559733766ad08343bde1d1ec80a4967c03a738fb8e0058ef6289f7b7c  license-mit
> diff --git a/package/python-maturin/python-maturin.mk b/package/python-maturin/python-maturin.mk
> index b239f282ba..f67f0ef562 100644
> --- a/package/python-maturin/python-maturin.mk
> +++ b/package/python-maturin/python-maturin.mk
> @@ -4,9 +4,9 @@
>  #
>  ################################################################################
>  
> -PYTHON_MATURIN_VERSION = 0.13.3
> +PYTHON_MATURIN_VERSION = 0.13.5
>  PYTHON_MATURIN_SOURCE = maturin-$(PYTHON_MATURIN_VERSION).tar.gz
> -PYTHON_MATURIN_SITE = https://files.pythonhosted.org/packages/f2/5c/af29a40fde2c8fea1e34e79a5d43e2a4278a685c1c9039c107444f9312d9
> +PYTHON_MATURIN_SITE = https://files.pythonhosted.org/packages/02/02/0bc5e44bc6f0a1ec21bd1b32d7d0ff6035a72858823ef394a95ac66327b7
>  PYTHON_MATURIN_SETUP_TYPE = setuptools
>  PYTHON_MATURIN_LICENSE = Apache-2.0 or MIT
>  PYTHON_MATURIN_LICENSE_FILES = license-apache license-mit
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
