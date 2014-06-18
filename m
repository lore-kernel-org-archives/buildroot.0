From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 18 Jun 2014 23:59:47 +0200
Subject: [Buildroot] [git commit] pax-utils: needs largefile support
Message-ID: <20140618220023.78BF69D047@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=39e4bf8abba9c9d2f308019b029ced1faa2f9350
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/2f8/2f833cc285eac99daba96949b9601f4e64b6f6be/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pax-utils/Config.in |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/pax-utils/Config.in b/package/pax-utils/Config.in
index 58100e4..2591e2f 100644
--- a/package/pax-utils/Config.in
+++ b/package/pax-utils/Config.in
@@ -1,7 +1,11 @@
 config BR2_PACKAGE_PAX_UTILS
 	bool "pax-utils"
+	depends on BR2_LARGEFILE
 	help
 	  ELF related utils for ELF 32/64 binaries that can check files
 	  for security relevant properties.
 
 	  http://www.gentoo.org/proj/en/hardened/pax-utils.xml
+
+comment "pax-utils needs a toolchain w/ largefile"
+	depends on !BR2_LARGEFILE
