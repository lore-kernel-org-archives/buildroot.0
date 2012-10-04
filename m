From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 4 Oct 2012 22:20:37 +0200
Subject: [Buildroot] [git commit] external-toolchain:
	BR2_TOOLCHAIN_EXTERNAL_GLIBC includes eglibc
Message-ID: <20121004205123.0C4DD997BD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=96688934c471d81197ebf0e19c72bba8fa5feb2e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Yann E. MORIN says:

    "Although eglibc can be configured to include/exclude parts of the
    features, it seems to not be in wide use, if at all."

Acked-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: Luca Ceresoli <luca@lucaceresoli.net>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/toolchain-external/Config.in |    7 ++++++-
 1 files changed, 6 insertions(+), 1 deletions(-)

diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index 94ae735..105fb2a 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -692,8 +692,13 @@ config BR2_TOOLCHAIN_EXTERNAL_CUSTOM_UCLIBC
 	select BR2_TOOLCHAIN_HAS_SHADOW_PASSWORDS
 
 config BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC
-	bool "glibc"
+	bool "glibc/eglibc"
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
+	help
+	  Note: eglibc is a variant of glibc that (among other things) can be
+	  configured to exclude some of its features. Using a toolchain with
+	  eglibc configured to exclude key features may cause build failures to
+	  some packages.
 
 endchoice
 
