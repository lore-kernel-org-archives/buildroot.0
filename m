From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu, 30 Jun 2016 06:51:51 +0200
Subject: [Buildroot] [PATCH 1/1] package/python: Fixed rebased patch
	011-remove-python-symlink.patch
Message-ID: <1467262311-27350-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

While rebasing one line was accidently not removed, this patch fixes

http://autobuild.buildroot.net/results/018/018303a5d551aaa6c91013ab0352437e9a2c28bc/
Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/python/011-remove-python-symlink.patch | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/python/011-remove-python-symlink.patch b/package/python/011-remove-python-symlink.patch
index fed46f0..e021d83 100644
--- a/package/python/011-remove-python-symlink.patch
+++ b/package/python/011-remove-python-symlink.patch
@@ -12,7 +12,7 @@ Index: b/Makefile.pre.in
 ===================================================================
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -974,17 +974,11 @@
+@@ -974,17 +974,10 @@
  		echo "Creating directory $(LIBPC)"; \
  		$(INSTALL) -d -m $(DIRMODE) $(DESTDIR)$(LIBPC); \
  	fi
@@ -20,7 +20,7 @@ Index: b/Makefile.pre.in
 -	then rm -f $(DESTDIR)$(BINDIR)/$(PYTHON); \
 -	else true; \
 -	fi
- 	(cd $(DESTDIR)$(BINDIR); $(LN) -s python2$(EXE) $(PYTHON))
+-	(cd $(DESTDIR)$(BINDIR); $(LN) -s python2$(EXE) $(PYTHON))
  	-rm -f $(DESTDIR)$(BINDIR)/python2$(EXE)
  	(cd $(DESTDIR)$(BINDIR); $(LN) -s python$(VERSION)$(EXE) python2$(EXE))
  	-rm -f $(DESTDIR)$(BINDIR)/python2-config
-- 
2.8.1
