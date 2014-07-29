From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue, 29 Jul 2014 23:12:42 +0200
Subject: [Buildroot] [PATCH 15 of 20] pkg-generic: add check on deprecated
 variable FOO_CONF_OPT
In-Reply-To: <patchbomb.1406668347@localhost>
References: <patchbomb.1406668347@localhost>
Message-ID: <d98d25de70f288dd3713.1406668362@localhost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch introduces a check for the usage of deprecated variable
FOO_CONF_OPT, and suggests to use FOO_CONF_OPTS instead.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
 package/pkg-generic.mk |  1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff -r f3169fb7c3a5 -r d98d25de70f2 package/pkg-generic.mk
--- a/package/pkg-generic.mk	Tue Jul 29 21:55:40 2014 +0200
+++ b/package/pkg-generic.mk	Tue Jul 29 21:56:34 2014 +0200
@@ -724,6 +724,7 @@
 $(eval $(call check-deprecated-variable,$(2)_INSTALL_STAGING_OPT,$(2)_INSTALL_STAGING_OPTS))
 $(eval $(call check-deprecated-variable,$(2)_INSTALL_HOST_OPT,$(2)_INSTALL_HOST_OPTS))
 $(eval $(call check-deprecated-variable,$(2)_AUTORECONF_OPT,$(2)_AUTORECONF_OPTS))
+$(eval $(call check-deprecated-variable,$(2)_CONF_OPT,$(2)_CONF_OPTS))
 
 TARGETS += $(1)
 
