From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 26 Jun 2015 21:28:00 +0200
Subject: [Buildroot] [PATCH 1/1] libarchive: add hash and enable lzma
 support
In-Reply-To: <1435330918-25695-1-git-send-email-nimaim@gmail.com>
References: <1435330918-25695-1-git-send-email-nimaim@gmail.com>
Message-ID: <20150626212800.60e62745@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Nimai Mahajan,

On Fri, 26 Jun 2015 11:01:58 -0400, Nimai Mahajan wrote:
> From: Nimai Mahajan <nimaim@gmail.com>
> 
> Add libarchive hash. Enable lzma support.
> Both xz and lzma support are provided by the xz library.
> This maintains consistency with how the other CONF_OPTS are defined.
> 
> Signed-off-by: Nimai Mahajan <nimaim@gmail.com>
> ---
>  package/libarchive/libarchive.hash | 2 ++
>  package/libarchive/libarchive.mk   | 7 ++++++-
>  2 files changed, 8 insertions(+), 1 deletion(-)
>  create mode 100644 package/libarchive/libarchive.hash
> 
> diff --git a/package/libarchive/libarchive.hash b/package/libarchive/libarchive.hash
> new file mode 100644
> index 0000000..5f96211
> --- /dev/null
> +++ b/package/libarchive/libarchive.hash
> @@ -0,0 +1,2 @@
> +# Locally computed:
> +sha256  eb87eacd8fe49e8d90c8fdc189813023ccc319c5e752b01fb6ad0cc7b2c53d5e  libarchive-3.1.2.tar.gz
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

In his review, Arnout asked you to pass --with-lzma in this case, but
you forgot to do it. So I've that and applied. Thanks!

Also, note that this patch should have been marked as "PATCH v2", by
using:

	git format-patch --subject-prefix="PATCH v2"

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
