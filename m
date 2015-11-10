From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 10 Nov 2015 11:28:51 +0100
Subject: [Buildroot] [git commit] gettext: fix legal info
Message-ID: <20151110103050.4A3DE81E8C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=185aa5b0f0a630b14885b78fb0033397ce7eb3a1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The license is wrong, it's GPLv3+ rather than GPLv2+ now.
Also there's a specific clause for libintl that makes it LGPLv2.1+, see
gettext-runtime/COPYING.

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gettext/gettext.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/gettext/gettext.mk b/package/gettext/gettext.mk
index 724b393..cb509f2 100644
--- a/package/gettext/gettext.mk
+++ b/package/gettext/gettext.mk
@@ -8,8 +8,8 @@ GETTEXT_VERSION = 0.19.6
 GETTEXT_SITE = $(BR2_GNU_MIRROR)/gettext
 GETTEXT_SOURCE = gettext-$(GETTEXT_VERSION).tar.xz
 GETTEXT_INSTALL_STAGING = YES
-GETTEXT_LICENSE = GPLv2+
-GETTEXT_LICENSE_FILES = COPYING
+GETTEXT_LICENSE = LGPLv2.1+ (libintl), GPLv3+ (the rest)
+GETTEXT_LICENSE_FILES = COPYING gettext-runtime/intl/COPYING.LIB
 
 GETTEXT_DEPENDENCIES = $(if $(BR2_PACKAGE_LIBICONV),libiconv)
 HOST_GETTEXT_DEPENDENCIES = # we don't want the libiconv dependency
