From: Samuel Martin <s.martin49@gmail.com>
Date: Sun,  5 Oct 2014 11:40:06 +0200
Subject: [Buildroot] [PATCH 1/2] package/swig: define SWIG pointing to the
	host swig program
Message-ID: <1412502007-9902-1-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 package/swig/swig.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/swig/swig.mk b/package/swig/swig.mk
index 9996e95..3ef56d6 100644
--- a/package/swig/swig.mk
+++ b/package/swig/swig.mk
@@ -31,3 +31,5 @@ endef
 HOST_SWIG_POST_INSTALL_HOOKS += HOST_SWIG_INSTALL_SYMLINK
 
 $(eval $(host-autotools-package))
+
+SWIG = $(HOST_DIR)/usr/bin/swig$(SWIG_MAJOR)
-- 
2.1.2
