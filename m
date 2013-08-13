From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 14 Aug 2013 00:33:47 +0200
Subject: [Buildroot] [PATCH 3/5] luajit: allow building for the host
In-Reply-To: <1346741921-28968-3-git-send-email-francois.perrad@gadz.org>
References: <1346741921-28968-1-git-send-email-francois.perrad@gadz.org>
 <1346741921-28968-3-git-send-email-francois.perrad@gadz.org>
Message-ID: <20130814003347.03a6be87@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Francois Perrad,

Why is the below patch needed? What is the usage of luajit built for
the host?

Thanks,

Thomas

On Tue,  4 Sep 2012 08:58:39 +0200, Francois Perrad wrote:
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  package/luajit/luajit.mk |   10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/package/luajit/luajit.mk b/package/luajit/luajit.mk
> index 913bc0c..e82df64 100644
> --- a/package/luajit/luajit.mk
> +++ b/package/luajit/luajit.mk
> @@ -50,6 +50,11 @@ define LUAJIT_BUILD_CMDS
>  		-C $(@D) amalg
>  endef
>  
> +define HOST_LUAJIT_BUILD_CMDS
> +	$(MAKE) PREFIX="/usr" \
> +		-C $(@D) amalg
> +endef
> +
>  define LUAJIT_INSTALL_STAGING_CMDS
>  	$(MAKE) PREFIX="/usr" DESTDIR="$(STAGING_DIR)" -C $(@D) install
>  endef
> @@ -58,8 +63,13 @@ define LUAJIT_INSTALL_TARGET_CMDS
>  	$(MAKE) PREFIX="/usr" DESTDIR="$(TARGET_DIR)" -C $(@D) install
>  endef
>  
> +define HOST_LUAJIT_INSTALL_CMDS
> +	$(MAKE) PREFIX="/usr" DESTDIR="$(HOST_DIR)" -C $(@D) install
> +endef
> +
>  define LUAJIT_CLEAN_CMDS
>  	-$(MAKE) -C $(@D) clean
>  endef
>  
>  $(eval $(generic-package))
> +$(eval $(host-generic-package))



-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
