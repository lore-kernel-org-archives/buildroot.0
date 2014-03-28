From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 28 Mar 2014 09:54:45 +0100
Subject: [Buildroot] [git commit] slang: add ncurses optional dependency
Message-ID: <20140328090050.437959C3ED@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3a7aee7742fbe802f26c9ec341580be16e4d1c25
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Ncurses check need to be disabled if ncurses package is not
selected.
If we don't do that, host's ncurses5-config may be used by
configure script.

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/slang/slang.mk |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/package/slang/slang.mk b/package/slang/slang.mk
index c6f0383..d943de3 100644
--- a/package/slang/slang.mk
+++ b/package/slang/slang.mk
@@ -13,6 +13,12 @@ SLANG_LICENSE_FILES = COPYING
 SLANG_INSTALL_STAGING = YES
 SLANG_MAKE = $(MAKE1)
 
+ifeq ($(BR2_PACKAGE_NCURSES),y)
+	SLANG_DEPENDENCIES = ncurses
+else
+	SLANG_CONF_OPT = ac_cv_path_nc5config=no
+endif
+
 # The installation location of the slang library
 # does not take into account the DESTDIR directory.
 # So SLANG_INST_LIB is initialized with -L/usr/lib/
