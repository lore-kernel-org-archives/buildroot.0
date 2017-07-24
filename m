From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 24 Jul 2017 18:23:12 +0200
Subject: [Buildroot] [git commit] grep: remove musl build workaround
Message-ID: <20170724162038.CA5B27FB2D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4ce38c3ac076982666eff923d5868281c3eff428
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit de903755d79e (grep: fix build failure for musl) added
--with-included-regex to configure options in musl builds. The commit log
mentions build failure because grep configure doesn't detect the missing libc
regex support. Unfortunately, the commit log adds no details on said build
failure, or any autobuilder reference. The autobuilder didn't record
any grep build failure for version 2.20 that was current at the time.

Build with musl succeeds nowadays, so remove the workaround.

Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/grep/grep.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/grep/grep.mk b/package/grep/grep.mk
index 06d84ed..6e44a18 100644
--- a/package/grep/grep.mk
+++ b/package/grep/grep.mk
@@ -9,7 +9,6 @@ GREP_SITE = $(BR2_GNU_MIRROR)/grep
 GREP_SOURCE = grep-$(GREP_VERSION).tar.xz
 GREP_LICENSE = GPL-3.0+
 GREP_LICENSE_FILES = COPYING
-GREP_CONF_OPTS = $(if $(BR2_TOOLCHAIN_USES_MUSL),--with-included-regex)
 GREP_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
 
 # link with iconv if enabled
