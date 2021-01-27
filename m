From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 27 Jan 2021 21:59:31 +0100
Subject: [Buildroot] [git commit] package/sudo: drop unneeded autoreconf
Message-ID: <20210127204009.C0DB4815BB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=84a8aac451906c30f79c123afe4a415573021dc5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 4fea71ac785cc (package/sudo: security bump to version 1.9.5p2)
removed the patch, but forgot to remove the now unneeded autoreconf.  Fix
that.

Reported-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/sudo/sudo.mk | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/sudo/sudo.mk b/package/sudo/sudo.mk
index 7a6320e7e4..ce18b9d965 100644
--- a/package/sudo/sudo.mk
+++ b/package/sudo/sudo.mk
@@ -11,8 +11,6 @@ SUDO_LICENSE_FILES = doc/LICENSE
 SUDO_CPE_ID_VALID = YES
 SUDO_CPE_ID_VERSION = 1.9.5
 SUDO_CPE_ID_VERSION_MINOR = p2
-# We're patching lib/eventlog/Makefile.in
-SUDO_AUTORECONF = YES
 # This is to avoid sudo's make install from chown()ing files which fails
 SUDO_INSTALL_TARGET_OPTS = INSTALL_OWNER="" DESTDIR="$(TARGET_DIR)" install
 SUDO_CONF_OPTS = \
