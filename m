From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 13 Dec 2016 16:53:58 +0100
Subject: [Buildroot] [PATCH v3 2/7] qt5: bump to 5.8.0-rc
In-Reply-To: <1481641171-10407-3-git-send-email-anaumann@ultratronik.de>
References: <1481641171-10407-1-git-send-email-anaumann@ultratronik.de>
 <1481641171-10407-3-git-send-email-anaumann@ultratronik.de>
Message-ID: <20161213165358.2b899771@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 13 Dec 2016 15:59:26 +0100, Andreas Naumann wrote:

>  menuconfig BR2_PACKAGE_QT5
>  	bool "Qt5"
>  	depends on BR2_INSTALL_LIBSTDCPP
>  	depends on BR2_USE_WCHAR
>  	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8

This new dependency needs to be propagated to places where
BR2_PACKAGE_QT5 is selected:

package/python-pyqt5/Config.in: select BR2_PACKAGE_QT5

However, my feeling is that python-pyqt5 should not be selecting
BR2_PACKAGE_QT5. It should use "depends on BR2_PACKAGE_QT5", it makes
more sense. When you want python-qt5 it's really obvious that you need
Qt5, so for the user it's logical to enable Qt5 and then Python-Qt5.

Bottom line: you could add a patch in your patch series that changes
the python-qt5 package to use a "depends on".

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
