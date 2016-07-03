From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 03 Jul 2016 20:18:47 +0200
Subject: [Buildroot] [PATCH v6] package/python-pillow: new package
References: <1467233456-17500-1-git-send-email-angelo.compagnucci@gmail.com>
Message-ID: <XnsA63ACEA291BC5berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

my first try to get this package to work with Kodi failed due to segfaults I 
have yet to investigate. I am sending this mail to inform you about some 
other stuff I found out while working on the package.

[posted and mailed]

>  ...y-add-option-to-disable-platform-guessing.patch | 65 
++++++++++++++++++++++

You can remove this patch because python-pillow-3.3.0, released 2016-07-01 
includes it.

> +PYTHON_PILLOW_VERSION = 3.2.0

See above, please bump to 3.3.0.

> +PYTHON_PILLOW_INSTALL_TARGET_CMDS = $(PYTHON_PILLOW_BUILD_CMDS) install

With my setup I needed to remove this line, otherwise the files installed by 
this package would end up in $(HOST_DIR) instead of $(TARGET_DIR).

While investigating the Kodi segfault I saw that they carry their own cross 
compile patch in 
https://github.com/xbmc/xbmc/tree/master/tools/depends/target/pythonmodule-
pil

Though aimed at pillow-3.0.0, it is possible to rebase the patch for 3.3.0, 
but I am lacking time atm to continue working on it.

Regards, Bernd
