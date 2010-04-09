From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri,  9 Apr 2010 11:06:47 +0200
Subject: [Buildroot] [PATCH 09/44] e2fsprogs: add support for host package
In-Reply-To: <cover.1270803901.git.thomas.petazzoni@free-electrons.com>
References: <cover.1270803901.git.thomas.petazzoni@free-electrons.com>
Message-ID: <e7cf05aebeea9485b538f6905818a5e888da2ff5.1270803901.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Host package is needed to get libuuid installed for the host, needed
to build the mtd utils for the host.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/e2fsprogs/e2fsprogs.mk |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/package/e2fsprogs/e2fsprogs.mk b/package/e2fsprogs/e2fsprogs.mk
index 09db996..af3c3ed 100644
--- a/package/e2fsprogs/e2fsprogs.mk
+++ b/package/e2fsprogs/e2fsprogs.mk
@@ -26,7 +26,12 @@ E2FSPROGS_CONF_OPT = \
 E2FSPROGS_MAKE_OPT = \
 	LDCONFIG=true
 
+define HOST_E2FSPROGS_INSTALL_CMDS
+ $(HOST_MAKE_ENV) $(MAKE) -C $(@D) install install-libs
+endef
+
 $(eval $(call AUTOTARGETS,package,e2fsprogs))
+$(eval $(call AUTOTARGETS,package,e2fsprogs,host))
 
 # binaries to keep or remove
 E2FSPROGS_BINTARGETS_$(BR2_PACKAGE_E2FSPROGS_BADBLOCKS) += usr/sbin/badblocks
-- 
1.6.3.3
