From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 19 Mar 2013 14:46:27 +0100
Subject: [Buildroot] [PATCH 000/120] x11: update to R7.7
In-Reply-To: <CALnvph238b9O2Db3DoOYPw6VLPpW39Tz2z3HcM=C+og=q-bH5w@mail.gmail.com>
References: <1363611219-26971-1-git-send-email-jbb@gamblify.com>
 <20130318160415.704c31a2@skate>
 <CALnvph238b9O2Db3DoOYPw6VLPpW39Tz2z3HcM=C+og=q-bH5w@mail.gmail.com>
Message-ID: <20130319144627.02a9cd4b@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Jesper Birks? B?kdahl,

On Tue, 19 Mar 2013 14:23:13 +0100, Jesper Birks? B?kdahl wrote:

> >  * xproto_fontcacheproto removal: it is still being used as a
> >    dependency in xlib_libXfont.mk.
> >
> 
> Yes, I missed that. Im going to undo those.

I don't know if you should undo it, or adjust the dependencies of
packages that depended on xproto_fontcacheproto.

> >  * xproto_xf86rushproto: same problem as other packages, it is removed
> >    while it is still being used by the X.org server (which gets
> >    changed only later in the patch series).
> >
> > Generally speaking, I would suggest to put all the version bumps and
> > related dependency removals first, and then the package removals.
> >
> > That said, achieving complete bisectability may be difficult: many of
> > the version bumps are related, and it may be hard to find the right
> > ordering. Maybe there should be one big patch that does all the version
> > bumps at once, and then patches to remove the packages that are no
> > longer useful.
> >
> 
> I going to do as you suggest and make one big patch with version bumps,
> followed by individual patches removing packages starting with the leaves
> in the dependency tree.
> Did not know that you would accept ONE patch with version bumps for
> several packages, but I think it is appropriate in this situation.

I am not the Buildroot maintainer, so I can't say what Peter Korsgaard
will accept exactly. Generally we want fine grained patches, but in the
case of the mechanical version bumping of a huge set of interrelated
packages such as X.org, maybe a single patch is better to keep
bisectability. Before doing this work, let's way for the opinion of
Peter, because he will be the one who will ultimately pull your patches.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
