From: Simon Adda-Reyss <simon.addareyss@libertysurf.fr>
Date: Sun, 5 Jul 2009 15:05:04 +0200
Subject: [Buildroot] gcc on target doesnt find gnu/stubs.h ??!
Message-ID: <20090705130504.GA21416@toto>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

 I haven't used buildroot - wonderful piece of software, thank you so
much - in a few years.

 I tried it again yesterday, with
 i386 and all default options (gcc 4.3.3),  +
wchar + libintl (no pregenerated locales)
development files in target

Package selection :
  flex
  native toolchain
  make

(also BR2_GCC_SUPPORTS_SYSROOT=y)

Everything went fine, but when I mount the generated image (I also tried
to make a virtual harddisk so that I can boot it in qemu), I can't use
gcc :

I tried to compile this small program:

#include <stdio.h>
main(){
printf("bonjour\n");
return(0);
}


and I got:
In file included from /usr/include/stdio.h:28,
from hoho.c:1:
/usr/lib/gcc/i686-linux-uclibc/4.3.3/include-fixed/features.h:327:23:
error: gnu/stubs.h: No such file or directory
In file included from /usr/include/stdio.h:72,
from hoho.c:1:
/usr/include/bits/uClibc_stdio.h:33:2:
error: #error config seems to be out
of sync regarding bufsiz options
/usr/include/bits/uClibc_stdio.h:46:2:
error: #error config seems to be out
of sync regarding builtin buffer size


Same problem when I tried to compile the glib1.2 (./configure went fine)


What is wrong? 
Please help.



Thanks a lot!


Simon Adda-Reyss
