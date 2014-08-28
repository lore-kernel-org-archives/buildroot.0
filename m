From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 28 Aug 2014 08:40:30 +0200
Subject: [Buildroot] [PATCH 1/2 v2] new package: libphidget
In-Reply-To: <1409134710-3694-1-git-send-email-yba@tkos.co.il> (Jonathan
 Ben-Avraham's message of "Wed, 27 Aug 2014 13:18:29 +0300")
References: <1409134710-3694-1-git-send-email-yba@tkos.co.il>
Message-ID: <87sikhruap.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Jonathan" == Jonathan Ben-Avraham <yba@tkos.co.il> writes:

 > Signed-off-by: Jonathan Ben-Avraham <yba@tkos.co.il>
 > ---
 >  package/Config.in                |    1 +
 >  package/libphidget/Config.in     |   25 +++++++++++++++++++++++++
 >  package/libphidget/libphidget.mk |   16 ++++++++++++++++
 >  3 files changed, 42 insertions(+)
 >  create mode 100644 package/libphidget/Config.in
 >  create mode 100644 package/libphidget/libphidget.mk

 > diff --git a/package/Config.in b/package/Config.in
 > index 4520ba6..1088f5a 100644
 > --- a/package/Config.in
 > +++ b/package/Config.in
 > @@ -676,6 +676,7 @@ menu "Hardware handling"
 >  	source "package/libsoc/Config.in"
 >  	source "package/libusb/Config.in"
 >  	source "package/libusb-compat/Config.in"
 > +	source "package/libphidget/Config.in"

Config.in entries should be sorted alphabetically.

 > +comment "libphidget needs a toolchain w/ threads"
 > +	depends on !BR2_TOOLCHAIN_HAS_THREADS
 > +

Trailing newline here.

Committed with these minor issues fixed, thanks.

-- 
Bye, Peter Korsgaard
