From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun,  3 Jun 2018 10:11:34 +0200
Subject: [Buildroot] [PATCH 2/2] whois: add host-perl-autodie dependency
In-Reply-To: <20180603081134.1933-1-fontaine.fabrice@gmail.com>
References: <20180603081134.1933-1-fontaine.fabrice@gmail.com>
Message-ID: <20180603081134.1933-2-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - http://autobuild.buildroot.net/results/5d13bd7df9596b3bdf1a720962d1ad09af752769

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/whois/whois.mk | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/whois/whois.mk b/package/whois/whois.mk
index 5cd7cde7fd..c1461b1f3b 100644
--- a/package/whois/whois.mk
+++ b/package/whois/whois.mk
@@ -8,7 +8,10 @@ WHOIS_VERSION = 5.3.0
 WHOIS_SITE = http://snapshot.debian.org/archive/debian/20180121T094839Z/pool/main/w/whois
 WHOIS_SOURCE = whois_$(WHOIS_VERSION).tar.xz
 # take precedence over busybox implementation
-WHOIS_DEPENDENCIES = $(if $(BR2_PACKAGE_BUSYBOX),busybox) $(TARGET_NLS_DEPENDENCIES)
+WHOIS_DEPENDENCIES = \
+	$(if $(BR2_PACKAGE_BUSYBOX),busybox) \
+	host-perl-autodie \
+	$(TARGET_NLS_DEPENDENCIES)
 WHOIS_MAKE_ENV = $(TARGET_MAKE_ENV)
 WHOIS_MAKE_OPTS = CC="$(TARGET_CC)" CFLAGS="$(TARGET_CFLAGS)" \
 	LIBS="$(WHOIS_EXTRA_LIBS)"
-- 
2.14.1
