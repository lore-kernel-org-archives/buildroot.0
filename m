From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 8 Nov 2012 16:26:12 +0100
Subject: [Buildroot] [git commit] kmod: don't build documentation if not
	needed
Message-ID: <20121108152636.554B599C7C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2fc64312d4840eb777df7e10b8405a364e813b9e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

No sense in building it if we throw it away in target-finalize anyway.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/kmod/kmod.mk |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/kmod/kmod.mk b/package/kmod/kmod.mk
index c6ef6a1..2833629 100644
--- a/package/kmod/kmod.mk
+++ b/package/kmod/kmod.mk
@@ -4,6 +4,10 @@ KMOD_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/kernel/kmod/
 KMOD_INSTALL_STAGING = YES
 KMOD_DEPENDENCIES = host-pkgconf
 
+ifneq ($(BR2_HAVE_DOCUMENTATION),y)
+KMOD_CONF_OPT += --disable-manpages
+endif
+
 ifeq ($(BR2_PACKAGE_ZLIB),y)
 KMOD_DEPENDENCIES += zlib
 KMOD_CONF_OPT += --with-zlib
