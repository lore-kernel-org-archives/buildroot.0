From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 4 Aug 2014 18:29:40 +0200
Subject: [Buildroot] [git commit] m2tools: fix MIA comment dependencies
Message-ID: <20140804163002.EB4369D3A4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=98a18ea01d7ea3f69bf5c44d48358dd110764c9c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/e2tools/Config.in |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/e2tools/Config.in b/package/e2tools/Config.in
index 13e2118..2baf580 100644
--- a/package/e2tools/Config.in
+++ b/package/e2tools/Config.in
@@ -14,4 +14,6 @@ config BR2_PACKAGE_E2TOOLS
 	  https://github.com/ndim/e2tools
 
 comment "e2tools needs a toolchain w/ threads, largefile and wchar"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_LARGEFILE || \
+		!BR2_USE_WCHAR
+	depends on BR2_USE_MMU
