From: Rico Bachmann <bachmann@tofwerk.com>
Date: Thu, 6 Oct 2011 08:53:19 +0200
Subject: [Buildroot] [PATCH 2/2] add libfcgi to buildroot
In-Reply-To: <201110012259.10267.arnout@mind.be>
References: <add libfcgi to buildroot>
 <1317285917-2134-1-git-send-email-bachmann@tofwerk.com>
 <20110929115849.73cbefaa@skate> <201110012259.10267.arnout@mind.be>
Message-ID: <001b01cc83f4$a3335150$e999f3f0$@com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> -----Urspr?ngliche Nachricht-----
> Von: Arnout Vandecappelle [mailto:arnout at mind.be]
> Gesendet: Samstag, 1. Oktober 2011 22:59
> An: buildroot at busybox.net
> Cc: Thomas Petazzoni; Rico Bachmann
> Betreff: Re: [Buildroot] [PATCH 2/2] add libfcgi to buildroot
> 
> [I put Rico back in CC]
> On Thursday 29 September 2011 11:58:49, Thomas Petazzoni wrote:
> > Le Thu, 29 Sep 2011 10:45:17 +0200,
> >
> > Rico Bachmann <bachmann@tofwerk.com> a ?crit :
> > > added the patches, still not working
> > > could be a problem with the filepath in the patch?
> [snip]
> > Also:
> >
> >  * Your two patches link_math_cgifcgi.patch and
> link_math_example.patch
> >    should be just one patch.
> 
>  You typically generate the patch like this:
> 
> 1. Make a copy of the unmodified source tree:
> cp -a output/build/fcgi-2.4.0 output/build/fcgi-2.4.0.orig
> 
> 2. Hack away in output/build/fcgi-2.4.0 until it works.
> 
> 3. Create the patch relative to the build directory:
> cd output/build
> diff -rup fcgi-2.4.0.orig fcgi-2.4.0 > \
>   ../../package/fcgi/fcgi-2.4.0-add-lm.patch
> 
> 4. Verify that it works by doing a clean build:
> make fcgi-dirclean; make fcgi
> 
> 5.
> >  * This patch should have a description and a Signed-off-by line.
> 
>  Edit package/fcgi/fcgi-2.4.0-add-lm.patch to add these things.
> 
>  The description goes in the beginning of the patch, before the first
> 'diff',
> and explains why the patch is necessary.
> 
>  The Signed-off-by line comes at the end of this patch comment.  It
> shows that
> you are the author of the patch and that you agree to distribute it
> under GPL.
> See http://kerneltrap.org/files/Jeremy/DCO.txt
> 
>  Terminate the description with a line containing three dashes: ---
> 
>  And look at some of the existing patches for inspiration :-)
> 
> >  * Patching the Makefiles in an autotools-based package is really
> >    wrong, it's the Makefile.am that should be patched. I think your
> >    LDFLAGS = -lm is more a workaround than a correct fix.
> 
>  The Makefile will be overwritten next time you configure the package.
> You'll
> notice that in step 4 :-).  Instead, you have to modify Makefile.am.
> Autotools uses Makefile.am to generate Makefile.in, and configure uses
> Makefile.in to generate Makefile.  However, buildroot normally doesn't
> run
> autotools but uses the distributed Makefile.in instead.  So, you should
> patch
> both Makefile.am and Makefile.in.
> 
> 
>  6. Send your patch to the upstream project.  And be prepared to get
> completely different feedback from them than what you got here :-)
> 
> 
>  Good luck!
> 
>  Regards,
>  Arnout
> --
> Arnout Vandecappelle                               arnout at mind be
> Senior Embedded Software Architect                 +32-16-286540
> Essensium/Mind                                     http://www.mind.be
> G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR
> Leuven
> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
> GPG fingerprint:  31BB CF53 8660 6F88 345D  54CC A836 5879 20D7 CF43

Thanks for this nice explanation.
I will fix the package in the Makefile.in and in the Makefile.am
And add i nice patch with all necessary comments and signed-off-by line etc.
