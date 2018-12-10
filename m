From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Mon, 10 Dec 2018 22:01:28 +0100
Subject: [Buildroot] [git commit] package/cryptopp: purge trailing '/' from
 CRYPTOPP_SITE
Message-ID: <20181210205813.14949840EC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ddcf8452502e25d7877c8214969691a7ee5889ca
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

<PKG>_SITE cannot have a trailing slash.

This was not detected by the check in generic-package because it is a
host-only package without Config.in symbol.

Signed-off-by: Carlos Santos <casantos@datacom.com.br>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/cryptopp/cryptopp.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/cryptopp/cryptopp.mk b/package/cryptopp/cryptopp.mk
index 08b18f2fbc..bc1f5a87a2 100644
--- a/package/cryptopp/cryptopp.mk
+++ b/package/cryptopp/cryptopp.mk
@@ -6,7 +6,7 @@
 
 CRYPTOPP_VERSION = 7.0.0
 CRYPTOPP_SOURCE = cryptopp$(subst .,,$(CRYPTOPP_VERSION)).zip
-CRYPTOPP_SITE = http://cryptopp.com/
+CRYPTOPP_SITE = http://cryptopp.com
 CRYPTOPP_LICENSE = BSL-1.0
 CRYPTOPP_LICENSE_FILES = License.txt
 CRYPTOPP_INSTALL_STAGING = YES
