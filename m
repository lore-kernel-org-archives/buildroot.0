From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 13 Nov 2020 23:43:47 +0100
Subject: [Buildroot] [git commit branch/2020.08.x] package/bitcoin: set
 BITCOIN_GENBUILD_NO_GIT
Message-ID: <20201113224710.9000081954@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=66928a8cf72c611c62864d7b9103ea5563e3d4ba
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.08.x

Set BITCOIN_GENBUILD_NO_GIT to not include (Buildroot) git version info in
build, which is available since version 0.15.0 and
https://github.com/bitcoin/bitcoin/commit/e98e3dde6a976a2c8f266ee963d6931fd4b37262

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 82d6abda1a84a2fc126af0bbda532bd545073c0e)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/bitcoin/bitcoin.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/bitcoin/bitcoin.mk b/package/bitcoin/bitcoin.mk
index d5e3973d9c..9d2094c02c 100644
--- a/package/bitcoin/bitcoin.mk
+++ b/package/bitcoin/bitcoin.mk
@@ -10,6 +10,7 @@ BITCOIN_AUTORECONF = YES
 BITCOIN_LICENSE = MIT
 BITCOIN_LICENSE_FILES = COPYING
 BITCOIN_DEPENDENCIES = host-pkgconf boost libevent
+BITCOIN_MAKE_ENV = BITCOIN_GENBUILD_NO_GIT=1
 BITCOIN_CONF_OPTS = \
 	--disable-bench \
 	--disable-wallet \
