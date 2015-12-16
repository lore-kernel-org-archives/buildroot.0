From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 16 Dec 2015 09:32:33 +0100
Subject: [Buildroot] [PATCH] python-pyxml: remove obsolete package
In-Reply-To: <1450251868-7288-1-git-send-email-yegorslists@googlemail.com>
References: <1450251868-7288-1-git-send-email-yegorslists@googlemail.com>
Message-ID: <20151216083233.GA3434@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yegor, All,

On 2015-12-16 08:44 +0100, yegorslists at googlemail.com spake thusly:
> From: Yegor Yefremov <yegorslists@googlemail.com>
> 
> PyXML is bitrotten and obsolete. You'll find the functionality it
> previously provided is now included in the Python standard library.
> 
> So no need to keep this package in Buildroot anymore.

You forgot to add it to Config.in.legacy .

Otherwise OK for me.

Regards,
Yann E. MORIN.

> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> ---
>  package/Config.in                      |  1 -
>  package/python-pyxml/Config.in         | 12 ------------
>  package/python-pyxml/python-pyxml.hash |  2 --
>  package/python-pyxml/python-pyxml.mk   | 17 -----------------
>  4 files changed, 32 deletions(-)
>  delete mode 100644 package/python-pyxml/Config.in
>  delete mode 100644 package/python-pyxml/python-pyxml.hash
>  delete mode 100644 package/python-pyxml/python-pyxml.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index d31b503..d2476f7 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -666,7 +666,6 @@ menu "External python modules"
>  	source "package/python-pyudev/Config.in"
>  	source "package/python-pyusb/Config.in"
>  	source "package/python-pyxb/Config.in"
> -	source "package/python-pyxml/Config.in"
>  	source "package/python-pyyaml/Config.in"
>  	source "package/python-pyzmq/Config.in"
>  	source "package/python-requests/Config.in"
> diff --git a/package/python-pyxml/Config.in b/package/python-pyxml/Config.in
> deleted file mode 100644
> index 82316ba..0000000
> --- a/package/python-pyxml/Config.in
> +++ /dev/null
> @@ -1,12 +0,0 @@
> -config BR2_PACKAGE_PYTHON_PYXML
> -	bool "python-pyxml"
> -	depends on BR2_PACKAGE_PYTHON
> -	select BR2_PACKAGE_EXPAT
> -	help
> -	  This is the Python XML package. The distribution contains a
> -	  validating XML parser, an implementation of the SAX and DOM
> -	  programming interfaces, an interface to the Expat parser (and the
> -	  Expat parser itself), and a C helper module that can speed up
> -	  xmllib.py by a factor of 5. There's even documentation!
> -
> -	  http://pyxml.sourceforge.net/topics/index.html
> diff --git a/package/python-pyxml/python-pyxml.hash b/package/python-pyxml/python-pyxml.hash
> deleted file mode 100644
> index df98c46..0000000
> --- a/package/python-pyxml/python-pyxml.hash
> +++ /dev/null
> @@ -1,2 +0,0 @@
> -# Locally computed
> -sha256 9fab66f9584fb8e67aebd8745a5c97bf1c5a2e2e461adf68862bcec64e448c13  PyXML-0.8.4.tar.gz
> diff --git a/package/python-pyxml/python-pyxml.mk b/package/python-pyxml/python-pyxml.mk
> deleted file mode 100644
> index 7ccce8e..0000000
> --- a/package/python-pyxml/python-pyxml.mk
> +++ /dev/null
> @@ -1,17 +0,0 @@
> -################################################################################
> -#
> -# python-pyxml
> -#
> -################################################################################
> -
> -PYTHON_PYXML_VERSION = 0.8.4
> -PYTHON_PYXML_SOURCE = PyXML-$(PYTHON_PYXML_VERSION).tar.gz
> -PYTHON_PYXML_SITE = http://downloads.sourceforge.net/project/pyxml/pyxml/$(PYTHON_PYXML_VERSION)
> -PYTHON_PYXML_LICENSE = BSD-3c
> -PYTHON_PYXML_LICENSE_FILES = LICENCE
> -PYTHON_PYXML_SETUP_TYPE = distutils
> -PYTHON_PYXML_DEPENDENCIES = expat
> -PYTHON_PYXML_BUILD_OPTS = --with-libexpat=$(STAGING_DIR)/usr
> -PYTHON_PYXML_INSTALL_TARGET_OPTS = --with-libexpat=$(STAGING_DIR)/usr
> -
> -$(eval $(python-package))
> -- 
> 2.1.4
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
