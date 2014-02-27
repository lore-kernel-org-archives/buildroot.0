From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 27 Feb 2014 08:18:02 +0100
Subject: [Buildroot] [PATCH 12/24] luajson: new package
In-Reply-To: <1393227301-14874-13-git-send-email-francois.perrad@gadz.org>
References: <1393227301-14874-1-git-send-email-francois.perrad@gadz.org>
 <1393227301-14874-13-git-send-email-francois.perrad@gadz.org>
Message-ID: <530EE6AA.9030202@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02/24/14 08:34, Francois Perrad wrote:
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  package/Config.in          |    1 +
>  package/luajson/Config.in  |    8 ++++++++
>  package/luajson/luajson.mk |   13 +++++++++++++
>  3 files changed, 22 insertions(+)
>  create mode 100644 package/luajson/Config.in
>  create mode 100644 package/luajson/luajson.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index 5f3ef17..e65d71d 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -382,6 +382,7 @@ source "package/luacrypto/Config.in"
>  source "package/luaexpat/Config.in"
>  source "package/luaexpatutils/Config.in"
>  source "package/luafilesystem/Config.in"
> +source "package/luajson/Config.in"
>  source "package/luaposix/Config.in"
>  source "package/luasec/Config.in"
>  source "package/luasocket/Config.in"
> diff --git a/package/luajson/Config.in b/package/luajson/Config.in
> new file mode 100644
> index 0000000..9be7d25
> --- /dev/null
> +++ b/package/luajson/Config.in
> @@ -0,0 +1,8 @@
> +config BR2_PACKAGE_LUAJSON
> +	bool "luajson"
> +	select BR2_PACKAGE_LPEG

 # run-time dependency only

> +	help
> +	  LuaJSON is a customizable JSON decoder/encoder
> +	  using LPEG for parsing.
> +
> +	  http://github.com/harningt/luajson
> diff --git a/package/luajson/luajson.mk b/package/luajson/luajson.mk
> new file mode 100644
> index 0000000..88db6b0
> --- /dev/null
> +++ b/package/luajson/luajson.mk
> @@ -0,0 +1,13 @@
> +################################################################################
> +#
> +# luajson
> +#
> +################################################################################
> +
> +LUAJSON_VERSION_UPSTREAM = 1.3.2
> +LUAJSON_VERSION = $(LUAJSON_VERSION_UPSTREAM)-1
> +LUAJSON_SUBDIR  = luajson

 If the upstream version is not included in the subdir, you don't need to
split the version in two parts.

 Regards,
 Arnout

> +LUAJSON_LICENSE = MIT
> +LUAJSON_LICENSE_FILES = $(LUAJSON_SUBDIR)/LICENSE
> +
> +$(eval $(luarocks-package))
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
