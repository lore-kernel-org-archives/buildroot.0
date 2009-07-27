From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 27 Jul 2009 15:24:12 +0200
Subject: [Buildroot] [git commit] qt: fix build with external toolchain
Message-ID: <20090727132435.8F8837780D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=072d89a883c19dc2f69742c65eae7b4cf81b1f63
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Set QMAKE_LFLAGS so that at link time --sysroot is passed to the
linker, and Qt finds the external libraries. This fixes Qt build when
zlib or other libraries are external, instead of using Qt's internal
copy.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/qt/qt.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/qt/qt.mk b/package/qt/qt.mk
index e07457e..ea59b07 100644
--- a/package/qt/qt.mk
+++ b/package/qt/qt.mk
@@ -448,6 +448,7 @@ endif
 	$(call QT_QMAKE_SET,STRIP,$(TARGET_STRIP))
 	$(call QT_QMAKE_SET,CFLAGS,$(TARGET_CFLAGS))
 	$(call QT_QMAKE_SET,CXXFLAGS,$(TARGET_CXXFLAGS))
+	$(call QT_QMAKE_SET,LFLAGS,$(TARGET_LDFLAGS))
 	-[ -f $(QT_QCONFIG_FILE) ] && cp $(QT_QCONFIG_FILE) \
 		$(QT_TARGET_DIR)/$(QT_QCONFIG_FILE_LOCATION)
 # Qt doesn't use PKG_CONFIG, it searches for pkg-config with 'which'.
-- 
1.6.3.3
