From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 3 Jul 2018 06:05:08 +0300
Subject: [Buildroot] [git commit] kf5-modemmanager-qt: new package
In-Reply-To: <20180702212055.3BA2784051@busybox.osuosl.org>
References: <20180702212055.3BA2784051@busybox.osuosl.org>
Message-ID: <20180703030508.rjd2345rrh65gcbs@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Mon, Jul 02, 2018 at 11:20:34PM +0200, Thomas Petazzoni wrote: 
> diff --git a/package/kf5/kf5-modemmanager-qt/Config.in b/package/kf5/kf5-modemmanager-qt/Config.in
> new file mode 100644
> index 0000000000..c291b886f5
> --- /dev/null
> +++ b/package/kf5/kf5-modemmanager-qt/Config.in
> @@ -0,0 +1,19 @@
> +config BR2_PACKAGE_KF5_MODEMMANAGER_QT
> +	bool "kf5-modemmanager-qt"
> +	depends on BR2_USE_MMU # qt5dbus
> +	depends on BR2_TOOLCHAIN_HAS_THREADS # qt5dbus
> +	depends on BR2_PACKAGE_MODEM_MANAGER
> +	select BR2_PACKAGE_QT5BASE_DBUS
> +	select BR2_PACKAGE_KF5_EXTRA_CMAKE_MODULES
> +	help
> +	  KF5 is a set of Qt framework addons, extending Qt in various
> +	  ways, not only restricted in helping integration in KDE.
> +
> +	  This package contains the ModemManager Qt5 bindings from the
> +	  KF5 project.
> +
> +	  https://api.kde.org/frameworks/modemmanager-qt/html/index.html
> +
> +comment "kf5-modemmanager-qt needs toolchain w/ threads"
> +	depends on BR2_USE_MMU
> +	depends on !BR2_TOOLCHAIN_HAS_THREADS

Shouldn't the comment also depend on BR2_PACKAGE_MODEM_MANAGER?

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
