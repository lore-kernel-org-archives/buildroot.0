From: Evgeniy Didin <Evgeniy.Didin@synopsys.com>
Date: Wed, 20 Dec 2017 16:22:10 +0000
Subject: [Buildroot] [PATCH 1/2] libdrm-armada: new package
In-Reply-To: <20171220151628.GE21413@scaer>
References: <20171220150843.21154-1-didin@synopsys.com>
 <20171220150843.21154-2-didin@synopsys.com> <20171220151628.GE21413@scaer>
Message-ID: <1513786929.21982.10.camel@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 2017-12-20 at 16:16 +0100, Yann E. MORIN wrote:
> Evgeniy, All,
> 
> On 2017-12-20 18:08 +0300, Evgeniy Didin spake thusly:
> > libdrm-armada is an Etnaviv libdrm buffer object management module.
> > It is used with xf86-driver-video-armada, which is Xorg driver for
> > Etnaviv.
> > 
> > Signed-off-by: Evgeniy Didin <didin@synopsys.com>
> > Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> > Cc: Alexey Brodkin <abrodkin@synopsys.com>
> > Cc: arc-buildroot at synopsys.com
> > ---
> > ?package/Config.in????????????????????????|??1 +
> > ?package/libdrm-armada/Config.in??????????|??7 +++++++
> > ?package/libdrm-armada/libdrm-armada.hash |??2 ++
> > ?package/libdrm-armada/libdrm-armada.mk???| 24
> > ++++++++++++++++++++++++
> > ?4 files changed, 34 insertions(+)
> > ?create mode 100644 package/libdrm-armada/Config.in
> > ?create mode 100644 package/libdrm-armada/libdrm-armada.hash
> > ?create mode 100644 package/libdrm-armada/libdrm-armada.mk
> > 
> > diff --git a/package/Config.in b/package/Config.in
> > index bd39a374f0..54caf7ae41 100644
> > --- a/package/Config.in
> > +++ b/package/Config.in
> > @@ -1116,6 +1116,7 @@ menu "Graphics"
> > ?	source "package/libdmtx/Config.in"
> > ?	source "package/libdri2/Config.in"
> > ?	source "package/libdrm/Config.in"
> > +????????source "package/libdrm-armada/Config.in"
> 
> Indentation with a TAB, not spaces:
> 
> ????$ ./utils/check-package package/libdrm-armada/*
> ????package/libdrm-armada/libdrm-armada.mk:19: expected indent with
> tabs
> ????33 lines processed
> ????1 warnings generated
> 
> ;-)
Sure, didn't notice that.

> > ?	source "package/libepoxy/Config.in"
> > ?	source "package/libexif/Config.in"
> > ?	source "package/libfm/Config.in"
> > diff --git a/package/libdrm-armada/Config.in b/package/libdrm-
> > armada/Config.in
> > new file mode 100644
> > index 0000000000..5deabf35ae
> > --- /dev/null
> > +++ b/package/libdrm-armada/Config.in
> > @@ -0,0 +1,7 @@
> > +config BR2_PACKAGE_LIBDRM_ARMADA
> > +	bool "libdrm-armada"
> > +	select BR2_PACKAGE_LIBDRM
> 
> libdrm depends on BR2_TOOLCHAIN_HAS_THREADS, so you need to propagate
> the dependency.

Ok, I will add it.
> > +	help
> > +	??Etnaviv libdrm buffer object management module
> > +
> > +	??https://urldefense.proofpoint.com/v2/url?u=http-3A__git.
> > arm.linux.org.uk_cgit_libdrm-
> > 2Darmada.git_&d=DwIBaQ&c=DPL6_X_6JkXFx7AXWqB0tg&r=vQk-
> > RIbjwN0zvlwiMSpq3LYUTNf7Gqc4ujhosYITtAw&m=CnJ1QQnRCNEGVciQmjSeLqgbk
> > J-lRMQV6Gfay4HEu8A&s=5qH5xP6bBnTlbjhd9Xq0BYoKYxA5NJ7ib9yNXMfGz4g&e=
> > diff --git a/package/libdrm-armada/libdrm-armada.hash
> > b/package/libdrm-armada/libdrm-armada.hash
> > new file mode 100644
> > index 0000000000..40911ea8e4
> > --- /dev/null
> > +++ b/package/libdrm-armada/libdrm-armada.hash
> > @@ -0,0 +1,2 @@
> > +# Locally calculated
> > +sha256
> > 0454ac8f55c7bfff548b75d7116c56fa125f5dfe118e630a85feb221de82fbb6??l
> > ibdrm-armada-6b461c.tar.gz
> > diff --git a/package/libdrm-armada/libdrm-armada.mk
> > b/package/libdrm-armada/libdrm-armada.mk
> > new file mode 100644
> > index 0000000000..fb96ad0b6e
> > --- /dev/null
> > +++ b/package/libdrm-armada/libdrm-armada.mk
> > @@ -0,0 +1,24 @@
> > +##################################################################
> > ##############
> > +#
> > +# libdrm-armada
> > +#
> > +##################################################################
> > ##############
> > +
> > +LIBDRM_ARMADA_VERSION = 6b461c
> > +LIBDRM_ARMADA_SOURCE = libdrm-armada-
> > $(LIBDRM_ARMADA_VERSION).tar.gz
> 
> This is the default value, so must not be specified.
> 
> > +LIBDRM_ARMADA_SITE = https://urldefense.proofpoint.com/v2/url?u=ht
> > tp-3A__git.arm.linux.org.uk_cgit_libdrm-
> > 2Darmada.git&d=DwIBaQ&c=DPL6_X_6JkXFx7AXWqB0tg&r=vQk-
> > RIbjwN0zvlwiMSpq3LYUTNf7Gqc4ujhosYITtAw&m=CnJ1QQnRCNEGVciQmjSeLqgbk
> > J-lRMQV6Gfay4HEu8A&s=KvgEHT225hwonSHx1uDmUZmsyl6xKudpJ9GAzsSEzIc&e=
> > +LIBDRM_ARMADA_SITE_METHOD = git
> > +LIBDRM_ARMADA_DEPENDENCIES = libdrm
> > +LIBDRM_ARMADA_INSTALL_STAGING = YES
> > +
> > +# We're patching configure.ac
> 
> I have not seen a patch that touches configure.ac. For that matter, I
> have even seen no patch at all. Did you forget to git-add them?
> 
> Or is it needed just because it is straight from the git tree? ;-)
Oh, didn't clean this comment. I used libedit.mk file as a base for
this package, so from there came this comment. Will remove it.

> Regards,
> Yann E. MORIN.
> 
> > +LIBDRM_ARMADA_AUTORECONF = YES
> > +
> > +# Needed for autoreconf to work properly
> > +define LIBDRM_ARMADA_FIXUP_M4_DIR
> > +????????mkdir $(@D)/m4
> > +endef
> > +
> > +LIBDRM_ARMADA_POST_PATCH_HOOKS += LIBDRM_ARMADA_FIXUP_M4_DIR
> > +
> > +$(eval $(autotools-package))
> > --?
> > 2.11.0
> > 
> > _______________________________________________
> > buildroot mailing list
> > buildroot at busybox.net
> > https://urldefense.proofpoint.com/v2/url?u=http-3A__lists.busybox.n
> > et_mailman_listinfo_buildroot&d=DwIBaQ&c=DPL6_X_6JkXFx7AXWqB0tg&r=v
> > Qk-
> > RIbjwN0zvlwiMSpq3LYUTNf7Gqc4ujhosYITtAw&m=CnJ1QQnRCNEGVciQmjSeLqgbk
> > J-lRMQV6Gfay4HEu8A&s=PUa6pTJ7cE6Uf3QeEw_d5CgLvgLTbjMgB4hR6bL0CxY&e=
> 
Best regards,
Evgeniy Didin
