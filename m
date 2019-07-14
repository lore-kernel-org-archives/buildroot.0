From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 14 Jul 2019 14:34:15 +0200
Subject: [Buildroot] [PATCH v2 1/2] package/Config.in: fix alphabetical
 order
In-Reply-To: <20190611204946.3848-1-jerzy.m.grzegorek@gmail.com>
References: <20190611204946.3848-1-jerzy.m.grzegorek@gmail.com>
Message-ID: <20190714123415.GB18236@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2019-06-11 22:49 +0200, Jerzy Grzegorek spake thusly:
> Signed-off-by: Jerzy Grzegorek <jerzy.m.grzegorek@gmail.com>
> ---
> Changes v1 -> v2:
>  - swap patches 1 and 2 (Arnout)
>  - change alphabetical order (Arnout)
>    real alphabetical order: '-', digits, capitals, '_', lowercase
>    order after change: '-', '_', digits, capitals, lowercase
> ---
> 
>  package/Config.in | 30 +++++++++++++++---------------
>  1 file changed, 15 insertions(+), 15 deletions(-)
> 
> diff --git a/package/Config.in b/package/Config.in
> index f61009410d..fcb61c61e0 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -288,10 +288,10 @@ comment "Graphic libraries"
>  	source "package/directfb/Config.in"
>  	source "package/directfb-examples/Config.in"
>  	source "package/efl/Config.in"
> +	source "package/fb-test-app/Config.in"
>  	source "package/fbdump/Config.in"
>  	source "package/fbgrab/Config.in"
>  	source "package/fbset/Config.in"
> -	source "package/fb-test-app/Config.in"

Actually, I am not a fan of this ordering.

I am a human, not a machine, so when I try to find something in an
ordered list in my head, I definitely do not run qsort() using the
C locale. Instead, I just ignore '-' or '_' when sorting; I just
sort on the letters and numbers, and anything else is silently
ignored.

