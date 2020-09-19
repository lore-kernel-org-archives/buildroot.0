From: Chris Packham <judge.packham@gmail.com>
Date: Sat, 19 Sep 2020 20:07:50 +1200
Subject: [Buildroot] [autobuild.buildroot.net] Your daily results for
 2020-09-18
In-Reply-To: <20200919100107.6470d236@windsurf.hq.k.grp>
References: <5f65af16.1c69fb81.8e15f.d9b0SMTPIN_ADDED_MISSING@mx.google.com>
 <CAFOYHZDhc1KX5tEhobOgqpZ+P89xH=26oNXgv162iAEbU7taBg@mail.gmail.com>
 <20200919100107.6470d236@windsurf.hq.k.grp>
Message-ID: <CAFOYHZCw8csXXrda7zm=QbVP1Z0iNavqdoc5h5jGWxUHuyxOgg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 19 Sep 2020, 8:01 PM Thomas Petazzoni, <thomas.petazzoni@bootlin.com>
wrote:

> Hello Chris,
>
> On Sat, 19 Sep 2020 19:56:58 +1200
> Chris Packham <judge.packham@gmail.com> wrote:
>
> > The builds are failing with "arm-none-linux-gnueabi-gcc: error:
> > unrecognized command line option '-Wfloat-conversion'". This was recently
> > added to the micropython Makefiles. I haven't tracked down when this was
> > added to gcc but it looks like whatever version is used by these configs
> it
> > doesn't recognize it.
> >
> > The simple fix is to require a sufficiently new gcc version. I'll see if
> i
> > can get to it this weekend unless someone beats me to it.
>
> Thanks for the analysis. Since -Wfloat-conversion is only a warning
> option, it would not be really nice to force a newer gcc version just
> because of this. It would be better if the micropython build system
> could enable this warning if gcc supports it, and otherwise not enable
> it.
>
> Thanks,
>
> Thomas
> --
>

Yeah I was thinking the same thing. I don't think they have any
infrastructure for compiler feature detection but I'll see if I can find
someway of handling the older compilers.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200919/10417ac8/attachment.html>
