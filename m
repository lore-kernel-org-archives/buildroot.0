From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 28 Jan 2021 21:10:14 +0100
Subject: [Buildroot] [git commit branch/2020.02.x] package/sudo: drop
 unneeded autoreconf
Message-ID: <20210128200124.28425801C8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ce1f59f2e4ca1ce38cc2bf54f6419d2eee20d813
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Commit 4fea71ac785cc (package/sudo: security bump to version 1.9.5p2)
removed the patch, but forgot to remove the now unneeded autoreconf.  Fix
that.

Reported-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 84a8aac451906c30f79c123afe4a415573021dc5)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/sudo/sudo.mk | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/sudo/sudo.mk b/package/sudo/sudo.mk
index b727065abb..c08cf1c4a5 100644
--- a/package/sudo/sudo.mk
+++ b/package/sudo/sudo.mk
@@ -8,8 +8,6 @@ SUDO_VERSION = 1.9.5p2
 SUDO_SITE = https://www.sudo.ws/sudo/dist
 SUDO_LICENSE = ISC, BSD-3-Clause
 SUDO_LICENSE_FILES = doc/LICENSE
-# We're patching lib/eventlog/Makefile.in
-SUDO_AUTORECONF = YES
 # This is to avoid sudo's make install from chown()ing files which fails
 SUDO_INSTALL_TARGET_OPTS = INSTALL_OWNER="" DESTDIR="$(TARGET_DIR)" install
 SUDO_CONF_OPTS = \
