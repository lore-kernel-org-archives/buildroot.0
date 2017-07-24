From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 24 Jul 2017 06:59:54 +0300
Subject: [Buildroot] [PATCH 3/3] grep: remove musl build workaround
In-Reply-To: <b8bec6b0782f9808f59be046aea03648733417fa.1500868794.git.baruch@tkos.co.il>
References: <b8bec6b0782f9808f59be046aea03648733417fa.1500868794.git.baruch@tkos.co.il>
Message-ID: <f9b18f3f76137e6c4de2d0a72154ec79223019d9.1500868794.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Commit de903755d79e (grep: fix build failure for musl) added
--with-included-regex to configure options in musl builds. The commit log
mentions build failure because grep configure doesn't detect the missing libc
regex support. Unfortunately, the commit log adds no details on said build
failure, or any autobuilder reference. The autobuilder didn't record
any grep build failure for version 2.20 that was current at the time.

Build with musl succeeds nowadays, so remove the workaround.

Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/grep/grep.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/grep/grep.mk b/package/grep/grep.mk
index 06d84ed5b96f..6e44a189f0ab 100644
--- a/package/grep/grep.mk
+++ b/package/grep/grep.mk
@@ -9,7 +9,6 @@ GREP_SITE = $(BR2_GNU_MIRROR)/grep
 GREP_SOURCE = grep-$(GREP_VERSION).tar.xz
 GREP_LICENSE = GPL-3.0+
 GREP_LICENSE_FILES = COPYING
-GREP_CONF_OPTS = $(if $(BR2_TOOLCHAIN_USES_MUSL),--with-included-regex)
 GREP_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
 
 # link with iconv if enabled
-- 
2.13.2
