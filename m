From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 23 Apr 2015 22:51:52 +0200
Subject: [Buildroot] [PATCH] host-cmake: Install with install/fast target
In-Reply-To: <1429818373-1788-1-git-send-email-cedric.marie@openmailbox.org>
References: <1429818373-1788-1-git-send-email-cedric.marie@openmailbox.org>
Message-ID: <55395B68.8030308@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/23/15 21:46, C?dric Marie wrote:
> Use install/fast target in order to skip compilation in installation
> step. The same trick has just been used in pkg-cmake.mk for all CMake
> packages.
> 
> Signed-off-by: C?dric Marie <cedric.marie@openmailbox.org>

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Tested-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 Regards,
 Arnout

> ---
>  package/cmake/cmake.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/cmake/cmake.mk b/package/cmake/cmake.mk
> index 6b9e563..9ca6443 100644
> --- a/package/cmake/cmake.mk
> +++ b/package/cmake/cmake.mk
> @@ -44,7 +44,7 @@ define HOST_CMAKE_BUILD_CMDS
>  endef
>  
>  define HOST_CMAKE_INSTALL_CMDS
> -	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) install
> +	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) install/fast
>  endef
>  
>  define CMAKE_REMOVE_EXTRA_DATA
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
