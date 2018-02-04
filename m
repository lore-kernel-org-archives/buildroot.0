From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 4 Feb 2018 17:17:19 +0100
Subject: [Buildroot] [PATCH v2] python-remi: new package
In-Reply-To: <20180202214205.14781-1-gwenj@trabucayre.com>
References: <20180202214205.14781-1-gwenj@trabucayre.com>
Message-ID: <20180204161719.GG2411@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gwenhael, All,

On 2018-02-02 22:42 +0100, Gwenhael Goavec-Merou spake thusly:
> From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> 
> Remi is a GUI library for Python applications which transpiles an
> application's interface into HTML to be rendered in a web browser.
> This removes platform-specific dependencies and lets you easily
> develop cross-platform applications in Python!
[--SNIP--]
> diff --git a/package/python-remi/python-remi.mk b/package/python-remi/python-remi.mk
> new file mode 100644
> index 0000000000..6514118192
> --- /dev/null
> +++ b/package/python-remi/python-remi.mk
> @@ -0,0 +1,14 @@
> +################################################################################
> +# 

Trailing whitespace...

> +# python-remi
> +#
> +################################################################################
> +
> +PYTHON_REMI_VERSION = v1.0
> +PYTHON_REMI_SITE = $(call github,dddomodossola,remi,$(PYTHON_REMI_VERSION))
> +PYTHON_REMI_LICENSE = Apache-2.0
> +PYTHON_REMI_LICENSE_FILES = LICENSE
> +PYTHON_REMI_SETUP_TYPE = setuptools
> +
> +$(eval $(python-package))
> +

Trailng empty line.

Those two are causing check-package failures;
    https://gitlab.com/buildroot.org/buildroot/-/jobs/50971692

You can check locally with:
    ./utils/check-package package/python-remi/*

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
