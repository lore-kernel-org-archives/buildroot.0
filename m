From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun, 13 Nov 2011 19:27:57 -0300
Subject: [Buildroot] [PATCH 09/10] tar: build after busybox if enabled
In-Reply-To: <1321223278-14388-1-git-send-email-gustavo@zacarias.com.ar>
References: <1321223278-14388-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1321223278-14388-9-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
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
-- 
1.7.3.4
