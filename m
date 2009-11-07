From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 07 Nov 2009 11:08:07 +0100
Subject: [Buildroot] Upgrading from Buildroot 0.10 to 2009.08 (ARM)
In-Reply-To: <op.u2ywgvjbyqa4qb@jap-lappis.nevion.com> (Joachim Pihl's message
	of "Fri\, 6 Nov 2009 10\:54\:21 +0100")
References: <op.u2yqk2doyqa4qb@jap-lappis.nevion.com>
	<1257497536.1962.15.camel@bender>
	<op.u2ytxehoyqa4qb@jap-lappis.nevion.com>
	<20091106104249.55983beb@surf>
	<op.u2ywgvjbyqa4qb@jap-lappis.nevion.com>
Message-ID: <87ocneve9k.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Joachim" == Joachim Pihl <jpihl@nevion.com> writes:

 Joachim> On Fri, 06 Nov 2009 10:42:49 +0100, Thomas Petazzoni
 Joachim> <thomas.petazzoni@free-electrons.com> wrote:

 >> I think you don't need pkg-config on the target, so disable
 >> BR2_PACKAGE_PKG_CONFIG. This should allow you to disable libglib2
 >> (BR2_PACKAGE_LIBGLIB2), which in turn will allow you to disable gettext
 >> (BR2_PACKAGE_GETTEXT), libintl (BR2_PACKAGE_LIBINTL), libiconv
 >> (BR2_PACKAGE_LIBICONV).
 >> 
 >> Of course, this makes the assumption that your own internal
 >> applications do not use libglib2.

 Joachim> No, they don't, so I will try the above. I think it would well explain
 Joachim> the  library problems.

Some time ago we renamed the confusing pkgconfig package name, so now
host-pkgconfig is pkgconfig for the host (needed by lots of packages),
and pkgconfig is pkgconfig for the target (normally not needed).

-- 
Bye, Peter Korsgaard
