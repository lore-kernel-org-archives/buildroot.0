From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 8 Feb 2017 09:56:53 +0100
Subject: [Buildroot] [PATCH 1/2] package/qt5: remove menu comment about
 depreceted modules
In-Reply-To: <1486517040-8075-2-git-send-email-mr.zoltan.gyarmati@gmail.com>
References: <1486517040-8075-1-git-send-email-mr.zoltan.gyarmati@gmail.com>
 <1486517040-8075-2-git-send-email-mr.zoltan.gyarmati@gmail.com>
Message-ID: <20170208095653.7434a5a8@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

In the title: depreceted -> deprecated

On Wed,  8 Feb 2017 02:23:59 +0100, Zoltan Gyarmati wrote:

> diff --git a/package/qt5/qt5enginio/Config.in b/package/qt5/qt5enginio/Config.in
> index fcb866c..dba75e2 100644
> --- a/package/qt5/qt5enginio/Config.in
> +++ b/package/qt5/qt5enginio/Config.in
> @@ -10,4 +10,7 @@ config BR2_PACKAGE_QT5ENGINIO
>  
>  	  This package corresponds to the qt5enginio module.
>  
> +	  This package has been tagged as deprecated since version
> +	  5.6 and not recommended for new design.
> +
>  	  http://qt.io

That was not the only change done in the patch series that bumped to
5.8. What was done was:

 1. qt5enginio: move into legacy compatibility
 2. qt53d/qt5quickcontrols2/qt5serialbus: move out of tech preview

So your patch takes care of (1), but not (2). I.e for the qt53d,
qt5quickcontrols2 and qt5serialbus, there should be a note that says:
"This module was in tech preview in Qt 5.6, and promoted to a core
module in Qt ...".

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
