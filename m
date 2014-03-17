From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 17 Mar 2014 08:42:48 +0100
Subject: [Buildroot] [PATCH 6/6] Makefile: do not add the toolchain
 target to the TARGETS variable
In-Reply-To: <1394540278-28740-7-git-send-email-fabio.porcedda@gmail.com>
References: <1394540278-28740-1-git-send-email-fabio.porcedda@gmail.com>
 <1394540278-28740-7-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <5326A778.7070507@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/11/14 13:17, Fabio Porcedda wrote:
> Do not add the toolchain target to the TARGETS variable because now the
> toolchain target is a dependency added automatically so it is not
> necessary to add it anymore.

 I disagree with this one. When you run make, you expect buildroot to
build the toolchain even if no target package is selected. One use case I
can think of: when preparing an internal toolchain for use as an external
toolchain in later builds.


 Regards,
 Arnout

> 
> Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
> ---
>  Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Makefile b/Makefile
> index 0420364..481f779 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -300,7 +300,7 @@ GNU_HOST_NAME := $(shell support/gnuconfig/config.guess)
>  #
>  ################################################################################
>  
> -TARGETS := toolchain
> +TARGETS :=
>  
>  # silent mode requested?
>  QUIET := $(if $(findstring s,$(MAKEFLAGS)),-q)
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
