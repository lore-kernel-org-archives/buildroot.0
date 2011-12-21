From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 21 Dec 2011 13:42:13 +0100
Subject: [Buildroot] [PATCH] New package: python-setuptools
In-Reply-To: <1324464775-9409-1-git-send-email-yegorslists@googlemail.com>
References: <1324464775-9409-1-git-send-email-yegorslists@googlemail.com>
Message-ID: <20111221134213.2f868bdc@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Wed, 21 Dec 2011 11:52:55 +0100,
yegorslists at googlemail.com a ?crit :

> +PYTHON_INSTALL_STAGING = YES

Your .mk file does not contain the build and install commands for a
target version of this package, so this line is useless.

> +PYTHON_SETUPTOOLS_DEPENDENCIES = python

Again, this won't be used since you have defined only a host variant
for your package. What you need is:

HOST_PYTHON_SETUPTOOLS_DEPENDENCIES = host-python

> +	(cd $(@D); PYTHONPATH="$(HOST_DIR)/usr/lib/python2.7/site-packages"\

Use $(PYTHON_VERSION_MAJOR) instead of hardcoding 2.7.

> +$(eval $(call GENTARGETS))

Remove this line this you haven't implemented a target variant for this
package.

> +source "package/python-setuptools/Config.in"

And remove the Config.in file altogether as you haven't implemented a
target variant for this package.

Of course, if you intend to also support building setuptools for the
target, keep the Config.in file and the $(eval $(call GENTARGETS))
line, but remember to implement the BUILD_CMDS and INSTALL_*_CMDS as
well.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
