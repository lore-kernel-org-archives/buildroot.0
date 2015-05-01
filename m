From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 01 May 2015 23:45:33 +0200
Subject: [Buildroot] [PATCH 30/30] package/matchbox-panel: fix WiFi
 monitoring
In-Reply-To: <3de1b4334c76469f95d791d578f769831ab2f3a5.1429725549.git.yann.morin.1998@free.fr>
References: <cover.1429725549.git.yann.morin.1998@free.fr>
 <3de1b4334c76469f95d791d578f769831ab2f3a5.1429725549.git.yann.morin.1998@free.fr>
Message-ID: <5543F3FD.5010802@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 22/04/15 20:09, Yann E. MORIN wrote:
> matchbox-panel can build a simple applet to monitor the WiFi. For that,
> it tries to see if libiwl is available; if so, WiFi monitoring is
> enabled, otherwise it is disabled; there is not option to explicitly
> enable or disable it.
> 
> Currently, matchbox-panel depends on the wireless-tools package.
> However, that's not enough, since the library will only be installed if
> explictly enabled in the menuconfig *and* this is not a static build.
  explicitly

> 
> Change the dependency to be on the library, not the package.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 Regards,
 Arnout

> ---
>  package/matchbox/matchbox-panel/matchbox-panel.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/matchbox/matchbox-panel/matchbox-panel.mk b/package/matchbox/matchbox-panel/matchbox-panel.mk
> index dedbab6..455ae34 100644
> --- a/package/matchbox/matchbox-panel/matchbox-panel.mk
> +++ b/package/matchbox/matchbox-panel/matchbox-panel.mk
> @@ -32,7 +32,7 @@ else
>  MATCHBOX_PANEL_CONF_OPTS += --disable-dnotify
>  endif
>  
> -ifeq ($(BR2_PACKAGE_WIRELESS_TOOLS),y)
> +ifeq ($(BR2_PACKAGE_WIRELESS_TOOLS_LIB),y)
>  MATCHBOX_PANEL_DEPENDENCIES += wireless_tools
>  endif
>  
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
