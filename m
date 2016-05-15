From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 15 May 2016 21:17:43 +0200
Subject: [Buildroot] [PATCH] package/gcc: 4.8.x to 5.x: backport a fix
 for building gcc with gcc-6
In-Reply-To: <1463291260-2544-1-git-send-email-s.martin49@gmail.com>
References: <1463291260-2544-1-git-send-email-s.martin49@gmail.com>
Message-ID: <20160515211743.0dba51fd@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 15 May 2016 07:47:40 +0200, Samuel Martin wrote:
> When the host system compiler is gcc-6, this patch is needed to build
> Buildroot toolchain and cleanly apply on gcc version 4.8.x to 5.x (not
> needed for 4.7.x series).
> 
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
> ---
>  package/gcc/4.8.5/130-build_gcc-5_with_gcc-6.patch | 153 +++++++++++++++++++++
>  package/gcc/4.9.3/130-build_gcc-5_with_gcc-6.patch | 153 +++++++++++++++++++++

Isn't it a bit odd to have a patch named "build_gcc-5_with_gcc-6" when
in fact you're fixing gcc 4.x ?

>  package/gcc/5.3.0/130-build_gcc-5_with_gcc-6.patch | 153 +++++++++++++++++++++
>  .../arc-2015.12/130-build_gcc-5_with_gcc-6.patch   | 153 +++++++++++++++++++++

This one is also based on 4.8 as far as I know.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
