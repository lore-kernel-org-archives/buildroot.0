From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 5 Jul 2017 01:27:25 +0200
Subject: [Buildroot] [git commit] git: use the new gettext logic
Message-ID: <20170704233515.10D717FCC8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bbfb02598bf751c8e0c5c7259ad3379dc459988e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit switches to use the new gettext logic, which involves
using TARGET_NLS_DEPENDENCIES instead of hand-encoded dependencies
on gettext/host-gettext.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/git/git.mk | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/package/git/git.mk b/package/git/git.mk
index 9cc88dd..23ace0f 100644
--- a/package/git/git.mk
+++ b/package/git/git.mk
@@ -9,11 +9,7 @@ GIT_SOURCE = git-$(GIT_VERSION).tar.xz
 GIT_SITE = https://www.kernel.org/pub/software/scm/git
 GIT_LICENSE = GPL-2.0, LGPL-2.1+
 GIT_LICENSE_FILES = COPYING LGPL-2.1
-GIT_DEPENDENCIES = zlib host-gettext
-
-ifeq ($(BR2_PACKAGE_GETTEXT),y)
-GIT_DEPENDENCIES += gettext
-endif
+GIT_DEPENDENCIES = zlib $(TARGET_NLS_DEPENDENCIES)
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 GIT_DEPENDENCIES += openssl
