From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 28 Nov 2010 22:13:05 +0100
Subject: [Buildroot] [git commit master 1/1] target-finalize: libtread_db:
	support nonstd toolchain setups
Message-ID: <20101128211439.EA7DC8D34B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=66254843a57420cf46899b71526fe2481ca7a554
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Certain toolchain configs (E.G. on blackfin), don't use symlinks, so the
file name to match is the actual SONAME (.so.*). Support these toolchains
as well.

Signed-off-by: Mike Frysinger <vapier@gentoo.org>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 Makefile |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/Makefile b/Makefile
index fc165e1..8dbb026 100644
--- a/Makefile
+++ b/Makefile
@@ -418,7 +418,7 @@ ifneq ($(BR2_HAVE_DOCUMENTATION),y)
 	rm -rf $(TARGET_DIR)/usr/share/gtk-doc
 	-rmdir $(TARGET_DIR)/usr/share 2>/dev/null
 endif
-	find $(TARGET_DIR) -type f -perm +111 '!' -name 'libthread_db*.so' | \
+	find $(TARGET_DIR) -type f -perm +111 '!' -name 'libthread_db*.so*' | \
 		xargs $(STRIPCMD) 2>/dev/null || true
 	find $(TARGET_DIR)/lib/modules -type f -name '*.ko' | \
 		xargs -r $(STRIPCMD) $(STRIP_STRIP_UNNEEDED)
-- 
1.7.2.2
