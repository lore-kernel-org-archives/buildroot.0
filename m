From: =?us-ascii?Q?Emil_Kruper?= <e.krueper@solcon-systemtechnik.de>
Date: Tue, 2 Sep 2008 08:24:32 +0200
Subject: [Buildroot] Login exited
In-Reply-To: <ed4892840809011747w183e8e8bma1451d38c40e65c0@mail.gmail.com>
Message-ID: <MJEBLBOLLBKOACLOGNPBGEIHCBAA.e.krueper@solcon-systemtechnik.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Alter the device table file you have selected in your buildroot config (for
example target/generic/device_table.txt) and rebuild your system. By default
these files don't fit your needs.

In particular have a look at the section # Normal system devices, I think
this could be the origin of your problems.

Best regards,

Emil Kruper


-----Ursprungliche Nachricht-----
Von: buildroot-bounces at uclibc.org
[mailto:buildroot-bounces at uclibc.org]Im Auftrag von Steven Woody
Gesendet: Dienstag, 2. September 2008 02:47
An: buildroot at uclibc.org; busybox at busybox.net
Betreff: Re: [Buildroot] Login exited


Hi,

The buildroot I am using is the 080831 snapshot, the busybox is
1.11.2. Now I see the boot
prompt finally!  But I can't login:

---
Welcome to uClibc
uClibc login: root
Dec 31 17:01:05 nlmt auth.info login[195]: root login on 'ttyS0'
Dec 31 17:01:05 nlmt daemon.info init: init: process '/sbin/getty -L
ttyS0 115200 vt100' (pid 195) exited. Scheduling for restart.
Dec 31 17:0

Welcome to uClibc
uClibc login: default
Dec 31 17:01:05 nlmt daemon.info init: init: process '/sbin/getty -L
ttyS0 115200 vt100' (pid 195) exited. Scheduling for restart.
Dec 31 17:0
---

And, I got see a suspicious messages just after the kernel booted:
---
VFS: Mounted root (cramfs filesystem) readonly.
Freeing init memory: 84K
Error -3 while decompressing!
c0925384(-7384812)->c3e38000(4096)
---

I think I am so near to success, please help me! Thanks.

-
narke
_______________________________________________
buildroot mailing list
buildroot at uclibc.org
http://busybox.net/mailman/listinfo/buildroot
