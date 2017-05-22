From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 22 May 2017 15:38:32 +0200
Subject: [Buildroot] [PATCH next] tiff: bump version to 4.0.8
In-Reply-To: <20170522101353.35805-1-Vincent.Riera@imgtec.com>
References: <20170522101353.35805-1-Vincent.Riera@imgtec.com>
Message-ID: <20170522153832.64235fec@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 22 May 2017 11:13:53 +0100, Vicente Olivert Riera wrote:
> Patch 0001 already included in this release:
>   https://github.com/vadz/libtiff/commit/438274f938e046d33cb0e1230b41da32ffe223e1
> 
> Patch 0002 already included in this release:
>   https://github.com/vadz/libtiff/commit/43bc256d8ae44b92d2734a3c5bc73957a4d7c1ec
> 
> Patch 0003 already included in this release:
>   https://github.com/vadz/libtiff/commit/1044b43637fa7f70fb19b93593777b78bd20da86
> 
> Patch 0004 already included in this release:
>   https://github.com/vadz/libtiff/commit/9a72a69e035ee70ff5c41541c8c61cd97990d018
> 
> Patch 0005 already included in this release:
>   https://github.com/vadz/libtiff/commit/5c080298d59efa53264d7248bbe3a04660db6ef7
> 
> Patch 0006 already included in this release:
>   https://github.com/vadz/libtiff/commit/48780b4fcc425cddc4ef8ffdf536f96a0d1b313b
> 
> Patch 0007 already included in this release:
>   https://github.com/vadz/libtiff/commit/d60332057b9575ada4f264489582b13e30137be1
> 
> Patch 0008 already included in this release:
>   https://github.com/vadz/libtiff/commit/2ea32f7372b65c24b2816f11c04bf59b5090d05b
> 
> Patch 0009 already included in this release:
>   https://github.com/vadz/libtiff/commit/8283e4d1b7e53340684d12932880cbcbaf23a8c1
> 
> Patch 0010 already included in this release:
>   https://github.com/vadz/libtiff/commit/47f2fb61a3a64667bce1a8398a8fcb1b348ff122
> 
> Patch 0011 already included in this release:
>   https://github.com/vadz/libtiff/commit/3cfd62d77c2a7e147a05bd678524c345fa9c2bb8
> 
> Patch 0012 already included in this release:
>   https://github.com/vadz/libtiff/commit/0a76a8c765c7b8327c59646284fa78c3c27e5490
> 
> Patch 0013 already included in this release:
>   https://github.com/vadz/libtiff/commit/66e7bd59520996740e4df5495a830b42fae48bc4
> 
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> ---
>  ..._read.c-libtiff-tiffiop.h-fix-uint32-over.patch |  46 ---------
>  ..._ojpeg.c-make-OJPEGDecode-early-exit-in-c.patch |  53 ----------
>  ..._pixarlog.c-libtiff-tif_luv.c-fix-heap-ba.patch | 110 ---------------------
>  ..._dirread.c-modify-ChopUpSingleUncompresse.patch | 107 --------------------
>  ...p.c-error-out-cleanly-in-cpContig2Separat.patch |  74 --------------
>  ..._getimage.c-add-explicit-uint32-cast-in-p.patch |  31 ------
>  ...fiop.h-tif_unix.c-tif_win32.c-tif_vms.c-a.patch |  88 -----------------
>  ..._ojpeg.c-fix-leak-in-OJPEGReadHeaderInfoS.patch |  43 --------
>  ..._ojpeg.c-fix-leak-in-OJPEGReadHeaderInfoS.patch |  36 -------
>  ..._jpeg.c-avoid-integer-division-by-zero-in.patch |  35 -------
>  ..._dirread.c-avoid-division-by-floating-poi.patch |  47 ---------
>  ..._jpeg.c-validate-BitsPerSample-in-JPEGSet.patch |  35 -------
>  ..._read.c-avoid-potential-undefined-behavio.patch |  56 -----------
>  package/tiff/tiff.hash                             |   2 +-
>  package/tiff/tiff.mk                               |   2 +-
>  15 files changed, 2 insertions(+), 763 deletions(-)
>  delete mode 100644 package/tiff/0001-libtiff-tif_read.c-libtiff-tiffiop.h-fix-uint32-over.patch
>  delete mode 100644 package/tiff/0002-libtiff-tif_ojpeg.c-make-OJPEGDecode-early-exit-in-c.patch
>  delete mode 100644 package/tiff/0003-libtiff-tif_pixarlog.c-libtiff-tif_luv.c-fix-heap-ba.patch
>  delete mode 100644 package/tiff/0004-libtiff-tif_dirread.c-modify-ChopUpSingleUncompresse.patch
>  delete mode 100644 package/tiff/0005-tools-tiffcp.c-error-out-cleanly-in-cpContig2Separat.patch
>  delete mode 100644 package/tiff/0006-libtiff-tif_getimage.c-add-explicit-uint32-cast-in-p.patch
>  delete mode 100644 package/tiff/0007-libtiff-tiffiop.h-tif_unix.c-tif_win32.c-tif_vms.c-a.patch
>  delete mode 100644 package/tiff/0008-libtiff-tif_ojpeg.c-fix-leak-in-OJPEGReadHeaderInfoS.patch
>  delete mode 100644 package/tiff/0009-libtiff-tif_ojpeg.c-fix-leak-in-OJPEGReadHeaderInfoS.patch
>  delete mode 100644 package/tiff/0010-libtiff-tif_jpeg.c-avoid-integer-division-by-zero-in.patch
>  delete mode 100644 package/tiff/0011-libtiff-tif_dirread.c-avoid-division-by-floating-poi.patch
>  delete mode 100644 package/tiff/0012-libtiff-tif_jpeg.c-validate-BitsPerSample-in-JPEGSet.patch
>  delete mode 100644 package/tiff/0013-libtiff-tif_read.c-avoid-potential-undefined-behavio.patch

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
