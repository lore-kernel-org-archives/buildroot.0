From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  4 Jul 2017 16:48:15 +0200
Subject: [Buildroot] [PATCH 035/100] grep: use the new gettext logic
In-Reply-To: <20170704144920.12318-1-thomas.petazzoni@free-electrons.com>
References: <20170704144920.12318-1-thomas.petazzoni@free-electrons.com>
Message-ID: <20170704144920.12318-36-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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
-- 
2.9.4
