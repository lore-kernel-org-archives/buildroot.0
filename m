From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 2 Jul 2009 14:50:11 +0200
Subject: [Buildroot] External toolchain improvements
In-Reply-To: <1246484614.21132.36.camel@coalu.atr>
References: <mailman.0.1246405094.1110.buildroot@busybox.net>
	<1246406073.21132.13.camel@coalu.atr>
	<20090701160513.2ce29151@surf>
	<1246484614.21132.36.camel@coalu.atr>
Message-ID: <20090702145011.6b9f3fe9@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Le Wed, 01 Jul 2009 23:43:34 +0200,
Lionel Landwerlin <lionel.landwerlin@openwide.fr> a ?crit :

> Ok, I had another look at the ext-tool.mk makefile, and the sysroot
> dir is not copied because of the locale...
> 
> This current command to get the sysroot dir is :
> 
> SYSROOT_DIR=`$(TARGET_CC) -v 2>&1 | grep ^Configured | tr " " "\n" |
> grep -- "--with-sysroot" | cut -f2 -d=`;
> 
> which call (in my case) sh4-linux-gcc using the default locale and as
> my email address could suggest, my current locale is fr_FR.UTF-8. So
> grep ^Configured just fails.
> 
> Please apply the attached patch to your external-toolchain branch.

Ok, thanks for patch. I should probably add a little bit of error
checking in this external toolchain thing.

> >  * Buildroot version
> 
> Your external-toolchain branch

Which doesn't exist anymore since it has been merged in the official
Buildroot :-)

But ok, fine, I know what you're using.

> >  * Error messages
> 
> I will try to retry with the fix on the locale first.

For sure if Buildroot didn't properly copy the sysroot to the staging
dir, the rest of the compilation could not work.

That said, your configuration file enables a relatively large set of
packages that I haven't tested with the external toolchain
configuration. Most if not all of the packages using the
Makefile.autotools.in machinery should build flawlessly, but the
packages using their own stuff in the .mk might break. Don't hesitate
to report the breakage with the associated error messages (or the full
build output), it's usually relatively easy to fix.

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
