From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 18 Sep 2019 09:35:01 +0200
Subject: [Buildroot] [pkg-luarocks 3/6] pkg-luarocks: regen packages
 with external dependencies
In-Reply-To: <20190918061915.31250-3-francois.perrad@gadz.org>
References: <20190918061915.31250-1-francois.perrad@gadz.org>
 <20190918061915.31250-3-francois.perrad@gadz.org>
Message-ID: <20190918093501.5b91d097@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 18 Sep 2019 08:19:12 +0200
Francois Perrad <fperrad@gmail.com> wrote:

> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  package/lsqlite3/lsqlite3.mk             | 1 +
>  package/lua-curl/lua-curl.mk             | 1 +
>  package/lua-flu/lua-flu.mk               | 3 +++
>  package/lua-iconv/lua-iconv.mk           | 1 +
>  package/luadbi-sqlite3/luadbi-sqlite3.mk | 1 +
>  package/luaexpat/luaexpat.mk             | 1 +
>  package/luaossl/luaossl.mk               | 3 +++
>  package/luasec/luasec.mk                 | 1 +
>  package/luasql-sqlite3/luasql-sqlite3.mk | 1 +
>  package/wsapi-fcgi/wsapi-fcgi.mk         | 1 +
>  10 files changed, 14 insertions(+)
> 
> diff --git a/package/lsqlite3/lsqlite3.mk b/package/lsqlite3/lsqlite3.mk
> index bbf6a1db1..51f9516fd 100644
> --- a/package/lsqlite3/lsqlite3.mk
> +++ b/package/lsqlite3/lsqlite3.mk
> @@ -8,5 +8,6 @@ LSQLITE3_VERSION = 0.9.5-1
>  LSQLITE3_SUBDIR = lsqlite3_fsl09y
>  LSQLITE3_LICENSE = MIT
>  LSQLITE3_DEPENDENCIES = sqlite
> +LSQLITE3_BUILD_OPTS = SQLITE_DIR="$(STAGING_DIR)/usr"

I'm not sure to understand this change. It seems a bit redundant for
all those packages to say "the native libraries you need are in
$(STAGING_DIR)/usr", since native libraries are always there. Why isn't
the common infrastructure taking care of this ?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
