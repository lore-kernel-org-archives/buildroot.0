From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue, 1 Jun 2021 22:08:29 +0200
Subject: [Buildroot] [git commit] package/libesmtp: move SITE to s.b.n
Message-ID: <20210601194720.310BB8B3A3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1410cbd1638e1629454feda719fe9ea6473e941b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The original site is gone, and the author is no longer providing
tarballs:

  https://libesmtp.github.io/notes.html

Change website link to the current official page.

Fixes:
http://autobuild.buildroot.net/results/d788315bf708c31e14ba5fb35dccf94753d5f78a/
http://autobuild.buildroot.net/results/83bfdd8e5f897b4d4be81c4c16106feb4e17bd50/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/libesmtp/Config.in   | 2 +-
 package/libesmtp/libesmtp.mk | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libesmtp/Config.in b/package/libesmtp/Config.in
index f3ed521d22..db2dc8ec9c 100644
--- a/package/libesmtp/Config.in
+++ b/package/libesmtp/Config.in
@@ -4,7 +4,7 @@ config BR2_PACKAGE_LIBESMTP
 	help
 	  Library for sending emails through SMTP.
 
-	  http://brianstafford.info/libesmtp
+	  https://libesmtp.github.io
 
 comment "libesmtp needs a toolchain w/ dynamic library"
 	depends on BR2_STATIC_LIBS
diff --git a/package/libesmtp/libesmtp.mk b/package/libesmtp/libesmtp.mk
index dcffaceddc..1f5cdec191 100644
--- a/package/libesmtp/libesmtp.mk
+++ b/package/libesmtp/libesmtp.mk
@@ -6,7 +6,7 @@
 
 LIBESMTP_VERSION = 1.0.6
 LIBESMTP_SOURCE = libesmtp-$(LIBESMTP_VERSION).tar.bz2
-LIBESMTP_SITE = http://brianstafford.info/libesmtp
+LIBESMTP_SITE = http://sources.buildroot.net/libesmtp
 LIBESMTP_INSTALL_STAGING = YES
 LIBESMTP_CONFIG_SCRIPTS = libesmtp-config
 LIBESMTP_DEPENDENCIES = $(if $(BR2_PACKAGE_OPENSSL),openssl)
