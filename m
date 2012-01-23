From: Ozgun <ozgun.gunay@gmail.com>
Date: Mon, 23 Jan 2012 15:13:57 +0200
Subject: [Buildroot] mesa gles2 under buildroot
In-Reply-To: <CAPeX=+tVeJ6wip9tXgte5-8+qFqdxGNPU4NfyrdPs-a7fS8gsg@mail.gmail.com>
References: <CAPeX=+tVeJ6wip9tXgte5-8+qFqdxGNPU4NfyrdPs-a7fS8gsg@mail.gmail.com>
Message-ID: <CAPeX=+sR6a610=ED01DMSPxGtNwjvuCwOOR48EG0TsQkB_T52Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I'm using buildroot-2011.11 on ubuntu 11.10 for pc104 card with atom
processor.


The patches and the following patches solved the problem.

diff --git a/package/x11r7/xutil_makedepend/xutil_makedepend.mkb/package/x11r7/xutil_makedepend/
xutil_makedepend.mk
index b0bbafd..a69d21f 100644
--- a/package/x11r7/xutil_makedepend/xutil_makedepend.mk<http://git.buildroot.org/buildroot/tree/package/x11r7/xutil_makedepend/xutil_makedepend.mk?id=8086dfa32fafb91102be5b7516088cde9f2b8699>
+++ b/package/x11r7/xutil_makedepend/xutil_makedepend.mk<http://git.buildroot.org/buildroot/tree/package/x11r7/xutil_makedepend/xutil_makedepend.mk?id=c034b33f241ca90918cfbb0901160f0e874e0c24>
@@ -4,14 +4,11 @@
#
################################################################################
-XUTIL_MAKEDEPEND_VERSION = 1.0.1
+XUTIL_MAKEDEPEND_VERSION = 1.0.2
XUTIL_MAKEDEPEND_SOURCE = makedepend-$(XUTIL_MAKEDEPEND_VERSION).tar.bz2
XUTIL_MAKEDEPEND_SITE = http://xorg.freedesktop.org/releases/individual/util
-XUTIL_MAKEDEPEND_AUTORECONF = NO
-XUTIL_MAKEDEPEND_INSTALL_STAGING = NO
-XUTIL_MAKEDEPEND_INSTALL_TARGET = YES
-HOST_XUTIL_MAKEDEPEND_DEPENDENCIES = host-xproto-xproto
+XUTIL_MAKEDEPEND_DEPENDENCIES = xproto_xproto
-$(eval $(call AUTOTARGETS,package/x11r7,xutil_makedepend))
-$(eval $(call AUTOTARGETS,package/x11r7,xutil_makedepend,host))
+$(eval $(call AUTOTARGETS))
+$(eval $(call AUTOTARGETS,host))
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120123/27d53b77/attachment.html>
