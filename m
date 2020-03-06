From: lpdev at cordier.org <lpdev@cordier.org>
Date: Fri,  6 Mar 2020 15:42:42 +0100 (CET)
Subject: [Buildroot] update --march= for x86_64
Message-ID: <ea-mime-5e626162-549c-4ada36db@www-1.netcourrier.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

GCC has evolved a lot since 4.x versions. It seems that some target architectures are not available anymore (like corei7 and corei7-avx). GCC has moved to processor family names (like sandybridge, ivybridge) for the --march= parameter.

These new nqmes can be checked here:

- For old gcc: https://gcc.gnu.org/onlinedocs/gcc-4.8.5/gcc/i386-and-x86-64-Options.html#i386-and-x86-64-Options
- For gcc 7: https://gcc.gnu.org/onlinedocs/gcc-7.5.0/gcc/x86-Options.html#x86-Options

I can send a serie of patches for moving (or adding) from old march to new march syntax, by adding some of the most used intel processors that are used for embedded systems (low power cores i3/i5/i7-U, some atom x series and intel mXXX series).

Before working on this, I would like to have an advice from a toolchain guru if possible.

Thanks!

Louis-Paul CORDIER
