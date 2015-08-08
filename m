From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 08 Aug 2015 10:57:10 -0000
Subject: [Buildroot] [git commit branch/next] package/qpid-proton: disable
	languages bindings
Message-ID: <20150808105639.CAC0A7F8D4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d52c4bb9a862620d229e5af97d5df83c56f2e719
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Fixes (workaround):
http://autobuild.buildroot.net/results/eff48f8a827f8b4dbbdb7cb648a6c4a3ab4ac8a5/

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
Cc: Luca Ceresoli <luca@lucaceresoli.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/qpid-proton/qpid-proton.mk |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/package/qpid-proton/qpid-proton.mk b/package/qpid-proton/qpid-proton.mk
index 12fddb4..2e8c1d0 100644
--- a/package/qpid-proton/qpid-proton.mk
+++ b/package/qpid-proton/qpid-proton.mk
@@ -15,8 +15,15 @@ QPID_PROTON_DEPENDENCIES = \
 	util-linux \
 	$(if $(BR2_PACKAGE_OPENSSL),openssl)
 
+# Language bindings are enabled when host-swig tool is present in HOST_DIR.
+# For now, disable all of them.
 QPID_PROTON_CONF_OPTS = \
 	-DBUILD_JAVA=OFF \
+	-DBUILD_JAVASCRIPT=OFF \
+	-DBUILD_PERL=OFF \
+	-DBUILD_PHP=OFF \
+	-DBUILD_PYTHON=OFF \
+	-DBUILD_RUBY=OFF \
 	-DENABLE_VALGRIND=OFF \
 	-DENABLE_WARNING_ERROR=OFF \
 	-DPYTHON_EXECUTABLE=$(HOST_DIR)/usr/bin/python2
