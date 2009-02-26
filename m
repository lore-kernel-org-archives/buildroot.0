From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 26 Feb 2009 12:22:05 +0100
Subject: [Buildroot] Qtopia4 build issue
Message-ID: <20090226122205.390e848a@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

With latest SVN, Qtopia4 doesn't build on i386. The problem is that
'qmake' is being built with the target compiler instead of the host
compiler, while qmake is supposed to be executed on the host.

Buildroot's qtopia4.mk Makefile patches the Qmake configuration file to
set the correct path to the compiler.

But Qt's ./configure script looks inside the Qmake configuration to
know which compiler to use to compile Qmake itself, unless the CC and
CXX variables are overriden.

So I'm not sure what the correct fix for this issue is (maybe setting
CC and CXX ?), but there's clearly an issue here.

Anyone having the same problem ?

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
