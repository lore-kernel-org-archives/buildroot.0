Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1417AC433EF
	for <buildroot@archiver.kernel.org>; Tue,  3 May 2022 19:25:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AE060402D2;
	Tue,  3 May 2022 19:25:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Om3-lYG6xQqX; Tue,  3 May 2022 19:25:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4CAFE4027E;
	Tue,  3 May 2022 19:25:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 114081BF33A
 for <buildroot@lists.busybox.net>; Tue,  3 May 2022 19:25:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0D1064027E
 for <buildroot@lists.busybox.net>; Tue,  3 May 2022 19:25:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cZ52pQ7zHTeS for <buildroot@lists.busybox.net>;
 Tue,  3 May 2022 19:25:20 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7DFC04027C
 for <buildroot@buildroot.org>; Tue,  3 May 2022 19:25:20 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:e1bf:f1f7:9c5a:c735])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 6E13219F5AF;
 Tue,  3 May 2022 21:25:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1651605918;
 bh=etkVncPsX64xI0YCQoWEPtVuiCvcP7mN+MLV3OK9Jj4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZhQd4APjlB5kLYwDyfCp6ItwKokUrchXsNQLa1OzKhJiv1gwuZ+4/x5UoheHEgxPn
 h5H4KBkiWj3EVc70lx85Zc/b/xSfHGL0MBE0/Gkosv5Zw0OeEqa6lW3EF7L2qx6NvG
 EIHKMtnQ9ubIvXULGN5T9GGjKx7yBPPP2hRgXN5nsyvc//2oYRecQmqoTsjlRkfTT8
 d2REWdBYGYDcw//Dabp3GvE99j/fFWPmsfHijHlZFiY+x9cLmtC79iNJpXYKAZ7qJK
 fmwG0OoOrcFwixGbxch36QV5OqRGQ26M+AYPwsXv/yNHXaOmrGWARfIZEGH/NfrlAD
 KJ7lQk/Yr5r5Q==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 03 May 2022 21:25:15 +0200
Date: Tue, 3 May 2022 21:25:15 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20220503192515.GC2575@scaer>
References: <20220503185958.7939-1-ju.o@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220503185958.7939-1-ju.o@free.fr>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/eigen: bump to version 3.4.0
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
Cc: Matt Weber <matthew.weber@collins.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Julien, All,

On 2022-05-03 20:59 +0200, Julien Olivain spake thusly:
> For change log since 3.3.7:
> - https://eigen.tuxfamily.org/index.php?title=ChangeLog#Eigen_3.3.8
> - https://eigen.tuxfamily.org/index.php?title=ChangeLog#Eigen_3.3.9
> - https://eigen.tuxfamily.org/index.php?title=ChangeLog#Eigen_3.4.0
> 
> This commit slightly change the logic defining CMAKE_Fortran_COMPILER in
> CONF_OPTS to set it only if BR2_TOOLCHAIN_HAS_FORTRAN=y. This is because
> eigen cmake file fails if CMAKE_Fortran_COMPILER is set to a
> non-existing fortran compiler.
> 
> Note: COPYING.BSD hash changed due to the addition of a new-line at the
> end of the file. The content of the file did not changed.

Thanks for the heads-up.

> Signed-off-by: Julien Olivain <ju.o@free.fr>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
> Tested with:
> 
>     make check-package
>     ...
>     0 warnings generated
> 
>     ./utils/test-pkg -a -p eigen
>     ...
>     45 builds, 2 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed
> ---
>  package/eigen/eigen.hash | 4 ++--
>  package/eigen/eigen.mk   | 9 ++++++---
>  2 files changed, 8 insertions(+), 5 deletions(-)
> 
> diff --git a/package/eigen/eigen.hash b/package/eigen/eigen.hash
> index 5ec561ad10..ad7d6da9dc 100644
> --- a/package/eigen/eigen.hash
> +++ b/package/eigen/eigen.hash
> @@ -1,6 +1,6 @@
>  # Locally computed
> -sha256  685adf14bd8e9c015b78097c1dc22f2f01343756f196acdc76a678e1ae352e11  eigen-3.3.7.tar.bz2
> -sha256  4f877e5ae4672568ef82cfd0023e2cef4a7cf55d867ab249efc9569a7eb9e5b1  COPYING.BSD
> +sha256  b4c198460eba6f28d34894e3a5710998818515104d6e74e5cc331ce31e46e626  eigen-3.4.0.tar.bz2
> +sha256  51928dce36213c5333ba3172e847d735d4c6e9b7ff2722a326c49067155b82eb  COPYING.BSD
>  sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING.GPL
>  sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LGPL
>  sha256  f5b330efdad110cdd84d585ec61220b0650461fa599e36b13e1726c9346dcfb9  COPYING.MINPACK
> diff --git a/package/eigen/eigen.mk b/package/eigen/eigen.mk
> index 98e6c61e38..9df286e11f 100644
> --- a/package/eigen/eigen.mk
> +++ b/package/eigen/eigen.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -EIGEN_VERSION = 3.3.7
> +EIGEN_VERSION = 3.4.0
>  EIGEN_SOURCE = eigen-$(EIGEN_VERSION).tar.bz2
>  EIGEN_SITE = $(call gitlab,libeigen,eigen,$(EIGEN_VERSION))
>  EIGEN_LICENSE = MPL2, BSD-3-Clause, LGPL-2.1
> @@ -15,7 +15,10 @@ EIGEN_SUPPORTS_IN_SOURCE_BUILD = NO
>  
>  # Default Eigen CMake installs .pc file in /usr/share/pkgconfig
>  # change it to /usr/lib/pkgconfig, to be consistent with other packages.
> -EIGEN_CONF_OPTS = -DPKGCONFIG_INSTALL_DIR=/usr/lib/pkgconfig \
> -	-DCMAKE_Fortran_COMPILER=$(TARGET_FC)
> +EIGEN_CONF_OPTS = -DPKGCONFIG_INSTALL_DIR=/usr/lib/pkgconfig
> +
> +ifeq ($(BR2_TOOLCHAIN_HAS_FORTRAN),y)
> +EIGEN_CONF_OPTS += -DCMAKE_Fortran_COMPILER=$(TARGET_FC)
> +endif
>  
>  $(eval $(cmake-package))
> -- 
> 2.36.0
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
