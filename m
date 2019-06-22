From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 22 Jun 2019 21:31:49 +0200
Subject: [Buildroot] [git commit] toolchain: add gcc 9 entry
Message-ID: <20190622194127.EFA898165D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c389e162784d49b731f4aec5dedcc87e7583cbda
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In order to add gcc 9 support for internal and external toolchain in
follow-up commits, introduce BR2_TOOLCHAIN_GCC_AT_LEAST_9 symbol.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 toolchain/Config.in | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/toolchain/Config.in b/toolchain/Config.in
index 82d2658a1d..db3ce3cf24 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -521,10 +521,15 @@ config BR2_TOOLCHAIN_GCC_AT_LEAST_8
 	bool
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_7
 
+config BR2_TOOLCHAIN_GCC_AT_LEAST_9
+	bool
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_8
+
 # This order guarantees that the highest version is set, as kconfig
 # stops affecting a value on the first matching default.
 config BR2_TOOLCHAIN_GCC_AT_LEAST
 	string
+	default "9"	if BR2_TOOLCHAIN_GCC_AT_LEAST_9
 	default "8"	if BR2_TOOLCHAIN_GCC_AT_LEAST_8
 	default "7"	if BR2_TOOLCHAIN_GCC_AT_LEAST_7
 	default "6"	if BR2_TOOLCHAIN_GCC_AT_LEAST_6
