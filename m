From: Ryan Coe <bluemrp9@gmail.com>
Date: Tue, 10 Sep 2013 11:09:16 -0700
Subject: [Buildroot] [patch] kmod: install depmod to output/host/usr/sbin
Message-ID: <522F604C.1000206@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

After the move to kmod, building the Linux kernel no longer generates 
the module dependencies.  The Linux build process is looking for depmod 
at $(HOST_DIR)/usr/sbin/depmod.  Host-kmod is installing the symlink for 
depmod at $(HOST_DIR)/sbin/depmod. Attached is a patch to change the 
location of the depmod symlink for host-kmod.

-------------- next part --------------
A non-text attachment was scrubbed...
Name: host-kmod.patch
Type: text/x-patch
Size: 506 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130910/d276f2c9/attachment.bin>
