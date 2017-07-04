From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 5 Jul 2017 01:27:26 +0200
Subject: [Buildroot] [git commit] grep: use the new gettext logic
Message-ID: <20170704233515.5FFC180F3D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1d7a80d761fe88d15a91cc1913e75fccf4ef577a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit switches to use the new gettext logic, which involves
using TARGET_NLS_DEPENDENCIES instead of hand-encoded dependencies
on gettext/host-gettext.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/grep/grep.mk | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/package/grep/grep.mk b/package/grep/grep.mk
index 5101dda..a2ef422 100644
--- a/package/grep/grep.mk
+++ b/package/grep/grep.mk
@@ -11,11 +11,7 @@ GREP_LICENSE = GPL-3.0+
 GREP_LICENSE_FILES = COPYING
 GREP_CONF_OPTS = --disable-perl-regexp \
 	$(if $(BR2_TOOLCHAIN_USES_MUSL),--with-included-regex)
-
-# Can use libintl if available
-ifeq ($(BR2_PACKAGE_GETTEXT),y)
-GREP_DEPENDENCIES += gettext
-endif
+GREP_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
 
 # link with iconv if enabled
 ifeq ($(BR2_PACKAGE_LIBICONV),y)
