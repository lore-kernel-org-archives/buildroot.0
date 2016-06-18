From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 18 Jun 2016 14:59:48 +0200
Subject: [Buildroot] [git commit] elfutils: put all the "lfs mode" stuff
	together
Message-ID: <20160618130411.BC15980794@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bcc8d367140d00f76aba6ef4387a12469fa0c024
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/elfutils/elfutils.mk | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/elfutils/elfutils.mk b/package/elfutils/elfutils.mk
index 074ca02..a2012d6 100644
--- a/package/elfutils/elfutils.mk
+++ b/package/elfutils/elfutils.mk
@@ -16,17 +16,18 @@ ELFUTILS_DEPENDENCIES = zlib
 ELFUTILS_AUTORECONF = YES
 ELFUTILS_CONF_OPTS += --disable-werror
 
-ELFUTILS_CFLAGS = $(filter-out -D_FILE_OFFSET_BITS=64,$(TARGET_CFLAGS))
-
 # sparc64 needs -fPIC instead of -fpic
 ifeq ($(BR2_sparc64),y)
 ELFUTILS_CFLAGS += -fPIC
 endif
 
 # elfutils gets confused when lfs mode is forced, so don't
+ELFUTILS_CFLAGS = $(filter-out -D_FILE_OFFSET_BITS=64,$(TARGET_CFLAGS))
+ELFUTILS_CPPFLAGS = $(filter-out -D_FILE_OFFSET_BITS=64,$(TARGET_CPPFLAGS))
+
 ELFUTILS_CONF_ENV += \
 	CFLAGS="$(ELFUTILS_CFLAGS)" \
-	CPPFLAGS="$(filter-out -D_FILE_OFFSET_BITS=64,$(TARGET_CPPFLAGS))"
+	CPPFLAGS="$(ELFUTILS_CPPFLAGS)"
 
 ELFUTILS_LDFLAGS = $(TARGET_LDFLAGS)
 
