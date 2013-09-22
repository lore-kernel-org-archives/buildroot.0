From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 22 Sep 2013 15:50:36 +0200
Subject: [Buildroot] [PATCH v1 1/1] Openpowerlink: new package
In-Reply-To: <327943565.7314001.1379758800651.JavaMail.root@openwide.fr>
References: <1103454476.7313953.1379758391823.JavaMail.root@openwide.fr>
 <327943565.7314001.1379758800651.JavaMail.root@openwide.fr>
Message-ID: <20130922155036.2d967c64@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Romain Naour,

On Sat, 21 Sep 2013 12:20:00 +0200 (CEST), Romain Naour wrote:

> --- /dev/null
> +++ b/package/openpowerlink/openpowerlink.mk
> @@ -0,0 +1,92 @@
> +################################################################################
> +#
> +# openPOWERLINK

It should be lower cased completely.

> +#
> +################################################################################
> +
> +OPENPOWERLINK_VERSION = V1.08.3
> +OPENPOWERLINK_SOURCE = openPOWERLINK-$(OPENPOWERLINK_VERSION).zip
> +OPENPOWERLINK_SITE = http://downloads.sourceforge.net/project/openpowerlink/openPOWERLINK/V1.8.3
> +
> +OPENPOWERLINK_LICENSE = BSD-2c, GPLv2
> +OPENPOWERLINK_LICENSE_FILES = license.txt
> +OPENPOWERLINK_INSTALL_STAGING = YES
> +
> +ifeq ($(BR2_i386),y)
> +OPENPOWERLINK_ARCH = x86
> +endif
> +
> +ifeq ($(BR2_x86_64),y)
> +OPENPOWERLINK_ARCH = x86_64
> +endif
> +
> +OPENPOWERLINK_CONF_OPT = -DCMAKE_SYSTEM_PROCESSOR=$(OPENPOWERLINK_ARCH)
> +OPENPOWERLINK_CONF_OPT += -DCMAKE_INSTALL_PREFIX=/usr/

We normally put such things with one statement:

FOO_CONF_OPT = \
	BLEH1 \
	BLEH2

*But* in this particular case, there is no need to pass
-DCMAKE_INSTALL_PREFIX, because it is already passed by the CMake
package infrastructure.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
