From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 14 Oct 2014 07:54:01 -0300
Subject: [Buildroot] [PATCH 3/6] make: bump to version 4.1
In-Reply-To: <1413284044-20381-1-git-send-email-gustavo@zacarias.com.ar>
References: <1413284044-20381-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1413284044-20381-3-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also add hash file.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/make/make.hash | 2 ++
 package/make/make.mk   | 5 ++---
 2 files changed, 4 insertions(+), 3 deletions(-)
 create mode 100644 package/make/make.hash

diff --git a/package/make/make.hash b/package/make/make.hash
new file mode 100644
index 0000000..db95c60
--- /dev/null
+++ b/package/make/make.hash
@@ -0,0 +1,2 @@
+# Locally calculated after checking signature
+sha256	0bc7613389650ee6a24554b52572a272f7356164fd2c4132b0bcf13123e4fca5	make-4.1.tar.bz2
diff --git a/package/make/make.mk b/package/make/make.mk
index 803595f..20469ba 100644
--- a/package/make/make.mk
+++ b/package/make/make.mk
@@ -4,12 +4,11 @@
 #
 ################################################################################
 
-MAKE_VERSION = 4.0
+MAKE_VERSION = 4.1
 MAKE_SOURCE = make-$(MAKE_VERSION).tar.bz2
 MAKE_SITE = $(BR2_GNU_MIRROR)/make
+MAKE_DEPENDENCIES = $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext)
 MAKE_LICENSE = GPLv3+
 MAKE_LICENSE_FILES = COPYING
 
-MAKE_DEPENDENCIES = $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext)
-
 $(eval $(autotools-package))
-- 
2.0.4
