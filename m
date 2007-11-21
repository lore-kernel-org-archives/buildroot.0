From: Jean-Claude Gervais <jc.gervais@videotron.ca>
Date: Wed, 21 Nov 2007 13:31:27 -0500
Subject: [Buildroot] wchar.h compilation error: empty filename in #include
Message-ID: <1195669887.9559.2.camel@mercury.sprymusic>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I am getting a build error:

[...]
buildroot/build_i586/staging_dir/usr/bin/i586-linux-uclibc-gcc -Os -pipe
-Ibuildroot/build_i586/staging_dir/usr/include
-Ibuildroot/build_i586/staging_dir/include
--sysroot=buildroot/build_i586/staging_dir/ -isysroot
buildroot/build_i586/staging_dir -mtune=i586 -march=i586  -I. -g -O2 -c
mbchar.c
In file included from mbchar.h:157,
                 from mbchar.c:22:
./wchar.h:41:12: error: empty filename in #include
In file included from mbchar.c:22:
mbchar.h:242: error: expected ')' before 'wc'
make[3]: Leaving directory `buildroot/build_i586/coreutils-6.9/lib'
[...]

contents of wchar.h
-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
/* DO NOT EDIT! GENERATED AUTOMATICALLY! */
/* A substitute for ISO C99 <wchar.h>, for platforms that have issues.
   [...]
/*
 * ISO C 99 <wchar.h> for platforms that have issues.
 * <http://www.opengroup.org/susv3xbd/wchar.h.html>
 *
 * For now, this just ensures proper prerequisite inclusion order.
 */

#ifndef _GL_WCHAR_H
#define _GL_WCHAR_H

/* Tru64 with Desktop Toolkit C has a bug: <stdio.h> must be included
before
   <wchar.h>.
   BSD/OS 4.0.1 has a bug: <stddef.h>, <stdio.h> and <time.h> must be
   included before <wchar.h>.  */
#include <stddef.h>
#include <stdio.h>
#include <time.h>

/* Include the original <wchar.h>.  */
#include ""

#endif /* _GL_WCHAR_H */
-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.

As you can see, the #include directive at the end of wchar.h IS empty.
Does anyone know what is causing that or what I should do to correct the
problem?
I'd rather not manually edit wchar.h because it claims to be
automatically-generated, so if I make any further changes to the setup,
my change will probably keep being overwritten.

Thanks
J
