From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 10 May 2013 18:29:36 +0200
Subject: [Buildroot] [PATCH 14/16] python: remove stale python2-config
	symbolic link
In-Reply-To: <1368203379-3385-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1368203379-3385-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1368203379-3385-15-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We already remove python2.7-config and the symbolic link
python-config, but we forgot to remove the python2-config symbolic
link.

Note that we can't use the <pkg>_CONFIG_SCRIPTS mechanism here because
python2.7-config is written in... Python, and doesn't follow the usual
syntax of <pkg>-config scripts. It takes the paths directly from
distutils.sysconfig.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python/python.mk |    1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python/python.mk b/package/python/python.mk
index b942854..801c669 100644
--- a/package/python/python.mk
+++ b/package/python/python.mk
@@ -154,6 +154,7 @@ PYTHON_POST_INSTALL_TARGET_HOOKS += PYTHON_REMOVE_SMTPD
 #
 define PYTHON_REMOVE_DEVFILES
 	rm -f $(TARGET_DIR)/usr/bin/python$(PYTHON_VERSION_MAJOR)-config
+	rm -f $(TARGET_DIR)/usr/bin/python2-config
 	rm -f $(TARGET_DIR)/usr/bin/python-config
 endef
 
-- 
1.7.9.5
