From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 06 Apr 2018 18:57:51 +0200
Subject: [Buildroot] [PATCH] qemu: fix build with glibc 2.27
In-Reply-To: <2ea89efb89501dbb6f311d3644efb8d6543f1ba7.1521561417.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Tue, 20 Mar 2018 17:56:57 +0200")
References: <2ea89efb89501dbb6f311d3644efb8d6543f1ba7.1521561417.git.baruch@tkos.co.il>
Message-ID: <87y3i0gtm8.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > glibc version 2.27 added a wrapper for the memfd_create system call. The
 > wrapper prototype collides with a static declaration of memfd_create.
 > Add upstream patch to correctly detect the glibc provided memfd_create
 > definition.

 > Fixes:
 > http://autobuild.buildroot.net/results/b82/b825c0cd397424b1fc7fa87c580e1757dc25c588/
 > http://autobuild.buildroot.net/results/9aa/9aa3853d23c0dc72bf3632b4d66ae39f597f5250/
 > http://autobuild.buildroot.net/results/b13/b13039ba602b9d500b939d259816a39ba24e1ba2/

 > Cc: Francois Perrad <francois.perrad@gadz.org>
 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed to 2018.02.x as this is also a host package, thanks.

-- 
Bye, Peter Korsgaard
