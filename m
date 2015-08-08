From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 08 Aug 2015 10:56:24 -0000
Subject: [Buildroot] [git commit branch/next] tor: needs thread support
Message-ID: <20150808105615.EA3BF7FB5A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=49565a282ad6a9f6f04a184407ce04f9c4772e9c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Fixes:

  http://autobuild.buildroot.org/results/4f7/4f758978f6820ecceaad57385f3c104011180c4d/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/tor/Config.in |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/package/tor/Config.in b/package/tor/Config.in
index d44bd9f..3400dce 100644
--- a/package/tor/Config.in
+++ b/package/tor/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_TOR
 	bool "tor"
 	depends on BR2_USE_MMU # fork()
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_LIBEVENT
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_ZLIB
@@ -12,3 +13,7 @@ config BR2_PACKAGE_TOR
 	  state security.
 
 	  https://www.torproject.org
+
+comment "tor needs a toolchain w/ threads"
+	depends on BR2_USE_MMU
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
