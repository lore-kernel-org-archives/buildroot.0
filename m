From: Romain Naour <romain.naour@smile.fr>
Date: Thu, 26 Mar 2020 18:01:56 +0100
Subject: [Buildroot] [PATCH v2,
 1/1] package/connman: disable wireguard support
In-Reply-To: <20200326152501.GA30362@P-NAN-EREVAN-mikbou>
References: <20200326152501.GA30362@P-NAN-EREVAN-mikbou>
Message-ID: <ac92ce9e-41e2-5f5f-5c52-f479ccd609b1@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Mikael,

Le 26/03/2020 ? 16:25, Mikael Bourhis-Cloarec a ?crit?:
> The new Connman 1.38 release uses 'WireGuard' and 'libmnl' by default now.
> 
> But to keep the same 'Connman' setup as previous setup, we need to
> explicitly disable the 'WireGuard' support.
> 
> The support of all the new 'Connman' options will be added by follow-up commits
> (or patches).
> 
> Fixes:
> http://autobuild.buildroot.org/?reason=connman-1.38
> 
> Signed-off-by: Mikael Bourhis-Cloarec <mikael.bourhis@smile.fr>

Reviewed-by: Romain Naour <romain.naour@smile.fr>

Best regards,
Romain

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
> 
