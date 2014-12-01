From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 1 Dec 2014 23:29:03 +0100
Subject: [Buildroot] [git commit] coreutils: add error handling to for loop
Message-ID: <20141201223450.8A66080048@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5e7c3648724b1f77e03f5730b7371d2d42df54ed
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/coreutils/coreutils.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/coreutils/coreutils.mk b/package/coreutils/coreutils.mk
index db0d8a9..8901d23 100644
--- a/package/coreutils/coreutils.mk
+++ b/package/coreutils/coreutils.mk
@@ -102,7 +102,7 @@ endif
 define COREUTILS_POST_INSTALL
 	# some things go in root rather than usr
 	for f in $(COREUTILS_BIN_PROGS); do \
-		mv -f $(TARGET_DIR)/usr/bin/$$f $(TARGET_DIR)/bin/$$f; \
+		mv -f $(TARGET_DIR)/usr/bin/$$f $(TARGET_DIR)/bin/$$f || exit 1; \
 	done
 	# link for archaic shells
 	ln -fs test $(TARGET_DIR)/usr/bin/[
