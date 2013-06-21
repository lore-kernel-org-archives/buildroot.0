From: Thomas Weininger <Thomas.Weininger@diasemi.com>
Date: Fri, 21 Jun 2013 12:37:33 +0000
Subject: [Buildroot] Build error when trying to build the py-smbus
 package of i2c-tools
In-Reply-To: <4E062DFADC6E8142AA8EE9D214BA0C50E402D8@NB-EX-MBX01.diasemi.com>
References: <4E062DFADC6E8142AA8EE9D214BA0C50E3E24C@NB-EX-MBX01.diasemi.com>
 <51C32CE0.9050902@mind.be>
 <4E062DFADC6E8142AA8EE9D214BA0C50E400ED@NB-EX-MBX01.diasemi.com>
 <51C421AF.20904@mind.be>
 <4E062DFADC6E8142AA8EE9D214BA0C50E401E5@NB-EX-MBX01.diasemi.com>
 <51C42F6D.7080701@mind.be>
 <4E062DFADC6E8142AA8EE9D214BA0C50E402D8@NB-EX-MBX01.diasemi.com>
Message-ID: <4E062DFADC6E8142AA8EE9D214BA0C50E403D5@NB-EX-MBX01.diasemi.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> -----Original Message-----
> From: buildroot-bounces at busybox.net [mailto:buildroot-
> bounces at busybox.net] On Behalf Of Thomas Weininger
> Sent: Freitag, 21. Juni 2013 14:07
> To: Arnout Vandecappelle
> Cc: buildroot at busybox.net
> Subject: Re: [Buildroot] Build error when trying to build the py-smbus
> package of i2c-tools
>
> > -----Original Message-----
> > From: Arnout Vandecappelle [mailto:arnout at mind.be]
> > Sent: Freitag, 21. Juni 2013 12:48
> > To: Thomas Weininger
> > Cc: buildroot at busybox.net
> > Subject: Re: [Buildroot] Build error when trying to build the py-smbus
> > package of i2c-tools
> >
> > On 21/06/13 12:31, Thomas Weininger wrote:
> > >>> > >
> > >>> > >So it uses Python distutils (the setup.py) in order to build
> > >>> > >smbus.so. And it
> > >> >seems to me that it uses the host distutils instead of the target
> > >> >system's one.
> > >>> > >If this is the problem, then the Module.mk or the setup.py will
> > >>> > >most likely
> > >> >need to be patched in order to use the target system toolchain?
> > >> >
> > >> >   Hang on, maybe you have to build host-python-setuptools first?
> > > [Thomas Weininger]
> > > I can't find a python-setuptools option in the host utilities menu
> > > in
> > Buildroot's make menuconfig. How can I build it?
> > > However, for the target BR2_PACKAGE_PYTHON_SETUPTOOLS is set.
> >
> >   It's not a user-selectable host package, since it is only needed to
> > build other packages.  Normally, you build it by adding it to the
> > I2C_TOOLS_DEPENDENCIES variable. But you can also do it directly from
> > the command line:
> >
> > make host-python-setuptools
> > make i2c-tools-dirclean # Just to be sure make
> >
>
> [Thomas Weininger]
> I executed
> make host-python-setuptools
> make i2c-tools-dirclean
> make i2c-tools-rebuild
>
> Still the same error.
>
> Regards
> Thomas
> ________________________________
>
> Dialog Semiconductor GmbH
> Neue Str. 95
> D-73230 Kirchheim
> Managing Directors: Dr. Jalal Bagherli, Jean-Michel Richard Chairman of the
> Supervisory Board: Gregorio Reyes Commercial register: Amtsgericht
> Stuttgart: HRB 231181 UST-ID-Nr. DE 811121668
>
> Legal Disclaimer: This e-mail communication (and any attachment/s) is
> confidential and contains proprietary information, some or all of which may
> be legally privileged. It is intended solely for the use of the individual or
> entity to which it is addressed. Access to this email by anyone else is
> unauthorized. If you are not the intended recipient, any disclosure, copying,
> distribution or any action taken or omitted to be taken in reliance on it, is
> prohibited and may be unlawful.
>
> Please consider the environment before printing this e-mail
>
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
[Thomas Weininger]

I've just notice something, which seem to be strange:

