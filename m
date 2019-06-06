From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 6 Jun 2019 14:23:08 +0200
Subject: [Buildroot] [git commit branch/2019.02.x] toolchain: gcc bug 85180
 is fixed in gcc >= 8.x
Message-ID: <20190606124825.CF00983A8D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a421e81f3953cec167fabbf9300395aca8975202
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Gcc bug 85180 (https://gcc.gnu.org/bugzilla/show_bug.cgi?id=85180) has
been fixed on Gcc version >= 8.x, so this commit adjusts the
BR2_TOOLCHAIN_HAS_GCC_BUG_85180 option to no longer be true when the
gcc version is >= 8.x.

Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
Reviewed-by: Petr Vorel <petr.vorel@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit a94dd1ce9c48a079bfa22c0af718a00a6b4ba237)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 toolchain/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/toolchain/Config.in b/toolchain/Config.in
index bcbc3cf984..87d7bc30bb 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -129,6 +129,7 @@ config BR2_TOOLCHAIN_HAS_GCC_BUG_64735
 config BR2_TOOLCHAIN_HAS_GCC_BUG_85180
 	bool
 	default y if BR2_microblaze
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_8
 
 # https://gcc.gnu.org/bugzilla/show_bug.cgi?id=85862
 # An infinite loop exists in the find_base_term() logic of 6.x
