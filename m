From: Baruch Siach <baruch@tkos.co.il>
Date: Fri, 8 Dec 2017 10:14:00 +0200
Subject: [Buildroot] [PATCH v3] package/qt5scxml: new package
In-Reply-To: <1512719549-30117-1-git-send-email-b.bilas@grinn-global.com>
References: <1512719549-30117-1-git-send-email-b.bilas@grinn-global.com>
Message-ID: <20171208081400.273kki5lj7r6arte@tarshish.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Bartosz,

On Fri, Dec 08, 2017 at 08:52:29AM +0100, Bartosz Bilas wrote:
> Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>

[...]

> diff --git a/package/qt5/qt5scxml/Config.in b/package/qt5/qt5scxml/Config.in
> new file mode 100644
> index 0000000..8a582ca
> --- /dev/null
> +++ b/package/qt5/qt5scxml/Config.in
> @@ -0,0 +1,15 @@
> +config BR2_PACKAGE_QT5SCXML
> +	bool "qt5scxml"
> +	depends on BR2_PACKAGE_QT5_VERSION_LATEST

Since qt5scxml depends on BR2_PACKAGE_QT5_VERSION_LATEST ...

> +	select BR2_PACKAGE_QT5BASE
> +	help
> +	  Qt is a cross-platform application and UI framework for
> +	  developers using C++.
> +
> +	  The Qt SCXML module provides functionality
> +	  to create state machines from SCXML files.
> +
> +	  https://doc.qt.io/qt-5/qtscxml-index.html

[...]

> +ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
> +QT5SCXML_LICENSE = GPL-2.0+ or LGPL-3.0, GPL-3.0 with exception(tools), GFDL-1.3 (docs)
> +QT5SCXML_LICENSE_FILES = LICENSE.GPL3-EXCEPT LICENSE.LGPL3 LICENSE.FDL
> +else

... this is dead code.

> +QT5SCXML_LICENSE = GPL-3.0 or LGPL-2.1 with exception or LGPL-3.0, GFDL-1.3 (docs)
> +QT5SCXML_LICENSE_FILES = LICENSE.LGPL3 LICENSE.FDL
> +endif

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
