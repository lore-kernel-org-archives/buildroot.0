From: Asaf Kahlon <asafka7@gmail.com>
Date: Sat, 8 Aug 2020 16:56:08 +0300
Subject: [Buildroot] [PATCH v1 1/6] package/nvidia-modprobe: new package
In-Reply-To: <CA+h8R2qhP00=MNrQHC88ZG5mE0qCCaDP1MRvS7fHipdE40M6XA@mail.gmail.com>
References: <20200801213645.33787-1-christian@paral.in>
 <CALFsTFUsbwJohwJ4wRtd=jkyd=86jTtukirXW0pFHrHhx5NpwQ@mail.gmail.com>
 <CA+h8R2qhP00=MNrQHC88ZG5mE0qCCaDP1MRvS7fHipdE40M6XA@mail.gmail.com>
Message-ID: <CALFsTFUtZg=7H02EuegHc3UPMZUeezs1v-YZRwLNv47bfs4A0w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, Aug 8, 2020 at 2:29 PM Christian Stewart <christian@paral.in> wrote:
>
> Hi Asaf,
>
> On Sat, Aug 8, 2020 at 12:03 AM Asaf Kahlon <asafka7@gmail.com> wrote:
> > > +define NVIDIA_MODPROBE_INSTALL_TARGET_CMDS
> > > +       $(INSTALL) -m 0755 $(@D)/bin/nvidia-modprobe \
> > > +               $(TARGET_DIR)/usr/bin/nvidia-modprobe
> > > +endef
> >
> > Why do you prefer to call the compiler explicitly instead of using the Makefile?
> > I tested this package with the following change, and it seems to work fine:
> > define NVIDIA_MODPROBE_BUILD_CMDS
> > $(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)
> > endef
> >
> > define NVIDIA_MODPROBE_INSTALL_TARGET_CMDS
> > $(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) PREFIX=$(TARGET_DIR)
> > $(MAKE) -C $(@D) install
> > endef
> >
> > Maybe I miss something?
>
> You tested this?... I don't think so. It doesn't work:
>
>    LINK         _out/Linux_x86_64/nvidia-modprobe.unstripped
> /bin/sh: build/nvidia-modprobe-450.57/_out/Linux_x86_64/gen-manpage-opts:
> cannot execute binary file: Exec format error
> make[2]: *** [Makefile:149: _out/Linux_x86_64/options.1.inc] Error 126
>
> The package as-is from GitHub has an extremely convoluted Makefile
> which does not do what we want in Buildroot.
Yeah, you seem to be right.
I tested it with another toolchain, but it indeed does not work on the
jetsontx2 toolchain...

>
> Best regards,
> Christian

Asaf
