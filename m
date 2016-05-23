From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 23 May 2016 13:55:15 +0200
Subject: [Buildroot] [PATCH] valgrind: disable for MIPS soft-float
In-Reply-To: <1464003111-59011-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1464003111-59011-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20160523135515.0bc85032@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 23 May 2016 12:31:51 +0100, Vicente Olivert Riera wrote:

> diff --git a/package/valgrind/Config.in b/package/valgrind/Config.in
> index 21b2608..40e219d 100644
> --- a/package/valgrind/Config.in
> +++ b/package/valgrind/Config.in
> @@ -8,6 +8,7 @@ config BR2_PACKAGE_VALGRIND
>  		   BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le || \
>  		   BR2_x86_64
>  	depends on !BR2_STATIC_LIBS
> +	depends on !BR2_MIPS_SOFT_FLOAT

I am wondering if it isn't better to do:

        depends on BR2_ARM_CPU_ARMV7A || BR2_i386 || \
-                  BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el || \
+                  ((BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el) && !BR2_MIPS_SOFT_FLOAT) || \
                   BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le || \
                   BR2_x86_64

But I'm not sure. It's completely equivalent from a functionality point
of view, I'm just wondering which one is more logical.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
