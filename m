From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 14 Oct 2012 12:53:03 +0200
Subject: [Buildroot] [PATCH 0/7] Introduce the _AVAILABLE mechanism
In-Reply-To: <1347234052-10527-1-git-send-email-yann.morin.1998@free.fr>
References: <1347234052-10527-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20121014125303.0c88e415@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann,

On Mon, 10 Sep 2012 01:40:45 +0200, Yann E. MORIN wrote:

> This patch series is an RFC for how to handle the _AVAILABLE symbol
> in packages.
> 
> See this thread for the original proposal:
>     http://lists.busybox.net/pipermail/buildroot/2012-August/057144.html
> 
> In this series, all packages are converted to use the _AVAILABLE symbol.
> My reasoning behind this is that:
> 
>  1. all packages use the same mechanism, so they are consistent with
>     each others
>  2. modifying a package (ie. adding new dependencies) is easy, and does
>     not require tracking down all dependant packages
>  3. the dependencies of the comments "foo requires bar" are automatically
>     updated in this case (although that's minor, and the comment themselves
>     need updating)
>  4. with the new script in patch 2, it's dirt-easy to add a new package
>     using the _AVAILABLE mechanism
> 
> On the other hand, Arnout pointed out that only packages with depenencies on
> toolchain features should be converted, and in cascade, packages that depend
> on those, leaving alone packages that do not have any depednency at all (if
> I understood correctly):
>     http://lists.busybox.net/pipermail/buildroot/2012-August/058040.html
> 
> Of course, no need to say I'm in favor of modifying all packages, if at least
> only for points 1&2 above. ;-) Of course, I understand Arnout's concerns about
> keeping simplicity and not adding cruft where it is not needed. This post is
> to request comments on this new deeply-impacting change.

Sorry for not getting back to you earlier about this.

I am definitely in favour of this, and I'm really impressed by the
methodology you've used to achieve this. I will post a few comments as
replies to the individual patches with minor things.

However, I'd like you to update us on what are the remaining issues to
be solved before being able to commit this (of course, the script needs
to be re-executed to update all packages that have changed since you
posted the patch series, but you seemed to mention other issues as
well, gettext and maybe others).

> Again, this series is an _RFC_ on the _AVAILABLE mechanism, so the first
> question we must answer is:
> 
>     Do we even want this mechanism in buildroot at all?

Yes, we want this mechanism. Anyone trying to solve
http://autobuild.buildroot.org/results/3eaadd2365d60f574ba8daef45b34370cc5c6272/build-end.log
would agree with this change. I agree that it makes the simple package
slightly more complicated, but not too much, so it sounds to me like it
is a reasonable trade-off.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
