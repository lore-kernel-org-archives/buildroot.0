From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 27 Sep 2017 21:18:05 +0200
Subject: [Buildroot] [PATCH 2/2] dash: enable line editting if libedit
 is selected.
In-Reply-To: <1506530514-27185-2-git-send-email-casantos@datacom.ind.br>
References: <1506530514-27185-1-git-send-email-casantos@datacom.ind.br>
 <1506530514-27185-2-git-send-email-casantos@datacom.ind.br>
Message-ID: <20170927211805.62bb4cfb@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 27 Sep 2017 13:41:54 -0300, Carlos Santos wrote:

> +# Enable line editing, Emacs style
> +define DASH_INSTALL_PROFILE
> +	echo 'set -E' > $(TARGET_DIR)/etc/profile.d/dash.sh
> +endef

This really looks like a "personal preference" configuration, that is
more relevant in a custom rootfs overlay, no?

> +ifeq ($(BR2_PACKAGE_LIBEDIT),y)
> +DASH_DEPENDENCIES += libedit
> +DASH_CONF_OPTS += --with-libedit
> +DASH_POST_INSTALL_TARGET_HOOKS += DASH_INSTALL_PROFILE

What about --without-libedit in an else case ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
