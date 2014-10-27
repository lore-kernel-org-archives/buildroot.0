From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 27 Oct 2014 01:07:41 +0100
Subject: [Buildroot] [git commit] bmon: Bump version
Message-ID: <20141027002036.EE7CDB0DB7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=148ea737c084f6cee7d46cca7a3548959fc43965
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The release contains the configure scripts, as such we don't need the
autoreconf anymore.

Also add a hash file since there is a release tarball uploaded by the
maintainer.

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/bmon/bmon.hash |    2 ++
 package/bmon/bmon.mk   |    6 ++----
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/bmon/bmon.hash b/package/bmon/bmon.hash
new file mode 100644
index 0000000..dbe2e68
--- /dev/null
+++ b/package/bmon/bmon.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  78ab9e46840178fbc874cdbc94fde34e72e41a18a27383660b50b4c3cd0d1f9c  bmon-3.5.tar.gz
diff --git a/package/bmon/bmon.mk b/package/bmon/bmon.mk
index d4c7a49..d440156 100644
--- a/package/bmon/bmon.mk
+++ b/package/bmon/bmon.mk
@@ -4,10 +4,8 @@
 #
 ################################################################################
 
-BMON_VERSION = 3.2
-BMON_SITE = $(call github,tgraf,bmon,v$(BMON_VERSION))
-# configure not shipped
-BMON_AUTORECONF = YES
+BMON_VERSION = 3.5
+BMON_SITE = https://github.com/tgraf/bmon/releases/download/v$(BMON_VERSION)/
 BMON_DEPENDENCIES = host-pkgconf libconfuse libnl ncurses
 BMON_LICENSE = BSD-2c
 BMON_LICENSE_FILES = LICENSE
