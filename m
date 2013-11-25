From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 25 Nov 2013 10:06:53 +0100
Subject: [Buildroot] [git commit] e2fsprogs: Disable elf shared library when
	BR2_PREFER_STATIC_LIB is selected.
Message-ID: <20131125094406.5DA7F9BDDB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=efc35794c8706e376c5dbf49e0a33217a2f515ff
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Sonic Zhang <sonic.zhang@analog.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/e2fsprogs/e2fsprogs.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/e2fsprogs/e2fsprogs.mk b/package/e2fsprogs/e2fsprogs.mk
index 0670c74..cdca906 100644
--- a/package/e2fsprogs/e2fsprogs.mk
+++ b/package/e2fsprogs/e2fsprogs.mk
@@ -11,7 +11,7 @@ E2FSPROGS_LICENSE_FILES = COPYING lib/uuid/COPYING lib/ss/mit-sipb-copyright.h l
 
 E2FSPROGS_CONF_OPT = \
 	--disable-tls \
-	--enable-elf-shlibs \
+	$(if $(BR2_PREFER_STATIC_LIB),,--enable-elf-shlibs) \
 	$(if $(BR2_PACKAGE_E2FSPROGS_DEBUGFS),,--disable-debugfs) \
 	$(if $(BR2_PACKAGE_E2FSPROGS_E2IMAGE),,--disable-imager) \
 	$(if $(BR2_PACKAGE_E2FSPROGS_E4DEFRAG),,--disable-defrag) \
