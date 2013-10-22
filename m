From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 22 Oct 2013 23:58:22 +0200
Subject: [Buildroot] [git commit] nano: fix ncursesw build failure
Message-ID: <20131022220914.564F29BB4E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f0801fa2f3e1cbd617bacef3b442da6914caae0a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

After the latest version bump ncursesw5-config is automatically detected
if it's present in the build machine (almost always because we need full
ncurses support with headers for Kconfig's menuconfig).
Since we don't have ncursesw support in buildroot just say no. Fixes:
http://autobuild.buildroot.net/results/89d/89d7ec7306411b15f9ffbc2051d0d316237b4c07/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/nano/nano.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/nano/nano.mk b/package/nano/nano.mk
index aba4b4f..3707e77 100644
--- a/package/nano/nano.mk
+++ b/package/nano/nano.mk
@@ -10,6 +10,7 @@ NANO_LICENSE = GPLv3+
 NANO_LICENSE_FILES = COPYING
 NANO_MAKE_ENV = CURSES_LIB="-lncurses"
 NANO_CONF_OPT = --without-slang
+NANO_CONF_ENV = ac_cv_prog_NCURSESW_CONFIG=false
 NANO_DEPENDENCIES = ncurses
 
 ifeq ($(BR2_PACKAGE_NANO_TINY),y)
