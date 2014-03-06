From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 06 Mar 2014 18:37:43 +0100
Subject: [Buildroot] [PATCH v2 4/4] linux: remove dirs dependency
In-Reply-To: <1394098949-31981-5-git-send-email-fabio.porcedda@gmail.com>
References: <1394098949-31981-1-git-send-email-fabio.porcedda@gmail.com>
 <1394098949-31981-5-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <5318B267.2020301@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06/03/14 10:42, Fabio Porcedda wrote:
> The "dirs" dependency is redundant because now the "generic-package"
> infrastructure add automatically the "dirs" dependency so just remove
> the redundant references.
> 
> Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>


 There are also redundant dependencies on dirs in Makefile and in
package/uclibc/uclibc.mk - that can be done in a separate patch, but if
you get around to fixing the other places before this one gets committed
please do include it.


 Regards,
 Arnout


> ---
>  linux/linux.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/linux/linux.mk b/linux/linux.mk
> index 3d52e69..e270705 100644
> --- a/linux/linux.mk
> +++ b/linux/linux.mk
> @@ -302,12 +302,12 @@ include $(sort $(wildcard linux/linux-ext-*.mk))
>  $(eval $(generic-package))
>  
>  ifeq ($(BR2_LINUX_KERNEL),y)
> -linux-menuconfig linux-xconfig linux-gconfig linux-nconfig linux26-menuconfig linux26-xconfig linux26-gconfig linux26-nconfig: dirs linux-configure
> +linux-menuconfig linux-xconfig linux-gconfig linux-nconfig linux26-menuconfig linux26-xconfig linux26-gconfig linux26-nconfig: linux-configure
>  	$(MAKE) $(LINUX_MAKE_FLAGS) -C $(LINUX_DIR) \
>  		$(subst linux-,,$(subst linux26-,,$@))
>  	rm -f $(LINUX_DIR)/.stamp_{built,target_installed,images_installed}
>  
> -linux-savedefconfig linux26-savedefconfig: dirs linux-configure
> +linux-savedefconfig linux26-savedefconfig: linux-configure
>  	$(MAKE) $(LINUX_MAKE_FLAGS) -C $(LINUX_DIR) \
>  		$(subst linux-,,$(subst linux26-,,$@))
>  
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
