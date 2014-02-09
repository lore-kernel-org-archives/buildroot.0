From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 9 Feb 2014 09:35:54 +0100
Subject: [Buildroot] [git commit] kmod: really pass --disable-manpages
Message-ID: <20140209083628.E9C0D9C8B1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=674fd4f83464a1449a0db8bb4e2584b7b6f6a051
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The line below overwrites KMOD_CONF_OPT, so move the --disable-manpages
options below.

Fixes http://autobuild.buildroot.net/results/842/842131307c171e1bc5a1e918996d53b00ddb1be3/

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/kmod/kmod.mk |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/kmod/kmod.mk b/package/kmod/kmod.mk
index f819d0e..f79a492 100644
--- a/package/kmod/kmod.mk
+++ b/package/kmod/kmod.mk
@@ -15,13 +15,13 @@ HOST_KMOD_DEPENDENCIES = host-pkgconf
 KMOD_LICENSE = LGPLv2.1+
 KMOD_LICENSE_FILES = libkmod/COPYING
 
-KMOD_CONF_OPT += --disable-manpages
-HOST_KMOD_CONF_OPT = --disable-manpages
-
 # static linking not supported, see
 # https://git.kernel.org/cgit/utils/kernel/kmod/kmod.git/commit/?id=b7016153ec8
 KMOD_CONF_OPT = --disable-static --enable-shared
 
+KMOD_CONF_OPT += --disable-manpages
+HOST_KMOD_CONF_OPT = --disable-manpages
+
 ifeq ($(BR2_PACKAGE_ZLIB),y)
 KMOD_DEPENDENCIES += zlib
 KMOD_CONF_OPT += --with-zlib
