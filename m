From: Ryan Barnett <rjbarnet@rockwellcollins.com>
Date: Thu, 3 Oct 2013 15:24:46 -0500
Subject: [Buildroot] [PATCH 2/5] python-pycrypto: new package
In-Reply-To: <1380830465-16083-3-git-send-email-rjbarnet@rockwellcollins.com>
References: <1380830465-16083-1-git-send-email-rjbarnet@rockwellcollins.com>
 <1380830465-16083-3-git-send-email-rjbarnet@rockwellcollins.com>
Message-ID: <OFFF7399B2.3C93D59F-ON86257BF9.006FE9E4-86257BF9.0070221C@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ryan Barnett <rjbarnet@rockwellcollins.com> wrote on 
10/03/2013 03:01:02 PM:

[...]

> @@ -0,0 +1,25 @@
> 
+################################################################################
> +#
> +# python-pycrypto
> +#
> 
+################################################################################
> +
> +PYTHON_PYCRYPTO_VERSION = 2.6
> +PYTHON_PYCRYPTO_SOURCE  = pycrypto-$(PYTHON_PYCRYPTO_VERSION).tar.gz
> +PYTHON_PYCRYPTO_SITE    = 
http://ftp.dlitz.net/pub/dlitz/crypto/pycrypto
> +PYTHON_PYCRYPTO_LICENSE = Public Domain, Python 2.2 License 
(HMAC.py,setup.py)
> +
> +PYTHON_PYCRYPTO_LICENSE_FILES = COPYRIGHT LEGAL/copy/LICENSE.libtom \
> +      LEGAL/copy/LICENSE.orig LEGAL/copy/LICENSE.python-2.2
> +
> +PYTHON_PYCRYPTO_DEPENDENCIES = python
> +
> +define PYTHON_PYCRYPTO_BUILD_CMDS
> +   (cd $(@D); $(HOST_DIR)/usr/bin/python setup.py build --
> executable=/usr/bin/python)
> +endef

I realized now that I'm not actually compiling some of the shared library
objects for the target. I will fix this in my next version of this 
patchset.
I need to more closely follow what I did in python-pyasn with attempting
to use TARGET_CONFIG_OPT or python-distutilscross.

> +
> +define PYTHON_PYCRYPTO_INSTALL_TARGET_CMDS
> +   (cd $(@D); $(HOST_DIR)/usr/bin/python setup.py install --prefix=$
> (TARGET_DIR)/usr)
> +endef
> +
> +$(eval $(generic-package))

Thanks,
-Ryan
