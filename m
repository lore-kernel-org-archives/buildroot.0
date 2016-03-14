From: Max Filippov <jcmvbkbc@gmail.com>
Date: Mon, 14 Mar 2016 07:47:13 +0300
Subject: [Buildroot] [PATCH v2] slang: make install-static do
	install-pkgconfig
Message-ID: <1457930833-17879-1-git-send-email-jcmvbkbc@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

mc's configure can't find S-Lang because static S-Lang build doesn't
install pkgconfig file into staging. Adding install-pkgconfig to
install-static dependencies fixes that.

Fixes:
  http://autobuild.buildroot.net/results/085194f18bc7db1e801d98e6620e3a75fd988cc5/

Upstream status: patch submitted.

Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
---
Changes v1->v2:
- make it a separate patch, send upstream

 ...l-static-do-install-pkgconfig-as-install-.patch | 31 ++++++++++++++++++++++
 1 file changed, 31 insertions(+)
 create mode 100644 package/slang/0005-make-install-static-do-install-pkgconfig-as-install-.patch

diff --git a/package/slang/0005-make-install-static-do-install-pkgconfig-as-install-.patch b/package/slang/0005-make-install-static-do-install-pkgconfig-as-install-.patch
new file mode 100644
index 0000000..1572e09
--- /dev/null
+++ b/package/slang/0005-make-install-static-do-install-pkgconfig-as-install-.patch
@@ -0,0 +1,31 @@
+From 294bcde1afa0b3866f339f82709e867d827cea6c Mon Sep 17 00:00:00 2001
+From: Max Filippov <jcmvbkbc@gmail.com>
+Date: Mon, 14 Mar 2016 07:28:56 +0300
+Subject: [PATCH] make install-static do install-pkgconfig as install-elf does
+
+...so that install-static installs everything needed for linking with
+slang. This fixes e.g. the following mc build:
+
+  http://autobuild.buildroot.net/results/085/085194f18bc7db1e801d98e6620e3a75fd988cc5/build-end.log
+
+Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
+---
+ autoconf/Makefile.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/autoconf/Makefile.in b/autoconf/Makefile.in
+index a6defa6..ca1ffb2 100644
+--- a/autoconf/Makefile.in
++++ b/autoconf/Makefile.in
+@@ -74,7 +74,7 @@ clean:
+ 	cd modules; $(MAKE) clean
+ 	cd slsh; $(MAKE) clean
+ 	cd demo; $(MAKE) clean
+-install-static:
++install-static: install-pkgconfig
+ 	cd src; $(MAKE) install-static
+ 	cd slsh; $(MAKE) install-static
+ install-pkgconfig: slang.pc
+-- 
+2.1.4
+
-- 
2.1.4
