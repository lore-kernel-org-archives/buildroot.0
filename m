From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 1 Nov 2018 22:44:53 +0100
Subject: [Buildroot] [PATCH 1/1] ltp-testsuite: Backport compilation fix
 from upstream
In-Reply-To: <20181017205917.9536-1-petr.vorel@gmail.com>
References: <20181017205917.9536-1-petr.vorel@gmail.com>
Message-ID: <20181101224453.3dcb6b81@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 17 Oct 2018 22:59:17 +0200, Petr Vorel wrote:
> LTP fails to build 20180926 with both glibc 2.28 and uclibc-ng 1.0.30,
> due error in m4 macro check:
> 
> In file included from /home/rclinux/rc-buildroot-test/scripts/instance-0/output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/include/sys/stat.h:446:0,
>                  from ../../../../include/tst_safe_macros.h:26,
>                  from ../../../../include/tst_test.h:85,
>                  from statx05.c:27:
> /home/rclinux/rc-buildroot-test/scripts/instance-0/output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/include/bits/statx.h:87:5: note: expected 'struct statx * restrict' but argument is of type 'struct statx *'
>  int statx (int __dirfd, const char *__restrict __path, int __flags,
>      ^~~~~
> <builtin>: recipe for target 'statx01' failed
> make[5]: *** [statx01] Error 1
> <builtin>: recipe for target 'statx05' failed
> make[5]: *** [statx05] Error 1
> 
> This patch requires to regenerate configure.
> 
> Fixes:
> http://autobuild.buildroot.net/results/69566d0c728970a6dd6a793b08c5804df3cc00eb
> http://autobuild.buildroot.net/results/3c53ddfaca70b490a401c9123602965f3803cd0a
> http://autobuild.buildroot.net/results/8fb63f627a4ba55afea49ad0566064d20021889a
> http://autobuild.buildroot.net/results/496a1b40d378eaca98e532c03afb47e5291427b3
> http://autobuild.buildroot.net/results/47abceeda8044029b6d3200f3877d4d2c494202c
> 
> Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
> Reported-by: Florian La Roche <F.LaRoche@pilz.de>
> ---
> Hi, Thomas,

Applied to master, thanks. I simply tweaked the commit title because
"backport compilation fix from upstream is a bit vague".

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
