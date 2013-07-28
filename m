From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Sun, 28 Jul 2013 10:22:17 +0200
Subject: [Buildroot] [PATCH] <pkg>-rsync: support user custom cmds
In-Reply-To: <1374944218-19629-1-git-send-email-tjlee@ambarella.com>
References: <1374944218-19629-1-git-send-email-tjlee@ambarella.com>
Message-ID: <CAAXf6LXQWBEF2uM4e5MQg-QooTMwHmgZ99HT6PDH1DHNDDM-Gw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Tzu-Jung Lee,

On Sat, Jul 27, 2013 at 6:56 PM, Tzu-Jung Lee <roylee17@gmail.com> wrote:
> Signed-off-by: Tzu-Jung Lee <tjlee@ambarella.com>

Could you explain more about the use case of this patch? Why do you
want to override the rsync command?

> ---
>  package/pkg-generic.mk | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> index b8eaa98..d9a12f2 100644
> --- a/package/pkg-generic.mk
> +++ b/package/pkg-generic.mk
> @@ -309,6 +309,10 @@ $(2)_INSTALL_IMAGES                ?= NO
>  $(2)_INSTALL_TARGET            ?= YES
>  $(2)_DIR_PREFIX                        = $(if $(4),$(4),$(TOP_SRCDIR)/package)
>
> +# default rsync command
> +$(2)_RSYNC_CMDS ?= \
> +       rsync -au --cvs-exclude --include core $(SRCDIR)/ $(@D)
> +
>  # define sub-target stamps
>  $(2)_TARGET_INSTALL_TARGET =   $$($(2)_DIR)/.stamp_target_installed
>  $(2)_TARGET_INSTALL_STAGING =  $$($(2)_DIR)/.stamp_staging_installed

I fail to understand how this will work without further changes.
Even if a package defines FOO_RSYNC_CMDS, where is it used? I guess
the original rsync commands should be replaced by the new variable.

Also here, documentation should be updated to reflect new features.

Best regards,
Thomas
