From: Srikanth Thokala <sriku.linux@gmail.com>
Date: Sat, 29 Nov 2014 17:38:58 +0530
Subject: [Buildroot] Error: cannot create directory
	$buildroot/ouput/var/cache
Message-ID: <CA+mB=1+ogMmd0mw3ifDOaAspH22mDhSX-nuM6Wg8C8TBaMLm7w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I am trying to use buildroot for the custom embedded project for which
I have cloned the 'beaglebone' configuration and customized for my
embedded platform (like a9 platform and codesourcey toolchain).  After
doing a 'make', I see the following error:

++++++++
mkdir -p /home/sriku/tmp/buildroot/output/target/etc
# Mandatory configuration file and auxilliary cache directory
# for recent versions of ldconfig
touch /home/sriku/tmp/buildroot/output/target/etc/ld.so.conf
mkdir -p /home/sriku/tmp/buildroot/output/target/var/cache/ldconfig
mkdir: cannot create directory
?/home/sriku/tmp/buildroot/output/target/var/cache?: Not a directory
++++++++

Quickly walking through the above path, I see a file name 'cache'
already created under $buildroot/output/target/var/. So, I removed
this file and manually created var/cache/ldconfig directory and did a
'make'.  The build is success after this. I feel, I am missing some
configuration in the buildroot.

Please provide me some inputs to debug this.

Thanks in advance,
Srikanth
