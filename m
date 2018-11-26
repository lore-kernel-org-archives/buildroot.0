From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 26 Nov 2018 08:58:03 +0100
Subject: [Buildroot] [PATCH v2 1/1] linux: Make dtc install step more
 reliable
In-Reply-To: <bee731d7-dec3-399a-632b-7446e75fc034@andin.de>
References: <20181113155016.24022-1-anaumann@ultratronik.de>
 <20181123222930.41f98733@windsurf>
 <bee731d7-dec3-399a-632b-7446e75fc034@andin.de>
Message-ID: <20181126085803.254d439a@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Andreas,

On Mon, 26 Nov 2018 08:50:35 +0100, Andreas Naumann wrote:

> > I hesitated a bit, but in the end decided to apply this to master.
> > Indeed, with the current code, it's really a matter of luck whether
> > host-dtc gets built before/after linux that determines if the dtc ->
> > linux-dtc symlink will be created or not. With this patch, regardless
> > of whether host-dtc is built before or after linux, we'll have the same
> > result. To me, this was a sufficient motivation to apply this patch to
> > master.
> 
> Thanks for applying it. May I ask why you hesitated, was the commit 
> message clear enough? Or just too small of an issue?

My hesitation was not whether to apply it or not, the explanation was
clear.

My hesitation was whether it should have been applied to our "master"
branch or to our "next" branch.

We have a release process that works as follows:

 1 After a release, say 2018.08, we have two months of active
   development. During this time period, all changes go to the master
   branch: both fixes and major changes (package updates, new packages,
   infrastructure changes, etc.)

 2 After two months of development, we cut the -rc1 of the next
   release, for example 2018.11-rc1. At this point, we stop merging new
   development in the "master" branch, and only merge
   bug/security/build fixes. In order to avoid completely stopping the
   merge of new features, we open a "next" branch.

 3 During one month, we have these split master/next branches, until
   the final 2018.11 is released, from the master branch.

 4 Once 2018.11 is cut, we merge "next" back into "master" and goto
   step 1.

We are currently in step (2), so for each change we have to decide
whether the change should be committed to the master branch or the next
branch. Some changes are obvious: a build fix goes to master, a new
package goes to next. Some other changes are less obvious, and for this
specific patch, I hesitated a bit between applying to master and next.
That's all what I meant to say.

Does this clarify the hesitation ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
