From: Bernd Kuhls <berndkuhls@hotmail.com>
Date: Thu, 17 Apr 2014 16:40:10 +0200
Subject: [Buildroot] [PATCH 13/13] package/vlc: depends on the virtual
	package libgl
References: <cover.1396699629.git.yann.morin.1998@free.fr>
 <55d8bed0fa397c30345e1ba8318eeeb76fac7a3a.1396699629.git.yann.morin.1998@free.fr>
Message-ID: <an552bx168.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

"Yann E. MORIN" <yann.morin.1998@free.fr> wrote in
news:55d8bed0fa397c30345e1ba8318eeeb76fac7a3a.1396699629.git.yann.morin.199
8 at free.fr: 

> We now have a virtual package, libgl, which ensures openGL is available.

Hi,

a similar patch should be included in your patch series to fix
http://autobuild.buildroot.net/results/f7a/f7af081048ad967ed4a76afd8c527395f7
b0c2dc/

--- a/package/x11r7/xapp_xdriinfo/Config.in
+++ b/package/x11r7/xapp_xdriinfo/Config.in
@@ -2,6 +2,9 @@ config BR2_PACKAGE_XAPP_XDRIINFO
        bool "xdriinfo"
        select BR2_PACKAGE_XLIB_LIBX11
        select BR2_PACKAGE_XPROTO_GLPROTO
-       depends on BR2_PACKAGE_MESA3D
+       depends on BR2_PACKAGE_HAS_LIBGL
        help
          query configuration information of DRI drivers
+
+comment "xdriinfo depends on OpenGL"
+       depends on !BR2_PACKAGE_HAS_LIBGL


Regards, Bernd
