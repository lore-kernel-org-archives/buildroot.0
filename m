From: Ulf Samuelsson <ulf@atmel.com>
Date: Thu, 23 Aug 2007 00:12:47 +0200
Subject: [Buildroot] Hiding non-buildable packages
In-Reply-To: <20070822212034.GC11697@aon.at>
References: <1187728137.6145.48.camel@86-115-11-152>
	<20070822191320.GU11697@aon.at> <1187814296.4321.37.camel@86-115-11-28>
	<200708222244.38319.yann.morin.1998@anciens.enib.fr>
	<1187816364.4321.63.camel@86-115-11-28> <20070822212034.GC11697@aon.at>
Message-ID: <1187820767.4321.106.camel@86-115-11-28>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

ons 2007-08-22 klockan 23:20 +0200 skrev Bernhard Fischer:
> On Wed, Aug 22, 2007 at 10:59:24PM +0200, Ulf Samuelsson wrote:
> 
> >Granted, but do we need it to be perfect?, I think not!
> >
> >I know that openssh does not work due to lack of 64 bit math.
> 
> You are - for the second time today - tempting me to just apply my
> openssh update which i know may have trouble in some odd places, just
> FYI..

Go ahead, since it is permanently broken.

Implementing the 64 bit math routines in uClibc as an option
depending on if openSSH is built would be the proper thing to do.

- Or put the 64 bit math in the openSSH tree in a lib,

- Or change the computation to 32 bit math.


> >I do not think it works for any architecture.
> >Why should every newbie try this out for themseleves,
> >only to find that it does not build...
> 
> Since the default works fine, if somebody tries hard to shoot themselves
> in the foot, why prevent them from doing so?
> >
> >Much better to hide it from the build, and then let the guy
> >which really wants it to reenable and debug it.
> 
> No. That's not my approach.
> Let defaults work, if you change anything, be prepared to keep all
> parts.

I am not suggesting that the default should change.
The default should still be to show all packages,
but you can, set an option which hides broken packages


-- 
Best Regards,
Ulf Samuelsson          mail:   ulf at atmel.com
Atmel Nordic AB
Box 2033, 174 52 Sundbyberg
Kavalleriv?gen 24, 174 58 Sundbyberg
Sweden
Tel:    +46 8 441 54 22 GSM:    +46 706 224457
