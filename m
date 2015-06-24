From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 24 Jun 2015 23:49:08 +0200
Subject: [Buildroot] [PATCH] Don't export VERBOSE unless V=1 (for CMake)
In-Reply-To: <1435095367-4223-1-git-send-email-cedric.marie@openmailbox.org>
References: <1435095367-4223-1-git-send-email-cedric.marie@openmailbox.org>
Message-ID: <558B25D4.3050105@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06/23/15 23:36, C?dric Marie wrote:
> CMake verbose mode is based on VERBOSE environment variable.
> * If VERBOSE is exported but empty, only "Dependee ... is newer than
> depender ..." messages are shown.
> * If VERBOSE is exported and set (whatever the value), all compilation
> commands are shown.
> 
> VERBOSE is currently systematically exported by Buildroot, even if it
> is empty, in the root Makefile, which implies that the "light" verbose
> mode - with "Dependee ... is newer than depender ..." messages - is
> always enabled.
> 
> VERBOSE should only be exported when V=1, which is the standard way to
> enable verbose mode in Buildroot.
> 
> Signed-off-by: C?dric Marie <cedric.marie@openmailbox.org>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 Regards,
 Arnout

> ---
>  Makefile | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/Makefile b/Makefile
> index d3f80c4..8eb21d4 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -215,6 +215,7 @@ ifeq ($(KBUILD_VERBOSE),1)
>  ifndef VERBOSE
>    VERBOSE = 1
>  endif
> +export VERBOSE
>  else
>    quiet = quiet_
>    Q = @
> @@ -228,7 +229,7 @@ SHELL := $(shell if [ -x "$$BASH" ]; then echo $$BASH; \
>  # kconfig uses CONFIG_SHELL
>  CONFIG_SHELL := $(SHELL)
>  
> -export SHELL CONFIG_SHELL quiet Q KBUILD_VERBOSE VERBOSE
> +export SHELL CONFIG_SHELL quiet Q KBUILD_VERBOSE
>  
>  ifndef HOSTAR
>  HOSTAR := ar
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
