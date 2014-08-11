From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 11 Aug 2014 12:33:15 +0200
Subject: [Buildroot] [PATCH v3] ejabberd: new package
In-Reply-To: <CAJtjsKZan0d6fSg3HuT4gm4+09Cqej3NbFbFZNU+mh5YNPFEdQ@mail.gmail.com>
References: <1405686837-1418-1-git-send-email-johan.oudinet@gmail.com>
 <20140806202322.GE1587@free.fr>
 <CAJtjsKZan0d6fSg3HuT4gm4+09Cqej3NbFbFZNU+mh5YNPFEdQ@mail.gmail.com>
Message-ID: <20140811103315.GB4364@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Johan, All,

On 2014-08-11 11:36 +0200, Johan Oudinet spake thusly:
> On Wed, Aug 6, 2014 at 10:23 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> > I tried building ejabberd in a minmal config, with:
> >
> >     BR2_x86_i686=y
> >     BR2_TOOLCHAIN_EXTERNAL=y
> >     BR2_INIT_NONE=y
> >     # BR2_PACKAGE_BUSYBOX is not set
> >     BR2_PACKAGE_EJABBERD=y
> >     # BR2_TARGET_ROOTFS_TAR is not set
> >
> > And it fails at build time, with a lengthy error message, that I do not
> > completely grasp:
> >
> >     /home/ymorin/dev/buildroot/O/host/usr/lib/erlang/bin/escript rebar
> > get-deps && :> deps/.got
> >     ==> rel (get-deps)
> >     Uncaught error in rebar_core: {'EXIT',
> >                                    {badarg,
> 
> Very strange. It looks like the rebar script didn't accept the
> get-deps argument.
> Could you try with the same defconfig as mine to see if the problem
> comes from there.
> $ cat defconfig
> BR2_arm=y
> BR2_arm1176jzf_s=y
> BR2_KERNEL_HEADERS_VERSION=y
> BR2_DEFAULT_KERNEL_VERSION="3.12.20"
> BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_12=y
> BR2_TOOLCHAIN_BUILDROOT_LARGEFILE=y
> BR2_TOOLCHAIN_BUILDROOT_LOCALE=y
> BR2_TOOLCHAIN_BUILDROOT_CXX=y
> BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
> BR2_LINUX_KERNEL=y
> BR2_LINUX_KERNEL_CUSTOM_GIT=y
> BR2_LINUX_KERNEL_CUSTOM_REPO_URL="git://github.com/raspberrypi/linux.git"
> BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="a25152fdfbfd3b4330da16fc3aeb6b1ef8843805"
> BR2_LINUX_KERNEL_DEFCONFIG="bcmrpi_quick"
> BR2_LINUX_KERNEL_ZIMAGE=y
> BR2_PACKAGE_RPI_FIRMWARE=y
> BR2_PACKAGE_EJABBERD=y

I tried this defconfig (except I use an external toolchain to avoid
rebuilding it again and again) and I got the exact same error I had
previously (I did not check the numbers where the same, though.)

My build machine is an x86_64, running an up-to-date Ubuntu 14.04.
I'll check in a 32-bit chroot to see if the error is the same.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
