From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 4 Aug 2016 10:47:53 +0200
Subject: [Buildroot] [PATCH] openmpi: fix uClibc regdef.h include path
In-Reply-To: <1466592475-44093-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1466592475-44093-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20160804104753.5bd15cf2@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 22 Jun 2016 11:47:55 +0100, Vicente Olivert Riera wrote:
> In uClibc the regdef.h file is located under the sys directory. Due to
> that openmpi is failing to build with an error like this one:
> 
> atomic-asm.S:7:20: fatal error: regdef.h: No such file or directory
>  #include <regdef.h>
> 
> Add a patch in order to detect when we are building with uClibc and
> therefore include regdef.h from the right location.
> 
> Pull request sent upstream:
>   https://github.com/open-mpi/ompi-release/pull/1241
> 
> Fixes:
>   http://autobuild.buildroot.net/results/de5/de524cbef057c7c3cb45125ecf62202a2f74129c/
>   http://autobuild.buildroot.net/results/165/165bf4156b27ecea0b226550a42560f789659b03/
> 
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

This problem has actually been fixed in uClibc-ng 1.0.17, by commit
http://cgit.uclibc-ng.org/cgi/cgit/uclibc-ng.git/commit/?id=ff58e44fc38474b1898c59caf9a5e75d0d8c6c57.
We have updated Buildroot to uClibc-ng 1.0.17, so the problem will
disappear once I rebuild the MIPS toolchain.

I believe using the fix in uClibc-ng is better than a workaround in the
code itself, so I've marked your patch as rejected in patchwork.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
