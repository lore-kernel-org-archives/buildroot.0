From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 4 Feb 2018 18:38:42 +0100
Subject: [Buildroot] [PATCH] python-remi: fix trailing whitespace and
 line size
In-Reply-To: <20180204172409.26044-1-gwenj@trabucayre.com>
References: <20180204172409.26044-1-gwenj@trabucayre.com>
Message-ID: <20180204173842.GI2411@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gwenhael, All,

On 2018-02-04 18:24 +0100, Gwenhael Goavec-Merou spake thusly:
> From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> 
> Fixes line size in Config.in, trailing whitespace after # and empty line
> 
> Fixes:
>  - https://gitlab.com/buildroot.org/buildroot/-/jobs/50971692
> 
> Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> ---
>  package/python-remi/Config.in      | 9 +++++----
>  package/python-remi/python-remi.mk | 3 +--
>  2 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/package/python-remi/Config.in b/package/python-remi/Config.in
> index 68d0a92b11..2f4216b324 100644
> --- a/package/python-remi/Config.in
> +++ b/package/python-remi/Config.in
> @@ -1,9 +1,10 @@
>  config BR2_PACKAGE_PYTHON_REMI
>  	bool "python-remi"
>  	help
> -	  Remi is a GUI library for Python applications which transpiles an
> -	  application's interface into HTML to be rendered in a web browser.
> -	  This removes platform-specific dependencies and lets you easily
> -	  develop cross-platform applications in Python!
> +	  Remi is a GUI library for Python applications which
> +	  transpiles an application's interface into HTML to be
> +	  rendered in a web browser. This removes platform-specific
> +	  dependencies and lets you easily develop cross-platform
> +	  applications in Python!

You actually over-wrapped the help text. It can fit on 4 lines, which
even looks nicer:

    Remi is a GUI library for Python applications which transpiles
    an application's interface into HTML to be rendered in a web
    browser. This removes platform-specific dependencies and lets
    you easily develop cross-platform applications in Python!

Otherwise:

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Thanks! :-)

Regards,
Yann E. MORIN.

>  	  https://github.com/dddomodossola/remi/tree/master
> diff --git a/package/python-remi/python-remi.mk b/package/python-remi/python-remi.mk
> index 6514118192..3356430ddb 100644
> --- a/package/python-remi/python-remi.mk
> +++ b/package/python-remi/python-remi.mk
> @@ -1,5 +1,5 @@
>  ################################################################################
> -# 
> +#
>  # python-remi
>  #
>  ################################################################################
> @@ -11,4 +11,3 @@ PYTHON_REMI_LICENSE_FILES = LICENSE
>  PYTHON_REMI_SETUP_TYPE = setuptools
>  
>  $(eval $(python-package))
> -
> -- 
> 2.13.6
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
