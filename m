From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 31 Dec 2008 08:26:34 +0100
Subject: [Buildroot] Can't Login to New System
In-Reply-To: <ecbbfeda0812301520k69461096nbb27f0c5ca65c11@mail.gmail.com>
	(Andrew Wiley's message of "Tue\, 30 Dec 2008 17\:20\:35 -0600")
References: <ecbbfeda0812301520k69461096nbb27f0c5ca65c11@mail.gmail.com>
Message-ID: <87iqp03ivp.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Andrew" == Andrew Wiley <debio264@gmail.com> writes:

Hi,

 Andrew> As you can see, I didn't change the login message or
 Andrew> anything. All I've done to the root filesystem is moved /dev
 Andrew> from an out of date (but working) root to buildroot's
 Andrew> root. As far as I can tell, this has caused no problems. The
 Andrew> lines in /etc/inittab that start the getty you see here are:

 Andrew> # Put a getty on the serial port
 Andrew> ttyAM0::respawn:/sbin/getty -L ttyAM0 57600 vt100

 Andrew> ttyAM0 is a serial port.

You need to add ttyAMx to /etc/securetty. If you tell me the
major/minor numbers of /dev/ttyAMx, then I'll add device nodes +
securetty entries for them to the default rootfs.

-- 
Bye, Peter Korsgaard
