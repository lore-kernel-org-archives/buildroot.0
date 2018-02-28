From: Trent Piepho <tpiepho@impinj.com>
Date: Wed, 28 Feb 2018 18:23:28 +0000
Subject: [Buildroot] [PATCH 1/1] azmq: bump to version 1.0.2
In-Reply-To: <87vaehlj1v.fsf@dell.be.48ers.dk>
References: <20180227205125.8121-1-fontaine.fabrice@gmail.com>
 <87lgfem9h0.fsf@dell.be.48ers.dk>
 <MWHPR0601MB37534B75BE813D41A6C3920ED3C70@MWHPR0601MB3753.namprd06.prod.outlook.com>
 <87vaehlj1v.fsf@dell.be.48ers.dk>
Message-ID: <1519842208.25567.225.camel@impinj.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 2018-02-28 at 07:33 +0100, Peter Korsgaard wrote:
> > > > > > "Trent" == Trent Piepho <tpiepho@impinj.com> writes:
> 
>  >> >>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:
>  >> Does this fix any big / security issues so it needs to go to master or
>  >> s this for next?
> 
>  > The previous version of azmq will not build with the boost version in 2018.02-rc2.
> 
>  > It does work with buildroot 2017.11.2.
> 
>  > Not sure exactly where the breakage point was between those releases.
> 
> Ahh, so azmq-1.0 doesn't build in 2018.02-rc3? Odd, I don't see it in
> the autobuilder

azmq is a header only library and buildroot disables the library's unit
tests, so there is nothing to fail when buildroot "builds" the library.
 But if you use it, it doesn't work with some asio changes that went
into boost.

It would be interesting if buildroot could build and run a package's
unit tests.  I wonder if autobuilders would be able to find many bugs
that way?
