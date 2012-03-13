From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 13 Mar 2012 13:12:02 +0100
Subject: [Buildroot] [git commit] libethumb: Fix automagic dependencies on
	libedbus and libexif
Message-ID: <20120313130006.170B290D7F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ce6727f63046c49d5e778af72e7096ff2e3ad82c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libethumb will determine during configuration phase whether to build the
optional libexif and libedbus modules. It will enable this modules if
libedbus or libexif are present on the target system. Therefore, we need
to add these packages as optional dependencies to libethumb.

Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/efl/libethumb/libethumb.mk |    8 ++++++++
 1 files changed, 8 insertions(+), 0 deletions(-)

diff --git a/package/efl/libethumb/libethumb.mk b/package/efl/libethumb/libethumb.mk
index 16b2ba9..617de0d 100644
--- a/package/efl/libethumb/libethumb.mk
+++ b/package/efl/libethumb/libethumb.mk
@@ -13,4 +13,12 @@ LIBETHUMB_DEPENDENCIES = libeina libevas libecore libedje host-libedje
 
 LIBETHUMB_CONF_OPT = --with-edje-cc=$(HOST_DIR)/usr/bin/edje_cc
 
+ifeq ($(BR2_PACKAGE_LIBEXIF),y)
+LIBETHUMB_DEPENDENCIES += libexif
+endif
+
+ifeq ($(BR2_PACKAGE_LIBEDBUS),y)
+LIBETHUMB_DEPENDENCIES += libedbus
+endif
+
 $(eval $(call AUTOTARGETS))
