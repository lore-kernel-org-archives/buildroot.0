From: Francois Perrad <fperrad@gmail.com>
Date: Tue,  3 Jun 2014 20:46:58 +0200
Subject: [Buildroot] [PATCH] perl: removes useless files in target tree
Message-ID: <1401821218-5716-1-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

$(TARGET_DIR)/usr/lib/perl5/$(PERL_VERSION)/$(PERL_ARCHNAME)/CORE contains include files.
*.bs & .packlist files come with perl or perl/cpan packages.

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 Makefile | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Makefile b/Makefile
index 0b4264a..8bfba51 100644
--- a/Makefile
+++ b/Makefile
@@ -554,6 +554,9 @@ ifeq ($(BR2_PACKAGE_PYTHON_PYC_ONLY)$(BR2_PACKAGE_PYTHON3_PYC_ONLY),y)
 	find $(TARGET_DIR)/usr/lib/ -name '*.py' -print0 | xargs -0 rm -f
 endif
 	rm -rf $(TARGET_DIR)/usr/lib/luarocks
+	rm -rf $(TARGET_DIR)/usr/lib/perl5/$(PERL_VERSION)/$(PERL_ARCHNAME)/CORE
+	find $(TARGET_DIR)/usr/lib/perl5/ -name '*.bs' -print0 | xargs -0 rm -f
+	find $(TARGET_DIR)/usr/lib/perl5/ -name '.packlist' -print0 | xargs -0 rm -f
 	$(STRIP_FIND_CMD) | xargs $(STRIPCMD) 2>/dev/null || true
 	if test -d $(TARGET_DIR)/lib/modules; then \
 		find $(TARGET_DIR)/lib/modules -type f -name '*.ko' | \
-- 
1.9.1
