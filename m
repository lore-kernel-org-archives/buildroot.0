From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 26 Dec 2018 15:37:42 -0600
Subject: [Buildroot] [PATCH 5/5 v5] boot/systemd-boot: new package
In-Reply-To: <20181226222329.18046c1c@windsurf>
References: <cover.1545814334.git.yann.morin.1998@free.fr>
 <d38239f86f99924e87dcb6e045b2de3ac0cb435f.1545814334.git.yann.morin.1998@free.fr>
 <20181226222329.18046c1c@windsurf>
Message-ID: <CADvTj4pde8zNu86gOxeQ2zy6FRKVQHL=rnVcBkNub2WqXm6T6g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Dec 26, 2018 at 3:23 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello,
>
> Thanks for working on this!
>
> On Wed, 26 Dec 2018 09:52:30 +0100, Yann E. MORIN wrote:
> > From: James Hilliard <james.hilliard1@gmail.com>
> >
> > systemd-boot is the integration of gummiboot into systemd, and gummiboot
> > is no longer maintained [0]. However, it is still interesting to use it
> > as a simple, stand-alone bootloader.
> >
> > Since systemd-boot is really part of systemd, when systemd is enabled
> > (as an init system), we rely on it to build the boot blobs, and
> > systemd-boot (this package) is not available.
> >
> > Now, when systemd is not enabled, systemd-boot (this package) will
> > actually build the boot blobs, and only that. No userspace tool is
> > built.
> >
> > To avoid duplication, we just symlink the systemd patches as-is. We just
> > need to add a specific patch, that just relaxes the dependency checks,
> > since we're only interested in building the boot blobs.
> >
> > [0] https://cgit.freedesktop.org/gummiboot/commit/?id=55df1539c9d330732e88bd196afee386db6e4a1d
> >
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
>
> Do we have a serious valid use-case for wanting to use systemd-boot
> without systemd? This adds a fair bit of complexity, so I'd like to be
> sure of what we're doing here.
>
> An example of the complexity is with the symlinks to the patches. Every
> time a patch is added/removed in package/systemd/, one should remember
> to adjust the symlinks in boot/systemd-boot/. This is something that
> can very easily be missed.
>
> So it would be good to make sure we have a really solid use-case for
> adding this complexity.
Well systemd-boot is a perfectly good bootloader even without systemd.
It uses plain text config files so it's not hard to manage even
without the systemd userspace tools.
>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
