From: Julien Floret <julien.floret@6wind.com>
Date: Sun,  3 Jul 2016 00:21:31 +0200
Subject: [Buildroot] [PATCH 62/69] gawk: remove empty host dependencies
	definition
In-Reply-To: <1467498098-23731-1-git-send-email-julien.floret@6wind.com>
References: <1467498098-23731-1-git-send-email-julien.floret@6wind.com>
Message-ID: <1467498098-23731-63-git-send-email-julien.floret@6wind.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Julien Floret <julien.floret@6wind.com>
---
 package/gawk/gawk.mk | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/package/gawk/gawk.mk b/package/gawk/gawk.mk
index da9be95cd07f..b5b0f8d562af 100644
--- a/package/gawk/gawk.mk
+++ b/package/gawk/gawk.mk
@@ -36,9 +36,6 @@ else
 GAWK_CONF_OPTS += --without-readline
 endif
 
-# We don't have a host-busybox, and we don't want to use readline or mpfr
-HOST_GAWK_DEPENDENCIES =
-
 HOST_GAWK_CONF_OPTS = --without-readline --without-mpfr
 
 define GAWK_CREATE_SYMLINK
-- 
2.1.0
