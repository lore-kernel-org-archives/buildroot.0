From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 16 May 2016 08:50:19 +0200
Subject: [Buildroot] [PATCH v2] package/gcc: 4.8.x to 5.x: backport a
 fix for building gcc with gcc-6
In-Reply-To: <1463371428-5117-1-git-send-email-s.martin49@gmail.com>
References: <1463371428-5117-1-git-send-email-s.martin49@gmail.com>
Message-ID: <20160516085019.237fbc76@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 16 May 2016 06:03:48 +0200, Samuel Martin wrote:
> When the host system compiler is gcc-6, this patch is needed to build
> Buildroot toolchain and cleanly apply on gcc version 4.8.x to 5.x (not
> needed for 4.7.x series).
> 
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
> 
> ---
> changes v1->v2:
> - rename patches {ThomasP)
> ---
>  package/gcc/4.8.5/130-fix_build_with_gcc-6.patch   | 153 +++++++++++++++++++++
>  package/gcc/4.9.3/130-fix_build_with_gcc-6.patch   | 153 +++++++++++++++++++++
>  package/gcc/5.3.0/130-fix_build_with_gcc-6.patch   | 153 +++++++++++++++++++++
>  .../gcc/arc-2015.12/130-fix_build_with_gcc-6.patch | 153 +++++++++++++++++++++
>  4 files changed, 612 insertions(+)
>  create mode 100644 package/gcc/4.8.5/130-fix_build_with_gcc-6.patch
>  create mode 100644 package/gcc/4.9.3/130-fix_build_with_gcc-6.patch
>  create mode 100644 package/gcc/5.3.0/130-fix_build_with_gcc-6.patch
>  create mode 100644 package/gcc/arc-2015.12/130-fix_build_with_gcc-6.patch

Thanks for this new iteration, looks good. Now, I'm wondering whether I
should apply this to master or to next.

It really is a build fix, so master is normally appropriate. However:

 1/ It is touching really a core component, gcc, so we should be more
    conservative than for other packages.

 2/ There are probably tons of other host packages that don't yet build
    with gcc 6, so we might as well decide that Buildroot 2016.05 is
    not gcc 6 compatible, and to make it a goal for Buildroot 2016.08
    to support gcc 6 on the host.

Opinions welcome.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
