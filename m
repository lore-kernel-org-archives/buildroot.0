From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 30 Jun 2016 12:22:38 +0200
Subject: [Buildroot] [git commit] package/python: Fix rebased patch
	011-remove-python-symlink.patch
Message-ID: <20160630102355.16737820FE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4e1b3235c2fc480414c4a2ad59d9db1cafd9d2ae
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

While rebasing one line was accidently not removed, this patch fixes

http://autobuild.buildroot.net/results/018/018303a5d551aaa6c91013ab0352437e9a2c28bc/
Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
