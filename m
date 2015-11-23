From: Doug Kehn <rdkehn@yahoo.com>
Date: Mon, 23 Nov 2015 07:58:16 -0600
Subject: [Buildroot] [PATCH v5 2/2] toolchain/toolchain-common.in: install
	nscd
In-Reply-To: <1448287096-18606-1-git-send-email-rdkehn@yahoo.com>
References: <1448287096-18606-1-git-send-email-rdkehn@yahoo.com>
Message-ID: <1448287096-18606-3-git-send-email-rdkehn@yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add BR2_GLIBC_NSCD for installing nscd. BR2_GLIBC_NSCD can be used by
other packages (e.g. unscd) to prevent the selection of multiple nscd
packages.

Signed-off-by: Doug Kehn <rdkehn@yahoo.com>
Cc: Yann E. MORIN <yann.morin.1998@free.fr>
--
Changes v4 -> v5
  - No changes.
Changes v3 -> v4
  - Incorporate feedback/suggestions by Yann and Maxime.
Changes v2 -> v3
  - Remove trailing '/' from UNSCD_SITE.
  - Whitespace cleanup.
Changes v1 -> v2
  - Incorporate feedback/suggestions by Yann (from nss-pam-ldapd patch).

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
