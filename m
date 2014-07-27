From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 27 Jul 2014 22:20:23 +0200
Subject: [Buildroot] [PATCH 2/2] xf86-video-intel: Bump version to
	2.99.912
References: <1405661249-6506-2-git-send-email-ben@bwidawsk.net>
 <20140720191827.GA10208@bwidawsk.net>
Message-ID: <XnsA377E33F85B6AberndkuhlsPkbjNfxxIA@bernd-kuhls.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

[posted and mailed]

Ben Widawsky <ben@bwidawsk.net> wrote in 
news:20140720191827.GA10208 at bwidawsk.net:

> 4. Wait until Chris releases 2.99.913 (or 3.0), and just bump to that.

Hi,

after bisecting I found the patch responsible for the black screen:
http://cgit.freedesktop.org/xorg/driver/xf86-video-intel/commit/?
id=f66e25def3431a900068cc1c23a6b1e8322ef046

Disabling __intel_open_device__pci solved the problem, I have yet to 
investigate the reason and maybe open a bugreport at freedesktop.org. After 
boot the screen stays black when starting Xorg for the first time, the second 
try works, although all kernel modules were loaded before...

So updating buildroot to 2.99.914 is ok for me now.

Regards, Bernd
