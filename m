From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 26 Jan 2021 18:18:04 +0100
Subject: [Buildroot] [git commit] package/sslh: systemd needs libconfig
Message-ID: <20210126170356.C073B8101A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ab8cb306e0ccd888ecc8344aa533aeab5ad1d3be
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

systemd-sslh-generator unconditionally uses libconfig

Fixes:
 - http://autobuild.buildroot.org/results/d46581842906f7780f4a3a1ae21963e78e7f5276

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
[yann.morin.1998 at free.fr:
  - select libconfig
  - drop changes in the .mk
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/sslh/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/sslh/Config.in b/package/sslh/Config.in
index e608586c27..f6b46f3218 100644
--- a/package/sslh/Config.in
+++ b/package/sslh/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_SSLH
 	bool "sslh"
-	# uses fork()
-	depends on BR2_USE_MMU
+	depends on BR2_USE_MMU # fork()
+	select BR2_PACKAGE_LIBCONFIG if BR2_PACKAGE_SYSTEMD
 	help
 	  Applicative protocol multiplexer
 
