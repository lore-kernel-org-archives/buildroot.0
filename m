From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 27 Jan 2014 08:54:12 +0100
Subject: [Buildroot] [PATCH] Unexport TAR_OPTIONS.
In-Reply-To: <87k3dmmjut.fsf_-_@spindle.srvr.nix> (nix@esperi.org.uk's message
 of "Sun, 26 Jan 2014 22:58:02 +0000")
References: <878uu3pw4z.fsf@spindle.srvr.nix>
 <8738ka1jme.fsf@dell.be.48ers.dk> <87ob2ymkxn.fsf@spindle.srvr.nix>
 <87mwiiz7uc.fsf@dell.be.48ers.dk> <87k3dmmjut.fsf_-_@spindle.srvr.nix>
Message-ID: <87iot5zwpn.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Nix" == Nix  <nix@esperi.org.uk> writes:

 > GNU tar > 1.13.17 interprets TAR_OPTIONS as an environment variable
 > containing options to be prepended to the set on the command line.

 > Since we use the same variable, if the user's environment already
 > contains TAR_OPTIONS, our use of the same variable name modifies
 > the environment and causes untars to misbehave when TAR_OPTIONS
 > causes a -xf to be prepended to the tar command line, likely
 > converting a subsequent flag into a spurious filename.

 > Signed-off-by: Nick Alcock <nick.alcock@oracle.com>

Committed, thanks.

 > ---
 >  Makefile | 1 +
 >  1 file changed, 1 insertion(+)

 >> Indeed, and likewise we don't want a user's custom TAR_OPTIONS to affect
 >> the behaviour of Buildroot, so we should just unexport it like we do for
 >> E.G. GREP_OPTIONS.
 >> 
 >> Care to send a patch doing that? Thanks.

 > Instant patch. (I wish the problems I'm having with a 32-bit fakeroot
 > trying to run 64-bit stuff from the host and freezing with horrible
 > communication-related errors were so easy to solve... I might just
 > revamp the three-year-old buildroot fork I'm working from so it's not
 > relying on a 32-bit external codesourcery toolchain and build the damn
 > toolchain myself. That seems likely to be easier than debugging
 > *anything* to do with never-to-be-sufficiently-cursed fakeroot.)

Yes please - We've added quite some features and fixed bugs during the
last 3 years!


 > diff --git a/Makefile b/Makefile
 > index 9dfb1e0..067458b 100644
 > --- a/Makefile
 > +++ b/Makefile
 > @@ -261,6 +261,7 @@ unexport CPP
 >  unexport CFLAGS
 >  unexport CXXFLAGS
 >  unexport GREP_OPTIONS
 > +unexport TAR_OPTIONS
 >  unexport CONFIG_SITE
 >  unexport QMAKESPEC
 >  unexport TERMINFO
 > -- 
 > 1.8.5.2.169.ge058798

-- 
Bye, Peter Korsgaard 
