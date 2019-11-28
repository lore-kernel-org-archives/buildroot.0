From: Peter Seiderer <ps.report@gmx.net>
Date: Thu, 28 Nov 2019 22:23:58 +0100
Subject: [Buildroot] [PATCH v1] package/libdrm: fix nouveau tests
 compile for musl
In-Reply-To: <20191126233847.3d33d888@gmx.net>
References: <20191125205520.9234-1-ps.report@gmx.net>
 <20191126225146.0581d8ec@windsurf>
 <20191126233847.3d33d888@gmx.net>
Message-ID: <20191128222358.5245aaf6@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

On Tue, 26 Nov 2019 23:38:47 +0100, Peter Seiderer <ps.report@gmx.net> wrote:

> Hello Thomas,
>
> On Tue, 26 Nov 2019 22:51:46 +0100, Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:
>
> > On Mon, 25 Nov 2019 21:55:20 +0100
> > Peter Seiderer <ps.report@gmx.net> wrote:
> >
> > > Add openembedded provided patch [2] to fix musl toolchain compile failures
> > > because of different ioctl() signatures, (int, int, ...) vs. (int, unsigned
> > > long, ...).
> > >
> > > Fixes:
> > >
> > >   ../tests/nouveau/threaded.c:39:5: error: conflicting types for 'ioctl'
> > >   int ioctl(int fd, unsigned long request, ...)
> > >
> > > [1] http://autobuild.buildroot.net/results/047f149a928ac2a17e25211a0a8a264ebae369ac
> > > [2] https://github.com/openembedded/openembedded-core/blob/master/meta/recipes-graphics/drm/libdrm/musl-ioctl.patch
> > >
> > > Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> > > ---
> > >  ...uveau-threaded-adapt-ioctl-signature.patch | 37 +++++++++++++++++++
> > >  1 file changed, 37 insertions(+)
> > >  create mode 100644 package/libdrm/0006-tests-nouveau-threaded-adapt-ioctl-signature.patch
> >
> > Applied to master, thanks.
>
> And finally suggested upstream, see [1]...and the same for two more old ones, see [2] and [3]...

And as the way through gitlab merge requests seems to be the right one (instead
of the mailing list), re-submitted two more old buildroot patches, see [4], [5]...

Regards,
Peter

[4] https://gitlab.freedesktop.org/mesa/drm/merge_requests/31
[5] https://gitlab.freedesktop.org/mesa/drm/merge_requests/32

>
> Regards,
> Peter
>
> [1] https://gitlab.freedesktop.org/mesa/drm/merge_requests/30
> [2] https://gitlab.freedesktop.org/mesa/drm/merge_requests/27
> [3] https://gitlab.freedesktop.org/mesa/drm/merge_requests/28
>
>
> >
> > Thomas
>
