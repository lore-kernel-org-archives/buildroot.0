From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 31 Aug 2016 21:00:02 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Your build results for
	2016-08-29
In-Reply-To: <CAMduVEcsMc8AzLkJNh7FfZgUYejpk17mY+1cOPPf_TrgvPnT3A@mail.gmail.com>
References: <20160830063044.C1BC31017BF@stock.ovh.net>
 <CAMduVEcsMc8AzLkJNh7FfZgUYejpk17mY+1cOPPf_TrgvPnT3A@mail.gmail.com>
Message-ID: <20160831210002.356770b2@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 31 Aug 2016 19:51:44 +0200, Wojciech Zabolotny wrote:

> Unfortunately I was not able to reproduce the failed build.
> Compilation of a system for xtensa architecture starting from the
> qemu_xtensa_lx60_defconfig
> with addition of C++ support in the toolchain, jack2 and alsa-utils
> was completed without errors.

Regarding the jack2 build failure on xtensa, I already have the
beginning of a patch to solve it, but more testing is needed. You
probably didn't reproduce the error because you enabled only "jack2",
while the problem only occurs when the dbus support of jack2 is enabled.

> Compilation with "config" taken from
> http://autobuild.buildroot.net/results/2c3/2c3cf6cbdc5e954e5768bff836a02cfb0f3528cf/config
> lead to errors in host-faketime long before jack2 was compiled:
> 
> >>> host-faketime v0.9.6 Building  

[...]

> libfaketime.c:513:7: error: nonnull argument ?buf? compared to NULL
> [-Werror=nonnull-compare]
>     if (buf != NULL)
>        ^

What is the gcc version on your host machine?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
