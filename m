Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BBB7CD37BB
	for <buildroot@archiver.kernel.org>; Sat, 16 Sep 2023 13:09:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 04FED818BE;
	Sat, 16 Sep 2023 13:09:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 04FED818BE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Bu9Bjr-CMzzE; Sat, 16 Sep 2023 13:09:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 352D38148B;
	Sat, 16 Sep 2023 13:09:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 352D38148B
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 259BD1BF4E7
 for <buildroot@lists.busybox.net>; Sat, 16 Sep 2023 13:09:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F30E440B3B
 for <buildroot@lists.busybox.net>; Sat, 16 Sep 2023 13:09:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F30E440B3B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BO48bggEzMap for <buildroot@lists.busybox.net>;
 Sat, 16 Sep 2023 13:09:37 +0000 (UTC)
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CE61940235
 for <buildroot@buildroot.org>; Sat, 16 Sep 2023 13:09:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CE61940235
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:9162:d12f:41c1:9c3])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 0B1DB2003E8;
 Sat, 16 Sep 2023 15:09:28 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 16 Sep 2023 15:09:28 +0200
Date: Sat, 16 Sep 2023 15:09:28 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Marcin Niestroj <m.niestroj@grinn-global.com>
Message-ID: <20230916130928.GA415981@scaer>
References: <20230916050022.1364264-1-m.niestroj@grinn-global.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230916050022.1364264-1-m.niestroj@grinn-global.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1694869773;
 bh=40+mCPWDEnC3DT88nrrNO5aLxh/2KavAzOkHnbJEnIk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pVuFo9SDN1F1/cVGl6a2ofzu2pYZTzHSmQNafScAKKBCBZeo0ikX3wyip4wQTCZM5
 dtC5nWL/SQjRb7GdsizYzD+bsB9rJNO7M42QZ6I7aBMU5loJVV1wL/ZX2eH+lnzSCO
 NmKvBMN8k9jNsHX5qHQaIQPiG3EKCBWn3nsSXlEwCy1EyQm+yiP5afnpAkEt182RpO
 GxDjdv7Bk95H+Nk9/6L52vienR66nCB4DAvanI7/Bay+93I6zoCn4L1MHNGUk196yl
 tjSp6EOYu/zrF8oeBisWLP6JXt9ICfI7OGgl9Z5TSDeZ8R6sOSBOwFrvsLPfmWiOSO
 XuzFNnh2P1G/Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=pVuFo9SD
Subject: Re: [Buildroot] [PATCH] package/python-dbus-next: bump to version
 2.7.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Marcin, All,

On 2023-09-16 07:00 +0200, Marcin Niestroj spake thusly:
> Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
> ---
>  package/python-dbus-fast/python-dbus-fast.hash | 4 ++--
>  package/python-dbus-fast/python-dbus-fast.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-dbus-fast/python-dbus-fast.hash b/package/python-dbus-fast/python-dbus-fast.hash
> index dce258c0f9..83382bfb29 100644
> --- a/package/python-dbus-fast/python-dbus-fast.hash
> +++ b/package/python-dbus-fast/python-dbus-fast.hash
> @@ -1,5 +1,5 @@
>  # md5, sha256 from https://pypi.org/pypi/dbus-fast/json
> -md5  1fc61ba29ed79162c651be4bae4a9dee  dbus_fast-1.86.0.tar.gz
> -sha256  ca376a360f1bc2c3d59e9edfb5e4de5be389cca37e8c92f4539176ddf755341e  dbus_fast-1.86.0.tar.gz
> +md5  810a5b08cc14e269207efa9cb651e86b  dbus_fast-2.7.0.tar.gz
> +sha256  9110c689fea4869647ebad3cd80317554c9f77e3825eed2e36f4cb9aec749761  dbus_fast-2.7.0.tar.gz
>  # Locally computed sha256 checksums
>  sha256  c37e9c75110e01d1f0c5360dc7d7776a30ac5f70d2440db214423e4b7a77a6af  LICENSE
> diff --git a/package/python-dbus-fast/python-dbus-fast.mk b/package/python-dbus-fast/python-dbus-fast.mk
> index 1456d5600d..737406c9ab 100644
> --- a/package/python-dbus-fast/python-dbus-fast.mk
> +++ b/package/python-dbus-fast/python-dbus-fast.mk
> @@ -4,9 +4,9 @@
>  #
>  ################################################################################
>  
> -PYTHON_DBUS_FAST_VERSION = 1.86.0
> +PYTHON_DBUS_FAST_VERSION = 2.7.0

Commit title references python-dbus-next, but this is s/-next/-fast/

Applied to master, thanks.

Regards,
Yann E. MORIN.

>  PYTHON_DBUS_FAST_SOURCE = dbus_fast-$(PYTHON_DBUS_FAST_VERSION).tar.gz
> -PYTHON_DBUS_FAST_SITE = https://files.pythonhosted.org/packages/08/9d/ad27f451198724d6e5b4f0435a13f2b2f839716bbcdede2ccf6d99743ec5
> +PYTHON_DBUS_FAST_SITE = https://files.pythonhosted.org/packages/e5/ba/beeaf36821f0164a208e8cbe9adbdc75ce0a6eafdebd4011912a806a4275
>  PYTHON_DBUS_FAST_SETUP_TYPE = setuptools
>  PYTHON_DBUS_FAST_LICENSE = MIT
>  PYTHON_DBUS_FAST_LICENSE_FILES = LICENSE
> -- 
> 2.42.0
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
