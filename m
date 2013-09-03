From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 3 Sep 2013 21:16:40 +0200
Subject: [Buildroot] [PATCH 1/1] netplug: properly install init.d script.
In-Reply-To: <1378228974-3369-1-git-send-email-psanford@nearbuysystems.com>
References: <1378228974-3369-1-git-send-email-psanford@nearbuysystems.com>
Message-ID: <20130903211640.14902850@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Sanford,

On Tue,  3 Sep 2013 10:22:54 -0700, Peter Sanford wrote:
> Looks like this was lost in 20d4792e.
> 
> Signed-off-by: Peter Sanford <psanford@nearbuysystems.com>
> ---
>  package/netplug/netplug.mk |    7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/package/netplug/netplug.mk b/package/netplug/netplug.mk
> index fbc7a2d..36bd3f7 100644
> --- a/package/netplug/netplug.mk
> +++ b/package/netplug/netplug.mk
> @@ -16,6 +16,13 @@ define NETPLUG_INSTALL_TARGET_CMDS
>  	$(MAKE) DESTDIR=$(TARGET_DIR) -C $(@D) install
>  endef
>  
> +define NETPLUG_INSTALL_INITSCRIPT
> +	$(INSTALL) -m 0755 -D package/netplug/S29netplug \
> +		$(TARGET_DIR)/etc/init.d/S29netplug
> +endef
> +
> +NETPLUG_POST_INSTALL_TARGET_HOOKS += NETPLUG_INSTALL_INITSCRIPT

Looks good, but it should use NETPLUG_INSTALL_INIT_SYSV instead. See
the Buildroot manual for details,
http://buildroot.org/downloads/manual/manual.html.

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
