From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 07 Jul 2019 00:14:46 +0200
Subject: [Buildroot] [PATCH] board/qemu: ensure root is available before
 mounting it
In-Reply-To: <20190622165120.24021-1-yann.morin.1998@free.fr> (Yann E. MORIN's
 message of "Sat, 22 Jun 2019 18:51:20 +0200")
References: <20190622165120.24021-1-yann.morin.1998@free.fr>
Message-ID: <87zhlqdd49.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > On my machine, it happens once in a while that the virtualised machine
 > boots too fast for the rootfs to be available at the time the kernel
 > tries to mount it.

 > For example, board/qemu/arm-vexpress/readme.txt suggested changing
 > "-smp 1" up to "-smp 4". But doing so here causes a kernel panic:

 >     VFS: Cannot open root device "mmcblk0" or unknown-block(0,0): error -6
 >     Please append a correct "root=" boot option; here are the available partitions:
 >     1f00          131072 mtdblock0
 >      (driver?)
 >     1f01           32768 mtdblock1
 >      (driver?)
 >     Kernel panic - not syncing: VFS: Unable to mount root fs on
 >     unknown-block(0,0)

 > So, add the oh-so-usefull 'rootwait' option to all kernel command lines
 > for qemu defconfigs.

 > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
 > Cc: Joel Stanley <joel@jms.id.au>
 > Cc: Mark Corbin <mark.corbin@embecosm.com>
 > Cc: Matt Weber <matthew.weber@rockwellcollins.com>

Committed to 2019.02.x and 2019.05.x, thanks.

-- 
Bye, Peter Korsgaard
