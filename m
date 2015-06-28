From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Sun, 28 Jun 2015 21:42:43 +0200
Subject: [Buildroot] [RFC v4 09/16] infra: add GCC_SYSROOT environment
	variable to support pps feature
In-Reply-To: <1435520570-20332-1-git-send-email-fabio.porcedda@gmail.com>
References: <1435520570-20332-1-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <1435520570-20332-10-git-send-email-fabio.porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In order to support the per-package staging feature, add the GCC_SYSROOT
environment variable to the TARGET_CONFIGURE_OPTS and TARGET_MAKE_ENV
variables.

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
---
 package/Makefile.in | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index 2ed7cf7..924c808 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -280,9 +280,10 @@ TARGET_CONFIGURE_OPTS = \
 	FCFLAGS="$(TARGET_FCFLAGS)" \
 	PKG_CONFIG="$(PKG_CONFIG_HOST_BINARY)" \
 	STAGING_DIR="$(STAGING_DIR)" \
+	GCC_SYSROOT="$(STAGING_DIR)" \
 	INTLTOOL_PERL=$(PERL)
 
-TARGET_MAKE_ENV = PATH=$(BR_PATH)
+TARGET_MAKE_ENV = PATH=$(BR_PATH) GCC_SYSROOT="$(STAGING_DIR)"
 
 
 HOST_CONFIGURE_OPTS = \
-- 
2.4.3
