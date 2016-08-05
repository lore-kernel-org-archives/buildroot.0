From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 5 Aug 2016 21:05:41 +0200
Subject: [Buildroot] [PATCH] package/oprofile: introduce a
 BR2_PACKAGE_OPROFILE_ARCH_SUPPORTS
In-Reply-To: <1470397592-8459-1-git-send-email-romain.naour@gmail.com>
References: <1470397592-8459-1-git-send-email-romain.naour@gmail.com>
Message-ID: <20160805210541.0008534d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri,  5 Aug 2016 13:46:32 +0200, Romain Naour wrote:

> +config BR2_PACKAGE_OPROFILE_ARCH_SUPPORTS
> +	bool
> +	default y
> +	depends on BR2_arceb || BR2_arcle || BR2_arm || BR2_armeb || \
> +		BR2_aarch64 || BR2_aarch64_be || BR2_i386 || BR2_mips || \
> +		BR2_mipsel || BR2_mips64 || BR2_mips64el || BR2_powerpc || \
> +		BR2_powerpc64 || BR2_powerpc64le || BR2_sh4 || BR2_sh64 || \

Adding BR2_sh64 is a bit useless, as this architecture is deprecated in
Buildroot. And I'm not sure it's actually supported by oprofile.

I've also changed BR2_sh4 to BR2_sh, in order to cover all SuperH
variants, which oprofile seem to support.

Applied with those changes. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
