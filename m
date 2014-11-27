From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 27 Nov 2014 10:01:54 +0100
Subject: [Buildroot] [PATCH] system/device_table.txt: add /dev/null entry
In-Reply-To: <20141127081201.GQ2374@sapphire.tkos.co.il> (Baruch Siach's
 message of "Thu, 27 Nov 2014 10:12:01 +0200")
References: <0a2f80f7ceb3272bf534f85fbf5030df36cae191.1417070676.git.baruch@tkos.co.il>
 <87fvd5oz47.fsf@dell.be.48ers.dk>
 <20141127081201.GQ2374@sapphire.tkos.co.il>
Message-ID: <87bnntow3h.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

Hi,

>> > can't open /dev/null: No such file or directory
 >> > can't open /dev/null: No such file or directory
 >> > can't open /dev/null: No such file or directory
 >> > can't open /dev/null: No such file or directory
 >> > can't open /dev/null: No such file or directory
 >> > can't open /dev/null: No such file or directory
 >> > ...
 >> 
 >> Hmm, is this on a kernel without devtmpfs? Devtmpfs is expected to be
 >> used with mdev (and we automatically enable it if you build a kernel
 >> with BR).

 > I am currently using a kernel built with no devtmpfs support. Don't
 > we support mdev without devtmpfs anymore? Once I added /dev/null the
 > system seems to boot successfully as is, with /dev fully populated.

Well, it presumably doesn't get a lot of testing atleast as none of this
stuff afaik has changed the last few years.

Is there any specific reason why you don't use devtmpfs? It's quite
small and has been in the kernel since 2.6.32.

With that said, if just adding /dev/null fixes it for you then we can
certainly add it. What about similar things like /dev/console, /dev/tty
or your serial port?

Alternatively we can just ask people who don't want to use devtmpfs to
use system/dev_table_dev.txt as well, similar to how we do it for static /dev.


 >> > Starting mdev...
 >> > /etc/init.d/S10mdev: line 19: can't create /proc/sys/kernel/hotplug: nonexistent directory
 >> > mdev: /sys/class: No such file or directory
 >> 
 >> So you don't have /proc and /sys? Is this also a custom rootfs skeleton
 >> / inittab? With the default one we do a mount -a before running /etc/init.d/rcS.

 > I use the default inittab. The thing is that since /dev/null is missing, all 
 > inittab commands having "null" as console don't run, as I explained in the 
 > commit log above.

Ahh yes.

-- 
Bye, Peter Korsgaard 
