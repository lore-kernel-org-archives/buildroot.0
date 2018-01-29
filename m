From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 29 Jan 2018 23:16:55 +0100
Subject: [Buildroot] [PATCH 1/1] ltp-testsuite: Add upstream patch to
 fix build numa detection
In-Reply-To: <20180129202314.16767-1-petr.vorel@gmail.com>
References: <20180129202314.16767-1-petr.vorel@gmail.com>
Message-ID: <20180129231655.561070fc@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 29 Jan 2018 21:23:14 +0100, Petr Vorel wrote:
> This removes fix added in commit 3c937807a3 ("ltp-testsuite: disable numa tests")
> 
> Signed-off-by: Petr Vorel <petr.vorel@gmail.com>

Thanks for this update. There is however an issue, see below.

> ---
>  ...x-numa-v2-detection-for-cross-compilation.patch | 37 ++++++++++++++++++++++
>  package/ltp-testsuite/ltp-testsuite.mk             |  3 +-
>  2 files changed, 38 insertions(+), 2 deletions(-)
>  create mode 100644 package/ltp-testsuite/0002-numa-Fix-numa-v2-detection-for-cross-compilation.patch
> 
> diff --git a/package/ltp-testsuite/0002-numa-Fix-numa-v2-detection-for-cross-compilation.patch b/package/ltp-testsuite/0002-numa-Fix-numa-v2-detection-for-cross-compilation.patch
> new file mode 100644
> index 0000000000..6ad1db046e
> --- /dev/null
> +++ b/package/ltp-testsuite/0002-numa-Fix-numa-v2-detection-for-cross-compilation.patch
> @@ -0,0 +1,37 @@
> +From 01c134f30be755a43af12a4ae2c31177d04be790 Mon Sep 17 00:00:00 2001
> +From: Petr Vorel <pvorel@suse.cz>
> +Date: Mon, 29 Jan 2018 10:31:40 +0100
> +Subject: [PATCH] numa: Fix numa v2 detection for cross compilation
> +
> +Changed to AC_COMPILE_IFELSE as AC_RUN_IFELSE cannot be run while
> +cross compiling.
> +
> +Bug found by Buildroot project.
> +
> +Signed-off-by: Petr Vorel <pvorel@suse.cz>
> +Reported-by: Baruch Siach <baruch@tkos.co.il>
> +---
> + m4/ltp-numa.m4 | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)

You are changing m4 files, which requires regenerating the configure
script. Therefore, the package should have LTP_TESTSUITE_AUTORECONF =
YES, with a comment above it that says it's needed for patch
0002-numa-Fix-numa-v2-detection-for-cross-compilation.patch.

Could you check this, and submit an updated version?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
