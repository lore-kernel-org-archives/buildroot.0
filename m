From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 04 Jun 2016 17:50:34 +0200
Subject: [Buildroot] [PATCH 1/2] ninja: new package
References: <1465047243-1169-1-git-send-email-eric.le.bihan.dev@free.fr>
 <1465047243-1169-2-git-send-email-eric.le.bihan.dev@free.fr>
Message-ID: <av9b2dxral.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

please try to add support for python3:

> +HOST_NINJA_DEPENDENCIES = host-python

HOST_NINJA_DEPENDENCIES = $(if $(BR2_PACKAGE_PYTHON3),host-python3,host-python)

> +define HOST_NINJA_BUILD_CMDS
> +	(cd $(@D); ./configure.py --bootstrap)
> +endef

define HOST_NINJA_BUILD_CMDS
	(cd $(@D); ./configure.py --bootstrap --verbose --with-python=$(HOST_DIR)/usr/bin/python)
endef

What is the purpose of having ninja on the target machine?

Regards, Bernd
