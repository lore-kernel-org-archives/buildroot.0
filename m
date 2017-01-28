From: Waldemar Brodkorb <wbx@openadk.org>
Date: Sat, 28 Jan 2017 10:19:28 +0100
Subject: [Buildroot] [PATCH] or1k: fix build without flex/bison on host
Message-ID: <20170128091927.GA23055@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Similar to arc architecture this is required.

Reported-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/gcc/gcc.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index afe7c09..241f357 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -183,7 +183,7 @@ else
 HOST_GCC_COMMON_CONF_OPTS += --without-isl --without-cloog
 endif
 
-ifeq ($(BR2_arc),y)
+ifeq ($(BR2_arc)$(BR2_or1k),y)
 HOST_GCC_COMMON_DEPENDENCIES += host-flex host-bison
 endif
 
-- 
2.1.4
