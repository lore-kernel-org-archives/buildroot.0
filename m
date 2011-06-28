From: Jigar SOLANKI <jigar.solanki@labri.fr>
Date: Tue, 28 Jun 2011 14:27:12 +0200
Subject: [Buildroot] Buildroot root fs over NFS bug
Message-ID: <4E09C8A0.8000808@labri.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

I'm trying to build a full Linux environment on a Virtex4 FPGA board.
I'm actually using a sparc's clone (LEON).
I've successfully built and run the system using grmon
grmon> load image.ram
grmon> run

But when it comes to mount the root filesystem over NFS, i get the
following error :

...
IP-Config: Complete:
     device=eth0, addr=10.10.10.1, mask=255.255.255.0, gw=10.10.10.254,
     host=houat, domain=, nis-domain=(none),
     bootserver=10.10.10.254, rootserver=10.10.10.254, rootpath=
Freeing unused kernel memory: 5060k freed
Initializing random number generator... done.
Starting network...
ip: RTNETLINK answers: File exists
Starting NFS statd: touch: /var/lock/subsys/nfslock: No such file or
directory
done
Starting NFS services: *** invalid open64 call: O_CREAT without mode
***: /usr/sbin/exportfs terminated
======= Backtrace: =========
/lib/libc.so.6(__open64_2+0x28)[0x50133790]
/usr/sbin/exportfs[0x15ca8]
/usr/sbin/exportfs[0x13d90]
/usr/sbin/exportfs[0x11f3c]
/lib/libc.so.6(__libc_start_main+0x10c)[0x50079674]
/usr/sbin/exportfs[0x11154]
======= Memory map: ========
00010000-00019000 r-xp 000000
Welcome to Buildroot
buildroot login:


I have checked my NFS server : it works fine, i can mount after boot
without any problems :
mount -o nolock -t nfs ip:path mountpoint


Any ideas please ?
Thanks a lot for your help

-- 
Jigar SOLANKI


-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 554 bytes
Desc: OpenPGP digital signature
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110628/7d494168/attachment.asc>
