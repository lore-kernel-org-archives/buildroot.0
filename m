From: =?ISO-8859-1?Q?J=F6rg?= Krause <joerg.krause@embedded.rocks>
Date: Fri, 29 Jul 2016 18:15:46 +0200
Subject: [Buildroot] [PATCH 2/4] swupdate: updated lua check for
 libconfig
In-Reply-To: <20160724232739.14132-3-jordan@yelloz.me>
References: <20160724232739.14132-1-jordan@yelloz.me>
 <20160724232739.14132-3-jordan@yelloz.me>
Message-ID: <1469808946.3805.6.camel@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On So, 2016-07-24 at 16:27 -0700, Jordan Yelloz wrote:
> Most probably this was missed in commit
> 65b2ae49feb310d3272a47c44cf3b406646b25c1 which removed pinning to Lua
> 5.2.
> 
> Signed-off-by: Jordan Yelloz <jordan@yelloz.me>
> ---
> ?package/swupdate/Config.in | 3 ++-
> ?1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/package/swupdate/Config.in b/package/swupdate/Config.in
> index 5f5e1e77b9d1..d7217af1c47f 100644
> --- a/package/swupdate/Config.in
> +++ b/package/swupdate/Config.in
> @@ -3,7 +3,8 @@ config BR2_PACKAGE_SWUPDATE
> ?	depends on BR2_TOOLCHAIN_HAS_THREADS
> ?	depends on BR2_USE_MMU # fork()
> ?	# swupdate requires a parser and uses libconfig as default
> -	select BR2_PACKAGE_LIBCONFIG if !BR2_PACKAGE_JSON_C &&
> !BR2_PACKAGE_LUA_5_2
> +	select BR2_PACKAGE_LIBCONFIG if !BR2_PACKAGE_JSON_C && \
> +		!BR2_PACKAGE_HAS_LUAINTERPRETER


Good catch, thank you!

J?rg
