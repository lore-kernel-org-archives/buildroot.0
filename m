From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 30 Sep 2011 16:32:36 +0200
Subject: [Buildroot] [pull request] Pull request for branch
 for-2011.11/pkg-infra
In-Reply-To: <CAAXf6LU6daQM2sFioskBF56wf7uKbyStJgPjuk6-VUR5faRfFQ@mail.gmail.com>
References: <cover.1317325743.git.thomas.petazzoni@free-electrons.com>
 <CAAXf6LU6daQM2sFioskBF56wf7uKbyStJgPjuk6-VUR5faRfFQ@mail.gmail.com>
Message-ID: <20110930163236.12055d01@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

Le Fri, 30 Sep 2011 09:48:39 +0200,
Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> a ?crit :

> It would be good, at least for me, if the contribution flow for
> buildroot could be clarified.

Sure. But first of all, let's be clear that the contribution flow has
never been formally defined. The current contribution flow is merely
the result of history, of how past contributors did contribute, etc.
And this contribution flow will certainly continue to evolve as
contributors continue to question it, make proposals and as the project
grows. So there is definitely nothing set in stone, at least in my
perspective.

> If I understand correctly, Peter is the only person with write access
> to the buildroot master, so in the end he is the only one that can
> take action to get a patch merged.

Correct.

First, in the Buildroot history, before the Git era and before Peter
took over maintenance, multiple contributors could commit to the
Buildroot Subversion repository, and the result was an horrible pile of
crap, duplicated and incompatible features. Having a single point of
decision is a way of making sure that there is some consistency in the
features, coding style and in general in the orientation of the project.

Second, the single committer mechanism works quite well for projects as
big as Linux, so I am pretty sure that it can also work for smaller
projects such as Buildroot. However, having a single committer does not
mean that this single committer has to review, test and check each and
every patch. This is probably the point on which we (as a community)
are a bit weak at the moment: there is no clear organization of the
tree in subsystems, with maintainers that would take care of a
particular area, reducing the load on Peter. I have done that in the
past a few times, and I'm trying to do a little bit, but not enough,
and not in predictable way for Peter (when a patch comes, Peter cannot
assume whether I will take it or not).

> On the other hand, I am under the impression that you have some kind
> of privileged status as prime contributor, supplying pull requests to
> Peter.

Anybody can supply pull requests to Peter. The fact that I'm always
sending pull requests is just because I'm pushing my commits on a
public Git repository, and I have a script that automagically sends a
pull request with all the patches for review. Anyone in the Buildroot
community can do the same thing.

> These branches you prepare not only contain your own changes, but
> you sometimes also pull in changes from others, making you some kind
> of proxy to Peter.

Yes, as said above, I am sometimes trying to act as a maintainer on
some areas I'm interested in (for example, the package infrastructure),
in order to ease the process. This seems to be useful, because Peter
appears to trust my review and having a patch that I merged and Ack'ed
allows him to reduce his review process (whether Peter should trust my
review is an entirely different question, of course).

> From that perspective, I only provided comments to your patches when I
> had some. Up until now, I have not really acked any of your patches on
> which I had no comments but otherwise though were good. This for the
> simple reason that I didn't think it would change anything about the
> chances of your patches being merged, given my expectation that Peter
> would 'trust' your changes and take them in.

Peter will hopefully comment on this, but I think having your Ack on
others patches would be very useful. The more Acks there are on a given
patch, the less time Peter will spend reviewing the patch, especially
when those Acks come from people that have shown in the past to have a
very good understanding of the Buildroot internals (which definitely is
your case, considering the type of patches you have been sending
recently).

> It is very well possible that my understanding of this is wrong. That
> Buildroot is maintained in a different way, that your patches are
> treated in exactly the same way as other's, or that it *would* make a
> difference if I acked patches or otherwise provided positive feedback.
> Please let me know if this is the case.

As stated above, my patches are handled in the same way as others,
except maybe that due to past contribution, Peter has a slightly higher
trust in my patches than in other patches. But this trust is a
subjective thing which evolves permanently. The more you post good and
valid patches, the more this trust grows in Peter's mind. It's not a
black and white game, it's a long spectrum of gray shades :-)

And also as stated above, having your positive feedback, especially if
associated with actual testing, is definitely very useful.

> Now that we're discussing contribution, what is the best approach to
> get patches in once they were posted but forgotten? In the past I have
> sent several patches, some of which got some feedback, some of which
> did not. Many of these did not get merged. I have tried several
> approaches over time, like bumping the original mails, adding you or
> Peter directly in To:, poking Peter in private, or resending the
> patch. I cannot really say that any of these methods had a high
> success rate.
> A few weeks ago, after my upgrading to buildroot-2011.08, I assembled
> most remaining changes that I had made, and send them as a new set of
> patch series. These did get noticed. Can I conclude that this is the
> best approach for forgotten patches: send them again?

Yes, that's what I do: repost patches from time to time. It gives me
the opportunity to upgrade them on the latest master, ensuring that
there will be no merge conflicts. And also sometimes, I put some
pressure on Peter in order to get some attention, as I did yesterday
for my pkg-infra branch.

The number of patches being submitted to the list has grown quite
significantly in recent months and maybe we have reached the step at
which Peter can no longer handle all the patches and we as a community
need to organize ourselves to make the review process easier.
Currently, for every package bump that Peter handles directly, Peter
has to do some build testing in various toolchain configurations, etc.
This could very well be handled by some other people in the community.
Maybe we need to identify some subsystem maintainers for various areas
of Buildroot, I don't know. Or maybe we simply need some kind of
patchwork, or higher usage of Bugzilla to track which patches remain to
be merged. The question is open.

I hope that this gives some explanations on our development process.
Don't hesitate to continue the discussion so that we can improve this
development process.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
