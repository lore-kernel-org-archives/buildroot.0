From: Floris Bos <bos@je-eigen-domein.nl>
Date: Tue, 28 Apr 2015 17:15:59 +0200
Subject: [Buildroot] rpi-firmware package installs DTBs that are kernel
	version specific
Message-ID: <553FA42F.8060602@je-eigen-domein.nl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Currently the rpi-firmware buildroot package downloads and installs 
binary DTB files.
Problem is that those DTB files seem to be kernel version specific, and 
the current ones only work properly with a rpi-3.18.y Linux kernel.
When you use them with a kernel build from the rpi-3.19.y or rpi-4.0.y 
branch mmc0 does not function.

Think it may be better if we remove the binary DTB file installation 
from the rpi-firmware package, forcing the user to compile the device 
tree files from kernel source instead, ensuring matching version.

Yours sincerely,

Floris Bos