So, again, this is a mechanical sort suited for machines, not humans.
This is sad... :-(

Regards,
Yann E. MORIN.

>  	source "package/fbterm/Config.in"
>  	source "package/fbv/Config.in"
>  	source "package/freerdp/Config.in"
> @@ -319,11 +319,11 @@ comment "Graphic libraries"
>  
>  comment "Other GUIs"
>  	source "package/qt5/Config.in"
> -	source "package/kf5/Config.in"
>  if BR2_PACKAGE_QT5
>  comment "QT libraries and helper libraries"
>  	source "package/cutelyst/Config.in"
>  	source "package/grantlee/Config.in"
> +	source "package/kf5/Config.in"
>  	source "package/qextserialport/Config.in"
>  	source "package/qjson/Config.in"
>  	source "package/quazip/Config.in"
> @@ -462,8 +462,8 @@ endmenu
>  	source "package/lcdproc/Config.in"
>  	source "package/libubootenv/Config.in"
>  	source "package/libuio/Config.in"
> -	source "package/linuxconsoletools/Config.in"
>  	source "package/linux-backports/Config.in"
> +	source "package/linuxconsoletools/Config.in"
>  	source "package/lirc-tools/Config.in"
>  	source "package/lm-sensors/Config.in"
>  	source "package/lshw/Config.in"
> @@ -632,12 +632,15 @@ menu "Lua libraries/modules"
>  	source "package/lua-messagepack/Config.in"
>  	source "package/lua-msgpack-native/Config.in"
>  	source "package/lua-periphery/Config.in"
> +	source "package/lua-resty-http/Config.in"
> +	source "package/lua-sailor/Config.in"
>  	source "package/lua-sdl2/Config.in"
>  	source "package/lua-std-debug/Config.in"
>  	source "package/lua-std-normalize/Config.in"
>  	source "package/lua-stdlib/Config.in"
>  	source "package/lua-testmore/Config.in"
>  	source "package/lua-utf8/Config.in"
> +	source "package/lua-valua/Config.in"
>  	source "package/luabitop/Config.in"
>  	source "package/luadbi/Config.in"
>  	source "package/luadbi-sqlite3/Config.in"
> @@ -648,12 +651,9 @@ menu "Lua libraries/modules"
>  	source "package/lualogging/Config.in"
>  	source "package/luaossl/Config.in"
>  	source "package/luaposix/Config.in"
> -	source "package/lua-resty-http/Config.in"
> -	source "package/lua-sailor/Config.in"
>  	source "package/luasec/Config.in"
>  	source "package/luasocket/Config.in"
>  	source "package/luasql-sqlite3/Config.in"
> -	source "package/lua-valua/Config.in"
>  	source "package/lutok/Config.in"
>  	source "package/luv/Config.in"
>  	source "package/luvi/Config.in"
> @@ -742,13 +742,13 @@ menu "Perl libraries/modules"
>  	source "package/perl-lwp-mediatypes/Config.in"
>  	source "package/perl-mail-dkim/Config.in"
>  	source "package/perl-mailtools/Config.in"
> -	source "package/perl-mime-base64-urlsafe/Config.in"
>  	source "package/perl-mime-base64/Config.in"
> +	source "package/perl-mime-base64-urlsafe/Config.in"
>  	source "package/perl-mime-tools/Config.in"
>  	source "package/perl-module-implementation/Config.in"
>  	source "package/perl-module-runtime/Config.in"
> -	source "package/perl-mojolicious-plugin-authentication/Config.in"
>  	source "package/perl-mojolicious/Config.in"
> +	source "package/perl-mojolicious-plugin-authentication/Config.in"
>  	source "package/perl-moo/Config.in"
>  	source "package/perl-net-dns/Config.in"
>  	source "package/perl-net-http/Config.in"
> @@ -767,8 +767,8 @@ menu "Perl libraries/modules"
>  	source "package/perl-role-tiny/Config.in"
>  	source "package/perl-stream-buffered/Config.in"
>  	source "package/perl-sub-exporter-progressive/Config.in"
> -	source "package/perl-sub-quote/Config.in"
>  	source "package/perl-sub-install/Config.in"
> +	source "package/perl-sub-quote/Config.in"
>  	source "package/perl-sys-cpu/Config.in"
>  	source "package/perl-sys-meminfo/Config.in"
>  	source "package/perl-sys-mmap/Config.in"
> @@ -819,9 +819,9 @@ menu "External python modules"
>  	source "package/python-aiohttp-security/Config.in"
>  	source "package/python-aiohttp-session/Config.in"
>  	source "package/python-aiohttp-sse/Config.in"
> +	source "package/python-aiojobs/Config.in"
>  	source "package/python-aiomonitor/Config.in"
>  	source "package/python-aiorwlock/Config.in"
> -	source "package/python-aiojobs/Config.in"
>  	source "package/python-alsaaudio/Config.in"
>  	source "package/python-argh/Config.in"
>  	source "package/python-arrow/Config.in"
> @@ -873,8 +873,8 @@ menu "External python modules"
>  	source "package/python-dicttoxml/Config.in"
>  	source "package/python-django/Config.in"
>  	source "package/python-docker/Config.in"
> -	source "package/python-dockerpty/Config.in"
>  	source "package/python-docker-pycreds/Config.in"
> +	source "package/python-dockerpty/Config.in"
>  	source "package/python-docopt/Config.in"
>  	source "package/python-docutils/Config.in"
>  	source "package/python-dominate/Config.in"
> @@ -886,8 +886,8 @@ menu "External python modules"
>  	source "package/python-falcon/Config.in"
>  	source "package/python-fire/Config.in"
>  	source "package/python-flask/Config.in"
> -	source "package/python-flask-cors/Config.in"
>  	source "package/python-flask-babel/Config.in"
> +	source "package/python-flask-cors/Config.in"
>  	source "package/python-flask-jsonrpc/Config.in"
>  	source "package/python-flask-login/Config.in"
>  	source "package/python-flask-sqlalchemy/Config.in"
> @@ -920,9 +920,9 @@ menu "External python modules"
>  	source "package/python-jaraco-classes/Config.in"
>  	source "package/python-jedi/Config.in"
>  	source "package/python-jinja2/Config.in"
> +	source "package/python-json-schema-validator/Config.in"
>  	source "package/python-jsonmodels/Config.in"
>  	source "package/python-jsonschema/Config.in"
> -	source "package/python-json-schema-validator/Config.in"
>  	source "package/python-keyring/Config.in"
>  	source "package/python-libconfig/Config.in"
>  	source "package/python-libusb1/Config.in"
> @@ -1269,8 +1269,8 @@ menu "Graphics"
>  	source "package/cairo/Config.in"
>  	source "package/cairomm/Config.in"
>  	source "package/chipmunk/Config.in"
> -	source "package/exiv2/Config.in"
>  	source "package/exempi/Config.in"
> +	source "package/exiv2/Config.in"
>  	source "package/fltk/Config.in"
>  	source "package/fontconfig/Config.in"
>  	source "package/freetype/Config.in"
> @@ -1963,13 +1963,13 @@ menu "Networking applications"
>  	source "package/nbd/Config.in"
>  	source "package/ncftp/Config.in"
>  	source "package/ndisc6/Config.in"
> +	source "package/net-tools/Config.in"
>  	source "package/netatalk/Config.in"
>  	source "package/netcat/Config.in"
>  	source "package/netcat-openbsd/Config.in"
>  	source "package/netplug/Config.in"
>  	source "package/netsnmp/Config.in"
>  	source "package/netstat-nat/Config.in"
> -	source "package/net-tools/Config.in"
>  	source "package/network-manager/Config.in"
>  	source "package/nfacct/Config.in"
>  	source "package/nftables/Config.in"
> -- 
> 2.17.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
