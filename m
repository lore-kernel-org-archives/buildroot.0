From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 04 Sep 2013 00:16:34 +0200
Subject: [Buildroot] [PATCH 1/1] netplug: properly install init.d script.
In-Reply-To: <1378228974-3369-1-git-send-email-psanford@nearbuysystems.com>
 (Peter Sanford's message of "Tue, 3 Sep 2013 10:22:54 -0700")
References: <1378228974-3369-1-git-send-email-psanford@nearbuysystems.com>
Message-ID: <87d2op5z5p.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Sanford <psanford@nearbuysystems.com> writes:

 Peter> Looks like this was lost in 20d4792e.
 Peter> Signed-off-by: Peter Sanford <psanford@nearbuysystems.com>
 Peter> ---
 Peter>  package/netplug/netplug.mk |    7 +++++++
 Peter>  1 file changed, 7 insertions(+)

 Peter> diff --git a/package/netplug/netplug.mk b/package/netplug/netplug.mk
 Peter> index fbc7a2d..36bd3f7 100644
 Peter> --- a/package/netplug/netplug.mk
 Peter> +++ b/package/netplug/netplug.mk
 Peter> @@ -16,6 +16,13 @@ define NETPLUG_INSTALL_TARGET_CMDS
 Peter>  	$(MAKE) DESTDIR=$(TARGET_DIR) -C $(@D) install
 Peter>  endef
 
 Peter> +define NETPLUG_INSTALL_INITSCRIPT
 Peter> +	$(INSTALL) -m 0755 -D package/netplug/S29netplug \
 Peter> +		$(TARGET_DIR)/etc/init.d/S29netplug
 Peter> +endef

Committed with this changed to use NETPLUG_INSTALL_INIT_SYSV, thanks.

-- 
Bye, Peter Korsgaard
