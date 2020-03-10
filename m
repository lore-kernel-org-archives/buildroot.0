From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 10 Mar 2020 21:31:06 +0100
Subject: [Buildroot] [git commit branch/2019.02.x] package/grep: install to
 /bin to fix busybox aliasing
Message-ID: <20200310202151.8C9C58F008@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3c030e1685520523ec8c150b5c4af6c6cb6bf184
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

When the grep package is selected, it should be installed at the same exact
location where busybox installs it too, this way the grep/egrep/fgrep
executables will end up overwriting the busybox provided ones.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 10bc79c612dd945af236f23e11b4df79b3c76257)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/grep/grep.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/grep/grep.mk b/package/grep/grep.mk
index 96685b0276..eefdfe6a74 100644
--- a/package/grep/grep.mk
+++ b/package/grep/grep.mk
@@ -10,6 +10,8 @@ GREP_SOURCE = grep-$(GREP_VERSION).tar.xz
 GREP_LICENSE = GPL-3.0+
 GREP_LICENSE_FILES = COPYING
 GREP_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
+# install into /bin like busybox grep
+GREP_CONF_OPTS = --exec-prefix=/
 
 # link with iconv if enabled
 ifeq ($(BR2_PACKAGE_LIBICONV),y)
