From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 2 Feb 2014 12:12:12 +0100
Subject: [Buildroot] [PATCH] ljlinenoise: new package
In-Reply-To: <1391251950-19923-1-git-send-email-francois.perrad@gadz.org>
References: <1391251950-19923-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <20140202121212.5f9702b0@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Francois Perrad,

On Sat,  1 Feb 2014 11:52:30 +0100, Francois Perrad wrote:

> diff --git a/package/luarocks/luarocks.mk b/package/luarocks/luarocks.mk
> index 88ab22a..86e57d2 100644
> --- a/package/luarocks/luarocks.mk
> +++ b/package/luarocks/luarocks.mk
> @@ -37,6 +37,7 @@ define HOST_LUAROCKS_INSTALL_CMDS
>  	echo "external_deps_dirs = { [[$(STAGING_DIR)/usr]] }"  >> $(LUAROCKS_CONFIG_FILE)
>  	echo "gcc_rpath = false"                                >> $(LUAROCKS_CONFIG_FILE)
>  	echo "rocks_trees = { [[$(TARGET_DIR)/usr]] }"          >> $(LUAROCKS_CONFIG_FILE)
> +	echo "wrap_bin_scripts = false"                         >> $(LUAROCKS_CONFIG_FILE)
>  endef
>  
>  $(eval $(host-generic-package))

I believe it would be better to have this as part of a separate commit,
so that it comes with a proper description.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
