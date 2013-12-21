From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 21 Dec 2013 14:46:53 +0100
Subject: [Buildroot] How to create the package from software using
 "bootstrap" to configure?
In-Reply-To: <CAMduVEcRz63T4e5Fa_4iDm-H9e9RuOWkDMNTXAHe6VtZsLXhtg@mail.gmail.com>
References: <CAMduVEcRz63T4e5Fa_4iDm-H9e9RuOWkDMNTXAHe6VtZsLXhtg@mail.gmail.com>
Message-ID: <20131221144653.4af8deff@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Wojciech Zabolotny,

On Sat, 21 Dec 2013 14:15:44 +0100, Wojciech Zabolotny wrote:

> AVRDUDE_VERSION = eabe067c4527bc2eedc5db9288ef5cf1818ec720
> AVRDUDE_SITE =
> http://github.com/kcuzner/avrdude/tarball/$(AVRDUDE_VERSION)
> AVRDUDE_LICENSE = GPLv2 AVRDUDE_INSTALL_TARGET = YES
> AVRDUDE_AURORECONF = YES
> 
> 
> define AVRDUDE_CONFIGURE_CMDS
>         (cd $(@D)/avrdude; \
>                 ./bootstrap --prefix=$(TARGET_DIR)/usr
> --parallel=$(PARALLEL_JOBS) ;\
>                 ./configure --prefix=$(TARGET_DIR)/usr \
>         )
> endef
> 
> define AVRDUDE_BUILD_CMDS
>         $(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/avrdude
> endef
> 
> define AVRDUDE_INSTALL_TARGET_CMDS
>         $(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/avrdude install
> endef
> 
> $(eval $(generic-package))

Make it an autools-package instead, and specify AVRDUDE_AUTORECONF =
YES. This will have the same effect as calling avrdude's bootstrap
script.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
