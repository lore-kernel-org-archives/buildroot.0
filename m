From: Stephan Hoffmann <sho@relinux.de>
Date: Tue, 09 Oct 2012 10:26:04 +0200
Subject: [Buildroot] Webkit compilation broken without X11
Message-ID: <5073DF9C.5030505@relinux.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I am currently trying to compile webkit for my beaglebone using directfb
(without X11). Unfortunatelly, compilation stops because of missing X11
headers. This also happens with the qemu_arm_versatile defconfig.

> In file included from ./WebCore/bridge/npruntime_internal.h:28:0,
>                  from ./WebCore/plugins/PluginStream.h:40,
>                  from ./WebCore/plugins/PluginView.h:36,
>                  from WebCore/bindings/js/ScriptControllerGtk.cpp:35:
> ./WebCore/bridge/npapi.h:105:26: fatal error: X11/Xlib.h: No such file
> or directory
> compilation terminated.
> make[2]: ***
> [WebCore/bindings/js/libwebkit_1_0_la-ScriptControllerGtk.lo] Fehler 1

In 2012.05 Webkit compiles o.k.

Attached you find the modified defconfig to reproduce this failure.

Kind regards

Stephan


-- 
reLinux     -    Stephan Hoffmann
Am Schmidtgrund 124    50765 K?ln
Tel. +49.221.95595-19    Fax: -64
www.reLinux.de     sho at reLinux.de

-------------- next part --------------
An embedded and charset-unspecified text was scrubbed...
Name: qemu_arm_versatile_test_defconfig
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20121009/9655ddf9/attachment.ksh>
