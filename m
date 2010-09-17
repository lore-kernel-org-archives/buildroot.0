From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Fri, 17 Sep 2010 10:20:05 +0200
Subject: [Buildroot] [PATCH 1/1] Customize device creation
In-Reply-To: <4C8F4957.5030309@visionsystems.de>
References: <4C8F4957.5030309@visionsystems.de>
Message-ID: <AANLkTingPts2HHfEnGW8Jz6L7BSg+-BMU9NvQfD-0854@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> Create menu entry to select device creation method:
>
> - static method uses device table as before
> - devtmpfs method enables this feature in kernel
> - mdev method adds mdev starting script to the file system
> ?and selects mdev itself for installation
> - udev method selects udev for installation
>
> All dynamic methods are base on devtmpfs, so one doesn't
> need to care about /dev folder.

Found one issue: the device_table.txt creates also 4 folders in /etc/network

if-down.d/
if-post-down.d/
if-pre-up.d/
if-up.d/

so if one of the dynamic methods is chosen the folders won't be
created. Could these folders be added to fs/skeleton?

Regards,
Yegor
