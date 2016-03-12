From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 12 Mar 2016 10:27:34 +0100
Subject: [Buildroot] [PATCH 2/2] Revert "gcc/gcc-final: pass TARGET_ABI
 flags to configure with --enable-cxx-flags"
In-Reply-To: <1457657122-7283-3-git-send-email-jcmvbkbc@gmail.com>
References: <1457657122-7283-1-git-send-email-jcmvbkbc@gmail.com>
 <1457657122-7283-3-git-send-email-jcmvbkbc@gmail.com>
Message-ID: <56E3E106.1070908@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/11/16 01:45, Max Filippov wrote:
> This reverts commit 2dcab526a97d1dbcb73c3cd578e5bf2853853a10.
>
> Now that gcc correctly propagates CXXFLAGS_FOR_TARGET for libstdc++
> build this is no longer needed.
>
> Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>


  Regards,
  Arnout

> ---
>   package/gcc/gcc-final/gcc-final.mk | 4 ----
>   1 file changed, 4 deletions(-)
>
> diff --git a/package/gcc/gcc-final/gcc-final.mk b/package/gcc/gcc-final/gcc-final.mk
> index dbdb615..69fdc0c 100644
> --- a/package/gcc/gcc-final/gcc-final.mk
> +++ b/package/gcc/gcc-final/gcc-final.mk
> @@ -195,8 +195,4 @@ endef
>   HOST_GCC_FINAL_POST_INSTALL_HOOKS += HOST_GCC_FINAL_INSTALL_USR_LIBS
>   endif
>
> -ifeq ($(BR2_xtensa),y)
> -HOST_GCC_FINAL_CONF_OPTS += --enable-cxx-flags="$(TARGET_ABI)"
> -endif
> -
>   $(eval $(host-autotools-package))
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
