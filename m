From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 19 Oct 2019 21:06:56 +0200
Subject: [Buildroot] [git commit] package/pkg-python: fix python 3.8.0
 package builds
Message-ID: <20191019190206.8496782983@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fd989575e186d0367b3ee4f5c1a78eed0d7a8f50
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We need to update the sysconfigdata path for python 3.8.0 per upstream
commit 7efc526e5cfb929a79c192ac2dcf7eb78d3a4401 which indicates the "m"
flag has been removed from sys.abiflags.

Fixes this build error when building target packages:
ValueError: Empty module name

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pkg-python.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pkg-python.mk b/package/pkg-python.mk
index e906920417..be1ce071df 100644
--- a/package/pkg-python.mk
+++ b/package/pkg-python.mk
@@ -21,7 +21,7 @@
 ################################################################################
 
 define PKG_PYTHON_SYSCONFIGDATA_NAME
-$(basename $(notdir $(wildcard $(STAGING_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/_sysconfigdata_m_linux_*.py)))
+$(basename $(notdir $(wildcard $(STAGING_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/_sysconfigdata__linux_*.py)))
 endef
 
 # Target distutils-based packages
