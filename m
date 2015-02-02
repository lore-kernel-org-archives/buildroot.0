From: Samuel Martin <s.martin49@gmail.com>
Date: Mon, 2 Feb 2015 21:41:13 +0100
Subject: [Buildroot] [PATCH 07/16] package/dropbear: install
 dropbear.service to correct dir
In-Reply-To: <1421684056-5266-8-git-send-email-maxtram95@gmail.com>
References: <1421684056-5266-1-git-send-email-maxtram95@gmail.com>
 <1421684056-5266-8-git-send-email-maxtram95@gmail.com>
Message-ID: <CAHXCMMKQDy_K2VemxXjdE+_Njqqcy7iHYxUzeGhk_i_qV4fN+A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Maxim,

Looks like you forget your sob-line here ;-)

Anyway, you got my:

Reviewed-by: Samuel Martin <s.martin49@gmail.com>

On Mon, Jan 19, 2015 at 5:14 PM, Maxim Mikityanskiy <maxtram95@gmail.com> wrote:
> The place for package-provided systemd units is /lib/systemd/system.
> /etc/systemd/system is for custom units.
> ---
>  package/dropbear/dropbear.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/package/dropbear/dropbear.mk b/package/dropbear/dropbear.mk
> index 696095d..2230c61 100644
> --- a/package/dropbear/dropbear.mk
> +++ b/package/dropbear/dropbear.mk
> @@ -46,9 +46,9 @@ endef
>
>  define DROPBEAR_INSTALL_INIT_SYSTEMD
>         $(INSTALL) -D -m 644 package/dropbear/dropbear.service \
> -               $(TARGET_DIR)/etc/systemd/system/dropbear.service
> +               $(TARGET_DIR)/lib/systemd/system/dropbear.service
>         mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
> -       ln -fs ../dropbear.service \
> +       ln -fs /lib/systemd/system/dropbear.service \
>                 $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/dropbear.service

Though, you might often find relative symlinks, so they are correctly
resolved when looking at $(TARGET_DIR).

>  endef
>
> --
> 2.2.1


Regards,

-- 
Samuel
