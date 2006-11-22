From: Bernhard Fischer <rep.nop@aon.at>
Date: Wed, 22 Nov 2006 21:02:13 +0100
Subject: [Buildroot] problem generating c++ compiler for target arch
In-Reply-To: <33335.80.176.236.13.1164224678.squirrel@mail.primefarm.co.uk>
References: <33335.80.176.236.13.1164224678.squirrel@mail.primefarm.co.uk>
Message-ID: <20061122200213.GB1863@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Nov 22, 2006 at 07:44:38PM -0000, lists at primefarm.co.uk wrote:
>On Wed, November 22, 2006 6:52 pm, Bernhard Fischer wrote:

>OK, I tried again with 3.4.6, those errors do indeed go away. I now have a
>differnt set of problems (hooray!).
>
>The error seems to center around fakeroot, although I'm no expert at
>reading these error dumps.
>
>Here is the whole lot:
>
>CONFIG_FILES= CONFIG_HEADERS= /bin/sh ./config.status
>config.status: executing depfiles commands
>config.status: executing libtool commands
>/bin/sh ./libtool --tag=CC --mode=link gcc  -g -O2   -o faked  faked.o
>libcommunicate.la -ldl
>libtool: link: gcc -g -O2 -o faked faked.o  ./.libs/libcommunicate.a -ldl
>/usr/lib/libc_nonshared.a(elf-init.oS)(.gnu.linkonce.t.__i686.get_pc_thunk.bx+0x0):
>In function `__i686.get_pc_thunk.bx':
>: multiple definition of `__i686.get_pc_thunk.bx'

>
>Any ideas?

Not sure, but it sounds like your host's toolchain is too old.
binutils-2.16.1 work for me..
