From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 18 Nov 2011 00:06:03 +0000
Subject: [Buildroot] [PATCH 2 of 5 v2] stripping: use findfileclauses
	utility function
In-Reply-To: <26239e4561037c19ccfc.1321557991@devws108>
References: <patchbomb.1321557989@devws108>
 <26239e4561037c19ccfc.1321557991@devws108>
Message-ID: <201111180006.04412.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thursday 17 November 2011 19:41:56 Thomas De Schampheleire wrote:
> # HG changeset patch
> # User Thomas De Schampheleire <thomas.de_schampheleire@alcatel-lucent.com>
> # Date 1318576710 -7200
> # Node ID 26239e4561037c19ccfc7ac7ea216d36a6a8e87e
> # Parent  b6579582d02dd802adca94e2b38972cc19cd8b76
> stripping: use findfileclauses utility function
> 
> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

 I think this patch is redundant: it doesn't simplify anything, nobody would
want to apply or revert it individually.

 Regards,
 Arnout


> 
> ---
>  Makefile |  2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> --- a/Makefile
> +++ b/Makefile
> @@ -454,7 +454,7 @@ endif
>  ifeq ($(BR2_PACKAGE_PYTHON_PYC_ONLY),y)
>  	find $(TARGET_DIR)/usr/lib/ -name '*.py' -print0 | xargs -0 rm -f
>  endif
> -	find $(TARGET_DIR) -type f -perm +111 '!' -name 'libthread_db*.so*' | \
> +	find $(TARGET_DIR) -type f -perm +111 '!' $(call findfileclauses,libthread_db*.so*) | \
>  		xargs $(STRIPCMD) 2>/dev/null || true
>  	find $(TARGET_DIR)/lib/modules -type f -name '*.ko' | \
>  		xargs -r $(KSTRIPCMD) || true
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  31BB CF53 8660 6F88 345D  54CC A836 5879 20D7 CF43
