From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Fri, 21 Sep 2012 02:54:01 +0200
Subject: [Buildroot] [PATCH 03/10] ndisc6: only needs gettext if locale is
	selected
In-Reply-To: <20120921004927.11838.37292.stgit@localhost>
References: <20120921004927.11838.37292.stgit@localhost>
Message-ID: <20120921005401.11838.65084.stgit@localhost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Also add missing select in Config.in.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/ndisc6/Config.in |    1 +
 package/ndisc6/ndisc6.mk |    2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/ndisc6/Config.in b/package/ndisc6/Config.in
index 126bfa2..6abe4ce 100644
--- a/package/ndisc6/Config.in
+++ b/package/ndisc6/Config.in
@@ -4,6 +4,7 @@ comment "ndisc6 requires a toolchain with IPv6 support"
 config BR2_PACKAGE_NDISC6
 	bool "ndisc6 tools"
 	depends on BR2_INET_IPV6
+	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
 	help
 	  NDisc6 is a small collection of useful tools for IPv6 networking
 
diff --git a/package/ndisc6/ndisc6.mk b/package/ndisc6/ndisc6.mk
index f58cc13..1d3c0e7 100644
--- a/package/ndisc6/ndisc6.mk
+++ b/package/ndisc6/ndisc6.mk
@@ -10,7 +10,7 @@ NDISC6_SITE = http://www.remlab.net/files/ndisc6/
 NDISC6_CONF_ENV = CC="$(TARGET_CC) -std=gnu99"
 NDISC6_CONF_OPT = --localstatedir=/var --disable-rpath --disable-suid-install
 
-ifeq ($(BR2_PACKAGE_GETTEXT),y)
+ifeq ($(BR2_NEEDS_GETTEXT_IF_LOCALE),y)
 NDISC6_DEPENDENCIES += gettext
 NDISC6_CONF_ENV += LDFLAGS="$(TARGET_LDFLAGS) -lintl"
 endif
