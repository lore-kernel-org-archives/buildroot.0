From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 04 Mar 2014 18:07:24 +0100
Subject: [Buildroot] [PATCH v5 3/4] Makefile: add $(HOST_DIR)/sbin to
 the PATH
In-Reply-To: <1393703951-7059-4-git-send-email-s.martin49@gmail.com>
References: <1393703951-7059-1-git-send-email-s.martin49@gmail.com>
 <1393703951-7059-4-git-send-email-s.martin49@gmail.com>
Message-ID: <5316084C.1080807@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 01/03/14 20:59, Samuel Martin wrote:
> Extend BR_PATH because a few host-packages install programs in this

 s/BR_//

> location.
> 
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

> 
> ---
> changes v4 -> v5:
> - rebase
> - extend PATH instead of BR_PATH
> 
> changes v3 -> v4:
> - rebase
> - fix typo in commit log (ThomasP)
> - rename BR2_PATH -> BR_PATH
> 
> changes v2 -> v3:
> - rebase
> 
> changes v1 -> v2:
> - rebase
> ---
>  Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Makefile b/Makefile
> index 97f9983..35755dc 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -359,7 +359,7 @@ export BASE_DIR
>  # * Export the PATH including the Buildroot host bindirs with immediate
>  #   assignation to avoid recursive variable referencing issues triggered by make.
>  # * Quotes are needed for spaces and all in the original PATH content.
> -export PATH := "$(HOST_DIR)/bin:$(HOST_DIR)/usr/bin:$(HOST_DIR)/usr/sbin:$(PATH)"
> +export PATH := "$(HOST_DIR)/bin:$(HOST_DIR)/sbin:$(HOST_DIR)/usr/bin:$(HOST_DIR)/usr/sbin:$(PATH)"
>  
>  ################################################################################
>  #
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
