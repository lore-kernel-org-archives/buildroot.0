From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 10 Jul 2008 16:21:29 +0200
Subject: [Buildroot] dbus-1.1.1 is always rebuilt on "make"
In-Reply-To: <4876156A.4050200@atmel.com> (Ulf Samuelsson's message of "Thu\,
	10 Jul 2008 15\:58\:02 +0200")
References: <4876156A.4050200@atmel.com>
Message-ID: <87zlopom52.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ulf" == Ulf Samuelsson <ulf.samuelsson@atmel.com> writes:

 Ulf> It looks like dbus is always rebuilt.
 Ulf> make -d -n dbus shows: (In Swedish :-)

?h nej da!

/me hands Ulf a LANG=C

That's a known issue with Makefile.autotools.in. See r22461.

phony rules like libxml2-install-staging are always considered out of
date. We'll need to move to version independent stamp files like
recently discussed on the list to handle it.

-- 
Bye, Peter Korsgaard
