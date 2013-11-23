From: Bernd Kuhls <berndkuhls@hotmail.com>
Date: Sat, 23 Nov 2013 17:45:18 +0100
Subject: [Buildroot] [git commit] lockdev: add lockdev
References: <20130729192308.44C069AE88@busybox.osuosl.org>
Message-ID: <ul27max08g.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote
in news:20130729192308.44C069AE88 at busybox.osuosl.org: 

> commit:
> http://git.buildroot.net/buildroot/commit/?id=f2a007480cab92c359432b9fa30
> 7eb48c5510086 branch:
> http://git.buildroot.net/buildroot/commit/?id=refs/heads/master 

[...]

> +define LOCKDEV_INSTALL_TARGET_CMDS
> +     $(MAKE1) basedir=$(TARGET_DIR)/usr -C $(@D) install_run
> +     ln -sf liblockdev.$(LOCKDEV_VERSION).so
> $(STAGING_DIR)/usr/lib/liblockdev.so.1 +endef
> +endif # BR2_PREFER_STATIC_LIB

I think STAGING_DIR should have been TARGET_DIR here.

Regards, Bernd
