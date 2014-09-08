From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 8 Sep 2014 14:51:43 +0200
Subject: [Buildroot] [PATCH] qt4 webkit: Disable for MIPS64 n32
In-Reply-To: <1410178635-53697-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1410178635-53697-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20140908145143.55d5a2fb@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Vicente Olivert Riera,

On Mon, 8 Sep 2014 13:17:15 +0100, Vicente Olivert Riera wrote:

>  config BR2_PACKAGE_QT_WEBKIT
>  	bool "WebKit Module"
> +	# qt-4.8.6 webkit: fails to compile on MIPS64 n32 platforms
> +	# https://bugreports.qt-project.org/browse/QTBUG-39224
> +	depends on !BR2_MIPS_NABI32
>  	depends on BR2_PACKAGE_QT_SHARED
>  	depends on BR2_PACKAGE_QT_GUI_MODULE
>  	depends on BR2_PACKAGE_QT_NETWORK

No. As explained in a separate thread, you should use
BR2_PACKAGE_QT_ARCH_SUPPORTS_WEBKIT.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
