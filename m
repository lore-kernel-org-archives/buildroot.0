From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 26 Apr 2021 18:55:57 +0200
Subject: [Buildroot] [PATCH 1/1] package/python-dnspython: enable host build
Message-ID: <20210426165557.18477-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Needed for Samba 4.14.x:
https://gitlab.com/samba-team/samba/-/commit/2420b7c6d2038aca33759ca3a7d41240c5f19bf7#bc16f0673dfbb473658dfd16961cdbf12f02ea5a_8_15

Fixes:
http://autobuild.buildroot.net/results/7dc/7dc7e304cb4e9afb157326dd5e4ae38711e91cad/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
Forgot to send this patch while sending:
http://patchwork.ozlabs.org/project/buildroot/patch/20210404165823.954492-1-bernd.kuhls at t-online.de/

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
-- 
2.29.2
