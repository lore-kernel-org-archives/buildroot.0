From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Mon, 2 Feb 2015 16:38:06 +0100
Subject: [Buildroot] [PATCH 1/1] lua-periphery: new package
In-Reply-To: <1422852616-32612-1-git-send-email-vsergeev@gmail.com>
References: <1422852616-32612-1-git-send-email-vsergeev@gmail.com>
Message-ID: <CAAXf6LU=_dc=wA+VUwcBt2_PWnzKfLdXTcu23tZgZe8oX-zR4w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Vanya,

On Mon, Feb 2, 2015 at 5:50 AM, Vanya Sergeev <vsergeev@gmail.com> wrote:
> Signed-off-by: Vanya Sergeev <vsergeev@gmail.com>
> ---
>  package/Config.in                      |  1 +
>  package/lua-periphery/Config.in        |  8 ++++++++
>  package/lua-periphery/lua-periphery.mk | 13 +++++++++++++
>  3 files changed, 22 insertions(+)
>  create mode 100644 package/lua-periphery/Config.in
>  create mode 100644 package/lua-periphery/lua-periphery.mk
>
> diff --git a/package/Config.in b/package/Config.in
> index dd011be..ca63d4f 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -425,6 +425,7 @@ menu "Lua libraries/modules"
>         source "package/lua-ev/Config.in"
>         source "package/lua-messagepack/Config.in"
>         source "package/lua-msgpack-native/Config.in"
> +       source "package/lua-periphery/Config.in"
>         source "package/lua-testmore/Config.in"
>         source "package/luabitop/Config.in"
>         source "package/luacrypto/Config.in"
> diff --git a/package/lua-periphery/Config.in b/package/lua-periphery/Config.in
> new file mode 100644
> index 0000000..59cf17f
> --- /dev/null
> +++ b/package/lua-periphery/Config.in
> @@ -0,0 +1,8 @@
> +config BR2_PACKAGE_LUA_PERIPHERY
> +       bool "lua-periphery"
> +       depends on BR2_PACKAGE_HAS_LUAINTERPRETER
> +       help
> +         A library for GPIO, SPI, I2C, MMIO, and Serial peripheral I/O interface


Thanks a lot for your contribution.
I resent your patch to the list with a minor fix: the above line is 81
instead of 80 characters long.
Other than that, I compile-tested it without problems.

Best regards,
Thomas
