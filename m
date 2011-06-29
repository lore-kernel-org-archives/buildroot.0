From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 29 Jun 2011 16:57:45 +0200
Subject: [Buildroot] Buildroot root fs over NFS bug
In-Reply-To: <4E0B2562.9090208@labri.fr>
References: <4E09C8A0.8000808@labri.fr> <20110628163315.7f9a2527@skate>
 <4E0B2562.9090208@labri.fr>
Message-ID: <20110629165745.01b2aff4@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Please don't reply to me directly, but to the Buildroot list instead.

Le Wed, 29 Jun 2011 15:15:14 +0200,
Jigar SOLANKI <jigar.solanki@labri.fr> a ?crit :

> Thanks a lot for the reply.
> You were absolutely right, my bad, I wasnt mounting my root filesystem
> over NFS, it was just an initramfs.
> 
> I deactivated the initramfs support in the kernel config and it mounts
> just fine.
> 
> My question, just to be sure, is : why the kernel wasnt  mounting it
> before, even if it had everything in his command line (and even if the
> initramfs support was activated ?) It should have mounted it, right ?

If you have an initramfs, then the kernel uncompresses it at boot time,
and executes the /init script/application in this initramfs. And that's
all the kernel does when an initramfs is present: it's the job of the
initramfs initialization procedure to mount the real root filesystem
and switch to it.

So if you have an initramfs, it's normal not to see the typical:

  VFS: Mounted root (nfs filesystem) on device 0:14.

message in your boot log.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
