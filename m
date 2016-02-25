From: Gabe Evans <gabe@hashrabbit.co>
Date: Thu, 25 Feb 2016 21:55:15 +0000
Subject: [Buildroot] [PATCH 06/32] package/systemd: add
	--enable/disable-libcurl
In-Reply-To: <1456437341-19025-1-git-send-email-gabe@hashrabbit.co>
References: <1456437341-19025-1-git-send-email-gabe@hashrabbit.co>
Message-ID: <1456437341-19025-7-git-send-email-gabe@hashrabbit.co>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gabe Evans <gabe@hashrabbit.co>
---
 package/systemd/Config.in  | 1 +
 package/systemd/systemd.mk | 7 +++++++
 2 files changed, 8 insertions(+)

diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index 9de6e11..6edfba1 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -58,6 +58,7 @@ config BR2_PACKAGE_SYSTEMD
 	  - acl package will add support for multi-seat.
 	  - xz and/or lz4 packages will add compression support in journal
 	    and coredump.
+	  - libcurl package will add support for systemd-journal-upload.
 	  - libgcrypt package will add support for journal sealing and resolved
 	    DNSSEC verification.
 
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 29c764e..18e0c5c 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -104,6 +104,13 @@ else
 SYSTEMD_CONF_OPTS += --disable-zlib
 endif
 
+ifeq ($(BR2_PACKAGE_LIBCURL),y)
+SYSTEMD_DEPENDENCIES += libcurl
+SYSTEMD_CONF_OPTS += --enable-libcurl
+else
+SYSTEMD_CONF_OPTS += --disable-libcurl
+endif
+
 ifeq ($(BR2_PACKAGE_LIBGCRYPT),y)
 SYSTEMD_DEPENDENCIES += libgcrypt
 SYSTEMD_CONF_OPTS += \
-- 
1.9.1
