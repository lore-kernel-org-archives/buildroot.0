From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 23 Dec 2009 13:40:56 +0100
Subject: [Buildroot] [git commit master] neon: fix ssl option dependency
Message-ID: <20091223124148.EA0A5777F2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=b21c77cc08eb8604011d1df6ac405fdacb46d1ad
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Thanks to Gustavo Zacarias for noticing.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/neon/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/neon/Config.in b/package/neon/Config.in
index 318e4c6..5ebd64d 100644
--- a/package/neon/Config.in
+++ b/package/neon/Config.in
@@ -14,6 +14,7 @@ config BR2_PACKAGE_NEON_ZLIB
 
 config BR2_PACKAGE_NEON_SSL
 	bool "SSL support"
+	depends on BR2_PACKAGE_NEON
 	select BR2_PACKAGE_OPENSSL
 	help
 	  build with SSL support
-- 
1.6.3.3
