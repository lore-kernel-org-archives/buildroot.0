From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 20 Sep 2016 21:14:56 +0200
Subject: [Buildroot] [PATCH v2] python-pyqt5: new package
In-Reply-To: <20160823092606.1462-1-develop@manuel-voegele.de>
References: <20160819134225.1490-3-develop@manuel-voegele.de>
 <20160823092606.1462-1-develop@manuel-voegele.de>
Message-ID: <20160920211456.7dc36850@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I've applied your patch, after doing just a small change to it, see
below.

On Tue, 23 Aug 2016 11:26:06 +0200, Manuel V?gele wrote:

> new file mode 100644
> index 0000000..98c709e
> --- /dev/null
> +++ b/package/python-pyqt5/Config.in
> @@ -0,0 +1,17 @@
> +comment "python-pyqt5 needs a toolchain w/ wchar, NPTL, C++, dynamic library"
> +        depends on !BR2_PACKAGE_QT

This line is unrelated (mentions Qt, while this package is for Qt5),
and in fact not needed: this package is *selecting* Qt5, so there is
no need to take into account a Qt dependency here.

> +        depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_STATIC_LIBS

This line is intended with spaces, while it should have been intended
with a tab. Also, it was too long, so I've split the line.

I've fixed those minor details and applied.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
