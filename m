From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Mar 2014 17:16:52 +0100
Subject: [Buildroot] [git commit] toolchain/external/custom: add choice to
	select 'AT_LEAST_XXX' header version
Message-ID: <20140301193723.4386C9936B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c58bcd5dfb07306788eb210a5d00e9eba89df6fa
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Select the appropriate BR2_TOOLCHAIN_HEADERS_AT_LEAST_XXX options for the
external, custom toolchain backend.

We try to be conservative here, and default to kernel headers 2.6.x.

[Thomas: remove duplicated depends on BR2_TOOLCHAIN_EXTERNAL_CUSTOM,
since the choice is already inside a if BR2_TOOLCHAIN_EXTERNAL_CUSTOM
... endif block.]

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/toolchain-external/Config.in |   78 ++++++++++++++++++++++++++++++++
 1 files changed, 78 insertions(+), 0 deletions(-)

diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index 5981ef2..7ad46c3 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -945,6 +945,84 @@ config BR2_TOOLCHAIN_EXTERNAL_MUSL
 if BR2_TOOLCHAIN_EXTERNAL_CUSTOM
 
 choice
+	bool "External toolchain kernel headers series"
+	default BR2_TOOLCHAIN_EXTERNAL_HEADERS_REALLY_OLD
+	help
+	  Set to the kernel headers version that were used to build
+	  this external toolchain.
+
+	  This is used to hide/show some packages that have strict
+	  requirements on the version of kernel headers.
+
+	  If unsure what version your toolchain is using, you can look
+	  at the value of LINUX_VERSION_CODE in linux/version.h in your
+	  toolchain. The Linux version is M.m.p, with:
+	    M = ( LINUX_VERSION_CODE >> 16 ) & 0xFF
+	    m = ( LINUX_VERSION_CODE >> 8  ) & 0xFF
+	    p = ( LINUX_VERSION_CODE >> 0  ) & 0xFF
+
+config BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_13
+	bool "3.13.x"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_13
+
+config BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_12
+	bool "3.12.x"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12
+
+config BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_11
+	bool "3.11.x"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_11
+
+config BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_10
+	bool "3.10.x"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_10
+
+config BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_9
+	bool "3.9.x"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_9
+
+config BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_8
+	bool "3.8.x"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_8
+
+config BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_7
+	bool "3.7.x"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_7
+
+config BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_6
+	bool "3.6.x"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_6
+
+config BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_5
+	bool "3.5.x"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_5
+
+config BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_4
+	bool "3.4.x"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_4
+
+config BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_3
+	bool "3.3.x"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_3
+
+config BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_2
+	bool "3.2.x"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_2
+
+config BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_1
+	bool "3.1.x"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_1
+
+config BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_0
+	bool "3.0.x"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0
+
+config BR2_TOOLCHAIN_EXTERNAL_HEADERS_REALLY_OLD
+	bool "2.6.x"
+
+endchoice
+
+choice
 	prompt "External toolchain C library"
 	default BR2_TOOLCHAIN_EXTERNAL_CUSTOM_UCLIBC
 
