From: Alexander Dahl <post@lespocky.de>
Date: Wed, 2 Oct 2019 10:30:26 +0200
Subject: [Buildroot] [PATCH 1/1] package/collectd: bump to version 5.9.1
In-Reply-To: <20190930123302.28215-1-asafka7@gmail.com>
References: <20190930123302.28215-1-asafka7@gmail.com>
Message-ID: <20191002083025.4p73ye6kt3f7cjgv@falbala.home.lespocky.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hei hei,

On Mon, Sep 30, 2019 at 03:32:27PM +0300, Asaf Kahlon wrote:
> Update COLLECTD_SITE to github.
> 
> Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
> ---
>  package/collectd/collectd.hash | 12 ++++--------
>  package/collectd/collectd.mk   |  6 +++---
>  2 files changed, 7 insertions(+), 11 deletions(-)
> 
> diff --git a/package/collectd/collectd.hash b/package/collectd/collectd.hash
> index 7823765ec3..45d6f89c2d 100644
> --- a/package/collectd/collectd.hash
> +++ b/package/collectd/collectd.hash
> @@ -1,9 +1,5 @@
> -# From https://collectd.org/files/SHA512SUM
> -sha512 f2bf9896dd8fa116834418ea46aabdb160002da7f2600b7d5120d40eb7a956ccc845299696c854c2335946903374c84bbaeb28667319bf07b7a54ea465cccd54  collectd-5.9.0.tar.bz2
> -# From https://collectd.org/files/SHA256SUM
> -sha256 7b220f8898a061f6e7f29a8c16697d1a198277f813da69474a67911097c0626b  collectd-5.9.0.tar.bz2
> -# From https://collectd.org/files/SHA1SUM
> -sha1 58cd22ef8130f17c714e9609053cf45d311ac6c7  collectd-5.9.0.tar.bz2
> -
> -# Hash for license files
> +# Locally computed checksums
> +sha512	424ef12a3ba6997a71e6eda1a62d73fec588c9c4d90542c2381c1f9f4e118b2c02e18c71507e8984e20fb255b69b7f42afe83085b3df5e225c576d1eee1655fb	collectd-5.9.1.tar.gz
> +sha256	51fb72f51489cb33fa4ddd65b757d81d77c13a33b36f031d6ce2835a2eec9adb	collectd-5.9.1.tar.gz
> +sha1	30abba37e049e05dc7d00b205a61338da37ee8a6	collectd-5.9.1.tar.gz
>  sha256	ed0409b2b1c30566dab5fcdaf46ee70e140c99788e22f0267645a9357b476ae4	COPYING
> diff --git a/package/collectd/collectd.mk b/package/collectd/collectd.mk
> index c73008becd..624c7db939 100644
> --- a/package/collectd/collectd.mk
> +++ b/package/collectd/collectd.mk
> @@ -4,9 +4,9 @@
>  #
>  ################################################################################
>  
> -COLLECTD_VERSION = 5.9.0
> -COLLECTD_SITE = http://collectd.org/files
> -COLLECTD_SOURCE = collectd-$(COLLECTD_VERSION).tar.bz2
> +COLLECTD_VERSION = 5.9.1
> +COLLECTD_SITE = $(call github,collectd,collectd,collectd-$(COLLECTD_VERSION))
> +COLLECTD_SOURCE = collectd-$(COLLECTD_VERSION).tar.gz
>  COLLECTD_CONF_ENV = ac_cv_lib_yajl_yajl_alloc=yes
>  COLLECTD_INSTALL_STAGING = YES
>  COLLECTD_LICENSE = MIT (daemon, plugins), GPL-2.0 (plugins), LGPL-2.1 (plugins)

According to https://github.com/collectd/collectd/releases 5.9.2 has
been released yesterday.

Greets
Alex

-- 
/"\ ASCII RIBBON | ?With the first link, the chain is forged. The first
\ / CAMPAIGN     | speech censured, the first thought forbidden, the
 X  AGAINST      | first freedom denied, chains us all irrevocably.?
/ \ HTML MAIL    | (Jean-Luc Picard, quoting Judge Aaron Satie)
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 833 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20191002/1778ee61/attachment-0001.asc>
