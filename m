From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 13 Apr 2016 22:06:46 +0200
Subject: [Buildroot] [PATCH v4] qt5webkit: restore package
In-Reply-To: <1460554835-5242-1-git-send-email-gary.bisson@boundarydevices.com>
References: <1460554835-5242-1-git-send-email-gary.bisson@boundarydevices.com>
Message-ID: <20160413220646.102e7cd5@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Thanks. Looks mostly good, but I have a few questions.

On Wed, 13 Apr 2016 15:40:35 +0200, Gary Bisson wrote:

> Since we are now using the source from the git repository, we need
> to create an empty .git/ folder to force the headers re-generation.
> https://github.com/meta-qt5/meta-qt5/blob/jethro/recipes-qt/qt5/qt5.inc#L33
> 
> Note that GPLv3 license option has been added with this release.

Yes, but I don't see any reference to GPLv3 in your license information
below.


> +ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
> +QT5WEBKIT_LICENSE = LGPLv2+, BSD-3c, BSD-2c
> +# Source files contain references to LGPL_EXCEPTION.txt but it is not included
> +# in the archive.
> +QT5WEBKIT_LICENSE_FILES += LICENSE.LGPLv21
> +else
> +QT5WEBKIT_LICENSE = LGPLv2+ (WebCore), Commercial license
> +QT5WEBKIT_REDISTRIBUTE = NO
> +endif

No reference to GPLv3 whatsoever.

Also, LGPLv2+ is not correct I believe, it should be LGPLv2.1+, as the
name of the license file suggests.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
