From: Pierre Ficheux <pierre.ficheux@openwide.fr>
Date: Sun, 18 Sep 2011 18:44:59 +0200
Subject: [Buildroot] mdev problem in 2011.08 ?
In-Reply-To: <20110918162842.02150727@skate>
References: <4E75EBBF.9080203@openwide.fr> <20110918162842.02150727@skate>
Message-ID: <4E76200B.40608@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le 18/09/11 16:28, Thomas Petazzoni a ?crit :
> Hello Pierre,
> 
> Le Sun, 18 Sep 2011 15:01:51 +0200,
> Pierre Ficheux <pierre.ficheux@openwide.fr> a ?crit :
> 
>> May be I'm wrong but it seems there is a problem when using mdev for
>> /dev management:
> 
> For our mdev and udev support, we assume that the kernel is compiled
> with CONFIG_DEVTMPFS and CONFIG_DEVTMPFS_MOUNT. 

Kernel config looks fine:

$ grep DEVTMPFS output/build/linux-2.6.34.5/.config
CONFIG_DEVTMPFS=y
CONFIG_DEVTMPFS_MOUNT=y

But I still have:

Freeing unused kernel memory: 328k freed
can't open /dev/null: No such file or directory
can't open /dev/null: No such file or directory
can't open /dev/null: No such file or directory
can't open /dev/null: No such file or directory
can't open /dev/null: No such file or directory
can't open /dev/null: No such file or directory
Starting logging: OK
Starting mdev...
mdev: /sys/class: No such file or directory

I test with QEMU + rootfs.cpio, does it matter?

-- 
Pierre FICHEUX -/- CTO OW/OWI, France -\- pierre.ficheux at openwide.fr
                                         http://ingenierie.openwide.fr
                                         http://www.ficheux.org
I would love to change the world, but they won't give me the source code
