From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 6 Jun 2013 19:42:45 +0200
Subject: [Buildroot] [PATCH 04/14] lua-msgpack-native: fix github
 tarball to use commit id
In-Reply-To: <1370537249-15682-4-git-send-email-spenser@gillilanding.com>
References: <bug-6302-163@https.bugs.busybox.net/>
 <1370537249-15682-1-git-send-email-spenser@gillilanding.com>
 <1370537249-15682-4-git-send-email-spenser@gillilanding.com>
Message-ID: <20130606174245.GA3461@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Spenser, All,

On 2013-06-06 11:47 -0500, Spenser Gilliland spake thusly:
> Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
> ---
>  package/lua-msgpack-native/lua-msgpack-native.mk |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/lua-msgpack-native/lua-msgpack-native.mk b/package/lua-msgpack-native/lua-msgpack-native.mk
> index 97ce83c..b9ef21c 100644
> --- a/package/lua-msgpack-native/lua-msgpack-native.mk
> +++ b/package/lua-msgpack-native/lua-msgpack-native.mk
> @@ -4,7 +4,7 @@
>  #
>  #############################################################
>  LUA_MSGPACK_NATIVE_VERSION = g41cce91
> -LUA_MSGPACK_NATIVE_SITE = http://github.com/kengonakajima/lua-msgpack-native/tarball/master
> +LUA_MSGPACK_NATIVE_SITE = http://github.com/kengonakajima/lua-msgpack-native/tarball/${LUA_MSGPACK_NATIVE_VERSION)

$ make
package/lua-msgpack-native/lua-msgpack-native.mk:8: *** unterminated
variable reference.  Stop.
make: *** [all] Error 2

That's because you are using an opening curly-brace, but a closing
parenthesis in: ${LUA_MSGPACK_NATIVE_VERSION)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
