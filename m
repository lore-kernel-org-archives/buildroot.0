From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 6 May 2013 13:58:38 +0200
Subject: [Buildroot] [git commit] python: remove smtpd.py
Message-ID: <20130506115917.64FA299C43@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0d2fbe9d75308571da3afc2a5d1f3586c0ca3bec
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It's mostly sample code, normally not used, and has a bad shebang line.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/python/python.mk |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/package/python/python.mk b/package/python/python.mk
index 4876dd8..b942854 100644
--- a/package/python/python.mk
+++ b/package/python/python.mk
@@ -142,6 +142,13 @@ endef
 
 PYTHON_POST_INSTALL_STAGING_HOOKS += PYTHON_FIXUP_LIBDIR
 
+# Bad shebang, normally not used
+define PYTHON_REMOVE_SMTPD
+	rm -f $(TARGET_DIR)/usr/bin/smtpd.py
+endef
+
+PYTHON_POST_INSTALL_TARGET_HOOKS += PYTHON_REMOVE_SMTPD
+
 #
 # Development files removal
 #
