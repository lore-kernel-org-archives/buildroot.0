From: Mark Corbin <mark.corbin@embecosm.com>
Date: Fri, 7 Sep 2018 10:39:51 +0100
Subject: [Buildroot] RISC-V Shared Library Locations
Message-ID: <0b94e52f-0a99-c13c-7e3d-f37383c87e32@embecosm.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello

I've been looking at the RISC-V shared library issue reported by
Christopher McCrory[1]

For? RISC-V the glibc trusted directories for libraries are /lib64/<ABI>
and /usr/lib64/<ABI>, so for example, /lib64/lp64/ and /usr/lib64/lp64/
instead of the more common /lib64/ and /usr/lib64/. When you add extra
packages that require shared libraries the libraries are installed to
/usr/lib64/ and are therefore not found.

I was wondering if anybody has any thoughts on where/how this should be
fixed-up?

...modify package makefiles to install libraries to the 'ABI' locations?
...add LD_LIBRARY_PATH or ld.so.conf to the skeleton image and include
the 'non-ABI' locations?
...modify the glibc build configuration to use the 'non-ABI' locations?
...generate a set of symbolic links for each library file to point from
the 'ABI' locations to the '.../lib64' directories? For example,
/usr/lib64/lp64/libncurses.so -> ../libncurses.so

Any ideas would be much appreciated.

Thanks

Mark


[1] http://lists.busybox.net/pipermail/buildroot/2018-September/229685.html

-- 
Mark Corbin
Embecosm Ltd.
https://www.embecosm.com
