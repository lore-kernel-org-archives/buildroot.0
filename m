From: Micha Holzmann <holzmann@gmx.de>
Date: Fri, 14 Mar 2008 15:23:34 +0100
Subject: [Buildroot] Problems after building rootfs.i386.ext2
In-Reply-To: <46a136670803130959n7d6cfcaxf8eb0a78d93acf71@mail.gmail.com>
References: <20080313160410.GA13136@mail.mhnet.de>
	<46a136670803130959n7d6cfcaxf8eb0a78d93acf71@mail.gmail.com>
Message-ID: <20080314142333.GA14688@mail.mhnet.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

i did what you recommended. I chrooted and tried to mount proc with
several methods.

mount -t proc proc /proc
mount -t proc none /prot

proc was not mounted. mount said, to mount it needs proc mounted. At
this moment mount is a symlink to busybox. I left the chroot and mounted
proc to the proc inside the rootfs and do chroot again. mount without
options shows me infos. But ls -al still stucks until i press CTRL-C.
No change in the behavior.

The second hint you gave me, was to use strace. I activated strace in
the menuconfig. The compiler gives me errors for two lines:

net.c: In function ?printsock?:
net.c:958: error: field ?ll? has incomplete type
net.c:961: error: field ?nl? has incomplete type
make[2]: *** [net.o] Fehler 1

In this case i have no strace which runs inside the chroot.

I tried to build buildroot the last two weeks over 30+ times.
Now i am running out of ideas what to do.   :-)

May you have any further idea(s)?


Quoting John Voltz:
> I think when you chroot you need to remount /proc. That can cause weird
> problems like you describe. Also try using strace on commands that fail or
> freeze up. This can be very enlightening (or confusing). You might not even
> be able to chroot into it since you are using uClibc instead of glibc. I
> don't know for sure. Does anyone else?
> 
> John Voltz


Best regards,
Micha Holzmann
