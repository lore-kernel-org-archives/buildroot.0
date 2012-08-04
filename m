From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 4 Aug 2012 17:36:21 +0200
Subject: [Buildroot] Package informations, online and updated
In-Reply-To: <CAHXCMM+wipC3PvGyav=VyWVrKg5WrQvw-Ztjo+qDZaXbAE3QQg@mail.gmail.com>
References: <20120731213729.49c4b3ee@skate>
 <CAHXCMMLSAQ__EMtn=uSr3P1B3fAfbVCJTo-N5jK780cL6gQh_w@mail.gmail.com>
 <20120804143047.149fbf6c@skate>
 <CAHXCMM+wipC3PvGyav=VyWVrKg5WrQvw-Ztjo+qDZaXbAE3QQg@mail.gmail.com>
Message-ID: <20120804173621.58fb2a87@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Sat, 4 Aug 2012 14:53:28 +0200,
Samuel Martin <s.martin49@gmail.com> a ?crit :

> You're right.
> In such a case, it would be good to know that packages B, C, D has
> successfully been built at that time; package E will cause a
> build-failure, so, will trigger the "alarm" (aka, email/bug tracker
> entry/...) :).

Well, packages B, C and D have been successfully built with *that*
toolchain, or with any toolchain?

Really, because of the fact that each build is based on a random
toolchain and then a random set of packages, it's really hard to draw
definitive conclusions about when a package got broken and when it was
working.

I would rather suggest that we work towards having a 100% build success
rate, so that any build failure is considered as something to fix. Of
course, we can decide on a case by case basis to exclude certain build
scenarios from the autobuilders.

> My point is that sometimes, making some cleanup, some packages do not
> build. So, it would be useful to know if it has been built recently
> (so, in such a case the problem may be a dirty-worktree or the host
> configuration), or if there is a deeper problem due to the upgrade of
> some other packages, change in the infrastructure or anything else.

See above. A package may build successfully once, but then the next
time it doesn't build successful not because of the package being
upgraded, but because the selection of sub-options for that package is
different, because the libraries that have been built before that
package are different, etc. So defining "a package builds" is much,
much more complicated than it sounds in the first place.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
