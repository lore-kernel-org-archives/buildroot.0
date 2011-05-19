From: Diego Iastrubni <diegoiast@gmail.com>
Date: Thu, 19 May 2011 15:04:30 +0300
Subject: [Buildroot] Slow boots caused by
 ca520507fc15a8213334a76339a3e6d567e91ea0 (udev, inittab)
In-Reply-To: <87tycqucj3.fsf@macbook.be.48ers.dk>
References: <BANLkTi=cikrdVk_mikRhpLYZtgDarZCukw@mail.gmail.com>
	<20110517152841.2da7be8c@surf>
	<BANLkTinfxAON7FioeoC9scz9MF9F3fVp+w@mail.gmail.com>
	<BANLkTik-DyW2P62rGHM70=PYS=nBYFiRoQ@mail.gmail.com>
	<87zkmiud2q.fsf@macbook.be.48ers.dk>
	<BANLkTi=LS8Tk66Gn8zO2Oi476wEiLfJh0A@mail.gmail.com>
	<87tycqucj3.fsf@macbook.be.48ers.dk>
Message-ID: <BANLkTi=J6qHuzsS=aACb7Zssm5Se-LQZVQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, May 19, 2011 at 2:59 PM, Peter Korsgaard <jacmet@uclibc.org> wrote:
> ?>> Do you have devtmpfs + mount enabled in your kernel? (DEVTMPFS +
> ?>> DEVTMPFS_MOUNT). If you do so, /dev is already a tmpfs.
>
> ?Diego> It seems not. The sad thing is that I cannot even recompile the
>
> Argh - Then your best bet is probably to add a local hack to mount a
> tmpfs on /dev before starting udev.

And I propose adding a back that check in the udev script, as it wan
before. This should not hurt existing users.
