From: Ortmann, Michael <m.ortmann@lxinstruments.com>
Date: Mon, 8 Jul 2019 14:54:13 +0000
Subject: [Buildroot] [PATCH 1/1] package/webkitgtk: bump to version
 2.24.3
Message-ID: <6d875efc4fc34633a85e52c770d3e803@lxinstruments.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,
the new version of webkitgtk seems to be incompatible with the patch file "0001-Build-failure-after-r243644-in-GTK-Li.patch" that is located in "package/webkitgtk". Build fails after trying to apply the patch:

webkitgtk-2.24.3.tar.xz: OK (md5: e2a5bbd09a217eba096a2d1562143e35)
webkitgtk-2.24.3.tar.xz: OK (sha1: 26a33fd0af8223c130427cd59aaf5ccaba584114)
webkitgtk-2.24.3.tar.xz: OK (sha256: 940d746d7e82c357222feb5b3f44c4b201e81df7d81ddca5ca2bf3ae0acf6c51)
>>> webkitgtk 2.24.3 Extracting
xzcat /buildroot/buildroot-2019.05/dl/webkitgtk/webkitgtk-2.24.3.tar.xz | tar --strip-components=1 -C /buildroot/buildroot-2019.05/output/build/webkitgtk-2.24.3   -xf -
>>> webkitgtk 2.24.3 Patching

Applying 0001-Build-failure-after-r243644-in-GTK-Li.patch using patch:
patching file Source/WebCore/platform/graphics/gstreamer/MediaPlayerPrivateGStreamerBase.cpp
Reversed (or previously applied) patch detected!  Skipping patch.
1 out of 1 hunk ignored -- saving rejects to file Source/WebCore/platform/graphics/gstreamer/MediaPlayerPrivateGStreamerBase.cpp.rej
package/pkg-generic.mk:202: recipe for target '/buildroot/buildroot-2019.05/output/build/webkitgtk-2.24.3/.stamp_patched' failed
make[1]: *** [/buildroot/buildroot-2019.05/output/build/webkitgtk-2.24.3/.stamp_patched] Error 1
Makefile:84: recipe for target '_all' failed
make: *** [_all] Error 2

After deleting the patch file, building works for me.
Regards, Michael
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20190708/356cd615/attachment.html>
