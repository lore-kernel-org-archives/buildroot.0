From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 11 Feb 2018 10:14:45 +0100
Subject: [Buildroot] [PATCH 1/1] qt5webkit: add missing icu dependency
In-Reply-To: <20180211020330.32658-1-gael.portay@savoirfairelinux.com>
References: <20180211020330.32658-1-gael.portay@savoirfairelinux.com>
Message-ID: <20180211101445.51c63dab@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 10 Feb 2018 21:03:30 -0500, Ga?l PORTAY wrote:

> The Config.in is already selecting BR2_PACKAGE_QT5BASE_ICU but the
> dependency is missing from the QT5WEBKIT_DEPENDENCIES list in
> qt5webkit.mk.

And qt5base.mk has:

QT5BASE_DEPENDENCIES   += $(if $(BR2_PACKAGE_QT5BASE_ICU),icu)

and in turn, qt5webkit depends on qt5base.

Therefore, I don't see how you can fall into the situation where the
qt5webkit build is started without icu being already built.

Could you explain ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
http://bootlin.com
