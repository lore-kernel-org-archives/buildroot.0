From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Wed, 10 Aug 2011 00:12:53 +0200
Subject: [Buildroot] [PATCH 20/22] tcpreplay: remove --program-prefix
In-Reply-To: <1312927975-15543-1-git-send-email-yann.morin.1998@anciens.enib.fr>
References: <1312927975-15543-1-git-send-email-yann.morin.1998@anciens.enib.fr>
Message-ID: <1312927975-15543-20-git-send-email-yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

--program-prefix is now set in the auto-target infrastructure.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@anciens.enib.fr>
---
 package/tcpreplay/tcpreplay.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/tcpreplay/tcpreplay.mk b/package/tcpreplay/tcpreplay.mk
index f82867c..296f4eb 100644
--- a/package/tcpreplay/tcpreplay.mk
+++ b/package/tcpreplay/tcpreplay.mk
@@ -7,7 +7,7 @@
 TCPREPLAY_VERSION = 3.4.3
 TCPREPLAY_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/tcpreplay
 TCPREPLAY_CONF_ENV = tr_cv_libpcap_version=">= 0.7.0"
-TCPREPLAY_CONF_OPT = --program-prefix="" --with-libpcap=$(STAGING_DIR)/usr
+TCPREPLAY_CONF_OPT = --with-libpcap=$(STAGING_DIR)/usr
 
 TCPREPLAY_DEPENDENCIES = uclibc libpcap
 
-- 
1.7.2.5
