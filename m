From: Ivo Grondman <buildroot@grondman.net>
Date: Thu, 25 Feb 2021 16:20:43 +0100
Subject: [Buildroot] Python package installed without dependencies defined
 in setup.py
Message-ID: <FF75D700-F93F-4299-9093-BED6912A3868@grondman.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

I?m using a custom Python package which relies on setuptools for its installation, with dependencies defined in the install_requires part of setup.py. Once I run everything, I can see that the package itself is installed correctly, but none of its dependencies is. I also cannot find anything about any attempts to install dependencies in the logs. I do see the explicit ?setup.py install? call in the logs and if I manually call the install script on the machine where I do my buildroot builds then all the dependencies do get installed, so I?m not sure why buildroot doesn?t...

What could be going on here?

My my-python-package.mk:
######
MY_PYTHON_PACKAGE_VERSION = 0.0.1
MY_PYTHON_PACKAGE_SOURCE = my-package-$(MY_PYTHON_PACKAGE_VERSION).tar.gz
MY_PYTHON_PACKAGE_SITE = file://$(BR2_EXTERNAL_MYTREE_PATH)
MY_PYTHON_PACKAGE_SETUP_TYPE = setuptools
MY_PYTHON_PACKAGE_LICENSE = Other
MY_PYTHON_PACKAGE_LICENSE_FILES = LICENSE.md
$(eval $(python-package))
######

If you need any more info, please let me know.

Any help on this or perhaps a hint to debug this is greatly appreciated!

Cheers,

Ivo
