From: rc LSW <rc.lsw.collaborate@gmail.com>
Date: Fri, 18 Jan 2013 08:30:17 -0600
Subject: [Buildroot] [PATCH 1/1] added python unicode selection to menu
In-Reply-To: <1358338481-8467-1-git-send-email-rc.lsw.collaborate@gmail.com>
References: <1358338481-8467-1-git-send-email-rc.lsw.collaborate@gmail.com>
Message-ID: <CAC2S8kiBTfOT7obdyey2QLKzQUDVCDicvi4C5gWY1EfDCRmfvQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ignore this patch, submitting a new one later to fix a formatting issue in
the first section of the patch.

On Wed, Jan 16, 2013 at 6:14 AM, Matt Weber <rc.lsw.collaborate@gmail.com>wrote:

> From: Matthew Weber <matthew.l.weber@gmail.com>
>
>
> Signed-off-by: Matt Weber <rc.lsw.collaborate@gmail.com>
> ---
>  package/python/Config.in |   18 ++++++++++++++++++
>  package/python/python.mk |    6 ++++++
>  2 files changed, 24 insertions(+), 0 deletions(-)
>
> diff --git a/package/python/Config.in b/package/python/Config.in
> index 4089cce..cb032da 100644
> --- a/package/python/Config.in
> +++ b/package/python/Config.in
> @@ -83,6 +83,24 @@ config BR2_PACKAGE_PYTHON_UNICODEDATA
>         help
>           Unicode character database (used by stringprep module) (large).
>
> +if BR2_PACKAGE_PYTHON_UNICODEDATA
> +
> +choice
> +>.......prompt "Python unicode database format"
> +>.......default BR2_PACKAGE_PYTHON_UCS2
> +>.......help
> +>.......  Select Python unicode database format for target
> +
> +config BR2_PACKAGE_PYTHON_UCS2
> +>.......bool "Universal Character Set 2-byte (UCS2)"
> +
> +config BR2_PACKAGE_PYTHON_UCS4
> +>.......bool "Universal Character Set 4-byte (UCS4)"
> +
> +endchoice
> +
> +endif
> +
>  config BR2_PACKAGE_PYTHON_SQLITE
>         bool "sqlite module"
>         select BR2_PACKAGE_SQLITE
> diff --git a/package/python/python.mk b/package/python/python.mk
> index 71591b7..66a9db5 100644
> --- a/package/python/python.mk
> +++ b/package/python/python.mk
> @@ -96,6 +96,12 @@ ifneq ($(BR2_PACKAGE_PYTHON_UNICODEDATA),y)
>  PYTHON_CONF_OPT += --disable-unicodedata
>  endif
>
> +# Default is UCS2 w/o a conf opt
> +ifeq ($(BR2_PACKAGE_PYTHON_UCS4),y)
> +HOST_PYTHON_CONF_OPT += --enable-unicode=ucs4
> +PYTHON_CONF_OPT      += --enable-unicode=ucs4
> +endif
> +
>  ifeq ($(BR2_PACKAGE_PYTHON_BZIP2),y)
>  PYTHON_DEPENDENCIES += bzip2
>  else
> --
> 1.7.1
>
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130118/80a448a8/attachment.html>
