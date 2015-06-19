From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 19 Jun 2015 21:36:14 +0200
Subject: [Buildroot] [PATCH 1/1] Modified libarchive.mk to enable
 support for xz/lzma
In-Reply-To: <5582f0b5.a25c8c0a.014c.ffff8c3b@mx.google.com>
References: <5582f0b5.a25c8c0a.014c.ffff8c3b@mx.google.com>
Message-ID: <55846F2E.8070601@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Nimai,

On 06/18/15 18:24, nimaim at gmail.com wrote:
> From: Nimai <nimai@nimai-vm.com>

 A slightly more extensive commit message would be good, e.g.

Both xz and lzma support are provided by the xz library.

> 
> Signed-off-by: Nimai <nimai@nimai-vm.com>

 A signed-off-by is a legal statement, therefore it should have your ful name.

> ---
>  package/libarchive/libarchive.mk | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/package/libarchive/libarchive.mk b/package/libarchive/libarchive.mk
> index 61528d9..18fa8b7 100644
> --- a/package/libarchive/libarchive.mk
> +++ b/package/libarchive/libarchive.mk
> @@ -9,7 +9,6 @@ LIBARCHIVE_SITE = http://www.libarchive.org/downloads
>  LIBARCHIVE_INSTALL_STAGING = YES
>  LIBARCHIVE_LICENSE = BSD-2c, BSD-3c
>  LIBARCHIVE_LICENSE_FILES = COPYING
> -LIBARCHIVE_CONF_OPTS = --without-lzma
>  
>  ifeq ($(BR2_PACKAGE_LIBARCHIVE_BSDTAR),y)
>  ifeq ($(BR2_STATIC_LIBS),y)
> @@ -86,4 +85,10 @@ else
>  LIBARCHIVE_CONF_OPTS += --without-zlib
>  endif
>  
> +ifeq ($(BR2_PACKAGE_XZ),y)
> +LIBARCHIVE_DEPENDENCIES += xz

 We prefer to explicitly enable/disable, so add

LIBARCHIVE_CONF_OPTS += --with-lzma


 Can you fix these issues and repost?


 Regards,
 Arnout

> +else
> +LIBARCHIVE_CONF_OPTS += --without-lzma
> +endif
> +
>  $(eval $(autotools-package))
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
