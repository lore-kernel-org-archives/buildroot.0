From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 28 Oct 2019 14:04:59 +0100
Subject: [Buildroot] [git commit] package/libsemanage: fix build with python
 3.8
Message-ID: <20191028125827.94CD28B65D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=907159dad618acb124f878ca41adeee254c73a8d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
 - http://autobuild.buildroot.net/results/ad1f033def500b4354dc6261c8411f83420c409d

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libsemanage/libsemanage.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libsemanage/libsemanage.mk b/package/libsemanage/libsemanage.mk
index bd1e01febf..fd90346049 100644
--- a/package/libsemanage/libsemanage.mk
+++ b/package/libsemanage/libsemanage.mk
@@ -42,7 +42,7 @@ HOST_LIBSEMANAGE_MAKE_OPTS += \
 ifeq ($(BR2_PACKAGE_PYTHON3),y)
 HOST_LIBSEMANAGE_DEPENDENCIES += host-python3
 HOST_LIBSEMANAGE_MAKE_OPTS += \
-	PYINC="-I$(HOST_DIR)/include/python$(PYTHON3_VERSION_MAJOR)m/" \
+	PYINC="-I$(HOST_DIR)/include/python$(PYTHON3_VERSION_MAJOR)/" \
 	PYTHONLIBDIR="$(HOST_DIR)/lib/python$(PYTHON3_VERSION_MAJOR)/" \
 	PYLIBVER="python$(PYTHON3_VERSION_MAJOR)"
 else
