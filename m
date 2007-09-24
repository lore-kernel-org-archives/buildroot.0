From: Ulf Samuelsson <ulf@atmel.com>
Date: Mon, 24 Sep 2007 10:06:26 +0200
Subject: [Buildroot] Qtopia4 Failure
In-Reply-To: <1190595992.4299.27.camel@cyclops.infocab.com.au>
References: <1190563965.7015.21.camel@elrond.atmel.sweden>
	<1190591711.4299.17.camel@cyclops.infocab.com.au>
	<d6cda7730709231756k273d449axed0357049468a113@mail.gmail.com>
	<1190595992.4299.27.camel@cyclops.infocab.com.au>
Message-ID: <1190621186.7015.38.camel@elrond.atmel.sweden>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

m?n 2007-09-24 klockan 10:36 +0930 skrev Adam Hawes:
> On Mon, 2007-09-24 at 01:56 +0100, Thiago A. Corr?a wrote:
> > shouldn't you patch uClib instead? Claiming index with a define is
> > really stupid on the part of the library. Others, including myself use
> > index as variable names quite often.
> 
> Do you use index()?  The macro accepts 2 arguments and the pre-processor
> only seems to baulk when you use a function or method called index(...).
> Variable names appear unproblematic.
> 
> Fixing uClibc would be the sensible thing to do, and uClibc actually has
> a configuration option to turn off the legacy macros.  Turning them off,
> however, breaks compatibility with a few things (mplayer was the most
> recent one I found that wouldn't build with SUSv3 macros disabled).
> 

Did you try with UCLIBC_SUSV3_LEGACY enabled?

> I found it easier to patch Qtopia because it was the only thing that
> didn't like the macros that I have found thus far.
> 
> So please keep in mind that there is not one universal solution - there
> are a few options depending on the needs.  My patch fixes Qtopia for
> those people who need the SUSv3 legacy macros in other places.  For
> everyone else there's the configuration option of the library!
> 
> Regards,
> A
> 
> 
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
