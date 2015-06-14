From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 14 Jun 2015 22:48:54 +0200
Subject: [Buildroot] [PATCH/RFC v2 01/44] package/libsquish: New package
In-Reply-To: <1434292603-12052-2-git-send-email-bernd.kuhls@t-online.de>
References: <1434292603-12052-1-git-send-email-bernd.kuhls@t-online.de>
 <1434292603-12052-2-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20150614224854.7604869a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sun, 14 Jun 2015 16:36:00 +0200, Bernd Kuhls wrote:

> diff --git a/package/libsquish/0001-kodi.patch b/package/libsquish/0001-kodi.patch
> new file mode 100644
> index 0000000..1bab6a6
> --- /dev/null
> +++ b/package/libsquish/0001-kodi.patch
> @@ -0,0 +1,1504 @@
> +Add Kodi-specific patch
> +
> +Kodi 15.0 contains an updated version of libsquish:
> +https://github.com/xbmc/xbmc/tree/master/tools/depends/native/libsquish-native
> +
> +The OpenElec project provides a separate tarball including the Kodi-
> +specific patches:
> +http://sources.openelec.tv/devel/libsquish-1.10-openelec.tar.gz
> +
> +This patch is the diff between upstream libsquish 1.10 and the OpenElec
> +tarball without the vs7/ directory.
> +
> +Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Is there some hope of getting this patch merged upstream?

> +LIBSQUISH_VERSION = 1.10
> +LIBSQUISH_SOURCE = squish-$(LIBSQUISH_VERSION).tar.gz
> +LIBSQUISH_SITE = https://libsquish.googlecode.com/files

googlecode.com is going to disappear, is the project planning to move
to some other location.

> +LIBSQUISH_INSTALL_STAGING = YES
> +LIBSQUISH_LICENSE = MIT
> +LIBSQUISH_LICENSE_FILES = README
> +
> +define LIBSQUISH_INSTALL_STAGING_CMDS
> +	mkdir -p $(STAGING_DIR)/usr/lib/pkgconfig/
> +	CXX=$(TARGET_CXX) CXXFLAGS="$(TARGET_CXXFLAGS)" \
> +	$(MAKE) -C $(@D) install PREFIX=/usr INSTALL_DIR=$(STAGING_DIR)/usr

Please intend with an additional the second line of continuation lines.
Also, can you use:

	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) install \
		PREFIX=/usr INSTALL_DIR=$(STAGING_DIR)/usr

instead?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
