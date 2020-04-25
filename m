From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 25 Apr 2020 11:50:39 +0200
Subject: [Buildroot] [PATCH v2] package/matio: new package
In-Reply-To: <20200424085624.23908-1-gwenj@trabucayre.com>
References: <20200424085624.23908-1-gwenj@trabucayre.com>
Message-ID: <20200425115039.5280d03d@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 24 Apr 2020 10:56:24 +0200
Gwenhael Goavec-Merou <gwenj@trabucayre.com> wrote:

> diff --git a/package/matio/matio.hash b/package/matio/matio.hash
> new file mode 100644
> index 0000000000..d84f50e0b2
> --- /dev/null
> +++ b/package/matio/matio.hash
> @@ -0,0 +1,5 @@
> +# From https://sourceforge.net/projects/matio/files/matio/1.5.17/
> +sha512  af8ff11c7c44fea9ea6886e381f49ef9186946f3def98ad9695f2d5d1df045c35e8f4ceac12a44be397f7bbd708b4803762b5ce54c45b60a9f446d551c04f5d2  matio-1.5.17.tar.gz
> +# Locally computed
> +sha256  5e455527d370ab297c4abe5a2ab4d599c93ac7c1a0c85d841cc5c22f8221c400  matio-1.5.17.tar.gz

If there's an upstream provided sha512 hash, I'm not sure it's really
useful to add a locally calculated sha256 hash.

> +MATIO_VERSION = 1.5.17
> +MATIO_SITE = http://downloads.sourceforge.net/project/matio/matio/$(MATIO_VERSION)
> +MATIO_LICENSE = BSD-2-Clause
> +MATIO_LICENSE_FILES = COPYING
> +MATIO_DEPENDENCIES = zlib
> +MATIO_INSTALL_STAGING = YES
> +
> +# va_copy()
> +MATIO_CONF_ENV = ac_cv_va_copy=yes
> +
> +MATIO_CONF_OPTS = --enable-mat73=no

Please use:

	--disable-mat73

> +
> +ifeq ($(BR2_PACKAGE_MATIO_SPARSE),y)
> +MATIO_CONF_OPTS += --enable-extended-sparse=yes

Just:

	--enable-extended-sparse

> +else
> +MATIO_CONF_OPTS += --enable-extended-sparse=no

Use:

	--disable-extended-sparse

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
