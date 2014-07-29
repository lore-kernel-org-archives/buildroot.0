From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue, 29 Jul 2014 23:12:32 +0200
Subject: [Buildroot] [PATCH 05 of 20] pkg-generic: add check on deprecated
 variable FOO_INSTALL_OPT
In-Reply-To: <patchbomb.1406668347@localhost>
References: <patchbomb.1406668347@localhost>
Message-ID: <565580d243a8b4188223.1406668352@localhost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch introduces a check for the usage of deprecated variable
FOO_INSTALL_OPT, and suggests to use FOO_INSTALL_OPTS instead.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
 package/pkg-generic.mk |  1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff -r 350c3078ccd9 -r 565580d243a8 package/pkg-generic.mk
--- a/package/pkg-generic.mk	Mon Jul 28 21:34:36 2014 +0200
+++ b/package/pkg-generic.mk	Mon Jul 28 21:35:28 2014 +0200
@@ -719,6 +719,7 @@
 
 # Ensure unified variable name conventions between all packages
 $(eval $(call check-deprecated-variable,$(2)_MAKE_OPT,$(2)_MAKE_OPTS))
+$(eval $(call check-deprecated-variable,$(2)_INSTALL_OPT,$(2)_INSTALL_OPTS))
 
 TARGETS += $(1)
 
