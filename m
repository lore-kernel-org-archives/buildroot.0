From: Shaun Burdick <buildroot@shaunburdick.com>
Date: Wed, 06 Sep 2006 15:25:06 -0400
Subject: [Buildroot] "CONFIG_SYSLOGD" redefined
Message-ID: <44FF2092.10509@shaunburdick.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello everyone,
I wanted to say hello and great idea on the buildroot project.
I am having a little trouble finishing the compile however, and I was
wondering if I could get some help.
I searched in the malling list archives (recent google search) and could
not find any reference to the make error I receive.

It errors out complaining:

/home/shaun/svn/buildroot/build_i686/busybox/init/init.c:13:1:
"CONFIG_SYSLOGD" redefined
In file included from
/home/shaun/svn/buildroot/build_i686/busybox/include/busybox.h:10,
                 from
/home/shaun/svn/buildroot/build_i686/busybox/init/init.c:12:
/home/shaun/svn/buildroot/build_i686/busybox/include/bb_config.h:2669:1:
this is the location of the previous definition

Full make output:

[shaun at deusexmachina buildroot]$ make

Checking build system dependencies:
sed works:                          Ok
GNU make version '3.80':            Ok
gcc version '3.4.6':                Ok
which installed:                    Ok
bison installed:                    Ok
flex installed:                     Ok
gettext installed:                  Ok
Build system dependencies:          Ok

make -j1
CC=/home/shaun/svn/buildroot/build_i686/staging_dir/bin/i686-linux-uclibc-gcc
CROSS_COMPILE="/home/shaun/svn/buildroot/build_i686/staging_dir/bin/i686-linux-uclibc-"
CROSS="/home/shaun/svn/buildroot/build_i686/staging_dir/bin/i686-linux-uclibc-"
PREFIX="/home/shaun/svn/buildroot/build_i686/root" \
        EXTRA_CFLAGS="-Os -pipe " -C
/home/shaun/svn/buildroot/build_i686/busybox
make[1]: Entering directory `/home/shaun/svn/buildroot/build_i686/busybox'
  CC init/init.o
/home/shaun/svn/buildroot/build_i686/busybox/init/init.c:13:1:
"CONFIG_SYSLOGD" redefined
In file included from
/home/shaun/svn/buildroot/build_i686/busybox/include/busybox.h:10,
                 from
/home/shaun/svn/buildroot/build_i686/busybox/init/init.c:12:
/home/shaun/svn/buildroot/build_i686/busybox/include/bb_config.h:2669:1:
this is the location of the previous definition
make[2]: *** [/home/shaun/svn/buildroot/build_i686/busybox/init/init.o]
Error 1
make[1]: *** [_all] Error 2
make[1]: Leaving directory `/home/shaun/svn/buildroot/build_i686/busybox'
make: *** [/home/shaun/svn/buildroot/build_i686/busybox/busybox] Error 2
[shaun at deusexmachina buildroot]$

I attached my .config file, not sure if attachments are scraped off.  I
can respond with it in an email if need be.

My whole goal of this is to make a tiny DHCP/DNS server.  I want to use
it for home use and it will facilitate my interest in learning DNS.  I
will use it as a VM on my linux box so ssh access is a plus!

My thanks in advance,
-Shaun

-------------- next part --------------
An embedded and charset-unspecified text was scrubbed...
Name: .config
Url: http://busybox.net/lists/buildroot/attachments/20060906/dc16ef06/attachment.pot 
