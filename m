From: Quotient Remainder <quotientvremainder@gmail.com>
Date: Tue, 12 Jul 2011 16:23:15 +0100
Subject: [Buildroot] Installation of package files in staging and target
In-Reply-To: <20110712135140.4d2bd314@skate>
References: <20110712000117.3af73a1a@skate>
 <1310468114.2189.8.camel@dublxciaranr1.verifone.com>
 <20110712135140.4d2bd314@skate>
Message-ID: <1310484198.2189.35.camel@dublxciaranr1.verifone.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 2011-07-12 at 13:51 +0200, Thomas Petazzoni wrote:
> Le Tue, 12 Jul 2011 11:55:12 +0100,
> Quotient Remainder <quotientvremainder@gmail.com> a ?crit :
> 
> > I'm a little behind in tracking the changes with toolchain movements
> > from a few months back but I was of the understanding that the current
> > install scheme still allows the staging directory to be treated as a
> > kind of mini SDK and so if I build a system using Buildroot I can tar
> > up the staging dir and give it to application developers as an
> > interface. Is this still the case?  If so, wouldn't putting
> > executable programs into the staging dir be a bad thing?
> 
> Why would it be bad ? The binaries for the target are not inside
> host/usr/bin, but inside host/usr/<tuple>/sysroot/usr/bin, so even if
> the user adds host/usr/bin to its path to get access to the SDK, the
> target binaries won't be visible.
> 
> It's true however that this would enlarge the size of the SDK.

"Bad" isn't the right word; I shouldn't have used it.
It wasn't that they'd end up in the host's path that was my concern.
My thinking was that the binaries don't belong in an SDK since all we'd
need in it are header files and libraries so applications could be built
and linked with them.
I suppose it comes down to clarifying what the purpose of STAGING_DIR
actually is.

The size increase you mention would be significant.  Just looking at my
current build.  "output/staging/" is 330 MiB (of which 150 MiB is docs
and locale) and the stripped "output/target/" is 61 MiB, which could be
ten times larger with debugging symbols and it is this that would be
included in staging, right?
