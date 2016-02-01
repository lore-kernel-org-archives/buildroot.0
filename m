From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 1 Feb 2016 12:19:02 +0100
Subject: [Buildroot] [PATCH 3/7] croosbar moved to buildroot.
In-Reply-To: <56AF1D2B.30202@mclink.it>
References: <1454289936-10654-1-git-send-email-mc5686@mclink.it>
 <1454289936-10654-4-git-send-email-mc5686@mclink.it>
 <20160201082407.477cff7d@free-electrons.com>
 <56AF1D2B.30202@mclink.it>
Message-ID: <20160201121902.0c13ce7b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Mauro,

Please don't reply to me directly: keep the list in Cc so that everyone
can participate to the discussion, and the discussion benefits to
everyone. Also, please don't top-post, this is considered bad practice.

On Mon, 1 Feb 2016 09:54:03 +0100, Mauro Condarelli wrote:

> I am a bit confused.
> I tried to follow instructions in manual, but apparently I failed to fully understand them.
> I currently have a "personal" branch where I'm developing (part of a full installation where I'm developing my RootFilesystem for a real platform).
> What I sent are the diffs after a rebase and they reflect exactly what I submitted in the past days (of course).
> How should I prepare patches for the list?

The patches we want to see must be organized in a certain way (one
patch per new package, one patch for each logical change, etc.). Of
course, while you're doing your developing, you're probably going back
and forth between packages, and certainly not committing things
immediately in a way that is "clean" enough for submission.

So while all developers do for multi-patches series, they rewrite the
history of commits to produce a "clean" set of commits that is
appropriate for submission.

To do this, you need to use "interactive rebasing". You can learn about
it https://git-scm.com/book/en/v2/Git-Tools-Rewriting-History.

> The only way I see to separate in a logical order would be:
> 
> 1) clone a buildroot (master) in a separate subdir.
> 2) hand apply changes needed for a single package.
> 3) generate patches.
> 4) checkout "origin/master" (discarding changes)
> 5) go back to (2) for next package.
> 
> Is this the right way or do You have some better advice?
> Notice that with the above schema  I will not be able to try compiling (at least some) packages
> as they are not independent (e.g.: crossbar needs  *all* those patches to compile).

See above: use the interactive rebase functionality of Git.

One hint: for your big patch that adds all the packages, what you want
to do is:

 1/ Mark the patch as "edit" in your interactive rebase session
 2/ Git will stop at this patch

 3/ Use "git reset HEAD^" to de-apply the commit and put the changes
    back into your working tree

 4/ Create new commits.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
