From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 25 Oct 2014 01:28:57 +0200
Subject: [Buildroot] [PATCH] system/inittab: update to fix bug #7442
In-Reply-To: <1414006578-14307-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Wed, 22 Oct 2014 16:36:18 -0300")
References: <1414006578-14307-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87r3xx6o92.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > Update inittabs (skeleton/busybox & sysvinit) to remove the trailing
 > REMOUNT_ROOTFS_RW comment used as magic string in system/system.mk to
 > enable/disable remounting the root filesystem rw or not since it affects
 > sysvinit in doing so properly as reported in bug #7442.

 > Instead update the sed expressions to match clean non-commented strings
 > by searching for "-o remount,rw /" and checking that's the end of the
 > line as well to avoid affecting possibly other remounts that a user can
 > have in a custom inittab.

 > Long-term the startup block of inittab should just move to a S00sysinit
 > script or similar so that rcS can pick it up directly.

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Committed, thanks.

-- 
Bye, Peter Korsgaard
