From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Fri, 22 Jun 2012 07:42:35 +0200
Subject: [Buildroot] [PATCH 2 of 6 resend] pkg-download.mk: use
 stripurischeme function in localfiles download method
In-Reply-To: <patchbomb.1340343753@beantl019720>
References: <patchbomb.1340343753@beantl019720>
Message-ID: <b387bac066924704f2cc.1340343755@beantl019720>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
 package/pkg-download.mk |  4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/pkg-download.mk b/package/pkg-download.mk
--- a/package/pkg-download.mk
+++ b/package/pkg-download.mk
@@ -175,11 +175,11 @@ endef
 
 define DOWNLOAD_LOCALFILES
 	test -e $(DL_DIR)/$(2) || \
-		$(LOCALFILES) $(call qstrip,$(subst file://,,$(1))) $(DL_DIR)
+		$(LOCALFILES) $(call stripurischeme,$(call qstrip,$(1))) $(DL_DIR)
 endef
 
 define SOURCE_CHECK_LOCALFILES
-  test -e $(call qstrip,$(subst file://,,$(1)))
+  test -e $(call stripurischeme,$(call qstrip,$(1)))
 endef
 
 define SHOW_EXTERNAL_DEPS_LOCALFILES
