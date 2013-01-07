From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 7 Jan 2013 21:41:30 +0100
Subject: [Buildroot] [git commit] argp-standlone: build position independent
	code
Message-ID: <20130107212531.AF23B9A691@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=eb6cf3003366864aa29cc56eab88c26c3d8baedf
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Even though argp-standalone is built as a static library, it might get
linked in a shared library, so we must built it as
position-independent code.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/argp-standalone/argp-standalone.mk |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/package/argp-standalone/argp-standalone.mk b/package/argp-standalone/argp-standalone.mk
index 47c09b2..ba7f757 100644
--- a/package/argp-standalone/argp-standalone.mk
+++ b/package/argp-standalone/argp-standalone.mk
@@ -8,6 +8,9 @@ ARGP_STANDALONE_VERSION = 1.3
 ARGP_STANDALONE_SITE = http://www.lysator.liu.se/~nisse/archive
 ARGP_STANDALONE_INSTALL_STAGING = YES
 
+ARGP_STANDALONE_CONF_ENV = \
+	CFLAGS="$(TARGET_CFLAGS) -fPIC"
+
 define ARGP_STANDALONE_INSTALL_STAGING_CMDS
 	$(INSTALL) -D $(@D)/libargp.a $(STAGING_DIR)/usr/lib/libargp.a
 	$(INSTALL) -D $(@D)/argp.h $(STAGING_DIR)/usr/include/argp.h
