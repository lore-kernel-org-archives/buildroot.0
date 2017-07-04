From: Romain Naour <romain.naour@smile.fr>
Date: Tue, 4 Jul 2017 17:08:28 +0200
Subject: [Buildroot] [PATCH v3 07/14] gdb: Remove /usr part from
 installation path of gdbserver
In-Reply-To: <20170704140404.4098-8-arnout@mind.be>
References: <20170704140404.4098-1-arnout@mind.be>
 <20170704140404.4098-8-arnout@mind.be>
Message-ID: <f5916069-8c64-d853-9f2a-7d1fa9f7faa4@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

Le 04/07/2017 ? 16:03, Arnout Vandecappelle (Essensium/Mind) a ?crit :
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Reviewed-by: Romain Naour <romain.naour@smile.fr>

There are two other $(HOST_DIR)/usr in gdb.mk but I guess it will be done in a
follow up patch.

Best regards,
Romain

> ---
>  package/gdb/gdb.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/gdb/gdb.mk b/package/gdb/gdb.mk
> index 7036b4cb0f..9a97cb77a7 100644
> --- a/package/gdb/gdb.mk
> +++ b/package/gdb/gdb.mk
> @@ -181,7 +181,7 @@ GDB_POST_INSTALL_TARGET_HOOKS += GDB_REMOVE_UNNEEDED_FILES
>  # does.
>  define GDB_SDK_INSTALL_GDBSERVER
>  	$(INSTALL) -D -m 0755 $(TARGET_DIR)/usr/bin/gdbserver \
> -		$(HOST_DIR)/usr/$(GNU_TARGET_NAME)/debug-root/usr/bin/gdbserver
> +		$(HOST_DIR)/$(GNU_TARGET_NAME)/debug-root/usr/bin/gdbserver
>  endef
>  
>  ifeq ($(BR2_PACKAGE_GDB_SERVER),y)
> 
