From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 14 Jul 2015 11:46:52 +0200
Subject: [Buildroot] [PATCH 1/1] Makefile: create $(BUILD_DIR) before
 attempting to touch .root
In-Reply-To: <1436867048-6333-1-git-send-email-patrickdepinguin@gmail.com>
References: <1436867048-6333-1-git-send-email-patrickdepinguin@gmail.com>
Message-ID: <55A4DA8C.1030104@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/14/15 11:44, Thomas De Schampheleire wrote:
> From: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 Regards,
 Arnout

> 
> The target $(BUILD_DIR)/.root does not have a direct dependency on
> $(BUILD_DIR), meaning that cases could exist where the target is executed
> without $(BUILD_DIR) being present.
> Instead of hoping on a specific order, and instead of adding new make
> dependencies, just make sure the directory is created.
> 
> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
> ---
>  Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Makefile b/Makefile
> index 8eb8c6d..ee65417 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -471,7 +471,7 @@ RSYNC_VCS_EXCLUSIONS = \
>  	--exclude CVS
>  
>  $(BUILD_DIR)/.root:
> -	mkdir -p $(TARGET_DIR)
> +	mkdir -p $(TARGET_DIR) $(BUILD_DIR)
>  	rsync -a --ignore-times $(RSYNC_VCS_EXCLUSIONS) \
>  		--chmod=u=rwX,go=rX --exclude .empty --exclude '*~' \
>  		$(TARGET_SKELETON)/ $(TARGET_DIR)/
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
