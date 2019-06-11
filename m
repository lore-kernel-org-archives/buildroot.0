From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Tue, 11 Jun 2019 12:29:50 +0200
Subject: [Buildroot] [PATCH v3 08/15] package/gcc: switch to gcc 8.x as the
 default
In-Reply-To: <20190611102957.7145-1-giulio.benetti@micronovasrl.com>
References: <20190611102957.7145-1-giulio.benetti@micronovasrl.com>
Message-ID: <20190611102957.7145-9-giulio.benetti@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Romain Naour <romain.naour@gmail.com>

Even if gcc 7 is still maintained for some time (gcc 7.5 is pending),
switch to gcc 8.x since it has been released since 2018-05-02 and
gcc 9.x is available since 2019-05-03.

We have been having toolchains in the autobuilders with gcc
8.x for a while, so the vast majority of the problems should have
already been solved.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
---
v3: rebase patch on top of master branch sha1:
    04efb17c863606cdbc2405d01c3d48d6868c5245
---
 package/gcc/Config.in.host | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index 80eb68be62..f27ca4635f 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -5,7 +5,7 @@ choice
 	default BR2_GCC_VERSION_ARC if BR2_arc
 	default BR2_GCC_VERSION_CSKY if BR2_csky
 	default BR2_GCC_VERSION_OR1K if BR2_or1k
-	default BR2_GCC_VERSION_7_X
+	default BR2_GCC_VERSION_8_X
 	help
 	  Select the version of gcc you wish to use.
 
-- 
2.17.1
