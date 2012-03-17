From: PHilip RUshik <prushik@gmail.com>
Date: Sat, 17 Mar 2012 12:52:52 +0900
Subject: [Buildroot] Struggling with buildroot native compiler (or rather,
	the linker)
Message-ID: <CAGmOtePuxRAt5L4E-7aM-NQJfoiezfQ0W-1WQmk+11+oZDX3sw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I've gotten pretty good at using buildroot and adding new packages and all
that, the one thing which I just can't make work reliably is the native
compiler (and leafpad, which corrupts all files that it saves).
First of all, like I mentioned in another email, it always tries to link
with /usr/lib/libc.a even when not compiling regular dynamically linked
executables. The suggested fix was to softlink /lib/libc.so.0 to
/usr/lib/libc.so. Seemed like a good solution to me, and it seems to do
what its supposed to do, the linker finds that one instead of libc.a and
tries to link against that, however, the problem is that it always fails,
complaining about undefined symbols in /usr/lib/libc.so. The ones that I
remember it mentioning specifically are malloc and calloc, which I thought
was weird as they should be part of libc, yes?
Any ideas?

The code I was trying to compile looked like this

#include <stdio.h>

int main()
{
      return 0;
}



 ---PHil
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120317/226929d6/attachment.html>
