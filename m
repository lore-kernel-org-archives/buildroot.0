From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 13 Jan 2018 23:10:34 +0100
Subject: [Buildroot] [PATCH v2 1/1] python-xlib: new package
In-Reply-To: <20180105211307.25071-1-joseph.kogut@gmail.com>
References: <20180105000420.20152-1-joseph.kogut@gmail.com>
 <20180105211307.25071-1-joseph.kogut@gmail.com>
Message-ID: <20180113221034.GH3226@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Joseph, All,

On 2018-01-05 13:13 -0800, Joseph Kogut spake thusly:
[--SNIP--]
> diff --git a/package/python-xlib/python-xlib.mk b/package/python-xlib/python-xlib.mk
> new file mode 100644
> index 0000000000..5476edfe0d
> --- /dev/null
> +++ b/package/python-xlib/python-xlib.mk
> @@ -0,0 +1,15 @@
> +###############################################################################
> +#
> +# python-xlib
> +#
> +###############################################################################

Running the check-package script will return two issues:

    $ utils/check-package package/python-xlib/*
    package/python-xlib/python-xlib.mk:1: should be 80 hashes (http://nightly.buildroot.org/#writing-rules-mk)
    package/python-xlib/python-xlib.mk:5: should be 80 hashes (http://nightly.buildroot.org/#writing-rules-mk)
    26 lines processed
    2 warnings generated

CAn you fix, please?

Regards,
Yann E. MORIN.

> +PYTHON_XLIB_VERSION = 0.21
> +PYTHON_XLIB_SOURCE = python-xlib-$(PYTHON_XLIB_VERSION).tar.bz2
> +PYTHON_XLIB_SITE = https://pypi.python.org/packages/eb/de/b0eaaea7b8512dc41504db071824eef30293ff55c58d83081ebaebe85a38
> +PYTHON_XLIB_SETUP_TYPE = setuptools
> +PYTHON_XLIB_LICENSE = LGPL-2.0+
> +PYTHON_XLIB_LICENSE_FILES = LICENSE
> +PYTHON_XLIB_DEPENDENCIES = host-python-setuptools-scm
> +
> +$(eval $(python-package))
> --
> 2.15.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
