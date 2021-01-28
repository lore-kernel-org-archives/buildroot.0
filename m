From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 28 Jan 2021 21:00:28 +0100
Subject: [Buildroot] [git commit branch/2020.11.x] package/sslh: systemd
 needs libconfig
Message-ID: <20210128200058.BC649812DF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5bb1a4697bb51376b743b7a3b9e5fbd1cedf8151
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.11.x

systemd-sslh-generator unconditionally uses libconfig

Fixes:
 - http://autobuild.buildroot.org/results/d46581842906f7780f4a3a1ae21963e78e7f5276

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
[yann.morin.1998 at free.fr:
  - select libconfig
  - drop changes in the .mk
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit ab8cb306e0ccd888ecc8344aa533aeab5ad1d3be)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
 
