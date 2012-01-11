From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 11 Jan 2012 14:52:11 +0100
Subject: [Buildroot] Cant type anything into Serial Console login
In-Reply-To: <4F0D76AB.7000508@labri.fr> (Jigar SOLANKI's message of "Wed, 11
 Jan 2012 12:46:51 +0100")
References: <4F0D76AB.7000508@labri.fr>
Message-ID: <8739bmbb3o.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Jigar" == Jigar SOLANKI <jigar.solanki@labri.fr> writes:

Hi,

 Jigar> 1- the kernel command line (console=/dev/ttyS0,115200)

 Jigar> 2- and also checked in target options->generic serial config->put a
 Jigar> getty on ttyS0, 115200.

 Jigar> 3- I checked the inittab :

 Jigar> # Set up a couple of getty's
 Jigar> tty1::respawn:/sbin/getty 115200 tty1
 Jigar> tty2::respawn:/sbin/getty 115200 tty2

 Jigar> # Put a getty on the serial port
 Jigar> ttyS0::respawn:/sbin/getty -L ttyS0 115200 vt100 # GENERIC_SERIAL

 Jigar> 4- and I checked the /etc/securetty file too (ttyS0 is there).

 Jigar> What am I missing here?

Seems good. Can you interact with the shell over serial if you boot with
init=/bin/sh ?

-- 
Bye, Peter Korsgaard
