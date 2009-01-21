From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 21 Jan 2009 12:02:03 +0100
Subject: [Buildroot] busybox login problem on AT91SAM9263
In-Reply-To: <5B920D714A1C354D8949DBF58C2A35D604139AA8@freja.acte.local>
	(Robin ActeSE Stridh's message of "Wed\,
	21 Jan 2009 11\:00\:41 +0100")
References: <5B920D714A1C354D8949DBF58C2A35D604139AA8@freja.acte.local>
Message-ID: <87d4egudlg.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Robin" == Stridh, Robin ActeSE <robin.stridh@acteembedded.se> writes:

Hi,

 Robin> Changing the busybox version from 1.13.x to 1.10.x solves the
 Robin> problem, so I guess something must have been changed in that
 Robin> time affecting the login process.

Then it's time to debug. Do you have an /etc/securetty on the target
and does it list ttyS0?

If that's ok, then I would suggest you enable strace, boot with
init=/bin/sh and send the strace output of running login here to the
list.

-- 
Bye, Peter Korsgaard
