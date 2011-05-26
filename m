From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 26 May 2011 16:02:30 +0200
Subject: [Buildroot] Slow boots caused by
	ca520507fc15a8213334a76339a3e6d567e91ea0 (udev, inittab)
In-Reply-To: <BANLkTimz=8MSHOsoqqmEeNXB+jFf5+R37A@mail.gmail.com> (Diego
	Iastrubni's message of "Thu, 26 May 2011 13:17:27 +0300")
References: <BANLkTi=cikrdVk_mikRhpLYZtgDarZCukw@mail.gmail.com>
	<20110517152841.2da7be8c@surf>
	<BANLkTinfxAON7FioeoC9scz9MF9F3fVp+w@mail.gmail.com>
	<BANLkTik-DyW2P62rGHM70=PYS=nBYFiRoQ@mail.gmail.com>
	<87zkmiud2q.fsf@macbook.be.48ers.dk>
	<BANLkTi=LS8Tk66Gn8zO2Oi476wEiLfJh0A@mail.gmail.com>
	<87tycqucj3.fsf@macbook.be.48ers.dk>
	<BANLkTi=J6qHuzsS=aACb7Zssm5Se-LQZVQ@mail.gmail.com>
	<BANLkTimz=8MSHOsoqqmEeNXB+jFf5+R37A@mail.gmail.com>
Message-ID: <87aae9r24p.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Diego" == Diego Iastrubni <diegoiast@gmail.com> writes:

 Diego> Arggg... now SSH does not work, since the server cannot allocate
 Diego> a PTY....  Again - the fix is to re-add this line to the S10udev
 Diego> script:

 Diego> mount -t devpts /dev/pts /dev/pts || (echo "FAIL" && exit 1)

This happens automatically by the mount -a in your inittab as
/dev/pts is listed in the default /etc/fstab.

Notice you also need the mkdir -p /dev/pts to ensure the mount point is
available. Again, this is all handled in the default /etc/inittab.

Naturally none of this works because of your local hack to mount a tmpfs
in S10udev, so you'll need extra hackery to workaround your workaround.

-- 
Bye, Peter Korsgaard
