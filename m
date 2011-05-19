From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 19 May 2011 13:47:25 +0200
Subject: [Buildroot] Slow boots caused by
	ca520507fc15a8213334a76339a3e6d567e91ea0 (udev, inittab)
In-Reply-To: <BANLkTik-DyW2P62rGHM70=PYS=nBYFiRoQ@mail.gmail.com> (Diego
	Iastrubni's message of "Thu, 19 May 2011 14:34:28 +0300")
References: <BANLkTi=cikrdVk_mikRhpLYZtgDarZCukw@mail.gmail.com>
	<20110517152841.2da7be8c@surf>
	<BANLkTinfxAON7FioeoC9scz9MF9F3fVp+w@mail.gmail.com>
	<BANLkTik-DyW2P62rGHM70=PYS=nBYFiRoQ@mail.gmail.com>
Message-ID: <87zkmiud2q.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Diego" == Diego Iastrubni <diegoiast@gmail.com> writes:

Hi,

 Diego> Eventually, it seems that the delay was caused by the RAMFS not booing mounted
 Diego> on /dev/ which means that udev was writing real files (about 200) over my NFS
 Diego> share to my real limux machine. That *is* kinda slow....

Do you have devtmpfs + mount enabled in your kernel? (DEVTMPFS +
DEVTMPFS_MOUNT). If you do so, /dev is already a tmpfs.

-- 
Bye, Peter Korsgaard
