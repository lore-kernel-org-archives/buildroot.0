From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 15 Apr 2018 21:59:20 +0200
Subject: [Buildroot] [git commit] zeromq: add libunwind as an optional
 dependency
Message-ID: <20180415200239.DC7F68641E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0d0ef33bb74a96d9bf05bf3e36454a808175cfc3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/zeromq/zeromq.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/zeromq/zeromq.mk b/package/zeromq/zeromq.mk
index 2682a567de..8273cad763 100644
--- a/package/zeromq/zeromq.mk
+++ b/package/zeromq/zeromq.mk
@@ -51,4 +51,11 @@ else
 ZEROMQ_CONF_OPTS += --without-libsodium
 endif
 
+ifeq ($(BR2_PACKAGE_LIBUNWIND),y)
+ZEROMQ_DEPENDENCIES += libunwind
+ZEROMQ_CONF_OPTS += --enable-libunwind
+else
+ZEROMQ_CONF_OPTS += --disable-libunwind
+endif
+
 $(eval $(autotools-package))
