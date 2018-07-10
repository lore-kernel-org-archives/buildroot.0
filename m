From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 10 Jul 2018 22:49:44 +0200
Subject: [Buildroot] [PATCH 1/1] brltty: add optional at-spi2-core
 dependency
In-Reply-To: <20180710182226.10485-1-fontaine.fabrice@gmail.com>
References: <20180710182226.10485-1-fontaine.fabrice@gmail.com>
Message-ID: <c16061a6-39b0-afac-60c2-72dc2f331cf9@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 10-07-18 20:22, Fabrice Fontaine wrote:
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/brltty/brltty.mk | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/package/brltty/brltty.mk b/package/brltty/brltty.mk
> index eb91ef8ff7..df3e9c7888 100644
> --- a/package/brltty/brltty.mk
> +++ b/package/brltty/brltty.mk
> @@ -11,7 +11,8 @@ BRLTTY_INSTALL_STAGING_OPTS = INSTALL_ROOT=$(STAGING_DIR) install
>  BRLTTY_INSTALL_TARGET_OPTS = INSTALL_ROOT=$(TARGET_DIR) install
>  BRLTTY_LICENSE_FILES = LICENSE-GPL LICENSE-LGPL
>  
> -BRLTTY_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES) host-autoconf host-pkgconf
> +BRLTTY_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES) host-autoconf host-pkgconf \
> +	$(if $(BR2_PACKAGE_AT_SPI2_CORE),at-spi2-core)

 Indeed, there is no configure option to enable/disable it. You can add or
remove a2 from the list of supported screens, but that anyway doesn't change the
include/link flags so there is no point.

 Applied to master, thanks.

 Regards,
 Arnout


>  
>  BRLTTY_CONF_OPTS = \
>  	--disable-java-bindings \
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
