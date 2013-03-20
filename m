From: Jesper Baekdahl <jbb@gamblify.com>
Date: Wed, 20 Mar 2013 15:47:47 +0100
Subject: [Buildroot] [PATCH 000/120] x11: update to R7.7
In-Reply-To: <20130319144627.02a9cd4b@skate>
References: <1363611219-26971-1-git-send-email-jbb@gamblify.com>
 <20130318160415.704c31a2@skate>
 <CALnvph238b9O2Db3DoOYPw6VLPpW39Tz2z3HcM=C+og=q-bH5w@mail.gmail.com>
 <20130319144627.02a9cd4b@skate>
Message-ID: <CALnvph3JxtbK-59W5T0g44Q0QzSokdPq8HMvyKLRDAsu=iQ6JQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

I have made some changes to the patchset.

The commits have been reordered to make the version bumps come first.
I have kept them separate for clarity, but the plan is to squash them into
one
to turn them into one bisectable commit.

I took another look at the package removals, and changed them to also be
bisectable,
only removing a package after it has no more dependant packages.

I included a few more patches and documented the existing ones with origin.

You can find the changes here:
https://bitbucket.org/baekdahl/buildroot/src/96182fac0691/?at=x11r77_v2


Regards, Jesper


On Tue, Mar 19, 2013 at 2:46 PM, Thomas Petazzoni <
thomas.petazzoni@free-electrons.com> wrote:

> Dear Jesper Birks? B?kdahl,
>
> On Tue, 19 Mar 2013 14:23:13 +0100, Jesper Birks? B?kdahl wrote:
>
> > >  * xproto_fontcacheproto removal: it is still being used as a
> > >    dependency in xlib_libXfont.mk.
> > >
> >
> > Yes, I missed that. Im going to undo those.
>
> I don't know if you should undo it, or adjust the dependencies of
> packages that depended on xproto_fontcacheproto.
>
> > >  * xproto_xf86rushproto: same problem as other packages, it is removed
> > >    while it is still being used by the X.org server (which gets
> > >    changed only later in the patch series).
> > >
> > > Generally speaking, I would suggest to put all the version bumps and
> > > related dependency removals first, and then the package removals.
> > >
> > > That said, achieving complete bisectability may be difficult: many of
> > > the version bumps are related, and it may be hard to find the right
> > > ordering. Maybe there should be one big patch that does all the version
> > > bumps at once, and then patches to remove the packages that are no
> > > longer useful.
> > >
> >
> > I going to do as you suggest and make one big patch with version bumps,
> > followed by individual patches removing packages starting with the leaves
> > in the dependency tree.
> > Did not know that you would accept ONE patch with version bumps for
> > several packages, but I think it is appropriate in this situation.
>
> I am not the Buildroot maintainer, so I can't say what Peter Korsgaard
> will accept exactly. Generally we want fine grained patches, but in the
> case of the mechanical version bumping of a huge set of interrelated
> packages such as X.org, maybe a single patch is better to keep
> bisectability. Before doing this work, let's way for the opinion of
> Peter, because he will be the one who will ultimately pull your patches.
>
> Thomas
> --
> Thomas Petazzoni, Free Electrons
> Kernel, drivers, real-time and embedded Linux
> development, consulting, training and support.
> http://free-electrons.com
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130320/ada6fdca/attachment-0001.html>
