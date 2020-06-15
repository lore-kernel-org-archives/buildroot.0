From: Asaf Kahlon <asafka7@gmail.com>
Date: Mon, 15 Jun 2020 22:24:08 +0300
Subject: [Buildroot] [PATCH 2/2] package/python-web2py: needs python-yatl
In-Reply-To: <20200611205607.1869425-2-fontaine.fabrice@gmail.com>
References: <20200611205607.1869425-1-fontaine.fabrice@gmail.com>
 <20200611205607.1869425-2-fontaine.fabrice@gmail.com>
Message-ID: <CALFsTFWEjkS4WuFjN0=yyGgcTQ_5khf+vtgq2KCj3C7A8_+hRQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, Jun 11, 2020 at 11:56 PM Fabrice Fontaine
<fontaine.fabrice@gmail.com> wrote:
>
> python-yatl is a mandatory dependency of python-web2py since version
> 2.18.4 and
> https://github.com/web2py/web2py/commit/0663088d7f7c3257eaa9cdd8415483372d3c80b7
>
> Fixes:
>  - http://autobuild.buildroot.org/results/9d627152920973effeb48ad03c27a1c69fa83931
>
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/python-web2py/Config.in        | 1 +
>  package/python-web2py/python-web2py.mk | 2 +-
>  2 files changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/package/python-web2py/Config.in b/package/python-web2py/Config.in
> index bc2e6054e6..7f6ea52a91 100644
> --- a/package/python-web2py/Config.in
> +++ b/package/python-web2py/Config.in
> @@ -7,6 +7,7 @@ config BR2_PACKAGE_PYTHON_WEB2PY
>         select BR2_PACKAGE_PYTHON3_PYEXPAT if BR2_PACKAGE_PYTHON3 # runtime
>         select BR2_PACKAGE_PYTHON_SQLITE if BR2_PACKAGE_PYTHON # runtime
>         select BR2_PACKAGE_PYTHON3_SQLITE if BR2_PACKAGE_PYTHON3 # runtime
> +       select BR2_PACKAGE_PYTHON_YATL
>         help
>           web2py is a free open source full-stack framework for rapid
>           development of fast, scalable, secure and portable
> diff --git a/package/python-web2py/python-web2py.mk b/package/python-web2py/python-web2py.mk
> index 9aebf4d19d..734ad0a7bb 100644
> --- a/package/python-web2py/python-web2py.mk
> +++ b/package/python-web2py/python-web2py.mk
> @@ -9,7 +9,7 @@ PYTHON_WEB2PY_SITE = $(call github,web2py,web2py,v$(PYTHON_WEB2PY_VERSION))
>  PYTHON_WEB2PY_LICENSE = LGPL-3.0
>  PYTHON_WEB2PY_LICENSE_FILES = LICENSE
>  PYTHON_WEB2PY_DEPENDENCIES = $(if $(BR2_PACKAGE_PYTHON3),host-python3 python3,host-python python) \
> -       python-pydal host-python-pydal
> +       python-pydal host-python-pydal python-yatl host-python-yatl

Why do we need both host-python-yatl and python-yatl as dependencies
and not only the host variant?
BTW I managed to compile python-web2py with your patch even without
python-pydal (but with host-python-pydal), so I suggest we use only
the host variants.

>
>  PYTHON_WEB2PY_EXCLUSIONS = \
>         welcome.w2p \
> --
> 2.26.2
>

Regards,
Asaf.
