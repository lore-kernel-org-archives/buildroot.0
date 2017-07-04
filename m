From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 5 Jul 2017 01:11:18 +0200
Subject: [Buildroot] [PATCH 1/3] package/kvazaar: add host-pkgconf
 dependency
In-Reply-To: <20170704230857.7916-1-romain.naour@smile.fr>
References: <20170704230857.7916-1-romain.naour@smile.fr>
Message-ID: <feca4664-a804-0fc9-424f-d8a97ea654c6@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 05-07-17 01:08, Romain Naour wrote:
> The build system use PKG_CHECK_MODULES.
> 
> checking pkg-config is at least version 0.9.0... ./configure: line 16886: output/host/usr/bin/pkg-config: No such file or directory
> no
> 
> Signed-off-by: Romain Naour <romain.naour@smile.fr>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 Regards,
 Arnout

> ---
>  package/kvazaar/kvazaar.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/kvazaar/kvazaar.mk b/package/kvazaar/kvazaar.mk
> index 30b8bda..f9149a7 100644
> --- a/package/kvazaar/kvazaar.mk
> +++ b/package/kvazaar/kvazaar.mk
> @@ -10,6 +10,7 @@ KVAZAAR_LICENSE = LGPL-2.1+
>  KVAZAAR_LICENSE_FILES = COPYING
>  KVAZAAR_AUTORECONF = YES
>  KVAZAAR_INSTALL_STAGING = YES
> +KVAZAAR_DEPENDENCIES = host-pkgconf
>  KVAZAAR_CONF_OPTS = --without-cryptopp
>  
>  $(eval $(autotools-package))
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
