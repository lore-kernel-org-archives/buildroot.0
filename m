From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 1 Nov 2014 20:07:22 +0100
Subject: [Buildroot] [PATCH 1/1] package/tinyxml: fix the upstream URL
In-Reply-To: <1414865313-30621-1-git-send-email-romain.naour@openwide.fr>
References: <1414865313-30621-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <20141101190722.GE10189@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain, All,

On 2014-11-01 19:08 +0100, Romain Naour spake thusly:
> Signed-off-by: Romain Naour <romain.naour@openwide.fr>
> ---
>  package/tinyxml/Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/tinyxml/Config.in b/package/tinyxml/Config.in
> index 061ff67..466e391 100644
> --- a/package/tinyxml/Config.in
> +++ b/package/tinyxml/Config.in
> @@ -5,7 +5,7 @@ config BR2_PACKAGE_TINYXML
>  	  TinyXML is a simple, small, C++ XML parser that can be
>  	  easily integrating into other programs.
>  
> -	  https://github.com/leethomason/tinyxml2
> +	  http://sourceforge.net/projects/tinyxml

Well, I'm not even sure we are using that TinyXML.

In fact, we get it from an XMBC mirror:
    TINYXML_SITE = http://mirrors.xbmc.org/build-deps/sources

The content of the tinyxml-2.6.2_2.tar.gz archive is not even remotely
similar to the content of the repository on the sourceforge webpage; at
least, it has been hugely re-organised, and patched. It also has
autotools files, which is good, though.

So, NAK on this, until we have a clear explanations on what's going on.

Maxime, why do we need this specially patched tinyxml from the XBMC
mirror, instead of the one from upstream?

Regards,
Yann E. MORIN.

>  comment "tinyxml needs a toolchain w/ C++"
>  	depends on !BR2_INSTALL_LIBSTDCPP
> -- 
> 1.9.3
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
