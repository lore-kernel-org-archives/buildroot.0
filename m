From: Yegor Yefremov <yegor_sub1@visionsystems.de>
Date: Fri, 24 Sep 2010 09:35:05 +0200
Subject: [Buildroot] [PATCH 0/4] /etc/inittab stuff and device creation stuff
Message-ID: <4C9C54A9.20803@visionsystems.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter and Thomas,

we've discussed mdev/udev handling and I've made some patches concerning this issue. The main idea is to provide 4 methods on how devices are created:

1. static - using the device_table.txt
2. dynamic - using devtmpfs only
3. dynamic - using devtmpfs and mdev
4. dynamic - using devtmpfs and udev

All methods are suitable for both read-only and full-featured file systems. The patches select appropriate options for kernel/BusyBox/packages, so it should be sufficient just to choose the proper method in "Target filesystem option".

Due to the fact, that device_table.txt not only creates devices, but also some folders in /etc/network. So I made a patch that creates this folders in default skeleton.

The second path of the patches enables custom console port configuration and also terminal type will be made configurable.

Please review the patches.

Best regards,
Yegor
