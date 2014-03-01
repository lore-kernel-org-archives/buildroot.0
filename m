From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Mar 2014 17:15:09 +0100
Subject: [Buildroot] [git commit] toolchain/common: add minimum kernel
	headers options
Message-ID: <20140301193723.2684896DFF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b155f5a5ab321b06df1c5d5f5e104438e8288cf8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We now have quite a few packages that depend on the kernel headers to be
at least a certain version. For example, dvb-apps requires at least the
3.3 kernel headers.

Add a set of options that packages can depend on, to check that the kernel
headers match their required version.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/toolchain-common.in |   59 +++++++++++++++++++++++++++++++++++++++++
 1 files changed, 59 insertions(+), 0 deletions(-)

diff --git a/toolchain/toolchain-common.in b/toolchain/toolchain-common.in
index c4e3890..01bb39f 100644
--- a/toolchain/toolchain-common.in
+++ b/toolchain/toolchain-common.in
@@ -110,3 +110,62 @@ config BR2_ECLIPSE_REGISTER
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
