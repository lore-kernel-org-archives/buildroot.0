From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 14 Nov 2011 09:35:21 +0100
Subject: [Buildroot] [git commit] tar: build after busybox if enabled
Message-ID: <20111114083543.A66ED8F555@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8795caa082382f600f006c15275d20df00ce1179
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/tar/tar.mk |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/package/tar/tar.mk b/package/tar/tar.mk
index c797de9..edbd9bd 100644
--- a/package/tar/tar.mk
+++ b/package/tar/tar.mk
@@ -7,4 +7,9 @@
 TAR_VERSION = 1.26
 TAR_SITE = $(BR2_GNU_MIRROR)/tar
 
+# Prefer full-blown tar over buybox's version
+ifeq ($(BR2_PACKAGE_BUSYBOX),y)
+TAR_DEPENDENCIES += busybox
+endif
+
 $(eval $(call AUTOTARGETS))
