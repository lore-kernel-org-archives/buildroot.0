From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Thu, 23 Feb 2017 18:00:33 +0100
Subject: [Buildroot] [PATCH 11/25] luacrypto: remove default definition of
	PKG_SUBDIR
In-Reply-To: <20170223170047.24417-1-arnout@mind.be>
References: <20170223170047.24417-1-arnout@mind.be>
Message-ID: <20170223170047.24417-12-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The luarocks infra already provides the correct default value for
PKG_SUBDIR, so it doesn't have to be defined in the .mk file.

Therefore, _VERSION_UPSTREAM doesn't need to be defined either.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/luacrypto/luacrypto.mk | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/package/luacrypto/luacrypto.mk b/package/luacrypto/luacrypto.mk
index b0e972c629..b6dbb9999f 100644
--- a/package/luacrypto/luacrypto.mk
+++ b/package/luacrypto/luacrypto.mk
@@ -4,9 +4,7 @@
 #
 ################################################################################
 
-LUACRYPTO_VERSION_UPSTREAM = 0.3.2
-LUACRYPTO_VERSION = $(LUACRYPTO_VERSION_UPSTREAM)-1
-LUACRYPTO_SUBDIR = luacrypto-$(LUACRYPTO_VERSION_UPSTREAM)
+LUACRYPTO_VERSION = 0.3.2-1
 LUACRYPTO_LICENSE = MIT
 LUACRYPTO_LICENSE_FILES = $(LUACRYPTO_SUBDIR)/COPYING
 LUACRYPTO_DEPENDENCIES = openssl
-- 
2.11.0
