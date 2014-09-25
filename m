From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 25 Sep 2014 21:50:18 +0200
Subject: [Buildroot] [PATCH 1/1] tiff: ensure directory exists before
	installing to it
In-Reply-To: <CANxTyt6KjuN4ObKa8oB0nbDxgE-mV1dJgxz2X-PCe0_3uidBmw@mail.gmail.com>
 (Danomi Manchego's message of "Thu, 25 Sep 2014 09:08:48 -0400")
References: <1410488467-2093-1-git-send-email-danomimanchego123@gmail.com>
 <87oau4ysjp.fsf@dell.be.48ers.dk>
 <CANxTyt6KjuN4ObKa8oB0nbDxgE-mV1dJgxz2X-PCe0_3uidBmw@mail.gmail.com>
Message-ID: <877g0rzdhh.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Danomi" == Danomi Manchego <danomimanchego123@gmail.com> writes:

Hi,

 > I tried compiling tiff with the TIFF_INSTALL_TARGET_CMDS deleted, and
 > it seemed to work fine for my configuration - lots of new stuff
 > installed to /usr/bins, and .a, .la, .so + symlinks installed to
 > /usr/lib, and a bunch of documentation and man pages.  So, no obvious
 > disaster.

 > I could try spinning another patch to use the 'make install'.  But
 > there are 23 of those tiff bins installed by the default install.
 > Currently, we have kconfig enables for 2 of those 23.  Should there be
 > switches for all the other ones, or just a hard-coded deletion
 > intiff.mk, like libjpeg's bins?

Thanks. I would prefer to keep the behaviour as it is today (E.G. keep
the options for the 2 and delete everything else). If in the future
people need any of the remaining 21 programs then we can add options
then.

Thanks!

-- 
Bye, Peter Korsgaard
