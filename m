From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 24 Nov 2017 10:04:11 +0100
Subject: [Buildroot] [PATCH v2 1/1] qt5webengine: enable build for 5.6.3
In-Reply-To: <20171123232619.29849-1-gael.portay@savoirfairelinux.com>
References: <20171123232619.29849-1-gael.portay@savoirfairelinux.com>
Message-ID: <20171124100411.1a2adc9c@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

+Yann in Cc, since there is licensing stuff involved :)

On Thu, 23 Nov 2017 18:26:19 -0500, Ga?l PORTAY wrote:

> +Upstream-Status: Merged
> +Task-number: QTBUG-57761
> +Change-Id: I29f037dfe542222b5188a33c7727c81a464a87bb
> +Reviewed-by: Allan Sandfeld Jensen <allan.jensen@qt.io>
> +Reviewed-by: Michal Klocek <michal.klocek@qt.io>
> +Signed-off-by: Ga?l PORTAY <gael.portay@savoirfairelinux.com>
> +[gportay: backport from 5.9 and merge conflicts]

Backporting from 5.9 to 5.6 raises a red flag: Qt changed its licensing
terms between 5.6 and 5.9, and you can't backport things this way,
because Qt 5.9 is under GPLv3, while Qt 5.6 is not.

However I'm not sure about the specific status of qt5webengine. Also,
its <pkg>_LICENSE variable says:

include package/qt5/qt5webengine/chromium.inc
QT5WEBENGINE_LICENSE = GPL-2.0 or LGPL-3.0 or GPL-3.0 or GPL-3.0 with exception
QT5WEBENGINE_LICENSE_FILES = LICENSE.GPL2 LICENSE.GPL3 LICENSE.GPL3-EXCEPT \
        LICENSE.GPLv3 LICENSE.LGPL3 $(CHROMIUM_LICENSE_FILES)

which I'm not sure is correct for Qt 5.6. Indeed, many of the packages
have something like this instead:

ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
QT5MULTIMEDIA_LICENSE = GPL-2.0+ or LGPL-3.0, GPL-3.0 with exception(tools), GFDL-1.3 (docs)
QT5MULTIMEDIA_LICENSE_FILES = LICENSE.GPL2 LICENSE.GPL3 LICENSE.GPL3-EXCEPT LICENSE.LGPL3 LICENSE.FDL
else
QT5MULTIMEDIA_LICENSE = GPL-3.0 or LGPL-2.1 with exception or LGPL-3.0, GFDL-1.3 (docs)
QT5MULTIMEDIA_LICENSE_FILES = LICENSE.GPLv3 LICENSE.LGPLv21 LGPL_EXCEPTION.txt LICENSE.LGPLv3 LICENSE.FDL
endif

Could you double check the license status of qt5webengine, in Qt 5.6
and Qt 5.9 respectively ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
