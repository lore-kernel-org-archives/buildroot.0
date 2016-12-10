From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 10 Dec 2016 21:52:22 +0100
Subject: [Buildroot] [Patch v2 3/9] s6: new package
In-Reply-To: <1481397650-14664-4-git-send-email-eric.le.bihan.dev@free.fr>
References: <1481397650-14664-1-git-send-email-eric.le.bihan.dev@free.fr>
 <1481397650-14664-4-git-send-email-eric.le.bihan.dev@free.fr>
Message-ID: <20161210215222.6989afd3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 10 Dec 2016 20:20:44 +0100, Eric Le Bihan wrote:
> This new package provides s6, a small suite of programs for UNIX,
> designed to allow process supervision (a.k.a service supervision), in
> the line of daemontools and runit.
> 
> Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>

Same comments as the previous patches: please fix the --prefix=/usr to
--prefix=$(HOST_DIR)/usr for the host variant. And there is the same
issue in the following patches as well.

> +define S6_INSTALL_STAGING_CMDS
> +	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(STAGING_DIR) install
> +endef

You're doing a plain "make install" here.

> +define HOST_S6_INSTALL_CMDS
> +	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(HOST_DIR) \
> +		install-dynlib \
> +		install-include
> +endef

but not here. Why?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
