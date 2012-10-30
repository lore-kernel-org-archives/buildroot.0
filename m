From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 30 Oct 2012 13:55:44 +0100
Subject: [Buildroot] [PATCH] package: add knxweb
In-Reply-To: <1351599843-24291-4-git-send-email-gregory.hermant@calao-systems.com>
References: <1351599843-24291-1-git-send-email-gregory.hermant@calao-systems.com>
 <1351599843-24291-4-git-send-email-gregory.hermant@calao-systems.com>
Message-ID: <20121030135544.6f6d0e40@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gregory Hermant,

On Tue, 30 Oct 2012 13:24:03 +0100, Gregory Hermant wrote:
> diff --git a/package/knxweb/knxweb.mk b/package/knxweb/knxweb.mk
> new file mode 100644
> index 0000000..5ca1760
> --- /dev/null
> +++ b/package/knxweb/knxweb.mk
> @@ -0,0 +1,20 @@
> +#############################################################
> +#
> +# knxweb
> +#
> +#############################################################
> +
> +KNXWEB_VERSION = 0.6.1
> +KNXWEB_SOURCE = knxweb-$(KNXWEB_VERSION).tar.gz
> +KNXWEB_SITE = http://sourceforge.net/projects/linknx/files/knxweb/knxweb-0.6.1/

The tarball has no license information, this is quite annoying.

> +define KNXWEB_INSTALL_TARGET_CMDS
> +	mkdir -p $(TARGET_DIR)/var/www
> +	cp -rdpf $(@D)/* $(TARGET_DIR)/var/www
> +endef
> +
> +define KNXWEB__UNINSTALL_TARGET_CMDS
> +	rm -rf $(TARGET_DIR)/var/www/
> +endef

Double _ here, so this doesn't work.

However, how does this web interface works? I see a few PHP scripts,
but they don't seem to be essential for the operation of the Web
interface. There's a lot of JS though. Does it communicate with the
server somehow?

I'm surprised that no interpreter like PHP, Lua or Python is needed
here for the server side, that's why I'm asking.

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
