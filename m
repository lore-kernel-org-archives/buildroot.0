From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 16 Feb 2014 18:27:20 +0100
Subject: [Buildroot] [PATCH 01/10] toolchain/common: add minimum kernel
	headers options
In-Reply-To: <cover.1392571021.git.yann.morin.1998@free.fr>
References: <cover.1392571021.git.yann.morin.1998@free.fr>
Message-ID: <be10daa58b2684239e80484fad4fe0bba433eea8.1392571021.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

We now have quite a few packages that depend on the kernel headers to be
at least a certain version. For example, dvb-apps requires at least the
3.3 kernel headers.

Add a set of options that packages can depend on, to check that the kernel
headers match their required version.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>

---
Notes:
1. We only add those versions already in the internal backend choice,
on the assumption that we won't have a package that depends on headers
older than the ones we provide ourselves in our internal backend.

This may pose a problem if the user selects (eg.) 2.6.39 as a custom
version, and a package would work with those headers. But since we only
start with 3.0, the package would not be selectable.

2. This does not address the format of the comment for when a package
depends on a specific kernel headers, to come in a following patch.

3. This is not used for now, but will be in the following patches.
---
 toolchain/toolchain-common.in | 59 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/toolchain/toolchain-common.in b/toolchain/toolchain-common.in
index 8435a65..f0785a2 100644
--- a/toolchain/toolchain-common.in
+++ b/toolchain/toolchain-common.in
@@ -107,3 +107,62 @@ config BR2_ECLIPSE_REGISTER
 	  This options tells Buildroot to generate the necessary
 	  configuration files to make your toolchain appear within
 	  Eclipse, through the Eclipse Buildroot plugin.
+
+# Options for packages to depend on, if they require at least a
+# specific version of the kernel headers.
+# Toolchains should choose the adequate option (ie. the highest
+# version, not all of them).
+config BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0
+	bool
+
+config BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_1
+	bool
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0
+
+config BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_2
+	bool
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_1
+
+config BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_3
+	bool
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_2
+
+config BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_4
+	bool
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_3
+
+config BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_5
+	bool
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_4
+
+config BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_6
+	bool
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_5
+
+config BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_7
+	bool
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_6
+
+config BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_8
+	bool
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_7
+
+config BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_9
+	bool
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_8
+
+config BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_10
+	bool
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_9
+
+config BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_11
+	bool
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_10
+
+config BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12
+	bool
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_11
+
+config BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_13
+	bool
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12
-- 
1.8.1.2
