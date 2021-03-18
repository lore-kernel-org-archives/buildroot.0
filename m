From: Peter Seiderer <ps.report@gmx.net>
Date: Thu, 18 Mar 2021 21:16:55 +0100
Subject: [Buildroot] [PATCH v1 2/2] package/git: bump version to 2.31.0
In-Reply-To: <20210318201655.32647-1-ps.report@gmx.net>
References: <20210318201655.32647-1-ps.report@gmx.net>
Message-ID: <20210318201655.32647-2-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- drop libpcre1 support

For details see [1].

[1] https://lore.kernel.org/git/xmqqwnu8z03c.fsf at gitster.g/T/

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/git/git.hash | 2 +-
 package/git/git.mk   | 8 ++------
 2 files changed, 3 insertions(+), 7 deletions(-)

diff --git a/package/git/git.hash b/package/git/git.hash
index c1960b9728..1c87f9829e 100644
--- a/package/git/git.hash
+++ b/package/git/git.hash
@@ -1,5 +1,5 @@
 # From: https://www.kernel.org/pub/software/scm/git/sha256sums.asc
-sha256  41f7d90c71f9476cd387673fcb10ce09ccbed67332436a4cc58d7af32c355faa  git-2.30.2.tar.xz
+sha256  e8f162cbdb3283e13cd7388d864ed23485f1b046a19e969f12ed2685fb789a40  git-2.31.0.tar.xz
 # Locally calculated
 sha256  5b2198d1645f767585e8a88ac0499b04472164c0d2da22e75ecf97ef443ab32e  COPYING
 sha256  1922f45d2c49e390032c9c0ba6d7cac904087f7cec51af30c2b2ad022ce0e76a  LGPL-2.1
diff --git a/package/git/git.mk b/package/git/git.mk
index 910dcf5fa1..c95878981a 100644
--- a/package/git/git.mk
+++ b/package/git/git.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GIT_VERSION = 2.30.2
+GIT_VERSION = 2.31.0
 GIT_SOURCE = git-$(GIT_VERSION).tar.xz
 GIT_SITE = $(BR2_KERNEL_MIRROR)/software/scm/git
 GIT_LICENSE = GPL-2.0, LGPL-2.1+
@@ -25,12 +25,8 @@ endif
 ifeq ($(BR2_PACKAGE_PCRE2),y)
 GIT_DEPENDENCIES += pcre2
 GIT_CONF_OPTS += --with-libpcre2
-else ifeq ($(BR2_PACKAGE_PCRE),y)
-GIT_DEPENDENCIES += pcre
-GIT_CONF_OPTS += --with-libpcre1
-GIT_MAKE_OPTS += NO_LIBPCRE1_JIT=1
 else
-GIT_CONF_OPTS += --without-libpcre
+GIT_CONF_OPTS += --without-libpcre2
 endif
 
 ifeq ($(BR2_PACKAGE_LIBCURL),y)
-- 
2.30.2
