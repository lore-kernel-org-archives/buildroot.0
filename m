From: Peter Seiderer <ps.report@gmx.net>
Date: Mon, 18 Jun 2018 22:44:57 +0200
Subject: [Buildroot] [PATCH 1/1] qt5base: fix license
In-Reply-To: <20180618185906.18553-1-fontaine.fabrice@gmail.com>
References: <20180618185906.18553-1-fontaine.fabrice@gmail.com>
Message-ID: <20180618224457.101ff5f3@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Fabrice,

On Mon, 18 Jun 2018 20:59:06 +0200, Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Since QT 5.11, LICENSE.GPLv3 doesn't exist anymore so use LICENSE.GPL3
> and add its hash
> Note: hashes of LICENSE.LGPLv3 and header.BSD are not the same between
> QT 5.11 and 5.6.4 but we can't add two hashes for the same file...

It is possible to add .hash file to the version sub-directory, see e.g.
package/qt5/qt5base/5.6.3/qt5base.hash and package/qt5/qt5quickcontrols2/5.6.3/qt5quickcontrols2.hash

Regards,
Peter

> 
> Fixes:
>  - http://autobuild.buildroot.net/results/b8add9b9a2defe5e64330714e9768ffa6393adc0
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/qt5/qt5base/qt5base.hash | 1 +
>  package/qt5/qt5base/qt5base.mk   | 2 +-
>  2 files changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/package/qt5/qt5base/qt5base.hash b/package/qt5/qt5base/qt5base.hash
> index 263fb84acc..937d35bdc2 100644
> --- a/package/qt5/qt5base/qt5base.hash
> +++ b/package/qt5/qt5base/qt5base.hash
> @@ -6,6 +6,7 @@ sha256 ed6e46db84f7d34923ab4eae165c63e05ab3cfa9d19a73d3f57b4e7bfd41de66  qtbase-
>  
>  # Hashes for license files:
>  sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
> +sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903 LICENSE.GPL3
>  sha256 245248009fd0af1725d183248380e476c1283383909358a13686606352bf2a17 LICENSE.GPLv3
>  sha256 0dbe024961f6ab5c52689cbd036c977975d0d0f6a67ff97762d96cb819dd5652 LICENSE.GPL3-EXCEPT
>  sha256 68afaf3392f8c04218fbf29db43cc0b18bf651c1db086556aa584046de9f3e35 LICENSE.LGPLv3
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
