From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 11 Apr 2012 12:40:18 +0200
Subject: [Buildroot] [PATCH] Patch gpsd-2.95 for avr32
In-Reply-To: <1334140031-29576-1-git-send-email-spdawson@gmail.com>
References: <1334140031-29576-1-git-send-email-spdawson@gmail.com>
Message-ID: <20120411124018.1cb660eb@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Le Wed, 11 Apr 2012 11:27:11 +0100,
spdawson at gmail.com a ?crit :

> gpsd does not compile for avr32, due to use of finite() rather than
> isfinite(). See, for example, random buildroot test
> build b7c357dddd7c1f749813035ddbee731d233c59b8

Thanks Simon. I haven't investigated this particular problem. Do you
know why it would be avr32-specific?

Moreover, gpsd 2.95 is quite ancient, the latest version is 3.4, and it
has this problem fixed (see
http://git.savannah.gnu.org/cgit/gpsd.git/commit/pseudonmea.c?id=3b00bd2e71d277283062ed83078de9741a4a8b98).
However, it looks like gpsd is now using Scons as its builds system, so
bumping to 3.4 will require quite a bit of work on gpsd.mk.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
