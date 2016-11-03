From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu,  3 Nov 2016 23:21:05 +0100
Subject: [Buildroot] [PATCH 1/4] package/pseudo: needs sqlite
In-Reply-To: <cover.1478211656.git.yann.morin.1998@free.fr>
References: <cover.1478211656.git.yann.morin.1998@free.fr>
Message-ID: <66a2e2ef68a1edaaaee0d92c60279cc8b2e5325b.1478211656.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

pseudo uses sqlite to store its state.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/pseudo/pseudo.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/pseudo/pseudo.mk b/package/pseudo/pseudo.mk
index 314fa82..ffa6e58 100644
--- a/package/pseudo/pseudo.mk
+++ b/package/pseudo/pseudo.mk
@@ -12,4 +12,9 @@ PSEUDO_SITE_METHOD = git
 PSEUDO_LICENSE = LGPLv2.1
 PSEUDO_LICENSE_FILES = COPYING
 
+HOST_PSEUDO_DEPENDENCIES = host-sqlite
+HOST_PSEUDO_CONF_OPTS = \
+	--libdir=$(HOST_DIR)/usr/lib \
+	--with-sqlite=$(HOST_DIR)/usr
+
 $(eval $(host-autotools-package))
-- 
2.7.4
