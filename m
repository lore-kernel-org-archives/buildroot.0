From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 22 Oct 2016 16:22:02 +0200
Subject: [Buildroot] [git commit] package/libcec: include TARGET_{C,
	CXX}FLAGS to the overloaded {C, CXX}FLAGS
Message-ID: <20161022144115.A39B7819CA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d1a312d2097bad24fb1c0639c6801c2a4f6c2e7f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
 
