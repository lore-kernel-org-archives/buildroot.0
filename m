From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 29 Aug 2018 22:50:01 +0200
Subject: [Buildroot] [PATCH v2 1/1] qt5quickcontrols: update license
 file names
In-Reply-To: <20180829110517.15151-1-laurent.hartanerot@gmail.com>
References: <20180829061813.9348-1-laurent.hartanerot@gmail.com>
 <20180829110517.15151-1-laurent.hartanerot@gmail.com>
Message-ID: <20180829225001.576248e1@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Laurent,

On Wed, 29 Aug 2018 13:05:17 +0200, Laurent Hartanerot wrote:
> From: Laurent Hartanerot <laurent.hartanerot@atos.net>
> 
> Update license file name for qt5quickcontrols-5.6
> 
> Signed-off-by: Laurent Hartanerot <laurent.hartanerot@atos.net>

I have applied your patch to the master branch, after doing two
additional tweaks, see below.


> +ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
>  QT5QUICKCONTROLS_LICENSE = GPL-2.0 or GPL-3.0 or LGPL-3.0, GFDL-1.3 (docs)
>  QT5QUICKCONTROLS_LICENSE_FILES = LICENSE.GPL2 LICENSE.GPL3 LICENSE.LGPL3 LICENSE.FDL
> +else
> +QT5QUICKCONTROLS_LICENSE = GPL-2.0 or GPL-3.0 or LGPL-3.0, GFDL-1.3 (docs)

The LICENSE variable was the same in both cases, so I moved it outside
of the version condition.

> +QT5QUICKCONTROLS_LICENSE_FILES = LICENSE.FDL LICENSE.GPLv2 LICENSE.GPLv3 LICENSE.LGPLv3

I moved LICENSE.FDL to the end of the list, so that the license files
are in the same order in both versions. It doesn't change anything
functionally speaking, but is a bit more consistent.

Thanks!

Thomas Petazzoni
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
