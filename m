From: Heikki Lindholm <holindho@cs.helsinki.fi>
Date: Tue, 17 Jul 2007 11:33:26 +0300
Subject: [Buildroot] Gcc broken on OS X
Message-ID: <469C7ED6.90402@cs.helsinki.fi>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,
Some recent changes have also broken gcc build:
cp 
/private/tmp/buildroot-devel/toolchain_build_i686/gcc-4.1.2/gcc/../fixincludes/README-fixinc 
include/README
chmod a+r include/README
echo timestamp > stmp-int-hdrs
make[3]: *** No rule to make target `/usr/bin/i686-linux-uclibc-as', 
needed by `stamp-as'.  Stop.
make[2]: *** [all-gcc] Error 2
make[1]: *** [all] Error 2
make: *** 
[/private/tmp/buildroot-devel/toolchain_build_i686/gcc-4.1.2-final/.compiled] 
Error 2

Looks like an absolute path using $prefix has crept in from somewhere.

-- hl
