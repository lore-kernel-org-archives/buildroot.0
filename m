From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 3 Jul 2013 23:49:07 +0200
Subject: [Buildroot] [git commit] kmod: bump version
In-Reply-To: <8761wrpbrt.fsf@dell.be.48ers.dk>
References: <20130703194340.D760E9A19A@busybox.osuosl.org>
 <20130703232625.08b7fe54@skate> <8761wrpbrt.fsf@dell.be.48ers.dk>
Message-ID: <20130703234907.3c4c944e@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Korsgaard,

On Wed, 03 Jul 2013 23:35:34 +0200, Peter Korsgaard wrote:

>  Thomas> 	depends !BR2_PREFER_STATIC_LIB
> 
>  Thomas> in the kconfig dependencies maybe?
> 
> We could, yes.  I'm fairly sure we have a number of other packages
> that don't handle BR2_PREFER_STATIC_LIB though.

True, but I believe those packages should either be fixed, or marked
as depends on !BR2_PREFER_STATIC_LIB. As we have discussed a number of
times in the past, I believe that a "prefer static libraries" option
doesn't make much sense. Either you /want/ static libraries, or
you /don't/ want static libraries. But a "prefer" option that doesn't
even tell you for which libraries static linking or dynamic linking
will be used is kinda useless. And since kconfig doesn't allow us to
easily provide per-package options to allow the user to define on a
per-library basis whether it should be built static or dynamic, I
believe the only two selections that make sense are: full dynamic or
full static.

Or, as we discussed when talking about building with -fPIC: build
static /and/ dynamic, build dynamic only (default), build static only.

> It will need to be propagated to kmods reverse dependencies (udev,
> network-manager, udisks, ..)

Indeed. I must say I'm somewhat surprised that something relatively
simple like kmod doesn't support static linking.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
