From: Stefan Becker <chemobejk@gmail.com>
Date: Mon, 16 Apr 2018 14:47:22 +0300
Subject: [Buildroot] [PATCH] swupdate: install web application version 2
In-Reply-To: <20180416114444.26220-1-chemobejk@gmail.com>
References: <20180415195628.4CE0F88476@busybox.osuosl.org>
 <20180416114444.26220-1-chemobejk@gmail.com>
Message-ID: <CAOJ2eMcLiqd03QV5b14WzeXZz1LCU703C-kB0=JXgXtht3Noug@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Apr 16, 2018 at 2:44 PM, Stefan Becker <chemobejk@gmail.com> wrote:
> The old web application under www/ and mongoose API v1 no longer work
> after upgrading to 2018.03. Install web application version 2 from
> examples/www/v2/ to /var/www/swupdate/ instead.
>
> This fix does not address the fact that you can't rebuild the new web
> application under buildroot. That would require host Node.js & npm to
> run the application build. I.e. for now users have to live with the
> example application or apply patches directly to the built version of
> the appication.
>
> Signed-off-by: Stefan Becker <chemobejk@gmail.com>
> ---
>  package/swupdate/swupdate.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/package/swupdate/swupdate.mk b/package/swupdate/swupdate.mk
> index 8649931eb7..5dce9cd46c 100644
> --- a/package/swupdate/swupdate.mk
> +++ b/package/swupdate/swupdate.mk
> @@ -125,7 +125,7 @@ define SWUPDATE_INSTALL_TARGET_CMDS
>         $(INSTALL) -D -m 0755 $(@D)/swupdate $(TARGET_DIR)/usr/bin/swupdate
>         $(if $(BR2_PACKAGE_SWUPDATE_INSTALL_WEBSITE), \
>                 mkdir -p $(TARGET_DIR)/var/www/swupdate; \
> -               cp -dpf $(@D)/www/* $(TARGET_DIR)/var/www/swupdate)
> +               cp -dpRf $(@D)/examples/www/v2/* $(TARGET_DIR)/var/www/swupdate)
>  endef
>
>  # Checks to give errors that the user can understand
> --
> 2.14.3
>

Other alternative would be to revert swupdate 2017.11 -> 2018.03
change (git commit 26184c2815072e2ab5ba6eb3e13542684d65c55a)

Regards, Stefan
