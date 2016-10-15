From: Samuel Martin <s.martin49@gmail.com>
Date: Sat, 15 Oct 2016 22:31:20 +0200
Subject: [Buildroot] [PATCH v4 6/9] package/libcec: include TARGET_{C,
	CXX}FLAGS to the overloaded {C, CXX}FLAGS
In-Reply-To: <20161015203123.11241-1-s.martin49@gmail.com>
References: <20161015203123.11241-1-s.martin49@gmail.com>
Message-ID: <20161015203123.11241-7-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

---
changes v3->v4:
- fix commit subject
- update A/R/T tags

changes v2->v3:
- new patch
---
 package/libcec/libcec.mk | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/libcec/libcec.mk b/package/libcec/libcec.mk
index b762d88..55c5fbb 100644
--- a/package/libcec/libcec.mk
+++ b/package/libcec/libcec.mk
@@ -29,8 +29,9 @@ endif
 ifeq ($(BR2_PACKAGE_RPI_USERLAND),y)
 LIBCEC_DEPENDENCIES += rpi-userland
 LIBCEC_CONF_OPTS += \
-	-DCMAKE_C_FLAGS="-lvcos -lvchiq_arm" \
-	-DCMAKE_CXX_FLAGS="-I$(STAGING_DIR)/usr/include/interface/vmcs_host/linux \
+	-DCMAKE_C_FLAGS="$(TARGET_CFLAGS) -lvcos -lvchiq_arm" \
+	-DCMAKE_CXX_FLAGS="$(TARGET_CXXFLAGS) \
+		-I$(STAGING_DIR)/usr/include/interface/vmcs_host/linux \
 		-I$(STAGING_DIR)/usr/include/interface/vcos/pthreads"
 endif
 
-- 
2.10.0
