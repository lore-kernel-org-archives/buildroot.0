From: Petr Vorel <petr.vorel@gmail.com>
Date: Wed, 8 May 2019 21:46:37 +0200
Subject: [Buildroot] [RFC PATCH 1/1] iputils: Bump to version s20190324
In-Reply-To: <CAG27Bk2yCdpQAw5pEmZjwTs=WDn93Y7XUs0Yy7Wg9JAT+OmLkg@mail.gmail.com>
References: <20190505232923.22744-1-petr.vorel@gmail.com>
 <20190507224038.0e11b51b@windsurf>
 <CAG27Bk2yCdpQAw5pEmZjwTs=WDn93Y7XUs0Yy7Wg9JAT+OmLkg@mail.gmail.com>
Message-ID: <20190508194636.GA29758@x230>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas, Sami,

> > ping6_common.c lacks:

> > #include <stddef.h>

> > once added, it builds fine.

> Hello,

> The include is fixed in upstream commit:
> https://github.com/iputils/iputils/commit/f65b38b9317e1298cfc5877b0eed7c7badbe597a

Thanks a lot both for info!

> Maybe it would make sense to do next release sometime soon that takes care of
> couple issues there were in s20190324, ref:

> * 25b552e (HEAD -> master, origin/master) build-sys/doc: make xsltproc required
> * 784a67c build-sys: make setcap-setuid.sh respect ${DESTDIR}
> * d45a8c8 build-sys: allow disabling setcap-setuid.sh at install
> * c3c04a9 ping: fix use-after-free
> * f65b38b ping6_common.c: include stddef.h
> * 13c24bc arping: fix packets count
> * f06ca70 build-sys: make rdisc.service a regular unit
> * 0cd6217 tracepath: fix warning: '/*' within block comment [-Wcomment]
> * c503834 doc: Use namespace correctly
> * c9aca1b tracepath: fix musl build, again
> * 991916b (tag: s20190324) release: iputils-s20190324
+1


> >The installation then fails because:

> > define IPUTILS_INSTALL_TARGET_CMDS
> >         $(INSTALL) -D -m 755 $(@D)/arping      $(TARGET_DIR)/sbin/arping
> >         $(INSTALL) -D -m 755 $(@D)/clockdiff   $(TARGET_DIR)/bin/clockdiff
> >         $(INSTALL) -D -m 755 $(@D)/ping        $(TARGET_DIR)/bin/ping
> >         $(INSTALL) -D -m 755 $(@D)/rarpd       $(TARGET_DIR)/sbin/rarpd
> >         $(INSTALL) -D -m 755 $(@D)/rdisc       $(TARGET_DIR)/sbin/rdisc
> >         $(INSTALL) -D -m 755 $(@D)/tftpd       $(TARGET_DIR)/usr/sbin/in.tftpd
> >         $(INSTALL) -D -m 755 $(@D)/tracepath   $(TARGET_DIR)/bin/tracepath
> >         $(INSTALL) -D -m 755 $(@D)/traceroute6 $(TARGET_DIR)/bin/traceroute6
> > endef

> > is no longer correct, as binaries are now produced in $(@D)/build/. But
> > probably we could use the standard installation procedure of the meson
> > build system instead of having custom install commands ?

> +1. Just let the build system do it's job.
I'll do. I didn't realise this was needed just for previous custom build system.

Kind regards,
Petr
