From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 2 Jan 2012 23:34:40 +0100
Subject: [Buildroot] [git commit] libesmtp: add optional openssl support
Message-ID: <20120102223526.96A098FF94@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5ec8da031b9fad064d4cc6ee70106af12cb109b2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libesmtp/libesmtp.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/libesmtp/libesmtp.mk b/package/libesmtp/libesmtp.mk
index 63f3192..f9be7cc 100644
--- a/package/libesmtp/libesmtp.mk
+++ b/package/libesmtp/libesmtp.mk
@@ -8,4 +8,6 @@ LIBESMTP_SOURCE = libesmtp-$(LIBESMTP_VERSION).tar.bz2
 LIBESMTP_SITE = http://www.stafford.uklinux.net/libesmtp
 LIBESMTP_INSTALL_STAGING = YES
 
+LIBESMTP_DEPENDENCIES = $(if $(BR2_PACKAGE_OPENSSL),openssl)
+
 $(eval $(call AUTOTARGETS))
