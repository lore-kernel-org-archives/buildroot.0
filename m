From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 17 Jan 2021 16:54:15 +0100
Subject: [Buildroot] [git commit] package/nano: bump to version 5.5
Message-ID: <20210117153633.649CC861B5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4910b594526cfadc9e069191394f47d2e038d546
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

support for Slang has been removed

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/nano/nano.hash | 4 ++--
 package/nano/nano.mk   | 3 +--
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/nano/nano.hash b/package/nano/nano.hash
index 2126f576a4..4498414fd0 100644
--- a/package/nano/nano.hash
+++ b/package/nano/nano.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-# https://www.nano-editor.org/dist/v5/nano-5.4.tar.xz.asc
+# https://www.nano-editor.org/dist/v5/nano-5.5.tar.xz.asc
 # using key BFD009061E535052AD0DF2150D28D4D2A0ACE884
-sha256  fe993408b22286355809ce48ebecc4444d19af8203ed4959d269969112ed86e9  nano-5.4.tar.xz
+sha256  390b81bf9b41ff736db997aede4d1f60b4453fbd75a519a4ddb645f6fd687e4a  nano-5.5.tar.xz
 sha256  fc82ca8b6fdb18d4e3e85cfd8ab58d1bcd3f1b29abe782895abd91d64763f8e7  COPYING
diff --git a/package/nano/nano.mk b/package/nano/nano.mk
index 1fc499c347..097afadc31 100644
--- a/package/nano/nano.mk
+++ b/package/nano/nano.mk
@@ -5,12 +5,11 @@
 ################################################################################
 
 NANO_VERSION_MAJOR = 5
-NANO_VERSION = $(NANO_VERSION_MAJOR).4
+NANO_VERSION = $(NANO_VERSION_MAJOR).5
 NANO_SITE = https://www.nano-editor.org/dist/v$(NANO_VERSION_MAJOR)
 NANO_SOURCE = nano-$(NANO_VERSION).tar.xz
 NANO_LICENSE = GPL-3.0+
 NANO_LICENSE_FILES = COPYING
-NANO_CONF_OPTS = --without-slang
 NANO_DEPENDENCIES = ncurses
 
 ifeq ($(BR2_PACKAGE_NCURSES_WCHAR),y)
