From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 29 Jul 2014 21:21:28 +0200
Subject: [Buildroot] [PATCH 1/2] xf86-video-intel: Disable SNA without
	composite
References: <1405661249-6506-1-git-send-email-ben@bwidawsk.net>
Message-ID: <XnsA379D943425CCberndkuhlsPkbjNfxxIA@bernd-kuhls.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ben Widawsky <ben@bwidawsk.net> wrote in 
news:1405661249-6506-1-git-send-email-ben at bwidawsk.net:

> SNA requires the composite extension.

Hi,

I could compile the sna module of 2.99.914 using

# BR2_PACKAGE_XLIB_LIBXCOMPOSITE is not set

snippet from configure:

xf86-video-intel 2.99.914 will be compiled with:
  Xorg Video ABI version: 18.0
  Acceleration backends: *sna

2.99.913 included a patch to address this:

* Fix build without Composite extension.

Regards, Bernd
