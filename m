From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Wed, 10 Aug 2011 00:12:55 +0200
Subject: [Buildroot] [PATCH 22/22] radvd: remove --program-prefix
In-Reply-To: <1312927975-15543-1-git-send-email-yann.morin.1998@anciens.enib.fr>
References: <1312927975-15543-1-git-send-email-yann.morin.1998@anciens.enib.fr>
Message-ID: <1312927975-15543-22-git-send-email-yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

--program-prefix is now set in the auto-target infrastructure.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@anciens.enib.fr>
---
 package/radvd/radvd.mk |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/package/radvd/radvd.mk b/package/radvd/radvd.mk
index fe8be5d..6b7468a 100644
--- a/package/radvd/radvd.mk
+++ b/package/radvd/radvd.mk
@@ -7,7 +7,6 @@ RADVD_VERSION:=1.6
 RADVD_SOURCE:=radvd-$(RADVD_VERSION).tar.gz
 RADVD_SITE:=http://www.litech.org/radvd/dist/
 RADVD_DEPENDENCIES:=flex host-flex
-RADVD_CONF_OPT:= --program-prefix=''
 
 define RADVD_INSTALL_INITSCRIPT
 	$(INSTALL) -m 0755 package/radvd/S50radvd $(TARGET_DIR)/etc/init.d
-- 
1.7.2.5
