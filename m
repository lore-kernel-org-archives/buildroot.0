From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 7 Dec 2010 21:35:18 +0100
Subject: [Buildroot] Pull request buildroot.git (vapier branch)
In-Reply-To: <8762v5u5r5.fsf@macbook.be.48ers.dk>
References: <1291503121-24114-1-git-send-email-vapier@gentoo.org>
	<20101205115745.0e86c054@surf> <20101205131952.50400c59@surf>
	<201012060156.53523.vapier@gentoo.org>
	<20101206202754.57658344@surf> <8762v5u5r5.fsf@macbook.be.48ers.dk>
Message-ID: <20101207213518.61b77079@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 07 Dec 2010 13:28:14 +0100
Peter Korsgaard <jacmet@uclibc.org> wrote:

> And as this will be most packages, we should probably do something
> like BR2_PACKAGE_BUSYBOX_SHOW_OTHERS - E.G. add this dependency in
> package/Config.in instead of moving it down to each individual
> package.

I don't think we should do that. With three options to handle
(BUSYBOX_SHOW_OTHERS, USE_MMU and PREFER_STATIC_LIB), the
package/Config.in is going to become a nightmare to read, and the fact
that the current if's in package/Config.in can be common to several
packages will be very reduced because of the three conditions.

On the opposite, I would have suggested to move these to the
per-package Config.in. Yes, it's a bit more code, but it's not a big
deal, and will make it easier to maintain.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
