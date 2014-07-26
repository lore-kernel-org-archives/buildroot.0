From: Gary Bisson <bisson.gary@gmail.com>
Date: Sat, 26 Jul 2014 10:06:43 -0700
Subject: [Buildroot] [PATCH] gst-fsl-plugins: fix includes for recent
	toolchains
In-Reply-To: <20140726093400.52ac81c2@free-electrons.com>
References: <1406270536-17145-1-git-send-email-bisson.gary@gmail.com>
 <20140726093400.52ac81c2@free-electrons.com>
Message-ID: <CADCpmyP74XPQXJ1_VNxdxQbsoCehZeJaks+sqecPCJVgyR8yig@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On Sat, Jul 26, 2014 at 12:34 AM, Thomas Petazzoni <
thomas.petazzoni@free-electrons.com> wrote:

> Dear Gary Bisson,
>
> On Thu, 24 Jul 2014 23:42:16 -0700, Gary Bisson wrote:
> > Build was failing starting with CodeSourcery 2013.11 due to
> > new v4l kernel headers.
> >
> > Signed-off-by: Gary Bisson <bisson.gary@gmail.com>
> >
> > ---
> > Yann, all,
> > I know this patch will look bad as we already discussed the use of -I
> instead of -idirafter.
> > However it has been reported and verified that this package doesn't
> build using recent toolchain such as CodeSourcery 2013.11.
> > It seems to come from the fact that the kernel headers in the toolchain
> have been updated which brings some incompatibility.
> > Using -idirafter, the v4l header picked up is from the toolchain which
> is missing some older structures like v4l2_dbg_chip_ident.
> > The CPPFLAGS setup is now exactly the same as what is done in Yocto.
> > Let me know your thoughts.
> > Thanks,
> > Gary
>
> Am I correct saying that this patch is superseded by your new
> http://patchwork.ozlabs.org/patch/373918/ patch ?
>

Indeed this patch no longer applies.

Thanks,
Gary
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140726/5eb2fdbb/attachment.html>
