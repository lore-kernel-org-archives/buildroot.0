From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 24 Jun 2020 21:57:43 +0200
Subject: [Buildroot] [git commit] toolchain/Config.in: add
 BR2_TOOLCHAIN_GCC_AT_LEAST_10 blind option
Message-ID: <20200624195532.EB98F83FD0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7f834a9fbcd75755e15847b3b0af273acd382d47
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In order to add gcc 10 support for internal and external toolchain in
follow-up commits, introduce BR2_TOOLCHAIN_GCC_AT_LEAST_10 symbol.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 toolchain/Config.in | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/toolchain/Config.in b/toolchain/Config.in
index 6865199ffc..83f5286701 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -591,10 +591,15 @@ config BR2_TOOLCHAIN_GCC_AT_LEAST_9
 	bool
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_8
 
+config BR2_TOOLCHAIN_GCC_AT_LEAST_10
+	bool
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_9
+
 # This order guarantees that the highest version is set, as kconfig
 # stops affecting a value on the first matching default.
 config BR2_TOOLCHAIN_GCC_AT_LEAST
 	string
+	default "10"	if BR2_TOOLCHAIN_GCC_AT_LEAST_10
 	default "9"	if BR2_TOOLCHAIN_GCC_AT_LEAST_9
 	default "8"	if BR2_TOOLCHAIN_GCC_AT_LEAST_8
 	default "7"	if BR2_TOOLCHAIN_GCC_AT_LEAST_7
