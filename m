From: Jordan Yelloz <jordan@yelloz.me>
Date: Mon, 13 Jun 2016 15:15:07 -0700
Subject: [Buildroot] [PATCH v4 1/1] fwup: blanked out HELP2MAN_PATH autoconf
	value
In-Reply-To: <20160613052640.6977-1-jordan@yelloz.me>
References: <20160613052640.6977-1-jordan@yelloz.me>
Message-ID: <20160613221507.29556-1-jordan@yelloz.me>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

If you have help2man installed, the build system will try to run
help2man on the target fwup binary which should not be expected to work.

Signed-off-by: Jordan Yelloz <jordan@yelloz.me>
---
 package/fwup/fwup.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/fwup/fwup.mk b/package/fwup/fwup.mk
index 0f857fc..814ca00 100644
--- a/package/fwup/fwup.mk
+++ b/package/fwup/fwup.mk
@@ -10,6 +10,7 @@ FWUP_LICENSE = Apache-2.0
 FWUP_LICENSE_FILES = LICENSE
 FWUP_DEPENDENCIES = libconfuse libarchive libsodium
 FWUP_AUTORECONF = YES
+FWUP_CONF_ENV = ac_cv_path_HELP2MAN=
 
 define FWUP_ADD_M4_DIR
 	mkdir -p $(@D)/m4
-- 
2.8.4
