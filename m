From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 2 Mar 2016 21:28:07 +0100
Subject: [Buildroot] [PATCH 1/1] package/ffmpeg: Fix i486 compilation
 with gcc5
In-Reply-To: <1456614055-10889-1-git-send-email-bernd.kuhls@t-online.de>
References: <1456614055-10889-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160302212807.28f05895@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sun, 28 Feb 2016 00:00:55 +0100, Bernd Kuhls wrote:
> Fixes
> 
> In file included from libpostproc/postprocess.c:539:0:
> libpostproc/postprocess_template.c: In function 'postProcess_MMX':
> libpostproc/postprocess_template.c:3184:5: error: 'asm' operand has impossible constraints
>      __asm__ volatile(
>      ^
> libpostproc/postprocess_template.c:3101:5: error: 'asm' operand has impossible constraints
>      __asm__ volatile(
>      ^
> using this defconfig:
> 
> BR2_x86_i486=y
> BR2_PACKAGE_FFMPEG=y
> BR2_PACKAGE_FFMPEG_GPL=y
> BR2_PACKAGE_FFMPEG_POSTPROC=y

This defconfig is not using gcc 5: we still default to gcc 4.9.

So are you sure the problem is specific to gcc5 ?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
