From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 1 May 2019 15:37:30 +0200
Subject: [Buildroot] [PATCH 1/5] package/network-manager: don't use
 --disable-crashtrace
In-Reply-To: <20190501072623.18271-1-lkundrak@v3.sk>
References: <20190501072623.18271-1-lkundrak@v3.sk>
Message-ID: <60bad502-a44f-6830-9784-b4ffd050e382@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 01/05/2019 09:26, Lubomir Rintel wrote:
> It was removed long ago and does nothing.
> 
> Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>

 Applied to master, thanks.

 Regards,
 Arnout

> ---
>  package/network-manager/network-manager.mk | 5 -----
>  1 file changed, 5 deletions(-)
> 
> diff --git a/package/network-manager/network-manager.mk b/package/network-manager/network-manager.mk
> index 721533038c..96f842f120 100644
> --- a/package/network-manager/network-manager.mk
> +++ b/package/network-manager/network-manager.mk
> @@ -82,11 +82,6 @@ else
>  NETWORK_MANAGER_CONF_OPTS += --disable-ovs
>  endif
>  
> -# uClibc by default doesn't have backtrace support, so don't use it
> -ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)
> -NETWORK_MANAGER_CONF_OPTS += --disable-crashtrace
> -endif
> -
>  define NETWORK_MANAGER_INSTALL_INIT_SYSV
>  	$(INSTALL) -m 0755 -D package/network-manager/S45network-manager $(TARGET_DIR)/etc/init.d/S45network-manager
>  endef
> 
