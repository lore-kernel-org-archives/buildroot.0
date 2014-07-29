From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue, 29 Jul 2014 23:12:46 +0200
Subject: [Buildroot] [PATCH 19 of 20] pkg-generic: add check on deprecated
 variable FOO_GETTEXTIZE_OPT
In-Reply-To: <patchbomb.1406668347@localhost>
References: <patchbomb.1406668347@localhost>
Message-ID: <1769f2d29e4024255cfb.1406668366@localhost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch introduces a check for the usage of deprecated variable
FOO_GETTEXTIZE_OPT, and suggests to use FOO_GETTEXTIZE_OPTS instead.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
 package/pkg-generic.mk |  1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff -r 3d344da68b41 -r 1769f2d29e40 package/pkg-generic.mk
--- a/package/pkg-generic.mk	Tue Jul 29 22:13:03 2014 +0200
+++ b/package/pkg-generic.mk	Tue Jul 29 22:13:41 2014 +0200
@@ -726,6 +726,7 @@
 $(eval $(call check-deprecated-variable,$(2)_AUTORECONF_OPT,$(2)_AUTORECONF_OPTS))
 $(eval $(call check-deprecated-variable,$(2)_CONF_OPT,$(2)_CONF_OPTS))
 $(eval $(call check-deprecated-variable,$(2)_BUILD_OPT,$(2)_BUILD_OPTS))
+$(eval $(call check-deprecated-variable,$(2)_GETTEXTIZE_OPT,$(2)_GETTEXTIZE_OPTS))
 
 TARGETS += $(1)
 
