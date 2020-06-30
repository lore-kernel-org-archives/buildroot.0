From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 30 Jun 2020 19:43:30 +0200
Subject: [Buildroot] NFS-root boot problem
In-Reply-To: <CAOiXNkBxAvePRB5zCCcPdyyBarM_4w_8hvc15nWhuK=15W6ptg@mail.gmail.com>
References: <CAOiXNkBxAvePRB5zCCcPdyyBarM_4w_8hvc15nWhuK=15W6ptg@mail.gmail.com>
Message-ID: <20200630194330.554815c0@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 30 Jun 2020 19:23:30 +0200
Andrey Nechypurenko <andreynech@gmail.com> wrote:

> [    8.349831] stm32-dwmac 5800a000.ethernet eth0: Link is Up -
> 1Gbps/Full - flow control rx/tx
> [    8.369852] IPv6: ADDRCONF(NETDEV_CHANGE): eth0: link becomes ready
> [    8.399809] Sending DHCP requests ., OK
> [    8.445835] IP-Config: Got DHCP answer from 192.168.10.1, my
> address is 192.168.10.2
> [    8.459285] IP-Config: Complete:
> [    8.464607]      device=eth0, hwaddr=00:80:e1:42:63:27,
> ipaddr=192.168.10.2, mask=255.255.255.0, gw=192.168.10.1
> [    8.480546]      host=devboard, domain=dev.local, nis-domain=(none)
> [    8.492540]      bootserver=192.168.10.1, rootserver=192.168.10.1,
> rootpath=/srv/nfs/rootfs,wsize=1024,rsize=1024,v3
> [    8.492546]      nameserver0=8.8.8.8
> [    8.515305] ALSA device list:
> [    8.520550]   No soundcards found.
> [    8.569520] VFS: Mounted root (nfs filesystem) on device 0:16.
> [    8.583574] devtmpfs: mounted
> [    8.590867] Freeing unused kernel memory: 1024K
> [    8.630042] Run /sbin/init as init process
> Starting syslogd: OK
> Starting klogd: OK
> Running sysctl: OK
> Initializing random number generator: OK
> Saving random seed: OK
> Starting rpcbind: OK
> Starting network: ip: RTNETLINK answers: File exists
> udhcpc: started, v1.31.1
> [   19.379804] nfs: server 192.168.10.1 not responding, still trying
> [   28.199820] nfs: server 192.168.10.1 not responding, still trying

When your DHCP client in userspace runs, it turns the network interface
down, and because you're doing root-over-NFS, this means you're cutting
the tree branch on which you're sitting!

Disable your DHCP client in userspace will solve your problem.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
