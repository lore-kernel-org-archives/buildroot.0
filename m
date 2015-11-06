From: Doug Kehn <rdkehn@yahoo.com>
Date: Fri,  6 Nov 2015 09:19:47 -0600
Subject: [Buildroot] [PATCH v4 2/2] toolchain/toolchain-common.in: install
	nscd
In-Reply-To: <1446823187-7878-1-git-send-email-rdkehn@yahoo.com>
References: <1446823187-7878-1-git-send-email-rdkehn@yahoo.com>
Message-ID: <1446823187-7878-3-git-send-email-rdkehn@yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add BR2_GLIBC_NSCD for installing nscd. BR2_GLIBC_NSCD can be used by
other packages (e.g. unscd) to prevent the selection of multiple nscd
packages.

Cc: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Doug Kehn <rdkehn@yahoo.com>
---
 toolchain/toolchain-common.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/toolchain/toolchain-common.in b/toolchain/toolchain-common.in
index 6871d8b..a119c9c 100644
--- a/toolchain/toolchain-common.in
+++ b/toolchain/toolchain-common.in
@@ -136,6 +136,10 @@ config BR2_ECLIPSE_REGISTER
 	  configuration files to make your toolchain appear within
 	  Eclipse, through the Eclipse Buildroot plugin.
 
+config BR2_GLIBC_NSCD
+	bool "Install nscd"
+	depends on BR2_TOOLCHAIN_USES_GLIBC
+
 # Options for packages to depend on, if they require at least a
 # specific version of the kernel headers.
 # Toolchains should choose the adequate option (ie. the highest
-- 
2.6.2
