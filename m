From: Divick Kishore <divick.kishore@gmail.com>
Date: Sun, 9 Jan 2011 03:05:30 +0530
Subject: [Buildroot] Linux kernel boot stops after NFS mount
In-Reply-To: <AANLkTikj2XSfEehgqCqoCfL_Ewknsd+sUHpEjrjc_hjY@mail.gmail.com>
References: <AANLkTikz=zS_a315fwc=F+iUL=j2P43bTi8CeJPuoHG3@mail.gmail.com>
	<4D286E5A.1010209@sensortherm.de>
	<AANLkTingWO1X3b7dgBqh5FVM7q9oxAtyaOHP-J0WnpS-@mail.gmail.com>
	<AANLkTikj2XSfEehgqCqoCfL_Ewknsd+sUHpEjrjc_hjY@mail.gmail.com>
Message-ID: <AANLkTinZ8NZ1JMCJ_zYBaMPF9mX_E2T09fKAkh0rGfSO@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Samuel,

> It might be that the console is disabled in /etc/inittab, just add the
> following line (replace ttyS0 by your serial console if it is not ttyS0):
> s0::respawn:/sbin/getty -L ttyS0 115200,38400,9600

Yeah I tried with this as well but still no output on console. My
serial console is ttyS0.

> Btw, take care of the console setting in the kernel command line and in the
> inittab

My kernel command line has the following bootargs (i.e. console is set
to be ttyS0).

bootargs=mem=32M rootfstype=ext3 root=/dev/nfs
nfsroot=192.168.1.4:/nfs ip=dhcp console=ttyS0


> Also, check in /etc/securetty that the console is enabled, to be able to
> login through the console.

I do see an entry ttyS0 in /etc/securetty apart from many other
entries like tty1, tty2 etc.

Regards,
DivKis
