From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 27 Feb 2014 07:44:41 +0100
Subject: [Buildroot] [PATCH 06/24] luajit: add host-luajit
In-Reply-To: <1393227301-14874-7-git-send-email-francois.perrad@gadz.org>
References: <1393227301-14874-1-git-send-email-francois.perrad@gadz.org>
 <1393227301-14874-7-git-send-email-francois.perrad@gadz.org>
Message-ID: <530EDED9.8060506@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02/24/14 08:34, Francois Perrad wrote:
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

 You should indicate why host-luajit is needed.

 Regards,
 Arnout

> ---
>  package/luajit/luajit.mk |    9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/package/luajit/luajit.mk b/package/luajit/luajit.mk
> index 01fbb78..f742333 100644
> --- a/package/luajit/luajit.mk
> +++ b/package/luajit/luajit.mk
> @@ -56,4 +56,13 @@ define LUAJIT_INSTALL_TARGET_CMDS
>  	$(MAKE) PREFIX="/usr" DESTDIR="$(TARGET_DIR)" -C $(@D) install
>  endef
>  
> +define HOST_LUAJIT_BUILD_CMDS
> +	$(MAKE) PREFIX="/usr" BUILDMODE=static -C $(@D) amalg
> +endef
> +
> +define HOST_LUAJIT_INSTALL_CMDS
> +	$(MAKE) PREFIX="/usr" DESTDIR="$(HOST_DIR)" -C $(@D) install
> +endef
> +
>  $(eval $(generic-package))
> +$(eval $(host-generic-package))
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
