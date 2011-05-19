From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 19 May 2011 13:59:12 +0200
Subject: [Buildroot] Slow boots caused by
	ca520507fc15a8213334a76339a3e6d567e91ea0 (udev, inittab)
In-Reply-To: <BANLkTi=LS8Tk66Gn8zO2Oi476wEiLfJh0A@mail.gmail.com> (Diego
	Iastrubni's message of "Thu, 19 May 2011 14:52:58 +0300")
References: <BANLkTi=cikrdVk_mikRhpLYZtgDarZCukw@mail.gmail.com>
	<20110517152841.2da7be8c@surf>
	<BANLkTinfxAON7FioeoC9scz9MF9F3fVp+w@mail.gmail.com>
	<BANLkTik-DyW2P62rGHM70=PYS=nBYFiRoQ@mail.gmail.com>
	<87zkmiud2q.fsf@macbook.be.48ers.dk>
	<BANLkTi=LS8Tk66Gn8zO2Oi476wEiLfJh0A@mail.gmail.com>
Message-ID: <87tycqucj3.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Diego" == Diego Iastrubni <diegoiast@gmail.com> writes:

Hi,

 >> Do you have devtmpfs + mount enabled in your kernel? (DEVTMPFS +
 >> DEVTMPFS_MOUNT). If you do so, /dev is already a tmpfs.

 Diego> It seems not. The sad thing is that I cannot even recompile the
 Diego> kernel, since the n00bs who engineered this crap did not think about
 Diego> updating the kernel from remote... and we have a few of them in the
 Diego> wild.

Argh - Then your best bet is probably to add a local hack to mount a
tmpfs on /dev before starting udev.

-- 
Bye, Peter Korsgaard
