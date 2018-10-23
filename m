From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 23 Oct 2018 23:56:16 +0100
Subject: [Buildroot] [scanrock 3/5] lua*: regeneration of *.mk files
In-Reply-To: <20181021163259.28335-4-francois.perrad@gadz.org>
References: <20181021163259.28335-1-francois.perrad@gadz.org>
 <20181021163259.28335-4-francois.perrad@gadz.org>
Message-ID: <41be71eb-52c7-c0f1-6df2-1f7f71eb0718@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 10/21/18 5:32 PM, Francois Perrad wrote:
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

 Just to be sure: they are all completely automatically regenerated without any
manual editing? If there is manual editing involved, please explain so at length
in the commit message.

 And you did that for all existing luarocks packages?

[snip]
> -COPAS_LICENSE_FILES = $(COPAS_SUBDIR)/doc/us/license.html
> +COPAS_LICENSE_FILES = $(COPAS_SUBDIR)/LICENSE

 I double-checked that both files indeed contain the MIT license text, and only
differ in that one is html and the other is plaintext.

[snip]
>  LUA_FLU_VERSION = 20150331-1
> -LUA_FLU_NAME_UPSTREAM = flu
> +LUA_FLU_NAME_UPSTREAM = Flu

 That is interesting... Since it used to work apparently there is no need for an
upstream name with the correct case? Indeed, if the only difference is the case,
then the NAME_UPSTREAM is not needed if _SUBDIR is anyway set explicitly. It's
probably better to set it explicitly anyway.


>  LUA_FLU_SUBDIR = doub-flu-a7daae986339
>  LUA_FLU_LICENSE = MIT
>  LUA_FLU_LICENSE_FILES = $(LUA_FLU_SUBDIR)/doc/LICENSE.txt
> diff --git a/package/lua-iconv/lua-iconv.mk b/package/lua-iconv/lua-iconv.mk
> index dd7533af5..ea8e0dd8b 100644
> --- a/package/lua-iconv/lua-iconv.mk
> +++ b/package/lua-iconv/lua-iconv.mk
> @@ -5,8 +5,8 @@
>  ################################################################################
>  
>  LUA_ICONV_VERSION = 7-1
> -LUA_ICONV_DEPENDENCIES = $(if $(BR2_PACKAGE_LIBICONV),libiconv)
>  LUA_ICONV_LICENSE = MIT
>  LUA_ICONV_LICENSE_FILES = $(LUA_ICONV_SUBDIR)/COPYING
> +LUA_ICONV_DEPENDENCIES = $(if $(BR2_PACKAGE_LIBICONV),libiconv)

 I seem to have missed the code in scanrocks that does this?

[snip]

 Basically, except for the commit message, all is well, so you can add my

 Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 Regards,
 Arnout
