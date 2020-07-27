From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 27 Jul 2020 16:31:43 +0200
Subject: [Buildroot] [PATCH 1/2] package/python3-decorator: new package
In-Reply-To: <20200723194600.3491282-1-thomas.petazzoni@bootlin.com>
References: <20200723194600.3491282-1-thomas.petazzoni@bootlin.com>
Message-ID: <20200727143143.GB19818@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2020-07-23 21:45 +0200, Thomas Petazzoni spake thusly:
> The host-python-networkx package needs to be built for the
> host-python3, even when the target Python is not necessarily Python
> 3.x. Since it depends on host-python-decorator, we need a Python 3
> variant of it, which this patch introduces.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Both applied to master, thanks.

But now that host-python-networkx depends on host-python3-decorator, we
can probably drop the host variant for python-decorator, as networkx was
the only user of it...

Regards,
Yann E. MORIN.

> ---
>  package/python-decorator/python-decorator.mk     |  1 +
>  package/python3-decorator/python3-decorator.hash |  1 +
>  package/python3-decorator/python3-decorator.mk   | 16 ++++++++++++++++
>  3 files changed, 18 insertions(+)
>  create mode 120000 package/python3-decorator/python3-decorator.hash
>  create mode 100644 package/python3-decorator/python3-decorator.mk
> 
> diff --git a/package/python-decorator/python-decorator.mk b/package/python-decorator/python-decorator.mk
> index 8df1dd70c9..e555f01ba1 100644
> --- a/package/python-decorator/python-decorator.mk
> +++ b/package/python-decorator/python-decorator.mk
> @@ -4,6 +4,7 @@
>  #
>  ################################################################################
>  
> +# Please keep in sync with package/python3-decorator/python3-decorator.mk
>  PYTHON_DECORATOR_VERSION = 4.4.1
>  PYTHON_DECORATOR_SITE = https://files.pythonhosted.org/packages/dc/c3/9d378af09f5737cfd524b844cd2fbb0d2263a35c11d712043daab290144d
>  PYTHON_DECORATOR_SOURCE = decorator-$(PYTHON_DECORATOR_VERSION).tar.gz
> diff --git a/package/python3-decorator/python3-decorator.hash b/package/python3-decorator/python3-decorator.hash
> new file mode 120000
> index 0000000000..f515d3133b
> --- /dev/null
> +++ b/package/python3-decorator/python3-decorator.hash
> @@ -0,0 +1 @@
> +../python-decorator/python-decorator.hash
> \ No newline at end of file
> diff --git a/package/python3-decorator/python3-decorator.mk b/package/python3-decorator/python3-decorator.mk
> new file mode 100644
> index 0000000000..d809bb5b9b
> --- /dev/null
> +++ b/package/python3-decorator/python3-decorator.mk
> @@ -0,0 +1,16 @@
> +################################################################################
> +#
> +# python3-decorator
> +#
> +################################################################################
> +
> +# Please keep in sync with package/python-decorator/python-decorator.mk
> +PYTHON3_DECORATOR_VERSION = 4.4.1
> +PYTHON3_DECORATOR_SITE = https://files.pythonhosted.org/packages/dc/c3/9d378af09f5737cfd524b844cd2fbb0d2263a35c11d712043daab290144d
> +PYTHON3_DECORATOR_SOURCE = decorator-$(PYTHON_DECORATOR_VERSION).tar.gz
> +PYTHON3_DECORATOR_LICENSE = BSD-2-Clause
> +PYTHON3_DECORATOR_LICENSE_FILES = LICENSE.txt
> +PYTHON3_DECORATOR_SETUP_TYPE = setuptools
> +HOST_PYTHON3_DECORATOR_NEEDS_HOST_PYTHON = python3
> +
> +$(eval $(host-python-package))
> -- 
> 2.26.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
