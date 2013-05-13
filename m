From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 13 May 2013 16:20:22 +0200
Subject: [Buildroot] [git commit] curlftpfs: specify curl-config path
Message-ID: <20130513142322.EAE0B9A1A5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b1c2bed54717606e91518bb7562a47d4b4fbe769
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

curlftpfs may pick up the distribution curl-config rather than the one
in the staging area thus failing to build.
Fix it by hardcoding the curl-config path.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/curlftpfs/curlftpfs.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

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
