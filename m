From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 5 Aug 2015 10:40:19 +0200
Subject: [Buildroot] [git commit branch/next] toolchain: add common gcc
	version hidden config options
Message-ID: <20150808105653.68BCA7FE0E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8ba2a76892c5da7ffe86d06ed89d3dc3e7f7e9e8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This commit adds a number of hidden Config.in options, that will be
used to handle dependencies on the gcc version. We mimic the model
that was used for the kernel headers dependency mechanism.

These hidden options will be selected by the internal and external
toolchain backend logic respectively, in follow-up commits.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 toolchain/toolchain-common.in |   44 +++++++++++++++++++++++++++++++++++++++++
 1 files changed, 44 insertions(+), 0 deletions(-)

diff --git a/toolchain/toolchain-common.in b/toolchain/toolchain-common.in
index b7a11a4..4be55c3 100644
--- a/toolchain/toolchain-common.in
+++ b/toolchain/toolchain-common.in
@@ -254,3 +254,47 @@ config BR2_TOOLCHAIN_HEADERS_AT_LEAST
 	default "3.1"  if BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_1
 	default "3.0"  if BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0
 	default "2.6"
+
+config BR2_TOOLCHAIN_GCC_AT_LEAST_4_3
+	bool
+
+config BR2_TOOLCHAIN_GCC_AT_LEAST_4_4
+	bool
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_4_3
+
+config BR2_TOOLCHAIN_GCC_AT_LEAST_4_5
+	bool
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_4_4
+
+config BR2_TOOLCHAIN_GCC_AT_LEAST_4_6
+	bool
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_4_5
+
+config BR2_TOOLCHAIN_GCC_AT_LEAST_4_7
+	bool
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_4_6
+
+config BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+	bool
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_4_7
+
+config BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
+	bool
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+
+config BR2_TOOLCHAIN_GCC_AT_LEAST_5
+	bool
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
+
+# This order guarantees that the highest version is set, as kconfig
+# stops affecting a value on the first matching default.
+config BR2_TOOLCHAIN_GCC_AT_LEAST
+	string
+	default "5"	if BR2_TOOLCHAIN_GCC_AT_LEAST_5
+	default "4.9"	if BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
+	default "4.8"	if BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+	default "4.7"	if BR2_TOOLCHAIN_GCC_AT_LEAST_4_7
+	default "4.6"	if BR2_TOOLCHAIN_GCC_AT_LEAST_4_6
+	default "4.5"	if BR2_TOOLCHAIN_GCC_AT_LEAST_4_5
+	default "4.4"	if BR2_TOOLCHAIN_GCC_AT_LEAST_4_4
+	default "4.3"	if BR2_TOOLCHAIN_GCC_AT_LEAST_4_3
