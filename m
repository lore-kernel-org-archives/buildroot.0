From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue, 29 Jul 2014 23:12:44 +0200
Subject: [Buildroot] [PATCH 17 of 20] pkg-generic: add check on deprecated
 variable FOO_BUILD_OPT
In-Reply-To: <patchbomb.1406668347@localhost>
References: <patchbomb.1406668347@localhost>
Message-ID: <9d23ec1bdf4c0e6f59b3.1406668364@localhost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch introduces a check for the usage of deprecated variable
FOO_BUILD_OPT, and suggests to use FOO_BUILD_OPTS instead.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
 package/pkg-generic.mk |  1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff -r 2ca4e88d3634 -r 9d23ec1bdf4c package/pkg-generic.mk
--- a/package/pkg-generic.mk	Tue Jul 29 22:11:15 2014 +0200
+++ b/package/pkg-generic.mk	Tue Jul 29 22:11:38 2014 +0200
@@ -725,6 +725,7 @@
 $(eval $(call check-deprecated-variable,$(2)_INSTALL_HOST_OPT,$(2)_INSTALL_HOST_OPTS))
 $(eval $(call check-deprecated-variable,$(2)_AUTORECONF_OPT,$(2)_AUTORECONF_OPTS))
 $(eval $(call check-deprecated-variable,$(2)_CONF_OPT,$(2)_CONF_OPTS))
+$(eval $(call check-deprecated-variable,$(2)_BUILD_OPT,$(2)_BUILD_OPTS))
 
 TARGETS += $(1)
 
