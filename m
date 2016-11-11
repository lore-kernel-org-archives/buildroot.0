From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 11 Nov 2016 15:16:13 +0100
Subject: [Buildroot] [PATCH] jasper: security bump to version 1.900.22
In-Reply-To: <3bcba6e589068f92853a6c7a7fb43f6b7c0c9968.1478800479.git.baruch@tkos.co.il>
References: <3bcba6e589068f92853a6c7a7fb43f6b7c0c9968.1478800479.git.baruch@tkos.co.il>
Message-ID: <20161111151613.479ca977@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 10 Nov 2016 19:54:39 +0200, Baruch Siach wrote:
> Fixes:
> CVE-2016-8693: Double free vulnerability in mem_close
> CVE-2016-8692: Divide by zero in jpc_dec_process_siz
> CVE-2016-8691: Divide by zero in jpc_dec_process_siz
> CVE-2016-8690: Null pointer dereference in bmp_getdata triggered by crafted
> BMP image
> CVE-2016-2089: matrix rows_ NULL pointer dereference in jas_matrix_clip()
> CVE-2016-8886: memory allocation failure in jas_malloc
> CVE-2016-8887: Null pointer dereference in jp2_colr_destroy
> CVE-2016-8884, CVE-2016-8885: Null pointer dereference in bmp_getdata
> (incomplete fix for CVE-2016-8690)
> CVE-2016-8880: Heap buffer overflow in jpc_dec_cp_setfromcox()
> CVE-2016-8881: Heap buffer overflow in jpc_getuint16()
> CVE-2016-8882: Null pointer access in jpc_pi_destroy
> CVE-2016-8883: Assert in jpc_dec_tiledecode()
> 
> Drop upstream patches.
> 
> Change SITE to the official download location, since the current one does not
> have the updated version. Unfortunately, the official site only offers tar.gz.
> 
> Fix license. It is "based on the MIT license", but not exactly the same
> (http://www.ece.uvic.ca/~frodo/jasper/; under "Legal Issues").
> 
> Drop autoreconf; the autotools version has been updated since commit
> 324ccec90d (jasper: autoreconf to fix rpath issue) that introduced it.
> 
> Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  package/jasper/0001-fix-CVE-2014-9029.patch   |  36 ---
>  package/jasper/0002-fix-CVE-2014-8138.patch   |  18 --
>  package/jasper/0003-fix-CVE-2014-8137-1.patch |  47 ----
>  package/jasper/0004-fix-CVE-2014-8137-2.patch |  18 --
>  package/jasper/0005-fix-CVE-2014-8157.patch   |  17 --
>  package/jasper/0006-fix-CVE-2014-8158.patch   | 334 --------------------------
>  package/jasper/0007-preserve-cflags.patch     |  27 ---
>  package/jasper/0008-fix-CVE-2016-2116.patch   |  18 --
>  package/jasper/0009-fix-CVE-2016-1577.patch   |  18 --
>  package/jasper/0010-fix-CVE-2016-1867.patch   |  16 --
>  package/jasper/0011-fix-CVE-2015-5221.patch   |  23 --
>  package/jasper/0012-fix-CVE-2015-5203.patch   | 187 --------------
>  package/jasper/jasper.hash                    |   2 +-
>  package/jasper/jasper.mk                      |   9 +-
>  14 files changed, 4 insertions(+), 766 deletions(-)
>  delete mode 100644 package/jasper/0001-fix-CVE-2014-9029.patch
>  delete mode 100644 package/jasper/0002-fix-CVE-2014-8138.patch
>  delete mode 100644 package/jasper/0003-fix-CVE-2014-8137-1.patch
>  delete mode 100644 package/jasper/0004-fix-CVE-2014-8137-2.patch
>  delete mode 100644 package/jasper/0005-fix-CVE-2014-8157.patch
>  delete mode 100644 package/jasper/0006-fix-CVE-2014-8158.patch
>  delete mode 100644 package/jasper/0007-preserve-cflags.patch
>  delete mode 100644 package/jasper/0008-fix-CVE-2016-2116.patch
>  delete mode 100644 package/jasper/0009-fix-CVE-2016-1577.patch
>  delete mode 100644 package/jasper/0010-fix-CVE-2016-1867.patch
>  delete mode 100644 package/jasper/0011-fix-CVE-2015-5221.patch
>  delete mode 100644 package/jasper/0012-fix-CVE-2015-5203.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
