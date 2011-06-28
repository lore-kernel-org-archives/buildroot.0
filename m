From: Sven Neumann <s.neumann@raumfeld.com>
Date: Tue, 28 Jun 2011 22:02:50 +0200
Subject: [Buildroot] problems compiling uclibc for Geode (i386)
Message-ID: <1309291371.21632.5.camel@bender>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I am currently trying to update our buildroot system to the latest
version that I pulled from your git repository yesterday. Things work
reasonably well and I have everything compiling fine for the ARM
platform. The Geode platform however is causing trouble when it comes to
compiling uclibc 0.9.32.

First I had to fix a compile problem by pulling in this patch from the
uclibc repository:
http://git.uclibc.org/uClibc/patch/?id=8245f3b4638fdff2011c2657af1bb211def704bc


But now I am stuck with this linker error:

  LD libuClibc-0.9.32.so
libc/libc_so.a(err.os):(.text.vwarn_work+0x127): undefined reference to
`__lll_unlock_wake_private'
collect2: ld returned 1 exit status
make[1]: *** [lib/libc.so] Error 1
make[1]: Leaving directory
`/home/sven/git/buildroot/output/toolchain/uClibc-0.9.32'

Any ideas?


Thanks in advance,
Sven
