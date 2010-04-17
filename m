From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 17 Apr 2010 05:39:13 +0200
Subject: [Buildroot] There are not device files in dev/ when I extract
 tarball image as root. bug?
In-Reply-To: <o2p2134af141004161820q79e42c27s847369b14bfa8c13@mail.gmail.com>
References: <o2p2134af141004161820q79e42c27s847369b14bfa8c13@mail.gmail.com>
Message-ID: <20100417053913.528536ef@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 17 Apr 2010 09:20:12 +0800
?? <greatsnows@gmail.com> wrote:

> And I followed it, but I did not get device files except this:
> 
> $ ls /tftpboot/rootfs/dev/ -l
> ??? 1
> lrwxrwxrwx 1 root root   10 2010-04-17 00:02 log -> ../tmp/log
> drwxr-xr-x 2 root root 1024 2010-04-17 00:02 pts
> 
> Does it must mknod manually?

No, it's a regression that I caused by the recent filesystem code
cleanup. I'm working on the fix. As an ugly workaround you can add:

TARGET_DEVICE_TABLE=target/device/generic/device_table.txt

at the beginning of fs/common.mk.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
