From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 17 Aug 2011 12:34:00 +0200
Subject: [Buildroot] [PATCH] wirless-tools: install header files to
 staging dir
In-Reply-To: <1313494267-23656-1-git-send-email-zonque@gmail.com>
References: <1313494267-23656-1-git-send-email-zonque@gmail.com>
Message-ID: <20110817123400.0bee201a@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Le Tue, 16 Aug 2011 13:31:07 +0200,
Daniel Mack <zonque@gmail.com> a ?crit :

> diff --git a/package/wireless_tools/wireless_tools.mk b/package/wireless_tools/wireless_tools.mk
> index d8358ba..3e73b51 100644
> --- a/package/wireless_tools/wireless_tools.mk
> +++ b/package/wireless_tools/wireless_tools.mk
> @@ -36,6 +36,7 @@ endef
>  define WIRELESS_TOOLS_INSTALL_TARGET_CMDS
>  	$(MAKE) -C $(@D) PREFIX="$(TARGET_DIR)" $(WIRELESS_TOOLS_INSTALL_TARGETS)
>  	$(MAKE) -C $(@D) INSTALL_MAN="$(TARGET_DIR)/usr/share/man" install-man
> +	$(MAKE) -C $(@D) INSTALL_INC="$(STAGING_DIR)/usr/include/" install-hdr
>  endef

Hum, the installation of the headers to the STAGING_DIR is already done
if you enable BR2_PACKAGE_WIRELESS_TOOLS_LIB.

(And anyway, installing things to STAGING_DIR in
<pkg>_INSTALL_TARGET_CMDS is very wrong).

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
