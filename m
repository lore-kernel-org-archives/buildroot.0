From: Matthew Weber <matthew.weber@collins.com>
Date: Mon, 25 Jan 2021 15:22:39 -0600
Subject: [Buildroot] [PATCH 2/2] package/uboot-tools: env/script
 generation need BINARIES_DIR
In-Reply-To: <20210125221651.10112779@windsurf.home>
References: <20210125145742.42460-1-matthew.weber@rockwellcollins.com>
 <20210125145742.42460-2-matthew.weber@rockwellcollins.com>
 <20210125221651.10112779@windsurf.home>
Message-ID: <CANQCQpZvXB_w=VjTrPM45CYcCtxmvCZB7thxB8v=E6yNaWdw2A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas/Yann,


On Mon, Jan 25, 2021 at 3:18 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> On Mon, 25 Jan 2021 08:57:42 -0600
> Matt Weber <matthew.weber@rockwellcollins.com> wrote:
>
> > From: Kalpesh Panchal <kalpesh.panchal@rockwellcollins.com>
> >
> > The host build of uboot-tools can occur early in the build process and may
> > require the creation of BINARIES_DIR before generation of an enabled envimage
> > and/or boot script binary.
> >
> > Signed-off-by: Kalpesh Panchal <kalpesh.panchal@rockwellcollins.com>
> > Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
>
> Hum, while this works, I'm in fact not too happy with the proposed
> solution. I would prefer that we move the mkenvimage/$(MKIMAGE)
> invocations to a BUILD_CMDS step, that produces its results in $(@D),
> and then INSTALL_CMDS does a $(INSTALL) ... of that file, which with
> the -D option would create $(BINARIES_DIR).
>
> I know it's a bit bike-shedding, but it feels a little bit better. What
> do you think ?

I've added Yann to the discussion as he suggested the mkdir :-)

Whatever is better to maintain.

-Matt
