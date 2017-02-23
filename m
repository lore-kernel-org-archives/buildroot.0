From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 23 Feb 2017 22:04:24 +0100
Subject: [Buildroot] [PATCH] qt5webkit: disable for MIPS soft-float
In-Reply-To: <20170222163654.305-1-Vincent.Riera@imgtec.com>
References: <20170222163654.305-1-Vincent.Riera@imgtec.com>
Message-ID: <20170223220424.712b8fd9@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 22 Feb 2017 16:36:54 +0000, Vicente Olivert Riera wrote:

> diff --git a/package/qt5/qt5webkit/Config.in b/package/qt5/qt5webkit/Config.in
> index e9c11fb..4613550 100644
> --- a/package/qt5/qt5webkit/Config.in
> +++ b/package/qt5/qt5webkit/Config.in
> @@ -9,6 +9,7 @@ config BR2_PACKAGE_QT5WEBKIT
>  	depends on !BR2_STATIC_LIBS
>  	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE
>  	depends on !BR2_BINFMT_FLAT # icu
> +	depends on !BR2_MIPS_SOFT_FLOAT

I've added a comment above this line to explain why this dependency
exists.

>  	help
>  	  Qt is a cross-platform application and UI framework for
>  	  developers using C++.

And I've propagated the dependency to the Config.in comment in this
file.

Applied to master with those two issues fixed. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
