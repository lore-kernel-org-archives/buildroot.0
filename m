From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 1 Apr 2019 22:47:47 +0200
Subject: [Buildroot] [git commit] package/rpm: fix nss build on musl
Message-ID: <20190401204401.75F8281523@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4200087e965bcc00f854e3ab70e5e8fe8a697909
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
 - http://autobuild.buildroot.org/results/395fd44a930dfc2ad380bc735c26d9ce62344295

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...0002-rpmio-digest_nss.c-fix-build-on-musl.patch | 32 ++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/package/rpm/0002-rpmio-digest_nss.c-fix-build-on-musl.patch b/package/rpm/0002-rpmio-digest_nss.c-fix-build-on-musl.patch
new file mode 100644
index 0000000000..66aeb64786
--- /dev/null
+++ b/package/rpm/0002-rpmio-digest_nss.c-fix-build-on-musl.patch
@@ -0,0 +1,32 @@
+From 817dbe77e3e5a6d89540000a48584358efb4b03a Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Mon, 1 Apr 2019 07:33:19 +0200
+Subject: [PATCH] rpmio/digest_nss.c: fix build on musl
+
+signal.h must be included to be able to use sigaction
+
+Fixes:
+ - http://autobuild.buildroot.org/results/395fd44a930dfc2ad380bc735c26d9ce62344295
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status:
+https://github.com/rpm-software-management/rpm/pull/650]
+---
+ rpmio/digest_nss.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/rpmio/digest_nss.c b/rpmio/digest_nss.c
+index 50f8c8e90..1692a9221 100644
+--- a/rpmio/digest_nss.c
++++ b/rpmio/digest_nss.c
+@@ -3,6 +3,7 @@
+ #include <pthread.h>
+ #include <nss.h>
+ #include <sechash.h>
++#include <signal.h>
+ #include <keyhi.h>
+ #include <cryptohi.h>
+ #include <blapit.h>
+-- 
+2.14.1
+
