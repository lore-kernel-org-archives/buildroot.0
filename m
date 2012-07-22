From: Samuel Martin <s.martin49@gmail.com>
Date: Sun, 22 Jul 2012 15:28:30 +0200
Subject: [Buildroot] [PATCH 02/11] e2fsprogs: add staging install
In-Reply-To: <1342963719-1810-1-git-send-email-s.martin49@gmail.com>
References: <1342963719-1810-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1342963719-1810-3-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Samuel Martin <s.martin49@gmail.com>

diff --git a/package/e2fsprogs/e2fsprogs.mk b/package/e2fsprogs/e2fsprogs.mk
index 16725ac..036e54e 100644
--- a/package/e2fsprogs/e2fsprogs.mk
+++ b/package/e2fsprogs/e2fsprogs.mk
@@ -26,6 +26,9 @@ E2FSPROGS_DEPENDENCIES = host-pkg-config util-linux
 E2FSPROGS_MAKE_OPT = \
 	LDCONFIG=true
 
+E2FSPROGS_INSTALL_STAGING = YES
+E2FSPROGS_INSTALL_STAGING_OPT += install install-libs DESTDIR=$(STAGING_DIR)
+
 define HOST_E2FSPROGS_INSTALL_CMDS
  $(HOST_MAKE_ENV) $(MAKE) -C $(@D) install install-libs
 endef
-- 
1.7.11.2
