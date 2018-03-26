From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 26 Mar 2018 23:48:45 +0200
Subject: [Buildroot] [Patch v3 1/3] ninja: new package
In-Reply-To: <1466796149-25218-2-git-send-email-eric.le.bihan.dev@free.fr>
References: <1466796149-25218-1-git-send-email-eric.le.bihan.dev@free.fr>
 <1466796149-25218-2-git-send-email-eric.le.bihan.dev@free.fr>
Message-ID: <20180326234845.6049b5ca@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Eric,

On Fri, 24 Jun 2016 21:22:27 +0200, Eric Le Bihan wrote:

> +NINJA_VERSION = v1.7.1
> +NINJA_SITE = $(call github,ninja-build,ninja,$(NINJA_VERSION))
> +NINJA_LICENSE = Apache-2.0
> +NINJA_LICENSE_FILES = COPYING
> +
> +HOST_NINJA_DEPENDENCIES = $(if $(BR2_PACKAGE_PYTHON3),host-python3,host-python)

Sorry for reviving such an old thread, but do you remember why you need
host-python3 or host-python ?

Indeed, this indicates that ninja supports both Python 2.x and Python
3.x, and Buildroot already guarantees that either Python 2.x or Python
3.x is available on the system, without the need to build host-python
or host-python3.

Therefore, why do we have this dependency ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
