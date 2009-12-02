From: Michael S. Zick <minimod@morethan.org>
Date: Wed, 2 Dec 2009 08:18:08 -0600
Subject: [Buildroot] [git tag 2009.11] update for 2009.11
In-Reply-To: <87y6lltrk5.fsf@macbook.be.48ers.dk>
References: <20091201142204.3F954777B5@busybox.osuosl.org>
	<200912020737.14587.minimod@morethan.org>
	<87y6lltrk5.fsf@macbook.be.48ers.dk>
Message-ID: <200912020818.10770.minimod@morethan.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed December 2 2009, Peter Korsgaard wrote:
> >>>>> "Michael" == Michael S Zick <minimod@morethan.org> writes:
> 
> Hi,
> 
>  >> git checkout -b mybranch 2009.11
> 
>  Michael> Which kills community collaboration by turning the tree into
>  Michael> number of users * number of local trees.
> 
>  Michael> Keep development on "head" if you wish - its your organization;
> 
> There has been various requests for bugfix releases in the past, and I
> have stated that I don't have any problems with that, but I don't have
> free cycles over to look through fixes and verify what needs to be
> backported. If someone wants to step up and point out what should get
> backported (and preferably does the backport/test), then I don't have
> any issues with doing bugfix releases now and then.
> 
> So far noone has stepped up to the task.
> 
> The only demand I have is that the bugfix releases are STRICTLY for
> bugfix / security issues.
> 
>  Michael> But I would recommend against locking out the community or
>  Michael> splintering the community of users that want to see a working 2009.11.
> 
>  Michael> Achieve that end anyway you like, anyway that does not feel as if
>  Michael> you are being insulted by the presumption that 2009.11 isn't perfectly
>  Michael> error free.
>  Michael> You are not being insulted, at least it was not my intent to insult.
> 
> I'm certainly not insulted.
> 
>  Michael> Just acknowledge there are two goals to be served here:
>  Michael> The Buildroot maintainer's goal of an error free 2010.02 next year.
>  Michael> The Buildroot user's goal of an error free 2009.11 for use **now**.
> 
>  Michael> Both can be archived if you don't splitter the support of 2009.11 
>  Michael> into individual, local, user trees.
> 
> No matter how you set it up it takes effort. I don't have the time to do
> a good job doing it, and so far noone has stepped up to help me doing
> it - Will you?
> 

I don't know enough GIT at the moment to make an intelligent answer to
the over all question.

But let us tackle one of the minor ones, and move forward towards the
"every release perfect" goal - this is, after all, a "mission critical"
system to its users.  ;)

Doing my best not to open up the question of "where" in the workflow the
bug tracking system belongs - lets take the easy way out, and leave it
just where it is; with a modification:

The system already has an "email to interested party" feature - -
Hard code it to make buildroot at busybox.net an "interested party" for
all entries made.

Using bug 729 as an example:

User opens new bug, to become bug 729...
On mailing list: [Bug 729] -Summary as subject-

Now the readers (users of Buildroot) reading the mailing list can
do "first level triage" on that report -

Responses appear properly threaded (if user pushes correct button) on
the mailing list -

If resolved on the mailing list, that bug can be (currently manually) closed.

Now picture the busy maintainer, running in circles to get a tagged release out...

The maintainer scans the thread, decides "no fix posted" and "no quick fix" -
(A.K.A: second level triage)

Tags the feature as "broke" in the menu config system with a reference to Bug:729
and moves gets on with doing something else.
The maintainer *might* update the status of the bug report;
The maintainer *might* update the mailing list thread;
but probably not, too time consuming at this point to do either.

But whatever the above sequence, it is now marked "broke" in the menu configuration
with a link to the bug report (and/or the mailing list archive thread).
Any user who finds something they want can now find a reference back
into the mailing list and/or bug tracker so they can contribute a solution.

Time and effort required at this point: minor, make buildroot at busybox.net an 
"interested party" to all bug tracker entries.
If easy to do, might even make that subject line tag: [tag:v2009.11, bug:729]

If this modification to the system had been in place two weeks ago -
2009.11 might not have shipped with an enabled, broken, sstrip.  ;)
All with *zero* additional time and effort on the maintainer's part.

Mike



> If the bugfix work is done in the master branch, another branch in the
> same tree or in another tree is just a minor technical detail.
> 
