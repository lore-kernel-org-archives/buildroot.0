From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 24 Feb 2010 22:16:56 +0100
Subject: [Buildroot] [PATCH 09/10] sylpheed: add dependency on libgtk2
In-Reply-To: <cover.1267046193.git.thomas.petazzoni@free-electrons.com>
References: <cover.1267046193.git.thomas.petazzoni@free-electrons.com>
Message-ID: <3fe3456123c05be66f39245f70f44efa1c4306df.1267046193.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/sylpheed/Config.in   |    1 +
 package/sylpheed/sylpheed.mk |    2 +-
 2 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/package/sylpheed/Config.in b/package/sylpheed/Config.in
index 2c4aa3a..fe5aee6 100644
--- a/package/sylpheed/Config.in
+++ b/package/sylpheed/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_SYLPHEED
 	bool "sylpheed"
+	select BR2_PACKAGE_LIBGTK2
 	help
 	  lightweight and user-friendly e-mail client.
 
diff --git a/package/sylpheed/sylpheed.mk b/package/sylpheed/sylpheed.mk
index 96eca9c..bc2872d 100644
--- a/package/sylpheed/sylpheed.mk
+++ b/package/sylpheed/sylpheed.mk
@@ -13,7 +13,7 @@ SYLPHEED_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
 
 SYLPHEED_CONF_OPT = --disable-gtkspell --program-prefix=""
 
-SYLPHEED_DEPENDENCIES = host-pkg-config
+SYLPHEED_DEPENDENCIES = host-pkg-config libgtk2
 
 $(eval $(call AUTOTARGETS,package,sylpheed))
 
-- 
1.6.3.3
