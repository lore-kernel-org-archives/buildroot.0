From: lists at primefarm.co.uk <lists@primefarm.co.uk>
Date: Wed, 22 Nov 2006 19:44:38 -0000 (UTC)
Subject: [Buildroot] problem generating c++ compiler for target arch
Message-ID: <33335.80.176.236.13.1164224678.squirrel@mail.primefarm.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, November 22, 2006 6:52 pm, Bernhard Fischer wrote:
> On Wed, Nov 22, 2006 at 06:06:31PM -0000, lists at primefarm.co.uk wrote:
>
>> Hi all,
>>
>>
>> I'm using buildroot to generate cross compilers for the arm 920t
>> running linux. Currently I have a working C compiler, but I really want
>> c++ working too.
>>
>> I get the following error when building (with latest svn release) with
>> fairly minimal options (I have tried to configure it so that it only
>> builds the compilers and related libs etc where possible).
>
> I take it that 3.4.6 works, yes?
> At least the index thing is fixed in 3.4.6 and later and i believe also
> the rope.
>

OK, I tried again with 3.4.6, those errors do indeed go away. I now have a
differnt set of problems (hooray!).

The error seems to center around fakeroot, although I'm no expert at
reading these error dumps.

Here is the whole lot:

CONFIG_FILES= CONFIG_HEADERS= /bin/sh ./config.status
config.status: executing depfiles commands
config.status: executing libtool commands
/bin/sh ./libtool --tag=CC --mode=link gcc  -g -O2   -o faked  faked.o
libcommunicate.la -ldl
libtool: link: gcc -g -O2 -o faked faked.o  ./.libs/libcommunicate.a -ldl
/usr/lib/libc_nonshared.a(elf-init.oS)(.gnu.linkonce.t.__i686.get_pc_thunk.bx+0x0):
In function `__i686.get_pc_thunk.bx':
: multiple definition of `__i686.get_pc_thunk.bx'
./.libs/libcommunicate.a(communicate.o)(.gnu.linkonce.t.__i686.get_pc_thunk.bx+0x0):/home/david/buildroot/toolchain_build_arm/fakeroot-1.5.8/communicate.c:72:
first defined here
collect2: ld returned 1 exit status
make[3]: *** [faked] Error 1
make[3]: Leaving directory
`/home/david/buildroot/toolchain_build_arm/fakeroot-1.5.8'
make[2]: *** [all-recursive] Error 1
make[2]: Leaving directory
`/home/david/buildroot/toolchain_build_arm/fakeroot-1.5.8'
make[1]: *** [all] Error 2
make[1]: Leaving directory
`/home/david/buildroot/toolchain_build_arm/fakeroot-1.5.8'
make: *** [/home/david/buildroot/toolchain_build_arm/fakeroot-1.5.8/faked]
Error 2



Any ideas?


David
