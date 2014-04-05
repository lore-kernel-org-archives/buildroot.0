From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat,  5 Apr 2014 17:21:57 +0200
Subject: [Buildroot] [PATCH 20/21] virtual-package: fake a version string
	for virtual packages
In-Reply-To: <cover.1396711074.git.yann.morin.1998@free.fr>
References: <cover.1396711074.git.yann.morin.1998@free.fr>
Message-ID: <e3fdd05cf4bf3867afc6d37d3f505aeede8c670b.1396711074.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Reviewed-by: Samuel Martin <s.martin49@gmail.com>
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
