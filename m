From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 6 Jul 2017 22:00:00 +0200
Subject: [Buildroot] [git commit] linuxptp: remove trailing backslashes
Message-ID: <20170706195654.540048040F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4b693c3c3fa92c4a57f561dcc25e47d4827f8a42
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Thanks to Yann E. Morin for spotting these.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/linuxptp/linuxptp.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/linuxptp/linuxptp.mk b/package/linuxptp/linuxptp.mk
index 6516659..bf2176c 100644
--- a/package/linuxptp/linuxptp.mk
+++ b/package/linuxptp/linuxptp.mk
@@ -13,12 +13,12 @@ LINUXPTP_LICENSE_FILES = COPYING
 LINUXPTP_MAKE_ENV = \
 	$(TARGET_MAKE_ENV) \
 	CROSS_COMPILE="$(TARGET_CROSS)" \
-	KBUILD_OUTPUT=$(STAGING_DIR) \
+	KBUILD_OUTPUT=$(STAGING_DIR)
 
 LINUXPTP_MAKE_OPTS = \
 	prefix=/usr \
 	EXTRA_CFLAGS="$(TARGET_CFLAGS)" \
-	EXTRA_LDFLAGS="$(TARGET_LDFLAGS)" \
+	EXTRA_LDFLAGS="$(TARGET_LDFLAGS)"
 
 define LINUXPTP_BUILD_CMDS
 	$(LINUXPTP_MAKE_ENV) $(MAKE) $(LINUXPTP_MAKE_OPTS) -C $(@D) all
