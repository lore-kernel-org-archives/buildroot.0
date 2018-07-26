From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 26 Jul 2018 10:40:56 +0200
Subject: [Buildroot] [PATCH v2] libostree: override path to
 gpg-error-config
In-Reply-To: <20180726080800.5564-1-marcus.folkesson@gmail.com>
References: <20180726080800.5564-1-marcus.folkesson@gmail.com>
Message-ID: <a8b4f7c2-2ea9-61af-995d-1dcc475cd6b5@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 26-07-18 10:08, Marcus Folkesson wrote:
> libostree has begun to use `gpg-error-config` in their configuration
> script.
> Point out gpg-error-config in staging dir to avoid using the one
> installed on the host system.
> 
> Fixes:
>  http://autobuild.buildroot.net/results/447b96e449e881cf1bd9644cda0f386aa4c75724
> 
> Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 Regards,
 Arnout

> ---
> 
> Notes:
>     v2:
>     	- override ac_cv_path_GPG_ERROR_CONFIG instead of  GPG_ERROR_CONFIG
> 
>  package/libostree/libostree.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/libostree/libostree.mk b/package/libostree/libostree.mk
> index 24eda0d1db..414cca104a 100644
> --- a/package/libostree/libostree.mk
> +++ b/package/libostree/libostree.mk
> @@ -12,6 +12,7 @@ LIBOSTREE_LICENSE = LGPL-2.0+
>  LIBOSTREE_LICENSE_FILES = COPYING
>  LIBOSTREE_DEPENDENCIES = e2fsprogs host-bison host-pkgconf libfuse libglib2 libgpgme xz
>  LIBOSTREE_INSTALL_STAGING = YES
> +LIBOSTREE_CONF_ENV = GPG_ERROR_CONFIG=$(STAGING_DIR)/usr/bin/gpg-error-config
>  
>  LIBOSTREE_CONF_OPTS += \
>  	--with-gpgme-prefix=$(STAGING_DIR)/usr \
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
