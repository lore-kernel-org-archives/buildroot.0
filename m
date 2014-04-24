From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 24 Apr 2014 22:26:40 +0200
Subject: [Buildroot] [PATCH 01/14] pkg-cmake.mk: replace "echo -en" with
	printf
In-Reply-To: <1398293313-17580-2-git-send-email-s.martin49@gmail.com>
References: <1398293313-17580-1-git-send-email-s.martin49@gmail.com>
 <1398293313-17580-2-git-send-email-s.martin49@gmail.com>
Message-ID: <53597380.30308@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 24/04/14 00:48, Samuel Martin wrote:
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
> Cc: Arnout Vandecappelle <arnout@mind.be>

 Commit message could have been clarified with

printf is POSIX-compliant, echo -e is not.

 Still,

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>


 Regards,
 Arnout

> 
> ---
> changes v1 -> v2
> - new patch
> ---
>  package/pkg-cmake.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/pkg-cmake.mk b/package/pkg-cmake.mk
> index bf3db90..edda14a 100644
> --- a/package/pkg-cmake.mk
> +++ b/package/pkg-cmake.mk
> @@ -160,7 +160,7 @@ host-cmake-package = $(call inner-cmake-package,host-$(pkgname),$(call UPPERCASE
>  
>  $(HOST_DIR)/usr/share/buildroot/toolchainfile.cmake:
>  	@mkdir -p $(@D)
> -	@echo -en "\
> +	@printf "\
>  	set(CMAKE_SYSTEM_NAME Linux)\n\
>  	set(CMAKE_C_COMPILER $(TARGET_CC_NOCCACHE))\n\
>  	set(CMAKE_CXX_COMPILER $(TARGET_CXX_NOCCACHE))\n\
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
