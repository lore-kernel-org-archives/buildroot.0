From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 13 Oct 2013 12:40:10 +0200
Subject: [Buildroot] [PATCH 2/5] gcc: add microblaze internal toolchain
In-Reply-To: <1381502000-1995-3-git-send-email-spenser@gillilanding.com>
References: <1381502000-1995-1-git-send-email-spenser@gillilanding.com>
 <1381502000-1995-3-git-send-email-spenser@gillilanding.com>
Message-ID: <20131013124010.58b2977f@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Spenser Gilliland,

On Fri, 11 Oct 2013 09:33:17 -0500, Spenser Gilliland wrote:

> @@ -102,6 +108,7 @@ config BR2_GCC_VERSION
>  	default "4.7.3"     if BR2_GCC_VERSION_4_7_X
>  	default "4.8.1"     if BR2_GCC_VERSION_4_8_X
>  	default "4.8-arc"   if BR2_GCC_VERSION_4_8_ARC
> +	default "4.9-microblaze" if BR2_GCC_VERSION_4_9_MICROBLAZE
>  	default $BR2_GCC_SNAP_DATE if BR2_GCC_VERSION_SNAP

I'm getting a build failure while testing this patch set:

>>> host-gcc-final 4.9-microblaze Patching package/gcc//gcc-final
support/scripts/apply-patches.sh /home/test/outputs/microblaze-glibc/build/host-gcc-final-4.9-microblaze package/gcc/4.9-microblaze \*.patch
Aborting.  'package/gcc/4.9-microblaze' is not a directory.

I believe we should have a few patches, at least the ones that are also
in package/gcc/4.8-arc.

Is this something you are willing to fix, or should I take your patches
and fix those problems?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
