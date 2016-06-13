From: Jordan Yelloz <jordan@yelloz.me>
Date: Sun, 12 Jun 2016 20:11:01 -0700
Subject: [Buildroot] [PATCH v2 1/1] fwup: blanked out MANS to avoid running
	help2man
In-Reply-To: <20160613023826.6329-1-jordan@yelloz.me>
References: <20160613023826.6329-1-jordan@yelloz.me>
Message-ID: <20160613031101.27646-1-jordan@yelloz.me>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

If you have help2man installed, the build system will try to run
help2man on the target fwup binary which should not be expected to work.

Signed-off-by: Jordan Yelloz <jordan@yelloz.me>
---
 package/fwup/fwup.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/fwup/fwup.mk b/package/fwup/fwup.mk
index 0f857fc..f960e36 100644
--- a/package/fwup/fwup.mk
+++ b/package/fwup/fwup.mk
@@ -10,6 +10,8 @@ FWUP_LICENSE = Apache-2.0
 FWUP_LICENSE_FILES = LICENSE
 FWUP_DEPENDENCIES = libconfuse libarchive libsodium
 FWUP_AUTORECONF = YES
+FWUP_MAKE_OPTS = MANS=
+FWUP_INSTALL_TARGET_OPTS = MANS=
 
 define FWUP_ADD_M4_DIR
 	mkdir -p $(@D)/m4
-- 
2.8.4
