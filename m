From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 17 Oct 2017 10:54:57 +0200
Subject: [Buildroot] [git commit branch/2017.08.x] bzip2: fix passing of
	TARGET_MAKE_ENV to make
Message-ID: <20171017090327.3BCD37FA3D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7f6052fc0d2eb3bc3aa87b7ad7b3a73c9676869d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.08.x

TARGET_MAKE_ENV is not passed to make because it is on a different
line without a backslash.

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit 7690bc03358b7460aa138f785b3a5704b919882a)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/bzip2/bzip2.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/bzip2/bzip2.mk b/package/bzip2/bzip2.mk
index 62571ed..e435330 100644
--- a/package/bzip2/bzip2.mk
+++ b/package/bzip2/bzip2.mk
@@ -12,13 +12,13 @@ BZIP2_LICENSE_FILES = LICENSE
 
 ifeq ($(BR2_STATIC_LIBS),)
 define BZIP2_BUILD_SHARED_CMDS
-	$(TARGET_MAKE_ENV)
+	$(TARGET_MAKE_ENV) \
 		$(MAKE) -C $(@D) -f Makefile-libbz2_so $(TARGET_CONFIGURE_OPTS)
 endef
 endif
 
 define BZIP2_BUILD_CMDS
-	$(TARGET_MAKE_ENV)
+	$(TARGET_MAKE_ENV) \
 		$(MAKE) -C $(@D) libbz2.a bzip2 bzip2recover $(TARGET_CONFIGURE_OPTS)
 	$(BZIP2_BUILD_SHARED_CMDS)
 endef
