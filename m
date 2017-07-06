From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 6 Jul 2017 16:27:59 +0200
Subject: [Buildroot] [PATCH v4 1/1] libressl: new package
In-Reply-To: <20170706111201.6806-1-aduskett@codeblue.com>
References: <20170706111201.6806-1-aduskett@codeblue.com>
Message-ID: <20170706162759.19812c63@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu,  6 Jul 2017 07:12:01 -0400, Adam Duskett wrote:

> +#Run install-exec to prevent header files and man pages from being installed
> +#to the target.
> +define LIBRESSL_INSTALL_TARGET_CMDS
> +	$(TARGET_MAKE_ENV) $(MAKE) DESTDIR=$(TARGET_DIR) -C $(@D) install-exec
> +endef

I think it has already been said in previous reviews: we want to do a
regular "make install" to the target, so please drop
INSTALL_TARGET_CMDS entirely, and rely on the one provided by the
autotools package infrastructure

Header files and man pages are automatically removed by Buildroot at
the end of the build (see the target-finalize make target in the main
Makefile).

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
