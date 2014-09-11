From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 11 Sep 2014 22:31:57 +0200
Subject: [Buildroot] [git commit] automake: disable manpages
Message-ID: <20140911204621.D83969D640@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2020ddbd0f2c32863e6be69a235852a088744c28
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As reported by Kanibal on IRC this seems to break on very modern
distributions and we don't care about manpages so disable them.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/automake/automake-0001-noman.patch |   27 +++++++++++++++++++++++++++
 1 files changed, 27 insertions(+), 0 deletions(-)

diff --git a/package/automake/automake-0001-noman.patch b/package/automake/automake-0001-noman.patch
new file mode 100644
index 0000000..a4ad16d
--- /dev/null
+++ b/package/automake/automake-0001-noman.patch
@@ -0,0 +1,27 @@
+Disable manpages build and installation, seems the bundled version of
+help2man is somewhat old and breaks on modern distributions such as
+Fedora 20, as reported by Kanibal on IRC.
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+
+diff -Nura automake-1.14.1.orig/Makefile.in automake-1.14.1/Makefile.in
+--- automake-1.14.1.orig/Makefile.in	2014-09-10 18:40:57.554164448 -0300
++++ automake-1.14.1/Makefile.in	2014-09-10 18:42:01.050348068 -0300
+@@ -3387,7 +3387,7 @@
+ check-am: all-am
+ 	$(MAKE) $(AM_MAKEFLAGS) check-TESTS check-local
+ check: check-am
+-all-am: Makefile $(INFO_DEPS) $(SCRIPTS) $(MANS) $(DATA)
++all-am: Makefile $(INFO_DEPS) $(SCRIPTS) $(DATA)
+ installdirs:
+ 	for dir in "$(DESTDIR)$(bindir)" "$(DESTDIR)$(infodir)" "$(DESTDIR)$(man1dir)" "$(DESTDIR)$(amdir)" "$(DESTDIR)$(automake_acdir)" "$(DESTDIR)$(automake_internal_acdir)" "$(DESTDIR)$(docdir)" "$(DESTDIR)$(perllibdir)" "$(DESTDIR)$(pkgvdatadir)" "$(DESTDIR)$(scriptdir)" "$(DESTDIR)$(system_acdir)" "$(DESTDIR)$(perllibdir)"; do \
+ 	  test -z "$$dir" || $(MKDIR_P) "$$dir"; \
+@@ -3454,7 +3454,7 @@
+ 	install-dist_automake_internal_acDATA install-dist_docDATA \
+ 	install-dist_perllibDATA install-dist_pkgvdataDATA \
+ 	install-dist_scriptDATA install-dist_system_acDATA \
+-	install-info-am install-man install-nodist_perllibDATA
++	install-info-am install-nodist_perllibDATA
+ 	@$(NORMAL_INSTALL)
+ 	$(MAKE) $(AM_MAKEFLAGS) install-data-hook
+ install-dvi: install-dvi-am
