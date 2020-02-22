From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Sat, 22 Feb 2020 11:59:00 +0100
Subject: [Buildroot] [PATCH] infra: don't be verbose when calling the
 instrumentation steps
In-Reply-To: <20200222103848.10236-1-yann.morin.1998@free.fr>
References: <20200222103848.10236-1-yann.morin.1998@free.fr>
Message-ID: <CAAXf6LX6G0c72v8rx1W9maf4ERKffKyo9qsSaN+qdsd=OOG-7g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

On Sat, Feb 22, 2020, 11:38 Yann E. MORIN <yann.morin.1998@free.fr> wrote:

> Commit 509db3b88a added calls to (parts of) the instrumentation steps.
> However, those calls are echoed, unlike the other places where we call
> them (in the package infra).
>
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
> ---
>  Makefile | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index 9662987bb4..b61a20a354 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -807,12 +807,12 @@ endif # merged /usr
>  # AFTER ALL FILE-CHANGING ACTIONS:
>  # Update timestamps in internal file list to fix attribution of files
>  # to packages on subsequent builds
> -       $(call step_pkg_size_file_list,$(TARGET_DIR))
> -       $(call step_pkg_size_finalize)
> -       $(call step_pkg_size_file_list,$(STAGING_DIR),-staging)
> -       $(call step_pkg_size_finalize,-staging)
> -       $(call step_pkg_size_file_list,$(HOST_DIR),-host)
> -       $(call step_pkg_size_finalize,-host)
> +       @$(call step_pkg_size_file_list,$(TARGET_DIR))
> +       @$(call step_pkg_size_finalize)
> +       @$(call step_pkg_size_file_list,$(STAGING_DIR),-staging)
> +       @$(call step_pkg_size_finalize,-staging)
> +       @$(call step_pkg_size_file_list,$(HOST_DIR),-host)
> +       @$(call step_pkg_size_finalize,-host)


Perhaps this should rather be $(Q) than @?
I quite like the fact that you can see what's going on, mostly relevant
when investigating an issue...

Thanks,
Thomas
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200222/ef78015e/attachment.html>
