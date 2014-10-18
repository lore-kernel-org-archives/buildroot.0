From: Maarten ter Huurne <maarten@treewalker.org>
Date: Sat, 18 Oct 2014 18:46:51 +0200
Subject: [Buildroot] [PATCH v3] rpi-userland: bump revision for musl
	compile fixes
In-Reply-To: <20141018130248.GB31723@free.fr>
References: <1410541269-32529-1-git-send-email-maarten@treewalker.org>
 <1491715.MQnf8L3yFy@hyperion> <20141018130248.GB31723@free.fr>
Message-ID: <1739784.babPHSSYPS@hyperion>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Saturday 18 October 2014 15:02:48 Yann E. MORIN wrote:
> Maarten, All,
> 
> On 2014-10-18 14:15 +0200, Maarten ter Huurne spake thusly:
> > On Saturday 18 October 2014 13:34:46 Yann E. MORIN wrote:
> > > So, still NAK for this bump. We can still bump it up to ba753c1 as
> > > this
> > > still works, but is not enough to get the musl fixes.
> > > 
> > > Maybe we could just hide it for musl for now?
> > 
> > I think it would be a pity to hide it when we have a fix for the musl
> > compile problem.
> > 
> > The only differences between the the proposed bump (4333d6d) and the
> > last
> > working version (ba753c1) are the commit that breaks Weston (66338d3)
> > and
> > the musl compile fixes. So I could create a v4 patch which bumps the
> > version to 4333d6d and contains a patch to revert 66338d3.
> > 
> > Alternatively, I could create a v4 patch which bumps the version to
> > ba753c1 and adds the musl compile fixes as separate patches. While the
> > number of patches would be greater (5 vs 1), the number of changed
> > lines would be smaller, since most of the compile fixes change one line
> > each.
> > 
> > Or I could create a v4 patch which bumps the version to ba753c1 and adds
> > the musl compile fixes as a single patch. Since we know they have been
> > accepted upstream in the same merge commit (4333d6d), we can drop all
> > of them at the same time once we can safely bump beyond that merge
> > commit.
> > 
> > At the moment I prefer bumping to ba753c1 + squashed musl compile fixes,
> > but I'd like a second opinion.
> 
> Well, I do not want to have weston break. weston is, as far as I can
> see, the only package in Buildroot that can make use of rpi-userland.
> Breaking it is out of the equation.

rpi-userland provides GL ES (BR2_PACKAGE_HAS_LIBGLES) among other features, 
so there are several more packages that depend on it. I needed it as a 
dependency for SDL2 (not in Buildroot yet).

But I agree that breaking one package to fix another is not progress.

> If the backport on-top of ba753c1 is easy, then that's OK for me. The
> patches are upstream, so it's OK to bundle them until either
> rpi-userland or/and weston upstream fix the issue.

I have a git clone of rpi-userland set up already to be able to submit the 
patches upstream, so creating a combined patch is not much work. I'll do 
that.

Bye,
		Maarten
