From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 21 Dec 2016 11:47:11 -0300
Subject: [Buildroot] [PATCH 2/2] nftables: bump to version 0.7
In-Reply-To: <20161221144711.13880-1-gustavo@zacarias.com.ar>
References: <20161221144711.13880-1-gustavo@zacarias.com.ar>
Message-ID: <20161221144711.13880-2-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

And fix small CONF_OPTS assignment snafu.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/nftables/nftables.hash | 4 ++--
 package/nftables/nftables.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/nftables/nftables.hash b/package/nftables/nftables.hash
index 987aae3..a743476 100644
--- a/package/nftables/nftables.hash
+++ b/package/nftables/nftables.hash
@@ -1,2 +1,2 @@
-# From http://www.netfilter.org/projects/nftables/downloads.html#nftables-0.6
-sha1	c0f90a208e0ab5d43d3e638350a4fe58e6f4366f	nftables-0.6.tar.bz2
+# From http://www.netfilter.org/projects/nftables/downloads.html#nftables-0.7
+sha1	c003fa8b63b1b44c52de345a4d84487d81865a98	nftables-0.7.tar.bz2
diff --git a/package/nftables/nftables.mk b/package/nftables/nftables.mk
index 10a1b42..64d6be7 100644
--- a/package/nftables/nftables.mk
+++ b/package/nftables/nftables.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NFTABLES_VERSION = 0.6
+NFTABLES_VERSION = 0.7
 NFTABLES_SOURCE = nftables-$(NFTABLES_VERSION).tar.bz2
 NFTABLES_SITE = http://www.netfilter.org/projects/nftables/files
 NFTABLES_DEPENDENCIES = gmp libmnl libnftnl host-bison host-flex \
@@ -16,7 +16,7 @@ ifeq ($(BR2_PACKAGE_READLINE),y)
 NFTABLES_DEPENDENCIES += readline
 NFTABLES_LIBS += -lncurses
 else
-NFTABLES_CONF_OPTS = --without-cli
+NFTABLES_CONF_OPTS += --without-cli
 endif
 
 ifeq ($(BR2_STATIC_LIBS)$(BR2_PACKAGE_LIBNFTNL_JSON),yy)
-- 
2.10.2
