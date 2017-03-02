From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 2 Mar 2017 22:47:56 +0100
Subject: [Buildroot] [git commit] luacrypto: remove default definition of
	PKG_SUBDIR
Message-ID: <20170302215348.653ED80468@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4709f7bd568931772483fb78d13d5a0a1a6b914f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The luarocks infra already provides the correct default value for
PKG_SUBDIR, so it doesn't have to be defined in the .mk file.

Therefore, _VERSION_UPSTREAM doesn't need to be defined either.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/luacrypto/luacrypto.mk | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/package/luacrypto/luacrypto.mk b/package/luacrypto/luacrypto.mk
index b0e972c..b6dbb99 100644
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
