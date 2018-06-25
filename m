From: Peter Seiderer <ps.report@gmx.net>
Date: Mon, 25 Jun 2018 21:21:13 +0200
Subject: [Buildroot] [PATCH v2,1/1] qt5base: fix license
In-Reply-To: <20180618213620.22387-1-fontaine.fabrice@gmail.com>
References: <20180618213620.22387-1-fontaine.fabrice@gmail.com>
Message-ID: <20180625212113.66ac335d@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Fabrice,

On Mon, 18 Jun 2018 23:36:20 +0200, Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - Since QT 5.11, LICENSE.GPLv3 doesn't exist anymore so use LICENSE.GPL3
>   and add its hash
> - Update hash of LICENSE.LGPLv3 (as it now makes a reference to
>   LICENSE.GPL3 instead of LICENSE.GPLv3)
> - Update hash of header.BSD (year is now YYYY instead of 2016)
> 
> Fixes:
>  - http://autobuild.buildroot.net/results/b8add9b9a2defe5e64330714e9768ffa6393adc0
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Reviewed-by: Peter Seiderer <ps.report@gmx.net>

Regards,
Peter

> ---
> Changes v1 -> v2 (after review of Peter Seiderer):
>  - Update hashes for LICENSE.LGPLv3 and header.BSD
>  - Remove hash of LICENSE.GPLv3
> 
>  package/qt5/qt5base/qt5base.hash | 6 +++---
>  package/qt5/qt5base/qt5base.mk   | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/qt5/qt5base/qt5base.hash b/package/qt5/qt5base/qt5base.hash
> index 263fb84acc..896cfb5f06 100644
> --- a/package/qt5/qt5base/qt5base.hash
> +++ b/package/qt5/qt5base/qt5base.hash
> @@ -6,9 +6,9 @@ sha256 ed6e46db84f7d34923ab4eae165c63e05ab3cfa9d19a73d3f57b4e7bfd41de66  qtbase-
>  
>  # Hashes for license files:
>  sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
> -sha256 245248009fd0af1725d183248380e476c1283383909358a13686606352bf2a17 LICENSE.GPLv3
> +sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903 LICENSE.GPL3
>  sha256 0dbe024961f6ab5c52689cbd036c977975d0d0f6a67ff97762d96cb819dd5652 LICENSE.GPL3-EXCEPT
> -sha256 68afaf3392f8c04218fbf29db43cc0b18bf651c1db086556aa584046de9f3e35 LICENSE.LGPLv3
> +sha256 88ec689407cf2df9b2eb5c45952564d51ce73c129a3bdffb15c0d2d161ad7558 LICENSE.LGPLv3
>  sha256 ed8742a95cb9db653a09b050e27ccff5e67ba69c14aa2c3137f2a4e1892f6c0d LICENSE.FDL
> -sha256 8fdefa0b45d9f791f687da6c2c4c83c1b701aaee2c08008f55d522af214b88f0 header.BSD
> +sha256 1f4fa3d202198f5d836993748eac9d91157e2cec7fb8426f56000a02a677cdc5 header.BSD
>  sha256 2a886915de4f296cdae5ed67064f86dba01d0c55286d86e8487f2a5caaf40216 src/3rdparty/harfbuzz-ng/COPYING
> diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
> index 1eabd7a15b..d5b25abcb8 100644
> --- a/package/qt5/qt5base/qt5base.mk
> +++ b/package/qt5/qt5base/qt5base.mk
> @@ -56,7 +56,7 @@ endif
>  QT5BASE_CONFIGURE_OPTS += -opensource -confirm-license
>  ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
>  QT5BASE_LICENSE = GPL-2.0+ or LGPL-3.0, GPL-3.0 with exception(tools), GFDL-1.3 (docs)
> -QT5BASE_LICENSE_FILES = LICENSE.GPL2 LICENSE.GPLv3 LICENSE.GPL3-EXCEPT LICENSE.LGPLv3 LICENSE.FDL
> +QT5BASE_LICENSE_FILES = LICENSE.GPL2 LICENSE.GPL3 LICENSE.GPL3-EXCEPT LICENSE.LGPLv3 LICENSE.FDL
>  else
>  QT5BASE_LICENSE = GPL-3.0 or LGPL-2.1 with exception or LGPL-3.0, GFDL-1.3 (docs)
>  QT5BASE_LICENSE_FILES = LICENSE.GPLv3 LICENSE.LGPLv21 LGPL_EXCEPTION.txt LICENSE.LGPLv3 LICENSE.FDL
