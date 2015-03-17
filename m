From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 17 Mar 2015 13:03:41 +0100
Subject: [Buildroot] [PATCH v3 1/2] package/cmake: disable on
 unsupported architectures
In-Reply-To: <1426587624-24938-1-git-send-email-s.martin49@gmail.com>
References: <1426587624-24938-1-git-send-email-s.martin49@gmail.com>
Message-ID: <20150317130341.0f673985@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Samuel Martin,

On Tue, 17 Mar 2015 11:20:23 +0100, Samuel Martin wrote:

> diff --git a/package/cmake/Config.in b/package/cmake/Config.in
> index 0b5bba9..36c5413 100644
> --- a/package/cmake/Config.in
> +++ b/package/cmake/Config.in
> @@ -1,3 +1,14 @@
> +config BR2_PACKAGE_CMAKE_ARCH_SUPPORTS
> +	bool
> +	default y
> +	depends on BR2_arm || BR2_armeb || \
> +		BR2_aarch64 || \
> +		BR2_m68k || \
> +		BR2_mips || BR2_mips64 || BR2_mipsel || BR2_mips64el || \
> +		BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le || \
> +		BR2_sparc || \
> +		BR2_i386 || BR2_x86_64

I've rewrapped this a little bit so it looks nicer, and applied.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
