From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 12 Jan 2015 22:00:44 +0100
Subject: [Buildroot] [PATCH] bootstrap: remove development/debug files
In-Reply-To: <1421094218-2999-1-git-send-email-yegorslists@googlemail.com>
References: <1421094218-2999-1-git-send-email-yegorslists@googlemail.com>
Message-ID: <20150112220044.0db3d53b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yegor Yefremov,

On Mon, 12 Jan 2015 21:23:38 +0100, Yegor Yefremov wrote:
> *.min.* files are sufficient for a production system, so
> remove other files, that will be used during development
> stage.
> 
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> ---
>  package/bootstrap/bootstrap.mk | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/package/bootstrap/bootstrap.mk b/package/bootstrap/bootstrap.mk
> index 1bf8aa2..f79a00f 100644
> --- a/package/bootstrap/bootstrap.mk
> +++ b/package/bootstrap/bootstrap.mk
> @@ -16,6 +16,11 @@ endef
>  define BOOTSTRAP_INSTALL_TARGET_CMDS
>  	mkdir -p $(TARGET_DIR)/var/www/bootstrap
>  	cp -dpfr $(@D)/dist/* $(TARGET_DIR)/var/www/bootstrap
> +
> +	rm $(TARGET_DIR)/var/www/bootstrap/css/bootstrap-theme.css*
> +	rm $(TARGET_DIR)/var/www/bootstrap/css/bootstrap.css*
> +	rm $(TARGET_DIR)/var/www/bootstrap/js/npm.js
> +	rm $(TARGET_DIR)/var/www/bootstrap/js/bootstrap.js
>  endef
>  
>  $(eval $(generic-package))

At this point, I am wondering if it is not simpler/shorter to install
only the necessary files, rather than install everything and remove
what's unneeded. Can you compare the two options?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
