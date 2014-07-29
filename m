From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue, 29 Jul 2014 23:12:36 +0200
Subject: [Buildroot] [PATCH 09 of 20] pkg-generic: add check on deprecated
 variable FOO_INSTALL_STAGING_OPT
In-Reply-To: <patchbomb.1406668347@localhost>
References: <patchbomb.1406668347@localhost>
Message-ID: <26c25594f92023254b55.1406668356@localhost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch introduces a check for the usage of deprecated variable
FOO_INSTALL_STAGING_OPT, and suggests to use FOO_INSTALL_STAGING_OPTS
instead.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
 package/pkg-generic.mk |  1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff -r 15f42758f952 -r 26c25594f920 package/pkg-generic.mk
--- a/package/pkg-generic.mk	Tue Jul 29 22:01:35 2014 +0200
+++ b/package/pkg-generic.mk	Tue Jul 29 22:02:01 2014 +0200
@@ -721,6 +721,7 @@
 $(eval $(call check-deprecated-variable,$(2)_MAKE_OPT,$(2)_MAKE_OPTS))
 $(eval $(call check-deprecated-variable,$(2)_INSTALL_OPT,$(2)_INSTALL_OPTS))
 $(eval $(call check-deprecated-variable,$(2)_INSTALL_TARGET_OPT,$(2)_INSTALL_TARGET_OPTS))
+$(eval $(call check-deprecated-variable,$(2)_INSTALL_STAGING_OPT,$(2)_INSTALL_STAGING_OPTS))
 
 TARGETS += $(1)
 
