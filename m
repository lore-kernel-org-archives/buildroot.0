From: Samuel Martin <s.martin49@gmail.com>
Date: Tue, 7 Feb 2017 15:52:08 +0100
Subject: [Buildroot] [PATCH v5 09/19] python2: remove full path from .pyc
In-Reply-To: <1482241596-31688-10-git-send-email-jezz@sysmic.org>
References: <1482241596-31688-1-git-send-email-jezz@sysmic.org>
 <1482241596-31688-10-git-send-email-jezz@sysmic.org>
Message-ID: <CAHXCMMLdL-DV7i5Z2nZ0g-gpUFuO+JiGhJKN7QpUcG5CDZLsug@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi J?r?me, all,

On Tue, Dec 20, 2016 at 2:46 PM, J?r?me Pouiller <jezz@sysmic.org> wrote:
> .pyc files include path to source .py file. This patch changes the way
> `pycompile.py' is launched in order to only keep the part relative to
> $TARGET_DIR.
>
> This work was sponsored by `BA Robotic Systems'.
>
> Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
> Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Reviewed-by: Samuel Martin <s.martin49@gmail.com>

> ---
>
> Notes:
>     v3:
>       - Typo in commit log (Arnout)
>
>  package/python/python.mk | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/package/python/python.mk b/package/python/python.mk
> index cbe7c19..18ab14c 100644
> --- a/package/python/python.mk
> +++ b/package/python/python.mk
> @@ -243,9 +243,10 @@ endif
>
>  define PYTHON_CREATE_PYC_FILES
>         PYTHONPATH="$(PYTHON_PATH)" \
> -       $(HOST_DIR)/usr/bin/python$(PYTHON_VERSION_MAJOR) \
> -               support/scripts/pycompile.py $(if $(BR2_REPRODUCIBLE),--force) \
> -               $(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)
> +       cd $(TARGET_DIR) && $(HOST_DIR)/usr/bin/python$(PYTHON_VERSION_MAJOR) \
> +               $(TOPDIR)/support/scripts/pycompile.py \
> +               $(if $(BR2_REPRODUCIBLE),--force) \
> +               usr/lib/python$(PYTHON_VERSION_MAJOR)
>  endef
>
>  ifeq ($(BR2_PACKAGE_PYTHON_PYC_ONLY)$(BR2_PACKAGE_PYTHON_PY_PYC),y)
> --
> 1.9.1
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

Regards,

-- 
Samuel
