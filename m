From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 3 May 2017 14:29:39 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Your build results for
	2017-04-29
In-Reply-To: <20170503102922.GB26389@argentina>
References: <20170430062822.F06D82097E@mail.free-electrons.com>
 <20170503102922.GB26389@argentina>
Message-ID: <20170503142939.3fc6a470@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Adding Arnout in Cc here because I believe it is a bug he introduced :-)

On Wed, 3 May 2017 12:29:22 +0200, Thomas De Schampheleire wrote:

> It seems that this is an invalid configuration:
> 
> BR2_arm=y
> BR2_cortex_a8=y
> BR2_ARM_EABI=y
> BR2_ARM_INSTRUCTIONS_THUMB2=y
> BR2_STATIC_LIBS=y
> BR2_TOOLCHAIN_EXTERNAL=y
> 
> With STATIC_LIBS set, there is no downloadable external toolchain.
> As such, Buildroot falls back to a preinstalled one and sets the toolchain
> location to /path/to/toolchain, which does not exist.
> 
> However, I don't find this toolchain config in the list at:
> http://autobuild.buildroot.net/toolchains/configs/

BR2_STATIC_LIBS is randomly added, to all possible configurations:

  https://git.buildroot.org/buildroot-test/tree/scripts/autobuild-run#n553

So even if you don't see this configuration in the list of toolchains,
it is normal to see BR2_STATIC_LIBS=y.

However, BR2_STATIC_LIBS should not be added for glibc toolchains.
Arnout recently reworked the way we detect if it's a glibc toolchain or
not... and it seems like it doesn't work as expected. Or perhaps
Richard hasn't updated his autobuild-run script and we have another
issue ?

Richard have you updated your autobuild-run script recently?

Thomas DS, see:

  https://git.buildroot.org/buildroot-test/commit/scripts/autobuild-run?id=7c49373a4f494fea64e98c44ca504680e89a0e86
  https://git.buildroot.org/buildroot-test/commit/scripts/autobuild-run?id=3972df164e23828a0e9eb8aa85f4e82b760a859e

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
