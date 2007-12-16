From: Martin Bures <needemesleepe@gmail.com>
Date: Sun, 16 Dec 2007 13:17:15 -0500
Subject: [Buildroot] Build kernel for ARM with Buildroot
In-Reply-To: <5970ab460712161009q5ae1e9e4i7b4cf247dd7f8811@mail.gmail.com>
References: <2b4282de0712150741n6266e9b0ged662875d25e2824@mail.gmail.com>
	<5970ab460712161009q5ae1e9e4i7b4cf247dd7f8811@mail.gmail.com>
Message-ID: <5970ab460712161017t7cec0c2fic59d89129138fa51@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

bingo.
it was actually : '<path_to_buildroot>/target/device/Arm/linux26
>
> .integrator926.config'



On Dec 16, 2007 1:09 PM, Martin Bures <needemesleepe@gmail.com> wrote:

> I've been having the same problem.  Here is what I know.
> in the file .config <http://config.in> in /buildroot, there is a variable:
>
> BR2_PACKAGE_LINUX_KCONFIG that is not set.  I have no idea what to set it
> to.
>
> I posted the question which got me this answer:
> grep -r BR2_PACKAGE_LINUX_KCONFIG target
>
> should give you some clues in which Config.in <http://config.in/> it is
> defined.
>
> the result of that is this:
> [ filtered for .svn exclusion and other devices ]
>
> target/linux/Makefile.in:ifneq ($(strip $(subst
> ",,$(BR2_PACKAGE_LINUX_KCONFIG))),)
> target/linux/Makefile.in:LINUX26_KCONFIG=$(strip $(subst
> ",,$(BR2_PACKAGE_LINUX_KCONFIG)))
> target/linux/Config.in:config BR2_PACKAGE_LINUX_KCONFIG
> target/linux/Makefile.in.advanced:ifneq ($(strip $(subst
> ",,$(BR2_PACKAGE_LINUX_KCONFIG))),)
> target/linux/Makefile.in.advanced:LINUX26_KCONFIG:=$(strip $(subst
> ",,$(BR2_PACKAGE_LINUX_KCONFIG)))
> target/linux/Makefile.in.advanced:      @echo
> BR2_PACKAGE_LINUX_KCONFIG=$(BR2_PACKAGE_LINUX_KCONFIG)
> target/linux/Config.in.advanced:# BR2_PACKAGE_LINUX_KCONFIG
> target/linux/Config.in.advanced:config BR2_PACKAGE_LINUX_KCONFIG
> target/linux/Config.in.experimental:config BR2_PACKAGE_LINUX_KCONFIG
> target/Makefile.in:BR2_PACKAGE_LINUX_KCONFIG:=$(strip $(subst
> ",,$(BR2_PACKAGE_LINUX_KCONFIG)))
> grep: target/device/jp/q5/target_skeleton/dev/log: No such file or
> directory
> grep: target/device/jp/q5/target_skeleton/etc/mtab: No such file or
> directory
> grep: target/device/jp/q5/target_skeleton/etc/resolv.conf: No such file or
> directory
> target/device/x86/i386/Makefile.in:ifeq ($(strip
> $(BR2_PACKAGE_LINUX_KCONFIG)),)
> target/device/x86/i386/Makefile.in:LINUX26_KCONFIG=$(strip
> $(BR2_PACKAGE_LINUX_KCONFIG))
> target/device/Arm/integrator926_defconfig:BR2_PACKAGE_LINUX_KCONFIG="target/device/Arm/linux26.integrator926.config"
>
>
> target/device/Arm/integrator926_huge_defconfig:BR2_PACKAGE_LINUX_KCONFIG="target/device/Arm/linux26.integrator926_huge.config"
> grep: target/generic/target_skeleton/dev/log: No such file or directory
> grep: target/generic/target_skeleton/etc/mtab: No such file or directory
> grep: target/generic/target_skeleton/etc/resolv.conf: No such file or
> directory
> grep: target/generic/target_busybox_skeleton/etc/mtab: No such file or
> directory
> grep: target/generic/target_busybox_skeleton/etc/resolv.conf: No such file
> or directory
>
> so maybe something like "/target/device/Arm/linux2.6.integrator926.config"
>
> On Dec 15, 2007 10:41 AM, Lan Ngoc < ngoclan.it@gmail.com> wrote:
>
> > I have been building kernel and getting error1: "cp: missing destination
> > file operand after" as following:
> > ................................................................
> >
> > [root at localhost buildroot]# make
> >
> > Checking build system dependencies:
> > BUILDROOT_DL_DIR clean:                         Ok
> > CC clean:                                       Ok
> > CXX clean:                                      Ok
> > CPP clean:                                      Ok
> > CFLAGS clean:                                   Ok
> > INCLUDES clean:                                 Ok
> > CXXFLAGS clean:                                 Ok
> > which installed:                                Ok
> > sed works:                                      Ok (/bin/sed)
> > GNU make version '3.81':                        Ok
> > C compiler '/usr/lib/ccache/gcc'
> > C compiler version '4.1.2':                     Ok
> > C++ compiler '/usr/lib/ccache/g++'
> > C++ compiler version ' 4.1.2':                   Ok
> > bison installed:                                Ok
> > flex installed:                                 Ok
> > gettext installed:                              Ok
> > makeinfo installed:                             Ok
> > Build system dependencies:                      Ok
> >
> > rm -rf /mnt/e/buildroot/project_build_arm/ENDUP/buildroot-config
> > mkdir -p /mnt/e/buildroot/project_build_arm/ENDUP
> > cp -dpRf package/config/buildroot-config
> > /mnt/e/buildroot/project_build_arm/ENDUP/buildroot-config
> > cp -dpf  /mnt/e/buildroot/project_build_arm/ENDUP/linux-
> > 2.6.22.10/.config
> > cp: missing destination file operand after
> > `/mnt/e/buildroot/project_build_arm/ENDUP/linux- 2.6.22.10/.config'
> > Try `cp --help' for more information.
> > make: *** [/mnt/e/buildroot/project_build_arm/ENDUP/linux-
> > 2.6.22.10/.configured] Error 1
> >
> > ......................................................
> > I'm using Fedora core 7 and lastest Buildroot version.
> >
> > Please show me how to sovle this error!
> >
> > Thank you very much!
> >
> > _______________________________________________
> > buildroot mailing list
> > buildroot at uclibc.org
> > http://busybox.net/mailman/listinfo/buildroot
> >
>
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20071216/629e2a6d/attachment-0001.htm 
