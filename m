From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 12 Sep 2013 20:21:57 +0200
Subject: [Buildroot] [PATCH 0/3] Support for out-of-tree Buildroot
 customization
In-Reply-To: <CAAXf6LVD590fVudge3Fk+2B8pSzvUEV2GQLTcbz=VpOB2HCmtQ@mail.gmail.com>
References: <1378646129-4167-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <OF0AEEFBDE.5291EB54-ON86257BE3.0005DA76-86257BE3.00087A88@rockwellcollins.com>
 <20130911091700.0b24df41@skate>
 <OFA3C6DE52.DF6BBCA7-ON86257BE3.0054A3F9-86257BE3.00577394@rockwellcollins.com>
 <20130911172709.GB3410@free.fr>
 <CAAXf6LVD590fVudge3Fk+2B8pSzvUEV2GQLTcbz=VpOB2HCmtQ@mail.gmail.com>
Message-ID: <20130912202157.536e5904@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas De Schampheleire,

On Thu, 12 Sep 2013 09:54:56 +0200, Thomas De Schampheleire wrote:

> > Yes, as I said above, I would have expected companies (well, people at
> > companies) be stressed by projects deadlines, and that they would work
> > in BR2_EXTERNAL, and only try to upstream later, when it would be too
> > late (for them!) to have proper reviews, since they would be internally
> > committed to their changes in BR2_EXTERNAL, and we would not be able to
> > take their changes.
> >
> > But if people use BR2_EXTERNAL as a fallback for anything that did not
> > make it upstream (by lack of time, or of interest), or for purely
> > internal stuff, then I don't see a reason for concern. All the better! :-)
> >
> 
> Not to ruin the atmosphere, but even though Ryan and his colleagues
> may be using BR2_EXTERNAL 'the good way', ultimately helping the
> buildroot project with their contributions, the danger of others not
> doing that is still real. Of course, _not_ contributing changes made
> in a company project was also possible previously, without
> BR2_EXTERNAL, so this is no reason to block the patchset.

Yes, that's what I believe: companies and people are forking Buildroot
nowadays. As I highlighted in my reply to Yann's e-mail, BR2_EXTERNAL
may in fact encourage companies in separating their specific changes
from the changes that could potentially be upstreamed, and therefore
encourage upstream.

I really don't think BR2_EXTERNAL is going to make things worse in
terms of upstreaming.

> In case it may be useful to others: here is how I am using buildroot
> in a company environment. We are not directly tracking mainline, but
> base ourselves on release tarballs. We have one Mercurial repository
> in which each of these release tarballs are extracted (the pristine
> repository). In this repository, no changes are made other than the
> extracting. Since these are release tarballs, there is obviously no
> information about the individual commits made in buildroot git, but
> this is generally not a problem. In case we do want to know who made a
> particular change, we can still look that up in buildroot git.
> A second repository is cloned from this first one, and does contain
> our own changes. This two-repository approach is similar to having a
> pristine branch and a master branch for development, it's a matter of
> choice.
> Our changes are mainly in package/company, board/company and configs.
> This makes updating to a new buildroot release pretty straightforward:
> first the pristine repo is updated with a new tarball. Then, these
> changes are pulled into the development repo, and merged. Most merges
> will be trivial because most changes are in separate files.
> If necessary, changes made upstream are imported as separate commits
> on top of the releases, but this happens only occasionally.
> 
> Of course, we do sometimes make changes in standard buildroot files.
> These can be new non-proprietary packages, or other changes throughout
> the tree. We take care to keep this upstreamable, and do effectively
> upstream when/where possible. It are these files that can pose a merge
> conflict, because for example the implementation originally committed
> is slightly different from the one accepted upstream. Or maybe, the
> patch has not yet been accepted upstream when a new release is taken
> in.
> The upstreaming work is currently done by one person (me) and this is
> clearly the weak point. If I stop paying attention to upstreaming, or
> to keeping the changes we make upstreamable, the delta between our
> development repo and mainline buildroot becomes so large that it is a
> nightmare to keep up with newer releases.

Do you think there is something we can do at the Buildroot level to
ease this process?

> In our overall build process, at some point the buildroot repo will be
> cloned at the right revision, the relevant config set, and 'make' will
> be run in buildroot. Afterwards, the result files will be collected
> from output/images and post-processed into the right format to put on
> our boards. One could consider buildroot here as a backend, as Yann
> referred to.
> 
> Upstreaming is also done with Mercurial: I convert buildroot git to hg
> using the hg-git extension. Patches are directly sent from Mercurial
> through the patchbomb extension. The only git command I execute is
> 'git pull' in the git repo, and possible 'git checkout next' during
> the time there is a master and active next branch.

Thanks a lot for this write-up. I think we should keep it somewhere in
a section of the manual.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
