From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 27 Feb 2014 08:08:02 +0100
Subject: [Buildroot] [PATCH 09/24] lpeg: new package
In-Reply-To: <1393227301-14874-10-git-send-email-francois.perrad@gadz.org>
References: <1393227301-14874-1-git-send-email-francois.perrad@gadz.org>
 <1393227301-14874-10-git-send-email-francois.perrad@gadz.org>
Message-ID: <530EE452.4050508@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02/24/14 08:34, Francois Perrad wrote:
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 Actually, everybody: is there any reason why we use python- and perl- as
package name prefixes, but not lua- ? For reference (not that it should
influence us), on Debian this package is called lua-lpeg.

 Regards,
 Arnout

> ---
>  package/Config.in      |    1 +
>  package/lpeg/Config.in |    8 ++++++++
>  package/lpeg/lpeg.mk   |   10 ++++++++++
>  3 files changed, 19 insertions(+)
>  create mode 100644 package/lpeg/Config.in
>  create mode 100644 package/lpeg/lpeg.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index edff553..a7df716 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -370,6 +370,7 @@ source "package/coxpcall/Config.in"
>  source "package/lbase64/Config.in"
>  source "package/ljlinenoise/Config.in"
>  source "package/ljsyscall/Config.in"
> +source "package/lpeg/Config.in"
>  source "package/lua-cjson/Config.in"
>  source "package/lua-ev/Config.in"
>  source "package/lua-msgpack-native/Config.in"
> diff --git a/package/lpeg/Config.in b/package/lpeg/Config.in
> new file mode 100644
> index 0000000..da54d61
> --- /dev/null
> +++ b/package/lpeg/Config.in
> @@ -0,0 +1,8 @@
> +config BR2_PACKAGE_LPEG
> +	bool "lpeg"
> +	depends on BR2_PACKAGE_HAS_LUA_INTERPRETER
> +	help
> +	  LPeg is a new pattern-matching library for Lua,
> +	  based on Parsing Expression Grammars (PEGs).
> +
> +	  http://www.inf.puc-rio.br/~roberto/lpeg/lpeg.html
> diff --git a/package/lpeg/lpeg.mk b/package/lpeg/lpeg.mk
> new file mode 100644
> index 0000000..a9759e5
> --- /dev/null
> +++ b/package/lpeg/lpeg.mk
> @@ -0,0 +1,10 @@
> +################################################################################
> +#
> +# lpeg
> +#
> +################################################################################
> +
> +LPEG_VERSION = 0.12-1
> +LPEG_LICENSE = MIT
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
