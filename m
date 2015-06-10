From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 10 Jun 2015 23:25:05 +0200
Subject: [Buildroot] [PATCH 1/1] openvmtools: add
 OPENVMTOOLS_VERSION_MAJOR variable
In-Reply-To: <1433918670-16552-1-git-send-email-jerzy.grzegorek@trzebnica.net>
References: <1433918670-16552-1-git-send-email-jerzy.grzegorek@trzebnica.net>
Message-ID: <5578AB31.9090309@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06/10/15 08:44, Jerzy Grzegorek wrote:
> Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 Note that the proposed move to github is a good idea, but a separate patch anyway.

 Regards,
 Arnout

> ---
>  package/openvmtools/openvmtools.mk | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/package/openvmtools/openvmtools.mk b/package/openvmtools/openvmtools.mk
> index ef6544a..92ecd36 100644
> --- a/package/openvmtools/openvmtools.mk
> +++ b/package/openvmtools/openvmtools.mk
> @@ -4,9 +4,10 @@
>  #
>  ################################################################################
>  
> -OPENVMTOOLS_VERSION = 9.10.0-2476743
> +OPENVMTOOLS_VERSION_MAJOR = 9.10.0
> +OPENVMTOOLS_VERSION = $(OPENVMTOOLS_VERSION_MAJOR)-2476743
>  OPENVMTOOLS_SOURCE = open-vm-tools-$(OPENVMTOOLS_VERSION).tar.gz
> -OPENVMTOOLS_SITE = http://downloads.sourceforge.net/project/open-vm-tools/open-vm-tools/stable-9.10.0
> +OPENVMTOOLS_SITE = http://downloads.sourceforge.net/project/open-vm-tools/open-vm-tools/stable-$(OPENVMTOOLS_VERSION_MAJOR)
>  OPENVMTOOLS_LICENSE = LGPLv2.1
>  OPENVMTOOLS_LICENSE_FILES = COPYING
>  # Autoreconf needed or config/missing will run configure again at buildtime
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
