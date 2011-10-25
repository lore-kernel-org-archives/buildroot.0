From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 25 Oct 2011 08:24:32 +0200
Subject: [Buildroot] Some topics for the Buildroot Developer Day
In-Reply-To: <CAAu5YTaZHudEQ+1vZoYA0v-RRVZ_tVm07ykR389vH9iaqMgNKw@mail.gmail.com>
References: <20111024173815.2277c6dd@skate>
 <CAAu5YTaZHudEQ+1vZoYA0v-RRVZ_tVm07ykR389vH9iaqMgNKw@mail.gmail.com>
Message-ID: <20111025082432.196d59aa@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Mon, 24 Oct 2011 23:54:42 +0100,
Quotient Remainder <quotientvremainder@gmail.com> a ?crit :

> A few months back I posted a patch set that provided a primitive, but
> functional, first attempt at this feature (as a separate target install
> stage in addition to the existing method) after being prompted to share by
> Yann. I don't think I saw any response but I do remember ThomasP saying on
> IRC that it was too simplistic and that he would comment in detail on the
> list but it seems to have fallen off his (long) list of tasks.
> I might take this opportunity to ask for comment again. One thing is that it
> needed no extra $ on TARGET_DIR for gen-/auto-targets. The value of
> TARGET_DIR is simply overridden to be "output/package/$package".

What you posted on July 2011 is a very simplified version of what
Lionel Landwerlin did a while ago. Basically, Lionel did what you did,
but in a much more complete way:

 * He did handle the installation of files in the TARGET_DIR, but also
   in STAGING_DIR and HOST_DIR

 * Each part of a package (target, staging, host) was then packaged in
   a tarball

 * Using this, Lionel implemented a <pkg>-uninstall mechanism that
   worked reliably for all packages.

 * On top of his work, I did start implementing support to remove
   packages automatically when they were removed from the menuconfig
   interface.

But I still do remember that it was working just fine on autotargets
packages, but was causing problems on gentargets packages. And there
were also other problems here and there, and the whole thing was making
Buildroot a lot more complicated. I really think we need to keep a
"simplicity first" rule for Buildroot. There are already other very
elaborate build systems, with package management and al., and it
doesn't make sense if Buildroot becomes as complicated as those build
systems.

I don't find the patches Lionel had posted last year, and his Git
repository seems to be offline. Lionel, can you put your Git repo back
online ?

> The reason I "care" about this kind of thing is to allow packaging of the
> build components for separate download to the target.

With your patch, for each package, the files gets installed both into
output/target and output/package/<pkg>/. Then how do you use that ? I
mean, you're talking about "separate" download to the target, but since
everything is already in output/target and therefore in your root
filesystem image?

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
