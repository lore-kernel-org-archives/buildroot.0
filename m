From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 12 Jul 2015 00:30:50 +0200
Subject: [Buildroot] [PATCH 4/7] nanocom: use <PKG>_STRIP_COMPONENTS
In-Reply-To: <1436624110-20428-4-git-send-email-luca@lucaceresoli.net>
References: <1436624110-20428-1-git-send-email-luca@lucaceresoli.net>
 <1436624110-20428-4-git-send-email-luca@lucaceresoli.net>
Message-ID: <55A1991A.2020304@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/11/15 16:15, Luca Ceresoli wrote:
> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 Regards,
 Arnout

> ---
>  package/nanocom/nanocom.mk | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
> 
> diff --git a/package/nanocom/nanocom.mk b/package/nanocom/nanocom.mk
> index f723951281f7..293dd091fc9d 100644
> --- a/package/nanocom/nanocom.mk
> +++ b/package/nanocom/nanocom.mk
> @@ -7,14 +7,10 @@
>  NANOCOM_VERSION = 1.0
>  NANOCOM_SOURCE = nanocom.tar.gz
>  NANOCOM_SITE = http://downloads.sourceforge.net/project/nanocom/nanocom/v$(NANOCOM_VERSION)
> +NANOCOM_STRIP_COMPONENTS = 0
>  NANOCOM_LICENSE = GPLv2+
>  NANOCOM_LICENSE_FILES = COPYING
>  
> -# N.B. Don't strip any path components during extraction.
> -define NANOCOM_EXTRACT_CMDS
> -	gzip -d -c $(DL_DIR)/$(NANOCOM_SOURCE) | tar --strip-components=0 -C $(NANOCOM_DIR) -xf -
> -endef
> -
>  define NANOCOM_BUILD_CMDS
>  	$(MAKE) CC="$(TARGET_CC) $(TARGET_CFLAGS) $(TARGET_LDFLAGS)" -C $(@D)
>  endef
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
