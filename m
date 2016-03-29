From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 29 Mar 2016 20:00:20 +0200
Subject: [Buildroot] [git commit] systemd: fix build with libgcrypt enabled
Message-ID: <20160329180102.0535A81840@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f5a56880ad651c8ad5e50e89ed3472fa1b81a643
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When gcrypt support is enabled, we need to tell systemd where
libgpg-error is installed.

Fixes:

  http://autobuild.buildroot.org/results/1fd6193ff33250565c95e53614f5aa7fc6f4581c/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/systemd/systemd.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 79e657e..75ad961 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -115,7 +115,8 @@ ifeq ($(BR2_PACKAGE_LIBGCRYPT),y)
 SYSTEMD_DEPENDENCIES += libgcrypt
 SYSTEMD_CONF_OPTS += \
 	--enable-gcrypt	\
-	--with-libgcrypt-prefix=$(STAGING_DIR)/usr
+	--with-libgcrypt-prefix=$(STAGING_DIR)/usr \
+	--with-libgpg-error-prefix=$(STAGING_DIR)/usr
 else
 SYSTEMD_CONF_OPTS += --disable-gcrypt
 endif
