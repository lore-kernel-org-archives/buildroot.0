From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 18 May 2021 17:00:56 +0200
Subject: [Buildroot] [PATCH 1/1] package/python3-six: add python3 variant
In-Reply-To: <1620853148995.76548@lab126.com>
References: <1620853148995.76548@lab126.com>
Message-ID: <20210518150056.GQ2506@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Chan, All,

On 2021-05-12 20:59 +0000, Chan, Donald via buildroot spake thusly:
> 
> Signed-off-by: Donald Chan <hoiho@lab126.com>

Why do you need a python3-specific version of six?

The existing package, python-six, is already compatible with both
python(2) and python3...

Please, can you respin with a better commit log, that explains why you
need to add it?

Regards,
Yann E. MORIN.

> ---
>  package/python3-six/python3-six.hash |  1 +
>  package/python3-six/python3-six.mk   | 18 ++++++++++++++++++
>  2 files changed, 19 insertions(+)
>  create mode 120000 package/python3-six/python3-six.hash
>  create mode 100644 package/python3-six/python3-six.mk
> 
> diff --git a/package/python3-six/python3-six.hash b/package/python3-six/python3-six.hash
> new file mode 120000
> index 0000000..ed8cb89
> --- /dev/null
> +++ b/package/python3-six/python3-six.hash
> @@ -0,0 +1 @@
> +../python-six/python-six.hash
> \ No newline at end of file
> diff --git a/package/python3-six/python3-six.mk b/package/python3-six/python3-six.mk
> new file mode 100644
> index 0000000..be64fce
> --- /dev/null
> +++ b/package/python3-six/python3-six.mk
> @@ -0,0 +1,18 @@
> +################################################################################
> +#
> +# python3-six
> +#
> +################################################################################
> +
> +# Please keep in sync with package/python-six/python-six.mk
> +PYTHON3_SIX_VERSION = 1.15.0
> +PYTHON3_SIX_SOURCE = six-$(PYTHON3_SIX_VERSION).tar.gz
> +PYTHON3_SIX_SITE = https://files.pythonhosted.org/packages/6b/34/415834bfdafca3c5f451532e8a8d9ba89a21c9743a0c59fbd0205c7f9426
> +PYTHON3_SIX_SETUP_TYPE = setuptools
> +PYTHON3_SIX_LICENSE = MIT
> +PYTHON3_SIX_LICENSE_FILES = LICENSE
> +HOST_PYTHON3_SIX_DL_SUBDIR = python-six
> +HOST_PYTHON3_SIX_NEEDS_HOST_PYTHON = python3
> +
> +$(eval $(python-package))
> +$(eval $(host-python-package))
> --
> 2.17.1
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
