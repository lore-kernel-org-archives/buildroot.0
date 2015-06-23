From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 23 Jun 2015 18:02:02 +0200
Subject: [Buildroot] [git commit] gcc: switch to gcc 4.9 as the default
 version
In-Reply-To: <55890EC2.2040505@mind.be>
References: <20150622222746.025B07FAFF@busybox.osuosl.org>
 <55890EC2.2040505@mind.be>
Message-ID: <20150623180202.34e83978@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle,

On Tue, 23 Jun 2015 09:46:10 +0200, Arnout Vandecappelle wrote:

>  I think we should again update our autobuilder toolchains in this case, to make
> sure we actually test the thing that we set as default.
> 
> [I have bad internet connection now so I didn't check if perhaps the autobuilder
> toolchains have already been updated. If so, sorry for the noise.]

We have a few internal toolchain configurations in the autobuilders:

  http://autobuild.buildroot.org/toolchains/configs/br-arc-full-internal.config
  http://autobuild.buildroot.org/toolchains/configs/br-arm-internal-full.config
  http://autobuild.buildroot.org/toolchains/configs/br-microblazeel-full-internal.config
  http://autobuild.buildroot.org/toolchains/configs/br-powerpc-internal-full.config
  http://autobuild.buildroot.org/toolchains/configs/br-xtensa-full-internal.config

These are always using the default gcc version. However, it is true
that all the other Buildroot toolchain configuration use pre-built
external toolchains, that are stuck to whatever was the default back
when 2015.05, except the following toolchains that already use gcc 4.9:

br-aarch64-glibc.config:BR2_GCC_VERSION_4_9_X=y
br-arm-cortex-a9-glibc.config:BR2_GCC_VERSION_4_9_X=y
br-arm-cortex-a9-musl.config:BR2_GCC_VERSION_4_9_X=y

But I can certainly trigger a rebuild of the toolchains with the most
recent Buildroot, using gcc 4.9 as the default, and having one
toolchain using gcc 5.1 to catch issues. Should I do this?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
