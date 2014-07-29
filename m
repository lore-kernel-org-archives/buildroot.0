From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue, 29 Jul 2014 23:12:40 +0200
Subject: [Buildroot] [PATCH 13 of 20] pkg-generic: add check on deprecated
 variable FOO_AUTORECONF_OPT
In-Reply-To: <patchbomb.1406668347@localhost>
References: <patchbomb.1406668347@localhost>
Message-ID: <30adbe34573b0ce6e101.1406668360@localhost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch introduces a check for the usage of deprecated variable
FOO_AUTORECONF_OPT, and suggests to use FOO_AUTORECONF_OPTS instead.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
 package/pkg-generic.mk |  1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff -r 7671d1a5bdb5 -r 30adbe34573b package/pkg-generic.mk
--- a/package/pkg-generic.mk	Tue Jul 29 22:04:21 2014 +0200
+++ b/package/pkg-generic.mk	Tue Jul 29 22:04:51 2014 +0200
@@ -723,6 +723,7 @@
 $(eval $(call check-deprecated-variable,$(2)_INSTALL_TARGET_OPT,$(2)_INSTALL_TARGET_OPTS))
 $(eval $(call check-deprecated-variable,$(2)_INSTALL_STAGING_OPT,$(2)_INSTALL_STAGING_OPTS))
 $(eval $(call check-deprecated-variable,$(2)_INSTALL_HOST_OPT,$(2)_INSTALL_HOST_OPTS))
+$(eval $(call check-deprecated-variable,$(2)_AUTORECONF_OPT,$(2)_AUTORECONF_OPTS))
 
 TARGETS += $(1)
 
