From: Conrad Parker <conrad@metadecks.org>
Date: Mon, 16 Jun 2008 14:58:24 +0900
Subject: [Buildroot] [PATCH] build fix for package/python
Message-ID: <dba6c0830806152258i78970879leb61228913545743@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Removed invalid hyphen in front of -$(MAKE) in the middle of a subshell;
this looks like it was left over from an earlier use as a standalone
makefile rule, where the - would have specified to allow failure.

Conrad.

---
 package/python/python.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/python/python.mk b/package/python/python.mk
index 82c938e..53d59c8 100644
--- a/package/python/python.mk
+++ b/package/python/python.mk
@@ -89,7 +89,7 @@ $(PYTHON_DIR)/.hostpython: $(PYTHON_DIR)/.patched
 		$(MAKE) python Parser/pgen && \
 		mv python hostpython && \
 		mv Parser/pgen Parser/hostpgen && \
-		-$(MAKE) distclean \
+		$(MAKE) distclean \
 	) && \
 	touch $@

-- 
1.5.4.3
