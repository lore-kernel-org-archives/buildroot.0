From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 15 Mar 2020 22:47:51 +0100
Subject: [Buildroot] [PATCH 1/2] package/libcpprestsdk: zlib is optional,
 not mandatory
In-Reply-To: <20200314222027.2317520-1-fontaine.fabrice@gmail.com>
References: <20200314222027.2317520-1-fontaine.fabrice@gmail.com>
Message-ID: <20200315224751.41147871@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 14 Mar 2020 23:20:26 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> +ifeq ($(BR2_PACKAGE_ZLIB),y)
> +LIBCPPRESTSDK_DEPENDENCIES += zlib
> +LIBCPPRESTSDK_CONF_OPTS += -DCPPREST_EXCLUDE_COMPRESSION=OFF
> +# brotli needs compression

What makes you think brotli needs zlib ? I had a quick look at the
CMake logic and didn't find that.

Also, how did you test that? zlib is a dependency of openssl, and
openssl is a mandatory dependency of libcpprestsdk. Did you test with
libressl ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
