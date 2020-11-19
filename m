From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 19 Nov 2020 23:11:25 +0100
Subject: [Buildroot] [PATCH v2 1/3] package/qt5/qt5coap: new package
In-Reply-To: <20201119220142.1054287-1-angelo@amarulasolutions.com>
References: <20201119220142.1054287-1-angelo@amarulasolutions.com>
Message-ID: <20201119231125.369c16bb@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Angelo,

Thanks a lot those three packages, they obviously look good. I only have one question.

On Thu, 19 Nov 2020 23:01:40 +0100
Angelo Compagnucci <angelo@amarulasolutions.com> wrote:

> +QT5COAP_VERSION = $(QT5_VERSION)
> +QT5COAP_SITE = $(call github,qt,qtcoap,v$(QT5_VERSION))
> +QT5COAP_INSTALL_STAGING = YES
> +QT5COAP_LICENSE = GPL-3.0, GFDL-1.3
> +QT5COAP_LICENSE_FILES = LICENSE.GPL3 LICENSE.FDL
> +QT5COAP_DEPENDENCIES = host-perl
> +
> +define QT5COAP_FIX_INCLUDE
> +	cd $(@D); $(HOST_DIR)/bin/syncqt.pl -module QtCoap -version $(QT5_VERSION)
> +endef

Why is this syncqt.pl invocation needed for those 3 packages? What
makes them different from the other Qt5 packages we have?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
