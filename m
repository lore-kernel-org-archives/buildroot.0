From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 26 Mar 2020 20:01:06 +0100
Subject: [Buildroot] [PATCH v2,
 1/1] package/connman: disable wireguard support
In-Reply-To: <20200326152501.GA30362@P-NAN-EREVAN-mikbou>
References: <20200326152501.GA30362@P-NAN-EREVAN-mikbou>
Message-ID: <20200326190106.GU22325@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2020-03-26 16:25 +0100, Mikael Bourhis-Cloarec spake thusly:
> The new Connman 1.38 release uses 'WireGuard' and 'libmnl' by default now.

For the libmnl part, we already have a pending patch:
    https://patchwork.ozlabs.org/patch/1251106/

> But to keep the same 'Connman' setup as previous setup, we need to
> explicitly disable the 'WireGuard' support.
> 
> The support of all the new 'Connman' options will be added by follow-up commits
> (or patches).
> 
> Fixes:
> http://autobuild.buildroot.org/?reason=connman-1.38

AFAICS, all the failures have iptable support enabled, which should be
solved by the patch above...

I don't see how wireguard fits in the picture...

Regards,
Yann E. MORIN.

> Signed-off-by: Mikael Bourhis-Cloarec <mikael.bourhis@smile.fr>
> ---
> Changes v1 -> v2 (after review of Romain Naour)
>   - this fix concerns all Arch, not only x86_64
>   - do not add a new '_CONF_OPTS' line but use the previous one
> 
>  package/connman/connman.mk | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/package/connman/connman.mk b/package/connman/connman.mk
> index 701be8b59d..62ae919862 100644
> --- a/package/connman/connman.mk
> +++ b/package/connman/connman.mk
> @@ -12,7 +12,8 @@ CONNMAN_INSTALL_STAGING = YES
>  CONNMAN_LICENSE = GPL-2.0
>  CONNMAN_LICENSE_FILES = COPYING
>  
> -CONNMAN_CONF_OPTS = --with-dbusconfdir=/etc
> +CONNMAN_CONF_OPTS = --with-dbusconfdir=/etc \
> +	--disable-wireguard
>  
>  ifeq ($(BR2_INIT_SYSTEMD),y)
>  CONNMAN_CONF_OPTS += --with-systemdunitdir=/usr/lib/systemd/system
> -- 
> 2.20.1
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
