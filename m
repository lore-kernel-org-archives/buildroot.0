From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 11 May 2013 22:41:44 +0200
Subject: [Buildroot] [git commit branch/next] python: remove stale
	python2-config symbolic link
Message-ID: <20130511204540.53F339A0DC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=85c798b88b56dbf79caba55226e0ebf12817caf2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

We already remove python2.7-config and the symbolic link
python-config, but we forgot to remove the python2-config symbolic
link.

Note that we can't use the <pkg>_CONFIG_SCRIPTS mechanism here because
python2.7-config is written in... Python, and doesn't follow the usual
syntax of <pkg>-config scripts. It takes the paths directly from
distutils.sysconfig.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/python/python.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

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
 
