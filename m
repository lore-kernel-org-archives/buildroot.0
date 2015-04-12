From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 12 Apr 2015 16:55:42 +0200
Subject: [Buildroot] [PATCH 11/14] packages: remove non-IPv6 enabler
 patches
In-Reply-To: <1428754662-27829-11-git-send-email-gustavo@zacarias.com.ar>
References: <1428754662-27829-1-git-send-email-gustavo@zacarias.com.ar>
 <1428754662-27829-11-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20150412145541.GM21018@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gustavo, All,

On 2015-04-11 09:17 -0300, Gustavo Zacarias spake thusly:
> These are no longer required so remove them.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/avahi/0003-ipv6only.patch                  |  19 --
>  package/avahi/0005-optional-ipv6.patch             | 147 --------------
>  package/iproute2/0001-optional-ipv6.patch          |  89 ---------
>  package/iproute2/0002-vxlan-optional-ipv6.patch    |  83 --------
>  package/libeXosip2/0001-fix-non-ipv6-build.patch   |  22 ---
>  package/libglib2/0001-optional-ipv6.patch          | 195 ------------------
>  package/libnice/0001-build-IPV6_RECVERR.patch      |  20 --
>  .../libtirpc/0003-Make-IPv6-support-optional.patch |  26 ---
>  package/luasocket/0001-uClibc-IPv6.patch           | 217 ---------------------
>  package/perl/0001-uClibc-IPv6.patch                |  61 ------
>  package/rpcbind/0003-Make-IPv6-configurable.patch  |  42 ----
>  package/rpcbind/rpcbind.mk                         |   1 -
>  package/x11vnc/0001-ipv6.patch                     |  25 ---
>  13 files changed, 947 deletions(-)
>  delete mode 100644 package/avahi/0003-ipv6only.patch
>  delete mode 100644 package/avahi/0005-optional-ipv6.patch
>  delete mode 100644 package/iproute2/0001-optional-ipv6.patch
>  delete mode 100644 package/iproute2/0002-vxlan-optional-ipv6.patch
>  delete mode 100644 package/libeXosip2/0001-fix-non-ipv6-build.patch
>  delete mode 100644 package/libglib2/0001-optional-ipv6.patch
>  delete mode 100644 package/libnice/0001-build-IPV6_RECVERR.patch
>  delete mode 100644 package/libtirpc/0003-Make-IPv6-support-optional.patch
>  delete mode 100644 package/luasocket/0001-uClibc-IPv6.patch
>  delete mode 100644 package/perl/0001-uClibc-IPv6.patch
>  delete mode 100644 package/rpcbind/0003-Make-IPv6-configurable.patch
>  delete mode 100644 package/x11vnc/0001-ipv6.patch

We also have one patch dealing with IPv6 for lighttpd:

  - package/lighttpd/0001-Fix-default-config-file.patch

    @@ -90,7 +90,7 @@ server.port = 80
     ##
     ## Use IPv6?
     ##
    -server.use-ipv6 = "enable"
    +# server.use-ipv6 = "enable"
     
     ##
     ## bind to a specific IP

  - changes the default config to disable IPv6: do we want to keep that
    hunk?

Otherwise:

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
