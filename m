From: Wojciech Zabolotny <wzab01@gmail.com>
Date: Mon, 26 Dec 2011 23:52:43 +0100
Subject: [Buildroot] SOLVED! Re: Buildroot 2011.11 on x86_64 - neither
 udev nor mdev loads needed modules at startup
In-Reply-To: <4EF8B484.4050908@gmail.com>
References: <4EF8B484.4050908@gmail.com>
Message-ID: <4EF8FABB.9060104@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ooops, I've forgotten about one more detail.

I have compiled the external module-init-tools instead of those provided by busybox.
I had to add "udevadm trigger --action=add" command to the /etc/init.d/S10udev file
  [...]
$UDEV_BIN -d || (echo "FAIL" && exit 1)
udevadm trigger --action=add
echo "done"
;;
[...]

In case if I've forgotten any other modification, I attach my "buildroot_config", my "busybox_config" and my "kernel_config" files.


-------------- next part --------------
A non-text attachment was scrubbed...
Name: kernel_config.gz
Type: application/x-gzip
Size: 32276 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20111226/20f53042/attachment-0003.bin>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: busybox_config.gz
Type: application/x-gzip
Size: 6485 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20111226/20f53042/attachment-0004.bin>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: buildroot_config.gz
Type: application/x-gzip
Size: 4981 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20111226/20f53042/attachment-0005.bin>