>>> i2c-tools 3.1.0 Building
PATH="/home/diasemi/workspace/dialog/buildroot/output/host/bin:/home/diasemi/workspace/dialog/buildroot/output/host/usr/bin:/home/diasemi/workspace/dialog/buildroot/output/host/usr/sbin/:~/bin:~/bin:~/bin:/usr/lib/mpi/gcc/openmpi/bin:/home/diasemi/bin:/usr/local/bin:/usr/bin:/bin:/usr/bin/X11:/usr/X11R6/bin:/usr/games:/usr/lib/mit/bin:/home/diasemi/workspace/dialog/u-boot/tools:/home/diasemi/workspace/dialog/u-boot/tools:/home/diasemi/workspace/dialog/u-boot/tools" PERLLIB="/home/diasemi/workspace/dialog/buildroot/output/host/usr/lib/perl" /usr/bin/make -j3 PATH="/home/diasemi/workspace/dialog/buildroot/output/host/bin:/home/diasemi/workspace/dialog/buildroot/output/host/usr/bin:/home/diasemi/workspace/dialog/buildroot/output/host/usr/sbin/:~/bin:~/bin:~/bin:/usr/lib/mpi/gcc/openmpi/bin:/home/diasemi/bin:/usr/local/bin:/usr/bin:/bin:/usr/bin/X11:/usr/X11R6/bin:/usr/games:/usr/lib/mit/bin:/home/diasemi/workspace/dialog/u-boot/tools:/home/diasemi/workspace/dialog/u-boot/tools:/home/diasemi/workspace/dialog/u-boot/tools" AR="/home/diasemi/workspace/dialog/buildroot/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-ar" AS="/home/diasemi/workspace/dialog/buildroot/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-as" LD="/home/diasemi/workspace/dialog/buildroot/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-ld" NM="/home/diasemi/workspace/dialog/buildroot/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-nm" CC="/home/diasemi/workspace/dialog/buildroot/output/host/usr/bin/ccache /home/diasemi/workspace/dialog/buildroot/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-gcc" GCC="/home/diasemi/workspace/dialog/buildroot/output/host/usr/bin/ccache /home/diasemi/workspace/dialog/buildroot/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-gcc" CPP="/home/diasemi/workspace/dialog/buildroot/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-cpp" CXX="/home/diasemi/workspace/dialog/buildroot/output/host/usr/bin/ccache /home/diasemi/workspace/dialog/buildroot/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-g++" FC="/home/diasemi/workspace/dialog/buildroot/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-gfortran" RANLIB="/home/diasemi/workspace/dialog/buildroot/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-ranlib" READELF="/home/diasemi/workspace/dialog/buildroot/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-readelf" STRIP="/home/diasemi/workspace/dialog/buildroot/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-strip" OBJCOPY="/home/diasemi/workspace/dialog/buildroot/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-objcopy" OBJDUMP="/home/diasemi/workspace/dialog/buildroot/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-objdump" AR_FOR_BUILD="/usr/bin/ar" AS_FOR_BUILD="/usr/bin/as" CC_FOR_BUILD="/home/diasemi/workspace/dialog/buildroot/output/host/usr/bin/ccache /usr/bin/gcc" GCC_FOR_BUILD="/home/diasemi/workspace/dialog/buildroot/output/host/usr/bin/ccache /usr/bin/gcc"

So CC_FOR_BUILD and GCC_FOR_BUILD point to /usr/bin/gcc. Couldn't be that the source of the errors?
But when this is wrong, why does the rest of i2c-tools build successfully?

Regards
Thomas
________________________________

Dialog Semiconductor GmbH
Neue Str. 95
D-73230 Kirchheim
Managing Directors: Dr. Jalal Bagherli, Jean-Michel Richard
Chairman of the Supervisory Board: Gregorio Reyes
Commercial register: Amtsgericht Stuttgart: HRB 231181
UST-ID-Nr. DE 811121668

Legal Disclaimer: This e-mail communication (and any attachment/s) is confidential and contains proprietary information, some or all of which may be legally privileged. It is intended solely for the use of the individual or entity to which it is addressed. Access to this email by anyone else is unauthorized. If you are not the intended recipient, any disclosure, copying, distribution or any action taken or omitted to be taken in reliance on it, is prohibited and may be unlawful.

Please consider the environment before printing this e-mail
