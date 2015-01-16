From: Santhosh Ramani <srcoolz@gmail.com>
Date: Fri, 16 Jan 2015 11:48:08 -0600
Subject: [Buildroot] NFS boot
Message-ID: <CADKZYYKc9a-2MNu_iS9XUvrh8FPnKQatZbbB4PidvOLVNKgd1g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Everyone,

I would like to perform NFS boot for my custom board. I was initially
having some difficulty with NFS - it would start and mount the filesystem
but then indicate that it's waiting for the server. See log below:

[    4.745189] Sending DHCP requests ., OK
[    4.765661] IP-Config: Got DHCP answer from 192.168.2.1, my address is
192.168.2.138
[    4.774549] IP-Config: Complete:
[    4.778079]      device=eth0, hwaddr=54:4a:16:b7:5e:e2,
ipaddr=192.168.2.138, mask=255.255.255.0, gw=192.168.2.1
[    4.788915]      host=192.168.2.138, domain=resprod.com,
nis-domain=(none)
[    4.796287]      bootserver=0.0.0.0, rootserver=192.168.2.4, rootpath=
[    4.803036]      nameserver0=192.168.0.3, nameserver1=192.168.0.6
*[    4.830473] VFS: Mounted root (nfs filesystem) on device 0:14.*
[    4.837628] devtmpfs: mounted
[    4.842027] Freeing unused kernel memory: 280K (c0610000 - c0656000)
Starting logging: OK
Populating /dev using udev: [    5.551890] udevd[808]: starting version 1.9
[    6.186179] PM: request_firmware failed
done
Initializing random number generator... done.
Starting system message bus: done
Starting network...
ip: RTNETLINK answers: File exists
udhcpc (v1.22.1) started
*[   17.925206] nfs: server 192.168.2.4 not responding, still trying*

Later I changed the S40network script on the NFS file system to not start
the network if it's NFS mount and then it worked. S40network is a buildroot
generated script - am I missing something in the config that will generate
the correct S40network script to allow NFS mount as well.

Thank you for your replies.
Regards

Santhosh


-- 
Greater the Difficulty....Sweeter is the Victory
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150116/75667aca/attachment.html>
