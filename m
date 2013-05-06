From: Nathan Lynch <ntl@pobox.com>
Date: Mon, 06 May 2013 12:42:36 -0500
Subject: [Buildroot] [PATCH] chrony: new package
In-Reply-To: <20130506192044.398293f1@skate>
References: <1367856775-4502-1-git-send-email-ntl@pobox.com>
 <20130506192044.398293f1@skate>
Message-ID: <1367862156.2177.8.camel@doorstop.aus.2wire.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 2013-05-06 at 19:20 +0200, Thomas Petazzoni wrote:
> Dear Nathan Lynch,
> 
> Thanks, this looks almost good. A few comments below.
> 
> On Mon,  6 May 2013 11:12:55 -0500, Nathan Lynch wrote:
> 
> > diff --git a/package/chrony/Config.in b/package/chrony/Config.in
> > new file mode 100644
> > index 0000000..a42bd77
> > --- /dev/null
> > +++ b/package/chrony/Config.in
> > @@ -0,0 +1,5 @@
> > +config BR2_PACKAGE_CHRONY
> > +	bool "chrony"
> > +	help
> > +	  Chrony is a pair of programs which are used to maintain the
> > +	  accuracy of the system clock.
> 
> We generally want a empty new line here, and then the upstream URL of
> the project.

Okay, will fix.


> Also, did you check that this program indeed builds with a minimal
> uClibc toolchain (no thread, no wchar, no locale, no nothing) ?

Sorry, no, that was sloppy of me.  I will do so for v2 and try to better
specify the package's needs and dependencies.  I'd be happy to try any
configs you'd care to point out...


> > diff --git a/package/chrony/chrony.mk b/package/chrony/chrony.mk
> > new file mode 100644
> > index 0000000..b9733f9
> > --- /dev/null
> > +++ b/package/chrony/chrony.mk
> > @@ -0,0 +1,6 @@
> 
> We generally like to have our nice header here, like in all other
> packages:
> 
> #############################################################
> #
> # bind
> #
> #############################################################

Will fix.

Thanks for the review, Thomas.
