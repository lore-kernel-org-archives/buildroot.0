From: joyful at sonic.net <joyful@sonic.net>
Date: Fri, 1 Jan 2010 14:59:03 -0800
Subject: [Buildroot] uclibc/buildroot build error
In-Reply-To: <87hbr9v866.fsf@macbook.be.48ers.dk>
References: <8351cdc2a3a8abf9b1f031824d6770e4.squirrel@webmail.sonic.net>
	<87fx772veo.fsf@macbook.be.48ers.dk>
	<d8fdfca5396745cde67af9bc66e27177.squirrel@webmail.sonic.net>
	<87oclsxbyz.fsf@macbook.be.48ers.dk>
	<62f4f618adb8f0fb041b8033370948f3.squirrel@webmail.sonic.net>
	<87fx73xxrk.fsf@macbook.be.48ers.dk>
	<e14e708720ddfeae76da70a20047b110.squirrel@webmail.sonic.net>
	<877hsdwchq.fsf@macbook.be.48ers.dk>
	<ca97c59d98e2891cf752ddf02b2de681.squirrel@webmail.sonic.net>
	<99c29bc6a922cbb004b34bdc010362dd.squirrel@webmail.sonic.net>
	<87hbr9v866.fsf@macbook.be.48ers.dk>
Message-ID: <d381f021a8d03bf54f7d3a16b75115f1.squirrel@webmail.sonic.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Happy New Year, Peter.
I deleted that buildroot to try different configuration already, so I
don't have that exactly buildroot .config file. But when my new try, I got
new error. The error message is below and the .config is attached:

       then mv -f ".deps/losetup-lomount.Tpo" ".deps/losetup-lomount.Po";
else rm -f ".deps/losetup-lomount.Tpo"; exit 1; fi
/tmp/buildroot-2009.11/output/staging/usr/bin/i686-linux-uclibc-gcc  -g
-O2   -o losetup  losetup-lomount.o
sh swap.configure

Your libc thinks that swapon has 1 arg only.

if /tmp/buildroot-2009.11/output/staging/usr/bin/i686-linux-uclibc-gcc
-DLOCALEDIR=\"\" -DHAVE_CONFIG_H   -include ../config.h -I../
include -DHAVE_NFS -fsigned-char -fomit-frame-pointer   -g -O2 -MT
swapon.o -MD -MP -MF ".deps/swapon.Tpo" -c -o swapon.o swapon.c;
\
       then mv -f ".deps/swapon.Tpo" ".deps/swapon.Po"; else rm -f
".deps/swapon.Tpo"; exit 1; fi
swapon.c:86: error: expected declaration specifiers or '...' before 'swapon'
swapon.c:86: error: expected declaration specifiers or '...' before 'path'
swapon.c:86: error: expected declaration specifiers or '...' before 'flags'
swapon.c:88: error: expected declaration specifiers or '...' before 'swapoff'
swapon.c:88: error: expected declaration specifiers or '...' before 'path'
swapon.c: In function 'swapon_all':
swapon.c:328: error: 'R_OK' undeclared (first use in this function)
swapon.c:328: error: (Each undeclared identifier is reported only once
swapon.c:328: error: for each function it appears in.)
make[3]: *** [swapon.o] Error 1
make[3]: Leaving directory
`/tmp/buildroot-2009.11/output/build/util-linux-2.13-pre7/mount'
make[2]: *** [all-recursive] Error 1
make[2]: Leaving directory
`/tmp/buildroot-2009.11/output/build/util-linux-2.13-pre7'
make[1]: *** [all] Error 2
make[1]: Leaving directory
`/tmp/buildroot-2009.11/output/build/util-linux-2.13-pre7'
make: ***
[/tmp/buildroot-2009.11/output/build/util-linux-2.13-pre7/misc-utils/chkdupexe]
Error 2

Very strange thing is that if I keep type "make", it will ignore the error
and continue build next step, with another different error, then "make"
will be able to keep moving forward.

>>>>>> "joyful" == joyful  <joyful@sonic.net> writes:
>
> Hi,
>
>  joyful> I selected few more package and build root gave more errors:
>
>  >>>> rsync 3.0.6 Building
>  joyful>
>  joyful> /usr/bin/make -j1 -C /tmp/buildroot/output/build/rsync-3.0.6/
>  joyful> make[1]: Entering directory
>  joyful> `/tmp/buildroot/output/build/rsync-3.0.6' In file included from
>  joyful> ./rsync.h:886, from ./rounding.c:20: ./lib/addrinfo.h:141:
>  joyful> error: redefinition of 'struct sockaddr_storage' Failed to
>  joyful> create rounding.h!  make[1]: *** [rounding.h] Error 1 make[1]:
>  joyful> Leaving directory `/tmp/buildroot/output/build/rsync-3.0.6'
>  joyful> make: ***
>  joyful> [/tmp/buildroot/output/build/rsync-3.0.6/.stamp_built] Error 2
>
> Please post your .config. Rsync builds here on powerpc and ARM without
> any problems.
>
>  joyful> I also ran into error when I try to include the latest
>  joyful> bind-9.7.0rc1 to build both the named and bind-lib.  I found an
>  joyful> old bind.mk that build both named and bind_lib, but that always
>  joyful> fail, too.
>
> What error did you run into?
>
> --
> Bye, Peter Korsgaard
>
>
-------------- next part --------------
An embedded and charset-unspecified text was scrubbed...
Name: config
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100101/c6b01871/attachment.diff>
