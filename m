From: lylejfranklin at gmail.com <lylejfranklin@gmail.com>
Date: Sun,  5 Jul 2020 14:28:45 -0400
Subject: [Buildroot] [PATCH 1/1] package/jq: bump version to a17dd32
Message-ID: <20200705182845.42885-1-lylejfranklin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Lyle Franklin <lylejfranklin@gmail.com>

- Bumps jq package to latest to fix seg fault errors
- https://github.com/stedolan/jq/issues/2003
- I saw this on ARM64 compiled with uclibc, issue mentions MIPS, so
  might only be an issue for non-x86

Signed-off-by: Lyle Franklin <lylejfranklin@gmail.com>
---
 package/jq/jq.hash | 2 +-
 package/jq/jq.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/jq/jq.hash b/package/jq/jq.hash
index 2cddda32c6..e9f15afa78 100644
--- a/package/jq/jq.hash
+++ b/package/jq/jq.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  3002cf80d871728562989b4a47d90a7301fe049a4e1d69836b99108f198dac06  jq-a97638713ad30653d424f136018098c4b0e5c71b.tar.gz
+sha256  20249104d4df2247253df6df4a980b8be1f5232f03fef7cd41bacb7e6eab04fd  jq-a17dd3248a666d01be75f6b16be37e80e20b0954.tar.gz
 sha256  111136aebcbfa68b6b0084e582b30e981da76adcff84eab6f9be32a1f38c5bf1  COPYING
diff --git a/package/jq/jq.mk b/package/jq/jq.mk
index 3d22306537..297a608b12 100644
--- a/package/jq/jq.mk
+++ b/package/jq/jq.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-JQ_VERSION = a97638713ad30653d424f136018098c4b0e5c71b
+JQ_VERSION = a17dd3248a666d01be75f6b16be37e80e20b0954
 JQ_SITE = $(call github,stedolan,jq,$(JQ_VERSION))
 JQ_LICENSE = MIT (code), CC-BY-3.0 (documentation)
 JQ_LICENSE_FILES = COPYING
-- 
2.27.0
