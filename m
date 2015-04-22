From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 22 Apr 2015 20:09:21 +0200
Subject: [Buildroot] [PATCH 10/30] package/matchbox: remove superfluous
	conditional includes
In-Reply-To: <cover.1429725549.git.yann.morin.1998@free.fr>
References: <cover.1429725549.git.yann.morin.1998@free.fr>
Message-ID: <71ea29cc98ad7d3f0278f14b50837784776b12ca.1429725549.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Now that the matchbox package no longer forcibly add entries to the
PACKAGES list, and entirely relies on having proper packages, we can
safely include all matchbox sub-packages .mk files, and the pkg-infra
will take care of building only those that are enabled.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/matchbox/matchbox.mk | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/matchbox/matchbox.mk b/package/matchbox/matchbox.mk
index 17d89d8..ae989b3 100644
--- a/package/matchbox/matchbox.mk
+++ b/package/matchbox/matchbox.mk
@@ -1,3 +1 @@
-ifeq ($(BR2_PACKAGE_MATCHBOX),y)
 include $(sort $(wildcard package/matchbox/*/*.mk))
-endif
-- 
1.9.1
