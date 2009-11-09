From: Jonathan dumaresq <jdumaresq@cimeq.qc.ca>
Date: Mon, 9 Nov 2009 15:52:54 -0500
Subject: [Buildroot] for target toolchain to be compiled
Message-ID: <!&!AAAAAAAAAAAYAAAAAAAAAHWPmCJoh6pNraKNfwnUAkLCgAAAEAAAAEZ6jQmWCPNPhTWJOiBE+SEBAAAAAA==@cimeq.qc.ca>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I just installed a fresh kubuntu 9.10 and try to build my .config file that
I was able to do in 9.04. 

From What I see, the target toolchain is not compiled and failed to 
>compile
uclibc. 

Here a sample of the output.

/buildroot/PROJECTS/buildroot/atngw100/toolchain/bin/sed -i -e
's,^.*UCLIBC_HAS_WCHAR.*,UCLIBC_HAS_WCHAR=y,g'
/buildroot/PROJECTS/buildroot/atngw100/toolchain/uClibc-0.9.30-avr32-2.1.5/.
oldconfig
/buildroot/PROJECTS/buildroot/atngw100/toolchain/bin/sed -i -e
's,^.*UCLIBC_HAS_PROGRAM_INVOCATION_NAME.*,UCLIBC_HAS_PROGRAM_INVOCATION_NAM
E=n,g'
/buildroot/PROJECTS/buildroot/atngw100/toolchain/uClibc-0.9.30-avr32-2.1.5/.
oldconfig
cp -f
/buildroot/PROJECTS/buildroot/atngw100/toolchain/uClibc-0.9.30-avr32-2.1.5/.
oldconfig
/buildroot/PROJECTS/buildroot/atngw100/toolchain/uClibc-0.9.30-avr32-2.1.5/.
config
mkdir -p
/buildroot/PROJECTS/buildroot/atngw100/toolchain/uClibc_dev/usr/include
mkdir -p /buildroot/PROJECTS/buildroot/atngw100/toolchain/uClibc_dev/usr/lib
mkdir -p /buildroot/PROJECTS/buildroot/atngw100/toolchain/uClibc_dev/lib
/usr/bin/make -j1 -C
/buildroot/PROJECTS/buildroot/atngw100/toolchain/uClibc-0.9.30-avr32-2.1.5 \
                ARCH="avr32" \
 
PREFIX=/buildroot/PROJECTS/buildroot/atngw100/toolchain/uClibc_dev/ \
                DEVEL_PREFIX=/usr/ \
 
RUNTIME_PREFIX=/buildroot/PROJECTS/buildroot/atngw100/toolchain/uClibc_dev/
\
                HOSTCC="/usr/bin/gcc" \
                oldconfig
make[1]: Entering directory
`/buildroot/PROJECTS/buildroot/atngw100/toolchain/uClibc-0.9.30-avr32-2.1.5'
  MKDIR include/config
/bin/sh:
/buildroot/PROJECTS/buildroot/atngw100/build/staging_dir/usr/bin/avr32-linux
-uclibc-gcc: not found
make[2]:
/buildroot/PROJECTS/buildroot/atngw100/build/staging_dir/usr/bin/avr32-linux
-uclibc-gcc: Command not found
make[2]:
/buildroot/PROJECTS/buildroot/atngw100/build/staging_dir/usr/bin/avr32-linux
-uclibc-gcc: Command not found
/bin/sh:
/buildroot/PROJECTS/buildroot/atngw100/build/staging_dir/usr/bin/avr32-linux
-uclibc-gcc: not found
make[2]:
/buildroot/PROJECTS/buildroot/atngw100/build/staging_dir/usr/bin/avr32-linux
-uclibc-gcc: Command not found
make[2]:
/buildroot/PROJECTS/buildroot/atngw100/build/staging_dir/usr/bin/avr32-linux
-uclibc-gcc: Command not found

What File I should play with to get the toolchain compiled in ?

Jonathan
