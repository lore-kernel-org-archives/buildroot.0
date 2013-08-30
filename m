From: Ryan Barnett <rjbarnet@rockwellcollins.com>
Date: Fri, 30 Aug 2013 09:09:45 -0500
Subject: [Buildroot] [PATCH v3 2/2] libcurl: add support for compiling with
	libssh2
In-Reply-To: <1377871785-4964-1-git-send-email-rjbarnet@rockwellcollins.com>
References: <1377871785-4964-1-git-send-email-rjbarnet@rockwellcollins.com>
Message-ID: <1377871785-4964-3-git-send-email-rjbarnet@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Adding configuration options that if libssh2 is selected, compile libcurl
with --with-ssh config flag.

Signed-off-by: Ryan Barnett <rjbarnet@rockwellcollins.com>
---
 package/libcurl/libcurl.mk |    8 ++++++++
 1 files changed, 8 insertions(+), 0 deletions(-)

diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
index 56f13ba..fd15478 100644
--- a/package/libcurl/libcurl.mk
+++ b/package/libcurl/libcurl.mk
@@ -34,6 +34,14 @@ else
 LIBCURL_CONF_OPT += --without-ssl
 endif
 
+# Configure curl to support libssh2
+ifeq ($(BR2_PACKAGE_LIBSSH2),y)
+LIBCURL_DEPENDENCIES += libssh2
+LIBCURL_CONF_OPT += --with-libssh2
+else
+LIBCURL_CONF_OPT += --without-libssh2
+endif
+
 define LIBCURL_FIX_DOT_PC
 	printf 'Requires: openssl\n' >>$(@D)/libcurl.pc.in
 endef
-- 
1.7.1
