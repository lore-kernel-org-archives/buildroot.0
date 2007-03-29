From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Thu, 29 Mar 2007 12:34:58 +0200
Subject: [Buildroot] Error with Busybox
In-Reply-To: <460B80C7.5040804@mbdsys.com>
References: <460A9989.6030108@mbdsys.com> <20070328210731.GE24135@aon.at>
	<460B80C7.5040804@mbdsys.com>
Message-ID: <20070329103458.GA870@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Mar 29, 2007 at 11:03:03AM +0200, kimtuan wrote:
>Bernhard Fischer wrote:
>>On Wed, Mar 28, 2007 at 06:36:25PM +0200, kimtuan wrote:
>>  
>>>Hello,
>>>
>>>I'm trying to build with Busybox but  I can't find out why I got this 
>>>building error :
>>>
>>>/home/kimtuan/work/buildroot/build_arm/staging_dir/bin/arm-linux-uclibc-strip: 
>>>'busybox_unstripped': No such file
>>>install: cannot stat `busybox': No such file or directory
>>>make[1]: *** [install] Error 1
>>>make[1]: Leaving directory 
>>>`/home/kimtuan/work/buildroot/build_arm/busybox-1.5.0'
>>>make: *** [/home/kimtuan/work/buildroot/build_arm/root/bin/busybox] Error 
>>>2
>>>    
>>
>>$ make busybox-clean
>>$ make
>>or, for more verbose output
>>$ make V=1
>>and show us the first error you are getting
>>
>>
>>  
>I still have the error. With verbosity i got this output :
>
>echo 'cmd_busybox_unstripped := 
>/home/kimtuan/work/buildroot/build_arm/busybox-1.5.0/scripts/trylink 
>/home/kimtuan/work/buildroot/build_arm/staging_dir/bin/arm-linux-uclibc-gcc 
>-o busybox_unstripped -Wl,-M -Wl,--warn-common -Wl,--sort-common 
>-Wl,--gc-sections -Wl,--start-group  applets/built-in.o  archival/lib.a  
>archival/libunarchive/lib.a  console-tools/lib.a  coreutils/lib.a  
>coreutils/libcoreutils/lib.a  debianutils/lib.a  e2fsprogs/lib.a  
>editors/lib.a  findutils/lib.a  init/lib.a  libbb/lib.a  
>libpwdgrp/lib.a  loginutils/lib.a  miscutils/lib.a  modutils/lib.a  
>networking/lib.a  networking/libiproute/lib.a  networking/udhcp/lib.a  
>procps/lib.a  runit/lib.a  selinux/lib.a  shell/lib.a  sysklogd/lib.a  
>util-linux/lib.a  archival/built-in.o  archival/libunarchive/built-in.o  
>console-tools/built-in.o  coreutils/built-in.o  
>coreutils/libcoreutils/built-in.o  debianutils/built-in.o  
>e2fsprogs/built-in.o  editors/built-in.o  findutils/built-in.o  
>init/built-in.o  libbb/built-in.o  libpwdgrp/built-in.o  
>loginutils/built-in.o  miscutils/built-in.o  modutils/built-in.o  
>networking/built-in.o  networking/libiproute/built-in.o  
>networking/udhcp/built-in.o  procps/built-in.o  runit/built-in.o  
>selinux/built-in.o  shell/built-in.o  sysklogd/built-in.o  
>util-linux/built-in.o -Wl,--end-group' > ./.busybox_unstripped.cmd
>rm -f .old_version
>/home/kimtuan/work/buildroot/build_arm/staging_dir/bin/arm-linux-uclibc-strip 
>-s --remove-section=.note --remove-section=.comment \
>               busybox_unstripped -o busybox
>/home/kimtuan/work/buildroot/build_arm/staging_dir/bin/arm-linux-uclibc-strip: 
>'busybox_unstripped': No such file
>/bin/sh 
>/home/kimtuan/work/buildroot/build_arm/busybox-1.5.0/applets/busybox.mkll 
>/home/kimtuan/work/buildroot/build_arm/busybox-1.5.0/include/autoconf.h 
>/home/kimtuan/work/buildroot/build_arm/busybox-1.5.0/include/applets.h 
>>busybox.links
>DO_INSTALL_LIBS="" \
>               /bin/sh 
>/home/kimtuan/work/buildroot/build_arm/busybox-1.5.0/applets/install.sh 
>"/home/kimtuan/work/buildroot/build_arm/root" --symlinks
>install: cannot stat `busybox': No such file or directory
>make[1]: *** [install] Error 1
>make[1]: Leaving directory 
>`/home/kimtuan/work/buildroot/build_arm/busybox-1.5.0'
>make: *** [/home/kimtuan/work/buildroot/build_arm/root/bin/busybox] Error 2

This is most likely not the first error.
