From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 6 Apr 2014 10:37:55 +0200
Subject: [Buildroot] [PATCH 2/2] exim: new package
In-Reply-To: <53407F98.9080602@lucaceresoli.net>
References: <1394124890-29254-1-git-send-email-luca@lucaceresoli.net>
 <1394124890-29254-3-git-send-email-luca@lucaceresoli.net>
 <20140405183515.473bebd4@skate> <53407F98.9080602@lucaceresoli.net>
Message-ID: <20140406103755.2daa940a@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Luca Ceresoli,

On Sun, 06 Apr 2014 00:11:36 +0200, Luca Ceresoli wrote:

> thanks for applying my patch and improving it.

You're welcome.

> However now that we have a "Mail" category exim should be placed there.
> I'm sending a patch to move it.

Sure, no problem.

> > I've added AR and RANLIB here, otherwise the exim build system uses the
> > native versions.
> 
> Did you actually experience a build error, or just fixed ased on visual
> inspection? That's weird, the code I submitted works here. But my build
> environment is different, this might justify a different behaviour.
> 
> Of course I am not against this change, in the worst case it's useless.
> Just curious.

I did not experience any problem, I just saw while looking at the build
log that it was correctly using the cross-gcc, but not cross-ar and
cross-ranlib, so I fixed that up.

> > My defconfig is:
> >
> > BR2_arm=y
> > BR2_TOOLCHAIN_EXTERNAL=y
> > BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
> > BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
> > BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-basic-2014.02-rc1.tar.bz2"
> > BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_13=y
> > # BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
> > BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
> > BR2_PACKAGE_EXIM=y
> 
> I'll have a look at this error.

Great, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
