From: llandwerlin at gmail.com <llandwerlin@gmail.com>
Date: Fri, 30 Apr 2010 02:24:12 +0200
Subject: [Buildroot] [PATCH 7/8] autoconf: added missing AUTOMAKE variable
	setting
In-Reply-To: <1272587053-19535-1-git-send-email-llandwerlin@gmail.com>
References: <1272587053-19535-1-git-send-email-llandwerlin@gmail.com>
Message-ID: <1272587053-19535-8-git-send-email-llandwerlin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Lionel Landwerlin <llandwerlin@gmail.com>

Signed-off-by: Lionel Landwerlin <llandwerlin@gmail.com>
---
 package/autoconf/autoconf.mk |    2 +-
 package/automake/automake.mk |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/autoconf/autoconf.mk b/package/autoconf/autoconf.mk
index b7c1fe4..722165c 100644
--- a/package/autoconf/autoconf.mk
+++ b/package/autoconf/autoconf.mk
@@ -27,4 +27,4 @@ $(eval $(call AUTOTARGETS,package,autoconf,host))
 # variables used by other packages
 AUTOCONF:=$(HOST_DIR)/usr/bin/autoconf
 AUTOHEADER:=$(HOST_DIR)/usr/bin/autoheader
-AUTORECONF=$(HOST_CONFIGURE_OPTS) ACLOCAL="$(ACLOCAL)" AUTOHEADER="$(AUTOHEADER)" $(HOST_DIR)/usr/bin/autoreconf -v -f -i -I "$(ACLOCAL_DIR)"
+AUTORECONF=$(HOST_CONFIGURE_OPTS) ACLOCAL="$(ACLOCAL)" AUTOHEADER="$(AUTOHEADER)" AUTOMAKE="$(AUTOMAKE)" $(HOST_DIR)/usr/bin/autoreconf -v -f -i -I "$(ACLOCAL_DIR)"
diff --git a/package/automake/automake.mk b/package/automake/automake.mk
index db935a4..46bb773 100644
--- a/package/automake/automake.mk
+++ b/package/automake/automake.mk
@@ -25,6 +25,6 @@ $(eval $(call AUTOTARGETS,package,automake))
 $(eval $(call AUTOTARGETS,package,automake,host))
 
 # variables used by other packages
-AUTOMAKE:=$(HOST_DIR)/usr/bin/automake
+AUTOMAKE = $(HOST_DIR)/usr/bin/automake
 ACLOCAL_DIR = $(STAGING_DIR)/usr/share/aclocal
 ACLOCAL = $(HOST_DIR)/usr/bin/aclocal -I $(ACLOCAL_DIR)
-- 
1.7.0.4
