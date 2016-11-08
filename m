From: Sam Bobroff <sam.bobroff@au1.ibm.com>
Date: Tue, 8 Nov 2016 16:10:06 +1100
Subject: [Buildroot] [PATCH 1/1] sdl: fix building on powerpc64 and
 powerpc64le
In-Reply-To: <53f345eb-3ea1-02ef-06bf-72f011b3728a@mind.be>
References: <a57a3d0430e248ee08148cef326cbf60283205ad.1478489382.git.sam.bobroff@au1.ibm.com>
 <20161107225106.5e9e61b6@free-electrons.com>
 <53f345eb-3ea1-02ef-06bf-72f011b3728a@mind.be>
Message-ID: <20161108051006.GB6803@tungsten.ozlabs.ibm.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Nov 08, 2016 at 02:04:31AM +0100, Arnout Vandecappelle wrote:
> 
> 
> On 07-11-16 22:51, Thomas Petazzoni wrote:
> > Also, are we going to need to patch libtool.m4 in each and every
> > package around? libtool.m4 from sdl is from libtool 2.2 which is not
> > _that_ old (by the standards of libtool upgrade speed, of course), so
> > we're likely to find many other packages in the same situation, aren't
> > we?

From the libtool git history it looks like the issue is fixed after
libtool 2.4.2.418.

>  Let me rephrase this.
> 
>  You should actually update support/libtool/buildroot-libtool-v1.5.patch and
> support/libtool/buildroot-libtool-v2.2.patch which will fix all packages in one
> fell swoop. (That is, assuming that v2.4 is OK already.)

That sounds great, but that system seems to be set up to patch only
ltmain.sh, and the code that needs patching isn't there.

The change needs to be in aclocal/libtool.m4  but I can't patch that and
then propagate the change to configure, because AUTORECONF doesn't work
for that package. (Maybe it would work for other packages, but I suspect
there would be problems updating a single file on it's own.)

I suppose I could try auto-patching configure and/or configure.in (or
.ac) along the same lines as ltmain.sh... what do you think?

Cheers,
Sam.
