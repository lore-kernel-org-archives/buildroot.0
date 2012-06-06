From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Wed, 6 Jun 2012 22:18:55 +0200
Subject: [Buildroot] [PATCH 1 of 6] pkg-download.mk: allow using
 localfiles outside of package infrastructure
In-Reply-To: <20120606221435.3d843ddd@skate>
References: <patchbomb.1338924131@beantl019720>
 <5103c7c0451ff036f611.1338924132@beantl019720>
 <20120606221435.3d843ddd@skate>
Message-ID: <CAAXf6LVY+dCoHvWttCHP8OPadjzSVZ2+Qx1r1q8=Qhr6yqHxDw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Op 6 jun. 2012 22:15 schreef "Thomas Petazzoni" <
thomas.petazzoni@free-electrons.com> het volgende:
>
> Le Tue, 05 Jun 2012 21:22:12 +0200,
> Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> a ?crit :
>
> > The localfiles download method uses $($(PKG)_SITE))) and
> > $($(PKG)_SOURCE) instead of $(1) and $(2). This means that it can only
> > be used for package downloads (through gentargets, autotargets, ...)
> > and not for other downloads like external toolchains.
> >
> > This patch changes localfiles to allow this, just as the wget and scp
> > download methods already did.
> > For the version control download methods, nothing changes.
> >
> > Signed-off-by: Thomas De Schampheleire <
thomas.de.schampheleire@gmail.com>
>
> I generally agree with this, but for consistency sake, it should
> probably done similarly for all other download methods, no? Of course,
> it can be done later as separate patches, the code is already
> inconsistent, so this patch does not make it worse from that
> perspective.

Well, for wget and scp it was already ok, and I didn't think it made sense
for the git, bzr, hg and svn methods, as you'd only use these for packages,
right?

Best regards,
Thomas
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120606/f7ba63d9/attachment-0001.html>
