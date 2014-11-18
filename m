From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 18 Nov 2014 08:40:43 +0100
Subject: [Buildroot] [git commit] package/rpm: add missing kconfig
	dependency to zlib
Message-ID: <20141118074238.21EDBB483D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=272b5ecd18037a9fd6de78213b10b59c39173ad7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since we build-depend on zlib, forcibly select it from kconfig.

This went unnoticed so far, because we did select openssl which
in turn selects zlib. But rpm needs zlib for itself, too.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Peter Korsgaard <jacmet@uclibc.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/rpm/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/rpm/Config.in b/package/rpm/Config.in
index 2492616..620eb1a 100644
--- a/package/rpm/Config.in
+++ b/package/rpm/Config.in
@@ -13,6 +13,7 @@ config BR2_PACKAGE_RPM
 	select BR2_PACKAGE_NEON_XML
 	select BR2_PACKAGE_NEON_ZLIB
 	select BR2_PACKAGE_NEON_SSL
+	select BR2_PACKAGE_ZLIB
 	help
 	  The RPM package management system.
 
