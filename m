From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 22 Nov 2009 21:51:46 +0100
Subject: [Buildroot] [git commit master] package/Makefile.in: fix 'true'
	invocation for BR2_STRIP_none
Message-ID: <20091122210625.2C704777EF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=3445ff4adebd3674d8e227479800efe987682d07
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Closes #701

Coreutils true doesn't understand a -Not_stripping argument.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES             |    1 +
 package/Makefile.in |    2 +-
 2 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/CHANGES b/CHANGES
index adcd8bd..37931d8 100644
--- a/CHANGES
+++ b/CHANGES
@@ -44,6 +44,7 @@
 	#657: Bug in imagemagick-clean target
 	#665: [PATCH] Samba package
 	#667: [PATCH] e2fsprogs
+	#701: make install problem with unstripped binaries
 	#703: [SECURITY] Update openssl package to 0.9.8l
 	#705: Bump spawn-fcgi package to 1.6.3
 	#709: Bump lighttpd package to 1.4.24
diff --git a/package/Makefile.in b/package/Makefile.in
index a10abe4..b5a7a8e 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -163,7 +163,7 @@ TARGET_STRIP=$(STAGING_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-sstrip
 STRIPCMD=$(TARGET_STRIP)
 endif
 ifeq ($(BR2_STRIP_none),y)
-TARGET_STRIP=true -Not_stripping
+TARGET_STRIP=true Not_stripping
 STRIPCMD=$(TARGET_STRIP)
 endif
 INSTALL:=$(shell which install || type -p install)
-- 
1.6.3.3
