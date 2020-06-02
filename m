From: Peter Seiderer <ps.report@gmx.net>
Date: Tue,  2 Jun 2020 23:00:53 +0200
Subject: [Buildroot] [PATCH v1] package/edid-decode: bump version to 1889504
Message-ID: <20200602210053.24091-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- edid-decode changed from C to C++, adjust make command
  accordingly

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/edid-decode/edid-decode.hash | 2 +-
 package/edid-decode/edid-decode.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/edid-decode/edid-decode.hash b/package/edid-decode/edid-decode.hash
index e0a9c18523..f843aa68fd 100644
--- a/package/edid-decode/edid-decode.hash
+++ b/package/edid-decode/edid-decode.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  27fcf4c8693ec6fe020b18c78c70ddba9a8b3ea8c55fcfad2a38103128ec5e36  edid-decode-6def7bc83dfb0338632e06a8b14c93faa6af8879.tar.gz
+sha256  327fe14531ddebe74a730efc30209e68efbd86c11375b5576cbe23af3d691150  edid-decode-188950472c19492547e298b27f9da0d72cf826df.tar.gz
 sha256  4b4a7e6d7c358bb5b982eaa84d228cd9e99b75a5fefd3af01272957bf2016b5b  edid-decode.c
diff --git a/package/edid-decode/edid-decode.mk b/package/edid-decode/edid-decode.mk
index c43f1ae7da..e15cb70f84 100644
--- a/package/edid-decode/edid-decode.mk
+++ b/package/edid-decode/edid-decode.mk
@@ -4,14 +4,14 @@
 #
 ################################################################################
 
-EDID_DECODE_VERSION = 6def7bc83dfb0338632e06a8b14c93faa6af8879
+EDID_DECODE_VERSION = 188950472c19492547e298b27f9da0d72cf826df
 EDID_DECODE_SITE = git://linuxtv.org/edid-decode.git
 EDID_DECODE_LICENSE = MIT
 EDID_DECODE_LICENSE_FILES = edid-decode.c
 
 define EDID_DECODE_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
-		CC="$(TARGET_CC) $(TARGET_CFLAGS) $(TARGET_LDFLAGS)"
+		CXX="$(TARGET_CXX) $(TARGET_CXXFLAGS) $(TARGET_LDFLAGS)"
 endef
 
 define EDID_DECODE_INSTALL_TARGET_CMDS
-- 
2.26.2
