From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  2 Mar 2014 17:52:59 +0100
Subject: [Buildroot] [PATCH 18/19] virtual-package: fake a version string
	for virtual packages
In-Reply-To: <cover.1393778339.git.yann.morin.1998@free.fr>
References: <cover.1393778339.git.yann.morin.1998@free.fr>
Message-ID: <1fcbf6258bbcfb24e532453e8970fc57e1e4b2d0.1393778339.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pkg-virtual.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/pkg-virtual.mk b/package/pkg-virtual.mk
index 9b206ea..617e5f2 100644
--- a/package/pkg-virtual.mk
+++ b/package/pkg-virtual.mk
@@ -44,6 +44,10 @@ endif
 # A virtual package does not have any source associated
 $(2)_SOURCE =
 
+# Fake a version string, so it looks nicer in the build log
+$(3)_VERSION = virtual
+HOST_$(3)_VERSION = virtual
+
 # This must be repeated from inner-generic-package, otherwise we get an empty
 # _DEPENDENCIES
 $(2)_DEPENDENCIES ?= $(filter-out host-toolchain $(1),\
-- 
1.8.3.2
