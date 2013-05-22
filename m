From: Will Newton <will.newton@gmail.com>
Date: Wed, 22 May 2013 13:35:29 +0100
Subject: [Buildroot] [PATCH] boost: Limit architectures which can build
	boost context library.
Message-ID: <CAFbHwiS62OSeS9ZFjE-A4A2RQND9t3BxZytqpKZDjcftrHiZWA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The boost context library needs porting to each new architecture
and only a limited number of ports are currently available.

Signed-off-by: Will Newton <will.newton@linaro.org>
---
 package/boost/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/boost/Config.in b/package/boost/Config.in
index e36e7d3..5c65b2f 100644
--- a/package/boost/Config.in
+++ b/package/boost/Config.in
@@ -23,6 +23,8 @@ config BR2_PACKAGE_BOOST_CHRONO

 config BR2_PACKAGE_BOOST_CONTEXT
     bool "boost-context"
+    depends on (BR2_arm || BR2_armeb || BR2_i386 || BR2_mips || BR2_mipsel \
+            || BR2_powerpc || BR2_sparc || BR2_x86_64)

 config BR2_PACKAGE_BOOST_DATE_TIME
     bool "boost-date_time"
--
1.8.1.4
-------------- next part --------------
A non-text attachment was scrubbed...
Name: 0001-boost-Limit-architectures-which-can-build-boost-cont.patch
Type: application/octet-stream
Size: 945 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130522/74ea6fd4/attachment.obj>
