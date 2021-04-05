From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 5 Apr 2021 11:45:17 +0200
Subject: [Buildroot] [PATCH 1/1] package/bash: remove development files
 and modules on the target.
In-Reply-To: <20210331081559.29619-1-nicolas.cavallari@green-communications.fr>
References: <20210331081559.29619-1-nicolas.cavallari@green-communications.fr>
Message-ID: <20210405114517.54157434@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Nicolas,

On Wed, 31 Mar 2021 10:15:59 +0200
Nicolas Cavallari <nicolas.cavallari@green-communications.fr> wrote:

> diff --git a/package/bash/bash.mk b/package/bash/bash.mk
> index efe7cbbe59..6af31f182d 100644
> --- a/package/bash/bash.mk
> +++ b/package/bash/bash.mk
> @@ -41,7 +41,8 @@ endif
>  define BASH_INSTALL_TARGET_CMDS
>  	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
>  		DESTDIR=$(TARGET_DIR) exec_prefix=/ install
> -	rm -f $(TARGET_DIR)/bin/bashbug
> +	rm -f $(TARGET_DIR)/bin/bashbug $(TARGET_DIR)/lib/pkgconfig/bash.pc

I am wondering if target-finalize shouldn't take care of removing
/lib/pkgconfig just like it removes /usr/lib/pkgconfig. This would have
the benefit of also dropping the /lib/pkgconfig folder, which your
change doesn't do.

What do you think?

> +	rm -rf $(TARGET_DIR)/lib/bash
>  endef
>  
>  # Add /bin/bash to /etc/shells otherwise some login tools like dropbear

Thanks,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
