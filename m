From: Kelvin Cheung <keguang.zhang@gmail.com>
Date: Wed, 7 Apr 2010 16:18:10 +0800
Subject: [Buildroot] mount.nfs: access denied by server while mounting ...
Message-ID: <k2y48ab7e011004070118ob29b899bra1499597e06c0cc4@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello all,

I compiled nfs-utils-1.0.10 with buildroot for my ARM(v4)
board(linux-2.6.29.6).

The content of export is as follow:

[root at fs2410 /root]# cat /etc/exports
/media *(rw,sync,no_subtree_check)

After the NFS server was started, I mount the server by
client(nfs-utils-1.1.6) from PC.

kelvin at kelvin-desktop:/nfs$ sudo mount 192.168.10.100:/media /mnt
mount.nfs: access denied by server while mounting 192.168.10.100:/media

The log message of server says:
Jan  1 08:00:36 fs2410 daemon.notice rpc.statd[532]: Version 1.0.10 Starting
Jan  1 08:00:36 fs2410 daemon.notice rpc.statd[532]: statd running as root.
chown /var/lib/nfs/sm to choose different user
Jan  1 08:00:37 fs2410 daemon.warn rpc.statd[532]: gethostbyname error for
fs2410
Jan  1 08:00:37 fs2410 daemon.notice rpc.statd[536]: Version 1.0.10 Starting
Jan  1 08:00:37 fs2410 daemon.notice rpc.statd[536]: statd running as root.
chown /var/lib/nfs/sm to choose different user
Jan  1 08:00:37 fs2410 daemon.warn rpc.statd[536]: gethostbyname error for
fs2410
Jan  1 08:00:43 fs2410 user.info kernel: Installing knfsd (copyright (C)
1996 okir at monad.swb.de).
Jan  1 08:01:06 fs2410 daemon.info init: starting pid 563, tty '/dev/ttyS0':
'/sbin/getty -L ttyS0 115200 vt100'
Jan  1 08:02:16 fs2410 auth.info login[563]: root login on 'ttyS0'
Jan  1 08:02:35 fs2410 daemon.notice mountd[546]: authenticated mount
request from 192.168.10.10:903 for /media (/media)
Jan  1 08:02:35 fs2410 daemon.warn mountd[546]: getfh failed: No such file
or directory

Dose anyone meet this problem before?
Any suggestions would be appreciated.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100407/c70569f6/attachment.htm>
