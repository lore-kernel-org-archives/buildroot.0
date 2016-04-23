From: Cam Hutchison <camh@xdna.net>
Date: Sat, 23 Apr 2016 15:53:34 +1000
Subject: [Buildroot] [PATCH v2 1/1] overlay: Add archive-based (tar)
	rootfs overlays
In-Reply-To: <CAFt09wMVqWepo-Ott0Y0nL45RnqoFy6tTunBP-OndgzEJoj_hw@mail.gmail.com>
References: <1460693286-6245-1-git-send-email-camh@xdna.net>
 <CAFt09wMVqWepo-Ott0Y0nL45RnqoFy6tTunBP-OndgzEJoj_hw@mail.gmail.com>
Message-ID: <20160423055334.GA29136@xdna.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Matthew,

Matthew Weber wrote:
> Cam,
> 
> On Thu, Apr 14, 2016 at 11:08 PM, Cam Hutchison <camh@xdna.net> wrote:
> > Add a feature to extract tar archives into the target rootfs when
> > building filesystem images. The archives are extracted inside the
> > fakeroot used to build the filesystem images so that the ownership and
> > permissions of files in the archive are preserved.
> >
> > This is useful when an external build process produces rootfs archives
> > or software is supplied as an archive that need to be incorporated the
> > generated rootfs.
> >
> > Configuration options are added to configure a list of paths to archives
> > to be extracted, and to configure how many path components to strip from
> > paths in those archives. It is not possible to configure a different
> > number of components for different archives.
> 
> Instead of this strip components option, would it be easier to
> document the expected pathing for the tar?  If you could apply
> specific strip values for each file, I think it would make sense to
> have this option.  What is your scenario where this would be required?
>  As all files would have to be the same to match whichever value is
> used.

I've added the strip components option to v2 of the patches as it was
brought up in v1:
  http://lists.busybox.net/pipermail/buildroot/2016-March/155397.html

I personally don't have a use case for strip components as the overlay
archives I am using come from a previous buildroot build, but I can see
the possibility of needing to strip one component from archives if the
rootfs overlay is contained within a named directory at the top level.
