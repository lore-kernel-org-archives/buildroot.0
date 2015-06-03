From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed,  3 Jun 2015 22:41:27 +0200
Subject: [Buildroot] [PATCH 10/32 v2] package/matchbox: remove superfluous
	conditional includes
In-Reply-To: <cover.1433362840.git.yann.morin.1998@free.fr>
References: <cover.1433362840.git.yann.morin.1998@free.fr>
Message-ID: <7d5a05ffa169cc16e9947245e76fc8d9140f7e21.1433362840.git.yann.morin.1998@free.fr>
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
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
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
