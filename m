From: Ulf Samuelsson <ulf@atmel.com>
Date: Mon, 23 Jul 2007 00:49:53 +0200
Subject: [Buildroot] svn commit: trunk/buildroot:
	packagetarget/device/Atmel
References: <20070722171703.79776A4756@busybox.net>
	<46A3B766.2000808@realitydiluted.com>
Message-ID: <013701c7ccb3$1a92a960$dcc4af0a@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


> ulf at uclibc.org wrote:
>> Author: ulf
>> Date: 2007-07-22 10:17:03 -0700 (Sun, 22 Jul 2007)
>> New Revision: 19194
>> 
>> Log:
>> ATMEL_MIRROR needs to be available before toolchain is built
>> 
>> Modified:
>>    trunk/buildroot/package/Makefile.in
>>    trunk/buildroot/target/device/Atmel/Makefile.in
>> 
> Ulf,
> 
> Please do not put any platform dependent code in the 'package/Makefile.in'
> file. It does not belong there. I will revert your change.
> 


While it is used for target/device/Atmel files, it is also needed
to download binutils/gcc/gdb tarballs for AVR32 architecture support.
If it is defined in target/device/Atmel, then it is not defined during
the toolchain build. causing this to fail.

The alternative is to submit a 7-10 MB patch+ for the buildroot tree
with all the AVR32 architecture patches, which I thought was a bad idea.

If you don't like that location, you need to come up with a location
where to put the definition of ATMEL_MIRROR *before*
"include toolchain/*/*.mk" in the main Makefile

The main Makefile seems to be the only other suitable location.


Best Regards
Ulf Samuelsson
