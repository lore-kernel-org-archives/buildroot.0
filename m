From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 22 Aug 2010 12:51:58 +0200
Subject: [Buildroot] [PATCH 06/20] Mark CRIS architecture as deprecated
In-Reply-To: <cover.1282471311.git.thomas.petazzoni@free-electrons.com>
References: <cover.1282471311.git.thomas.petazzoni@free-electrons.com>
Message-ID: <e5621b427c9c923bffdeeb5f568eb7abb36c109b.1282471311.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The CRIS architecture support in Buildroot hasn't been updated since a
long time. Even a toolchain with recent kernel headers does not build
due to missing patches.

Moreover, the CRIS architecture has been discontinued by Axis, as
visible at http://www.axis.com/products/dev/index.htm. We will remove
it from Buildroot at the next release cycle.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 target/Config.in.arch |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/target/Config.in.arch b/target/Config.in.arch
index d3a4025..ce64068 100644
--- a/target/Config.in.arch
+++ b/target/Config.in.arch
@@ -22,6 +22,11 @@ config BR2_avr32
 	select BR2_SOFT_FLOAT
 config BR2_cris
 	bool "cris"
+	# The CRIS architecture from Axis has been deprecated by the
+	# manufacturer. No units are sold after July 2010, and support
+	# will end in July 2011. Moreover, CRIS support in Buildroot
+	# has not been updated since a long time.
+	depends on BR2_DEPRECATED
 config BR2_ia64
 	bool "ia64"
 	# IA64 almost does not exist anymore and has never been used
-- 
1.7.0.4
