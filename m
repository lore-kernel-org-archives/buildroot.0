From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Fri, 15 Nov 2013 08:47:01 +0100
Subject: [Buildroot] [pkg-luarocks infra V3 07/10] lua-cjson: restore
 official name
In-Reply-To: <1384460249-32410-7-git-send-email-francois.perrad@gadz.org>
References: <1384460249-32410-1-git-send-email-francois.perrad@gadz.org>
 <1384460249-32410-7-git-send-email-francois.perrad@gadz.org>
Message-ID: <CAAXf6LW1wrMOLzof-xOHJ8LmSxCDMrgeCP0DMv58RAjZLXJq7Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Nov 14, 2013 at 9:17 PM, Francois Perrad <fperrad@gmail.com> wrote:
> (need by LuaRocks)
>
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  Config.in.legacy               |    7 +++++++
>  package/Config.in              |    2 +-
>  package/lua-cjson/Config.in    |   14 ++++++++++++++
>  package/lua-cjson/lua-cjson.mk |   34 ++++++++++++++++++++++++++++++++++
>  package/luacjson/Config.in     |   14 --------------
>  package/luacjson/luacjson.mk   |   35 -----------------------------------
>  6 files changed, 56 insertions(+), 50 deletions(-)
>  create mode 100644 package/lua-cjson/Config.in
>  create mode 100644 package/lua-cjson/lua-cjson.mk
>  delete mode 100644 package/luacjson/Config.in
>  delete mode 100644 package/luacjson/luacjson.mk
>
> diff --git a/Config.in.legacy b/Config.in.legacy
> index 587afe1..52bcf0a 100644
> --- a/Config.in.legacy
> +++ b/Config.in.legacy
> @@ -98,6 +98,13 @@ comment "build, or run, in unpredictable ways.               "
>  comment "----------------------------------------------------"
>  endif
>
> +config BR2_PACKAGE_LUACJSON
> +       bool "luacjson"
> +       select BR2_PACKAGE_LUA_CJSON
> +       select BR2_LEGACY
> +       help
> +         The package luacjson was renamed lua-cjson
> +
>  ###############################################################################
>  comment "Legacy options removed in 2013.11"
>

I think you should already put a comment at the top to say "Legacy
options removed in 2014.02".


Best regards,
Thomas
