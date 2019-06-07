From: Atharva Lele <itsatharva@gmail.com>
Date: Fri, 7 Jun 2019 14:12:50 +0530
Subject: [Buildroot] [PATCH 1/1] utils/genrandconfing: randomly enable
 BR2_REPRODUCIBLE 10% of the times
In-Reply-To: <ceec03d9-abba-e911-0b31-3d026f2f172a@mind.be>
References: <20190607081559.327-1-itsatharva@gmail.com>
 <ceec03d9-abba-e911-0b31-3d026f2f172a@mind.be>
Message-ID: <CABM+sgoaPB1DjPLWmQTuDbbFEZZC0tkHSj5pek4m-YCTvW7uHw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>  Both of these last two lines are the defaults, nobody else is going to
set
> them, so there's no need to set them explicitly.

OK, I'll remove those lines and send a v2.

Regards,
Atharva Lele


On Fri, Jun 7, 2019 at 1:56 PM Arnout Vandecappelle <arnout@mind.be> wrote:

>
>
> On 07/06/2019 10:15, Atharva Lele wrote:
> > Initial patch to start reproducibility testing.
> >
> > Also enable tar filesystem to compare images since diffoscope works well
> > with tar.
> >
> > Signed-off-by: Atharva Lele <itsatharva@gmail.com>
> > ---
> >  utils/genrandconfig | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> >
> > diff --git a/utils/genrandconfig b/utils/genrandconfig
> > index 5f3fe23260..b7d7bf7763 100755
> > --- a/utils/genrandconfig
> > +++ b/utils/genrandconfig
> > @@ -366,6 +366,14 @@ def gen_config(args):
> >      if randint(0, 4) == 0:
> >          configlines.append("BR2_SYSTEM_ENABLE_NLS=y\n")
> >
> > +    # Randomly enable BR2_REPRODUCIBLE 10% of times
> > +    # also enable tar filesystem images for testing
> > +    if randint(0, 10) == 0:
> > +        configlines.append("BR2_REPRODUCIBLE=y\n")
> > +        configlines.append("BR2_TARGET_ROOTFS_TAR=y\n")
> > +        configlines.append("BR2_TARGET_ROOTFS_TAR_NONE=y\n")
> > +        configlines.append("BR2_TARGET_ROOTFS_TAR_OPTIONS=\"\"\n")
>
>  Both of these last two lines are the defaults, nobody else is going to set
> them, so there's no need to set them explicitly.
>
>  Other than that,
>
>  Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
>
> [In other words: if you respin the patch according to the feedback I gave,
> you
> can add my Reviewed-by tag. But I don't want to add it to this version,
> that's
> why it's indented with a space, so patchwork doesn't pick it up.]
>
>  Regards,
>  Arnout
>
> > +
> >      # Write out the configuration file
> >      if not os.path.exists(args.outputdir):
> >          os.makedirs(args.outputdir)
> >
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20190607/1d295498/attachment.html>
