From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 12 Jan 2021 18:39:49 +0100
Subject: [Buildroot] [git commit branch/2020.02.x] package/zic: bump version
 to 2020f
Message-ID: <20210112172411.3CC6B870D5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c0bcd2ee44ac663e703cbf0d36bffe9261d9bb53
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Release notes:
https://mm.icann.org/pipermail/tz-announce/2020-December/000064.html

Rebased patch.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 7868289fd53480201f8be7b72097246b7923611c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/zic/0001-remove-dependency-check-on-version-file.patch | 8 ++++----
 package/zic/zic.hash                                           | 4 ++--
 package/zic/zic.mk                                             | 2 +-
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/zic/0001-remove-dependency-check-on-version-file.patch b/package/zic/0001-remove-dependency-check-on-version-file.patch
index f4b2590525..193c263049 100644
--- a/package/zic/0001-remove-dependency-check-on-version-file.patch
+++ b/package/zic/0001-remove-dependency-check-on-version-file.patch
@@ -18,10 +18,10 @@ diff --git a/Makefile b/Makefile
 index 1b714a8..00d2c09 100644
 --- a/Makefile
 +++ b/Makefile
-@@ -437,7 +437,7 @@ INSTALL:	ALL install date.1
- 		cp date $(DESTDIR)$(BINDIR)/.
- 		cp -f date.1 $(DESTDIR)$(MANDIR)/man1/.
- 
+@@ -587,7 +587,7 @@ INSTALL:	ALL install date.1
+ # Otherwise, use $(VERSION) unless it is "unknown" and there is already
+ # a 'version' file, in which case reuse the existing 'version' contents
+ # and append "-dirty" if the contents do not already end in "-dirty".
 -version:	$(VERSION_DEPS)
 +version:
  		{ (type git) >/dev/null 2>&1 && \
diff --git a/package/zic/zic.hash b/package/zic/zic.hash
index 677bb0f059..3cee80bcdd 100644
--- a/package/zic/zic.hash
+++ b/package/zic/zic.hash
@@ -1,4 +1,4 @@
-# From https://mm.icann.org/pipermail/tz-announce/2020-April/000058.html
-sha512  5235d6590e844491df32375857f5f36ba0046f2d21a078375188dff79b125cf9b69136a0a431624de1ecfa9d53b62a232f0e6ee0b734294cec62b670e6265cb2  tzcode2020a.tar.gz
+# From https://mm.icann.org/pipermail/tz-announce/2020-December/000064.html
+sha512  5f6bf1b508434842eb9dacacc744b5f3375c35b88e401ef372b5fde80ad2f523484fe52a6e99460e402230406ebf6a9261a97efde45a610f8e8085893d55c4ed  tzcode2020f.tar.gz
 # Locally computed:
 sha256  0613408568889f5739e5ae252b722a2659c02002839ad970a63dc5e9174b27cf  LICENSE
diff --git a/package/zic/zic.mk b/package/zic/zic.mk
index 98f3bca58b..7529b682a2 100644
--- a/package/zic/zic.mk
+++ b/package/zic/zic.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ZIC_VERSION = 2020a
+ZIC_VERSION = 2020f
 ZIC_SOURCE = tzcode$(ZIC_VERSION).tar.gz
 ZIC_SITE = https://www.iana.org/time-zones/repository/releases
 ZIC_STRIP_COMPONENTS = 0
