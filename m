From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 03 Jul 2013 23:35:34 +0200
Subject: [Buildroot] [git commit] kmod: bump version
In-Reply-To: <20130703232625.08b7fe54@skate> (Thomas Petazzoni's message of
 "Wed, 3 Jul 2013 23:26:25 +0200")
References: <20130703194340.D760E9A19A@busybox.osuosl.org>
 <20130703232625.08b7fe54@skate>
Message-ID: <8761wrpbrt.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Dear Peter Korsgaard,
 Thomas> On Wed, 3 Jul 2013 21:40:53 +0200, Peter Korsgaard wrote:

 >> +# static linking not supported, see
 >> +# https://git.kernel.org/cgit/utils/kernel/kmod/kmod.git/commit/?id=b7016153ec8
 >> +KMOD_CONF_OPT = --disable-static --enable-shared

 Thomas> 	depends !BR2_PREFER_STATIC_LIB

 Thomas> in the kconfig dependencies maybe?

We could, yes.  I'm fairly sure we have a number of other packages that
don't handle BR2_PREFER_STATIC_LIB though.

It will need to be propagated to kmods reverse dependencies (udev,
network-manager, udisks, ..)

-- 
Bye, Peter Korsgaard
