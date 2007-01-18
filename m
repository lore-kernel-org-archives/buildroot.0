From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Thu, 18 Jan 2007 11:29:27 +0100
Subject: [Buildroot] install uClibc daily snapshot failes
In-Reply-To: <200701172114.08730.claus.klein@arcormail.de>
References: <200701170833.04970.claus.klein@arcormail.de>
	<20070117181355.GA29900@aon.at>
	<200701172114.08730.claus.klein@arcormail.de>
Message-ID: <20070118102927.GB6515@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Jan 17, 2007 at 09:14:07PM +0100, Claus Klein wrote:
>On Wednesday 17 January 2007 19:13, Bernhard Fischer wrote:
>> On Wed, Jan 17, 2007 at 08:33:04AM +0100, Claus Klein wrote:
>> >Hi all!
>> >
>> >I'm not able to build uClibc daily snapshot:
>> >
>> ># Host: Linux P3linux 2.6.16.21-0.25-default #1 Tue Sep 19 07:26:15 UTC 2006 i686 i686 i386 GNU/Linux
>> ># Target Architecture (powerpc)
>> >
>> >make[1]: Leaving directory `/home/claus/src/buildroot/toolchain_build_powerpc/uClibc'
>> >touch -c /home/claus/src/buildroot/toolchain_build_powerpc/uClibc/lib/libc.a
>> >make -C /home/claus/src/buildroot/toolchain_build_powerpc/uClibc \
>> >        PREFIX= \
>> >        DEVEL_PREFIX=/tools/LinuxCDK/ \
>> >        RUNTIME_PREFIX=/tools/LinuxCDK/ \
>> >        install_runtime install_dev
>> >make[1]: Entering directory `/home/claus/src/buildroot/toolchain_build_powerpc/uClibc'
>> >install -d /tools/LinuxCDK/lib
>> >install -m 644 lib/lib*-0.9.29.so \
>> >        /tools/LinuxCDK/lib
>> >cd lib && tar -cf - *.so.* | tar -xf - -C /tools/LinuxCDK/lib
>> >tar: error while loading shared libraries: libpthread.so.0: ELF file data encoding not little-endian
>> >tar: error while loading shared libraries: libpthread.so.0: ELF file data encoding not little-endian
>> 
>> You don't have "." in your LD_LIBRARY_PATH, do you?
>I checked this alrady.
>That is not the problem.

Of course it is.
>
>> What is your echo $LD_LIBRARY_PATH ?
>> 
>> 
>claus at P3linux:~/src/buildroot> echo $LD_LIBRARY_PATH
>/usr/lib/qt3/lib:/usr/lib/qt3/lib:/usr/lib/qt3/lib:/usr/lib/qt3/lib:
--------------------------------------------------------------------^

fix your LD_LIBRARY_PATH, no patch needed.

HTH,
