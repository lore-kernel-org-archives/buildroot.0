From: Aras Vaichas <aras.vaichas@gmail.com>
Date: Wed, 6 Feb 2013 16:50:37 +0000
Subject: [Buildroot] makedevs and symbolic links
In-Reply-To: <20130206172641.4c042f87@skate>
References: <CAJkQPOn=Pi+NhbRvVG_gk9ccQDaUoUuPH3aEsos032kAv6Y23A@mail.gmail.com>
 <20130206172641.4c042f87@skate>
Message-ID: <CAJkQPOmpY_aT1DhDpxe2rw_endLzFkhmOWAkrbt1CzeG+7c=0Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 6 February 2013 16:26, Thomas Petazzoni <
thomas.petazzoni@free-electrons.com> wrote:

> Dear Aras Vaichas,
>
> On Wed, 6 Feb 2013 16:17:26 +0000, Aras Vaichas wrote:
> > I use Buildroot with my own custom root fs skeleton. My skeleton
> contains a
> > few symbolic links that I'd like to move out either into
> > the BR2_ROOTFS_POST_BUILD_SCRIPT or somewhere else.
> >
> > makedevs seemed logical but it doesn't support symbolic link creation.
> >
> > Is there a reason for this?
> >
> > Would it be useful to add it?
>
> From my point of view, makedevs is here to do the things you can't do
> without being root: create device nodes and adjust ownership.
>
> Symbolic links can be created as non-root in a post-build script for
> example, so I'm not sure there's really a need to have support for
> symbolic links in makedevs.
>
> Or maybe I'm missing the point?
>

Hi Thomas,

I understand that it doesn't make sense if you approach it from a non-root
user point of view.

From a maintenance point of view, it's a "nice to have" if the creation of
the root fs can be defined in as few places as possible. I like how
makedevs works because I can look at a single file and I see a nice list of
all the files in my system. Ideally it would be great if I could remove my
skeleton/ directory and put everything into the BR2_ROOTFS_DEVICE_TABLE
file.

makedevs currently creates regular files, directories, char dev files,
block dev files, and fifos. Adding symbolic links would make it "feature
complete".

regards,

Aras
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130206/8730bcef/attachment.html>
