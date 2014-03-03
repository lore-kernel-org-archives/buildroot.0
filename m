From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 3 Mar 2014 21:25:33 +0100
Subject: [Buildroot] [PATCH] wget: fix build against uclibc snapshot
In-Reply-To: <745b175536fa66c2f312ec98feadb25a8c543708.1393837610.git.baruch@tkos.co.il>
References: <745b175536fa66c2f312ec98feadb25a8c543708.1393837610.git.baruch@tkos.co.il>
Message-ID: <20140303212533.03c0f4b6@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Baruch Siach,

On Mon,  3 Mar 2014 11:06:50 +0200, Baruch Siach wrote:
> Same fix as a728e2fe3 (coreutils: fix build against uclibc snapshot).
> 
> uClibc development version adds support for POSIX spawn routines. However,
> unlike glibc these routines are in librt. This breaks gnulib autoconf
> detection. Teach gnulib autoconf to look for POSIX spawn in librt.
> 
> Fixes:
> http://autobuild.buildroot.net/results/bc20297dad0f0e9b7fa79fe835b9754fbce6dfdf/
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  .../wget-0001-spawn-fix-link-error-on-uclibc.patch | 40 ++++++++++++++++++++++
>  package/wget/wget.mk                               |  3 ++
>  2 files changed, 43 insertions(+)
>  create mode 100644 package/wget/wget-0001-spawn-fix-link-error-on-uclibc.patch

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
