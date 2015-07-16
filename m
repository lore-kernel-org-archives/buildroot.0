From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 16 Jul 2015 22:56:39 +0200
Subject: [Buildroot] [PATCH] gcc: add gcc 5.2.0
In-Reply-To: <1437079928-9591-1-git-send-email-gustavo@zacarias.com.ar>
References: <1437079928-9591-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20150716225639.14772165@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Thu, 16 Jul 2015 17:52:08 -0300, Gustavo Zacarias wrote:

> +	config BR2_GCC_VERSION_5_2_X
> +		bool "gcc 5.2.x"
> +		# Broken or unsupported architectures
> +		depends on !BR2_arc
> +		select BR2_GCC_NEEDS_MPC
> +		select BR2_GCC_SUPPORTS_GRAPHITE
> +
>  endchoice
>  
>  config BR2_GCC_SUPPORTS_FINEGRAINEDMTUNE
> @@ -99,6 +106,7 @@ config BR2_GCC_VERSION
>  	default "4.8.5"     if BR2_GCC_VERSION_4_8_X
>  	default "4.9.3"     if BR2_GCC_VERSION_4_9_X
>  	default "5.1.0"     if BR2_GCC_VERSION_5_1_X
> +	default "5.2.0"     if BR2_GCC_VERSION_5_2_X

That's not the right way of adding gcc 5.2 support. The gcc
release numbers have changed: 5 is the major release, and 5.{1,2} are
the bug fix releases.

Quoting https://gcc.gnu.org/ml/gcc/2015-07/msg00198.html:

  GCC 5.2 is a bug-fix release from the GCC 5 branch
  containing important fixes for regressions and serious bugs in
  GCC 5.1 with more than 81 bugs fixed since the previous release.

Therefore, we should instead rename BR2_GCC_VERSION_5_1_X to
BR2_GCC_VERSION_5_X, and then simply update from 5.1 to 5.2 (keeping
only 5.2 and removing 5.1), exactly like we were doing when the version
was changed from 4.9.1 to 4.9.2 for example.

Could you rework your patch in this direction?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
