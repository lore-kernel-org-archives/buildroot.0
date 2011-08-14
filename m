From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 14 Aug 2011 08:43:10 +0200
Subject: [Buildroot] /run/udev missing ?
In-Reply-To: <1313137798.1017.5.camel@sven> (Sven Neumann's message of "Fri,
 12 Aug 2011 10:29:56 +0200")
References: <1313137798.1017.5.camel@sven>
Message-ID: <87ty9kh4sh.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Sven" == Sven Neumann <s.neumann@raumfeld.com> writes:

 Sven> Hi,
 Sven> after updating to latest buildroot, udevd has problems starting:

 Sven> udevd[1114]: error: runtime directory '/run/udev' not writable, for now
 Sven> falling back to '/dev/.udev'
 Sven> udevd[1114]: failed to create queue file: No such file or directory
 Sven> udevd[1114]: error creating queue file

 Sven> It looks like udevd is not running or not working properly then as it
 Sven> fails to load the firmware for the Wifi chip.

 Sven> This is a configuration with static device management.

All other configurations than static dev (devtmpfs/mdev/udev) expects
CONFIG_DEVTMPFS_MOUNT to be enabled in the kernel, not a static /dev.

-- 
Bye, Peter Korsgaard
