From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 29 Jun 2016 15:56:53 +0200
Subject: [Buildroot] [PATCH 06/24] jsmin: drop unused host variant
In-Reply-To: <1467207991-4905-7-git-send-email-julien.floret@6wind.com>
References: <1467207991-4905-1-git-send-email-julien.floret@6wind.com>
 <1467207991-4905-7-git-send-email-julien.floret@6wind.com>
Message-ID: <20160629155653.326794ba@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 29 Jun 2016 15:46:13 +0200, Julien Floret wrote:
> Signed-off-by: Julien Floret <julien.floret@6wind.com>
> ---
>  package/jsmin/jsmin.mk | 9 ---------
>  1 file changed, 9 deletions(-)
> 
> diff --git a/package/jsmin/jsmin.mk b/package/jsmin/jsmin.mk
> index a66ba7158245..42344c9c8674 100644
> --- a/package/jsmin/jsmin.mk
> +++ b/package/jsmin/jsmin.mk
> @@ -17,13 +17,4 @@ define JSMIN_INSTALL_TARGET_CMDS
>  	$(INSTALL) -m 0755 -D $(@D)/jsmin $(TARGET_DIR)/usr/bin/jsmin
>  endef
>  
> -define HOST_JSMIN_BUILD_CMDS
> -	$(HOST_CONFIGURE_OPTS) $(MAKE) -C $(@D) jsmin
> -endef
> -
> -define HOST_JSMIN_INSTALL_CMDS
> -	$(INSTALL) -m 0755 -D $(@D)/jsmin $(HOST_DIR)/usr/bin/jsmin
> -endef
> -
>  $(eval $(generic-package))
> -$(eval $(host-generic-package))

This package (and its host variant) was added by Peter Korsgaard. I
guess the JS minimizer is useful on the host, when building other
packages, like web sites and their javascript code. Such packages are
generally not in Buildroot upstream, which is why we don't have a
dependency on host-jsmin anywhere.

Should we add a menuconfig entry, even though it's merely a build
dependency?

Peter?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
