From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 5 Jul 2015 14:59:40 +0200
Subject: [Buildroot] [PATCH v8 5/7] package/opencv: add gtk3 support
In-Reply-To: <1436089229-21103-6-git-send-email-s.martin49@gmail.com>
References: <1436089229-21103-1-git-send-email-s.martin49@gmail.com>
 <1436089229-21103-6-git-send-email-s.martin49@gmail.com>
Message-ID: <20150705145940.58041137@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Samuel Martin,

On Sun,  5 Jul 2015 11:40:27 +0200, Samuel Martin wrote:
> Fully rework the GTK support in OpenCV because it now supports gtk-2 and
> gtk-3 (but only one at the time).
> Note that, in the build-system, the gtk support is only available when
> Qt support is disabled; so make sure the menuconfig reflects this.

Nothing in the patch is doing that. You're anyway using a "choice", so
the user can only decide one of gtk2, gtk3, qt4 or qt5. So this comment
in the commit log doesn't make sense.


> +config BR2_PACKAGE_OPENCV_WITH_GTK3
> +	bool "gtk3"
> +	depends on BR2_ARCH_HAS_ATOMICS # libgtk3 -> cairo
> +	depends on BR2_USE_MMU # libgtk3 -> libglib2
> +	depends on BR2_USE_WCHAR # libgtk3 -> libglib2
> +	depends on BR2_TOOLCHAIN_HAS_THREADS # libgtk3 -> libglib2
> +	depends on BR2_INSTALL_LIBSTDCPP
> +	select BR2_PACKAGE_LIBGTK3

Please use a depends on BR2_PACKAGE_LIBGTK3, so that things are
consistent with qt4 and qt5 (unless of course you switch to a select
for Qt4/Qt5 following my previous comments). But in any case, be
*consistent*.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
