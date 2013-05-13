From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 13 May 2013 10:01:26 -0300
Subject: [Buildroot] [PATCH] curlftpfs: specify curl-config path
Message-ID: <1368450086-8430-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

curlftpfs may pick up the distribution curl-config rather than the one
in the staging area thus failing to build.
Fix it by hardcoding the curl-config path.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/curlftpfs/curlftpfs.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/curlftpfs/curlftpfs.mk b/package/curlftpfs/curlftpfs.mk
index c7d04ae..ff70f3b 100644
--- a/package/curlftpfs/curlftpfs.mk
+++ b/package/curlftpfs/curlftpfs.mk
@@ -6,6 +6,7 @@
 
 CURLFTPFS_VERSION = 0.9.2
 CURLFTPFS_SITE = http://downloads.sourceforge.net/project/curlftpfs/curlftpfs/$(CURLFTPFS_VERSION)
+CURLFTPFS_CONF_ENV = ac_cv_path__libcurl_config=$(STAGING_DIR)/usr/bin/curl-config
 CURLFTPFS_DEPENDENCIES = \
 	libglib2 libfuse openssl libcurl \
 	$(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext) \
-- 
1.8.1.5
