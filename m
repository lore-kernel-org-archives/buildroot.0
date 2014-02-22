From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 22 Feb 2014 22:01:59 +0100
Subject: [Buildroot] [PATCH 1/1] iputils: disable on older uclibc
	versions
In-Reply-To: <1393102140-5880-1-git-send-email-rjbarnet@rockwellcollins.com>
 (Ryan Barnett's message of "Sat, 22 Feb 2014 21:49:00 +0100")
References: <1393102140-5880-1-git-send-email-rjbarnet@rockwellcollins.com>
Message-ID: <87d2iesvy0.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ryan" == Ryan Barnett <ryanbarnett3@gmail.com> writes:

 > Disable when using a uclibc version before 0.9.33 since __dn_comp
 > function support was added in this version. Also disabling on AVR32
 > since any AVR32 toolchain will be based on a uclibc version older
 > than 0.9.33 (for using an external AVR32 toolchain).

I believe the public symbol is dn_comp (which internally gets defined to
__dn_comp in glibc/uClibc for some reason), so I've changed the commit
message and comment to use that instead.

Committed with that fixed, thanks.

-- 
Bye, Peter Korsgaard
