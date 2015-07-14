From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 14 Jul 2015 14:13:58 +0300
Subject: [Buildroot] [PATCH] qpid-proton: needs host python 2
Message-ID: <8442e9d6be96eb9a8c4165024e98ce38e7de1a6f.1436872438.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

qpid-proton uses Python as part of its build system. Only Python 2 is
currently supported.

Fixes:
http://autobuild.buildroot.net/results/bdf/bdf94981b52dc3a04fd21ff770a0a20d883bb1c3/
http://autobuild.buildroot.net/results/669/66964a00e44502ae00d5348a5ca2b632c729a417/
http://autobuild.buildroot.net/results/30d/30d2fed1149857b11375f2801f522a84f441fc1e/

and more.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/qpid-proton/qpid-proton.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/qpid-proton/qpid-proton.mk b/package/qpid-proton/qpid-proton.mk
index eae4589bf538..d21609d29776 100644
--- a/package/qpid-proton/qpid-proton.mk
+++ b/package/qpid-proton/qpid-proton.mk
@@ -12,6 +12,7 @@ QPID_PROTON_LICENSE_FILES = LICENSE
 QPID_PROTON_INSTALL_STAGING = YES
 QPID_PROTON_DEPENDENCIES = \
 	util-linux \
+	host-python \
 	$(if $(BR2_PACKAGE_OPENSSL),openssl)
 QPID_PROTON_CONF_OPTS = \
 	-DBUILD_JAVA=OFF \
-- 
2.1.4
