From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 26 Apr 2021 20:05:41 +0200
Subject: [Buildroot] [git commit branch/2021.02.x] package/python-dnspython:
 enable host build
Message-ID: <20210426173954.41A03861EC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=54227869c768991c178e46ca3bd75b1f249f75ba
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Needed for Samba 4.14.x:
https://gitlab.com/samba-team/samba/-/commit/2420b7c6d2038aca33759ca3a7d41240c5f19bf7#bc16f0673dfbb473658dfd16961cdbf12f02ea5a_8_15

Fixes:
http://autobuild.buildroot.net/results/7dc/7dc7e304cb4e9afb157326dd5e4ae38711e91cad/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 90bb7b67655a15b27bcbeb82641cfc0b07e92eb5)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-dnspython/python-dnspython.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/python-dnspython/python-dnspython.mk b/package/python-dnspython/python-dnspython.mk
index 18d98efd72..ed11687291 100644
--- a/package/python-dnspython/python-dnspython.mk
+++ b/package/python-dnspython/python-dnspython.mk
@@ -17,4 +17,11 @@ define PYTHON_DNSPYTHON_EXTRACT_CMDS
 	$(RM) -r $(@D)/dnspython-$(PYTHON_DNSPYTHON_VERSION)
 endef
 
+define HOST_PYTHON_DNSPYTHON_EXTRACT_CMDS
+	$(UNZIP) -d $(@D) $(HOST_PYTHON_DNSPYTHON_DL_DIR)/$(HOST_PYTHON_DNSPYTHON_SOURCE)
+	mv $(@D)/dnspython-$(HOST_PYTHON_DNSPYTHON_VERSION)/* $(@D)
+	$(RM) -r $(@D)/dnspython-$(HOST_PYTHON_DNSPYTHON_VERSION)
+endef
+
 $(eval $(python-package))
+$(eval $(host-python-package))
