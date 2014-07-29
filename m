From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue, 29 Jul 2014 23:12:34 +0200
Subject: [Buildroot] [PATCH 07 of 20] pkg-generic: add check on deprecated
 variable FOO_INSTALL_TARGET_OPT
In-Reply-To: <patchbomb.1406668347@localhost>
References: <patchbomb.1406668347@localhost>
Message-ID: <25036d8ae80fd4eee7e5.1406668354@localhost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch introduces a check for the usage of deprecated variable
FOO_INSTALL_TARGET_OPT, and suggests to use FOO_INSTALL_TARGET_OPTS instead.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
 package/pkg-generic.mk |  1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff -r 625dd5f23fa4 -r 25036d8ae80f package/pkg-generic.mk
--- a/package/pkg-generic.mk	Tue Jul 29 21:58:06 2014 +0200
+++ b/package/pkg-generic.mk	Tue Jul 29 22:00:46 2014 +0200
@@ -720,6 +720,7 @@
 # Ensure unified variable name conventions between all packages
 $(eval $(call check-deprecated-variable,$(2)_MAKE_OPT,$(2)_MAKE_OPTS))
 $(eval $(call check-deprecated-variable,$(2)_INSTALL_OPT,$(2)_INSTALL_OPTS))
+$(eval $(call check-deprecated-variable,$(2)_INSTALL_TARGET_OPT,$(2)_INSTALL_TARGET_OPTS))
 
 TARGETS += $(1)
 
