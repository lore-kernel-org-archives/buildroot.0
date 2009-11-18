From: Laine Walker-Avina <lwalkera@ieee.org>
Date: Tue, 17 Nov 2009 18:40:13 -0800
Subject: [Buildroot] [PATCH] Add support for the Cortex-A8 processor
In-Reply-To: <87aaykx0aw.fsf@macbook.be.48ers.dk>
References: <dfb660300911171312v7a9533d2q8aea097a5900cc74@mail.gmail.com>
	<dfb660300911171326y6c6ae77h6649c041d9a8a4e0@mail.gmail.com>
	<87aaykx0aw.fsf@macbook.be.48ers.dk>
Message-ID: <dfb660300911171840v73c98b0avfb2d26ca57c5f8db@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Nov 17, 2009 at 2:18 PM, Peter Korsgaard <jacmet@uclibc.org> wrote:
>>>>>> "Laine" == Laine Walker-Avina <lwalkera@ieee.org> writes:
>
> ?Laine> These patches add support for the Cortex-A8 processor used in the
> ?Laine> Beagleboard among others.
>
> Thanks, see below for a few comments.
>
> ?Laine> ---
> ?Laine> Laine Walker-Avina
> ?Laine> Firmware Engineer
> ?Laine> PASCO scientific
>
> ?Laine> From e317f275af94696ba680524120147e5618ccf213 Mon Sep 17 00:00:00 2001
> ?Laine> From: Laine Walker-Avina <lwalkera@ieee.org>
> ?Laine> Date: Thu, 29 Oct 2009 10:30:50 -0700
> ?Laine> Subject: [PATCH] Add support for the Cortex-A8 ARM target
>
>
> ?Laine> +config BR2_cortex_a8
> ?Laine> + ? ? ? bool "Cortex-A8"
> ?Laine> ?config BR2_sa110
> ?Laine> ? ? ? ? bool "sa110"
> ?Laine> ?config BR2_sa1100
> ?Laine> @@ -112,6 +114,7 @@ config BR2_ARM_TYPE
> ?Laine> ? ? ? ? default ARM_SA1100 ? ? ?if BR2_sa1100
> ?Laine> ? ? ? ? default ARM_XSCALE ? ? ?if BR2_xscale
> ?Laine> ? ? ? ? default ARM_IWMMXT ? ? ?if BR2_iwmmxt
> ?Laine> + ? ? ? default ARM_CORTEXA8 if BR2_cortex_a8
>
> ?Laine> ?choice
> ?Laine> ? ? ? ? prompt "Target ABI"
> ?Laine> @@ -591,6 +594,7 @@ config BR2_GCC_TARGET_TUNE
> ?Laine> ? ? ? ? default arm1136jf-s ? ? if BR2_arm1136jf_s
> ?Laine> ? ? ? ? default arm1176jz-s ? ? if BR2_arm1176jz_s
> ?Laine> ? ? ? ? default arm1176jzf-s ? ?if BR2_arm1176jzf_s
> ?Laine> + ? ? ? default cortex-a8 ? ? ? ? ? ? ? if BR2_cortex_a8
>
> Indentation seems wrong, otherwise it's fine. From what gcc version is
> cortex A8 supported? We should probably make it depend on that minimal
> version as the build otherwise breaks?

Gcc 4.4.1 added support for armv7-a, but there was a bug for c++
exceptions that made libstdc++ non-PIC which was fixed in 4.4.2. So
4.4.2 and later would probably be a good bet.

>
> ?Laine> ? ? ? ? default strongarm110 ? ?if BR2_sa110
>
> ?Laine> From 709c9a9140b377112a6721155e2a70bbaa893121 Mon Sep 17 00:00:00 2001
> ?Laine> From: Laine Walker-Avina <lwalkera@ieee.org>
> ?Laine> Date: Thu, 5 Nov 2009 14:27:45 -0800
> ?Laine> Subject: [PATCH] GCC: Add 4.4.2 as the active 4.4.x version
>
> We already have 4.4.2 support in BR.
Good to know.
>
> --
> Bye, Peter Korsgaard
>
