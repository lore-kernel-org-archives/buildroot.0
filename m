From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 8 Oct 2018 10:21:35 +0200
Subject: [Buildroot] [PATCH v3 1/2] package/mariadb: handle missing
 ucontext_t
In-Reply-To: <20181007170637.25113-1-bernd.kuhls@t-online.de>
References: <20181007170637.25113-1-bernd.kuhls@t-online.de>
Message-ID: <20181008102135.2b2c11b3@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  7 Oct 2018 19:06:36 +0200, Bernd Kuhls wrote:
> On some archs uclibc does not provide ucontext_t, for details see
> https://git.buildroot.net/buildroot/commit/?id=f1cbfeea95e6287c7a666aafc182ffa318eff262
> 
> This patch fixes a build error
> 
> In file included from /home/bernd/buildroot/output/build/mariadb-10.2.17/libmariadb/plugins/pvio/pvio_socket.c:32:0:
> /home/bernd/buildroot/output/build/mariadb-10.2.17/libmariadb/include/ma_context.h:62:3: error: unknown type name ?ucontext_t?
>    ucontext_t base_context;
>    ^~~~~~~~~~
> 
> using this defconfig:
> 
> BR2_arcle=y
> BR2_archs38=y
> BR2_TOOLCHAIN_EXTERNAL=y
> BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
> BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
> BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arcle-hs38-full-2018.02-926-gb393c24.tar.bz2"
> BR2_TOOLCHAIN_EXTERNAL_GCC_7=y
> BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_1=y
> BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
> BR2_TOOLCHAIN_EXTERNAL_CXX=y
> BR2_PACKAGE_MYSQL=y
> BR2_PACKAGE_MARIADB=y
> BR2_PACKAGE_MARIADB_SERVER=y
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
> v3: provided cmake fix instead of _CONF_OPTS (Thomas)
> v2: added musl fix

Both applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
