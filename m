From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon,  3 Mar 2014 23:10:23 +0100
Subject: [Buildroot] [PATCH 4/7] package/zic: install header
In-Reply-To: <cover.1393884458.git.yann.morin.1998@free.fr>
References: <cover.1393884458.git.yann.morin.1998@free.fr>
Message-ID: <ea469bd003d287011efcd1a8791628b0445aa85d.1393884458.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

The incoming host-tzdump package requires the tzfile header,
so we isntall it.

Signed-off-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>
[yann.morin.1998 at free.fr: split zic header-install to its own cset]
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/zic/zic.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/zic/zic.mk b/package/zic/zic.mk
index c9b6c7b..4814fba 100644
--- a/package/zic/zic.mk
+++ b/package/zic/zic.mk
@@ -22,6 +22,8 @@ endef
 define HOST_ZIC_INSTALL_CMDS
 	mkdir -p $(HOST_DIR)/usr/sbin
 	install -D -m 755 $(@D)/zic $(HOST_DIR)/usr/sbin/zic
+	mkdir -p $(HOST_DIR)/usr/include
+	install -D -m 644 $(@D)/tzfile.h $(HOST_DIR)/usr/include/tzfile.h
 endef
 
 $(eval $(host-generic-package))
-- 
1.8.3.2
