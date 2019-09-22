From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 22 Sep 2019 20:04:55 +0200
Subject: [Buildroot] [git commit] package/policycoreutils: drop ARCH variable
Message-ID: <20190922180710.A37398F0C9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8af9e534e728c40834071d9ab256bac7d3a16d92
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The ARCH variable is no longer referenced by the policycoreutils build
system since upstream commit 4cc808671a18b5405be5707eefedd78b9c693268
("Move policycoreutils/mcstrans to mcstrans.")

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/policycoreutils/policycoreutils.mk | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/package/policycoreutils/policycoreutils.mk b/package/policycoreutils/policycoreutils.mk
index ff606a7d17..9c50b02a9e 100644
--- a/package/policycoreutils/policycoreutils.mk
+++ b/package/policycoreutils/policycoreutils.mk
@@ -36,8 +36,7 @@ endif
 POLICYCOREUTILS_MAKE_OPTS += \
 	$(TARGET_CONFIGURE_OPTS) \
 	CFLAGS="$(TARGET_CFLAGS) -U_FILE_OFFSET_BITS" \
-	CPPFLAGS="$(TARGET_CPPFLAGS) -U_FILE_OFFSET_BITS" \
-	ARCH="$(BR2_ARCH)"
+	CPPFLAGS="$(TARGET_CPPFLAGS) -U_FILE_OFFSET_BITS"
 
 POLICYCOREUTILS_MAKE_DIRS = \
 	load_policy newrole run_init \
@@ -72,7 +71,6 @@ HOST_POLICYCOREUTILS_MAKE_OPTS = \
 	$(HOST_CONFIGURE_OPTS) \
 	CFLAGS="$(HOST_CFLAGS) -U_FILE_OFFSET_BITS" \
 	CPPFLAGS="$(HOST_CPPFLAGS) -U_FILE_OFFSET_BITS" \
-	ARCH="$(HOSTARCH)" \
 	DESTDIR=$(HOST_DIR) \
 	PREFIX=$(HOST_DIR)
 
