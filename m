From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 14 May 2009 19:25:24 +0200
Subject: [Buildroot] [PATCH 2/5] gamin: only enable python support if enabled
In-Reply-To: <1242321927-10185-1-git-send-email-jacmet@sunsite.dk>
References: <1242321927-10185-1-git-send-email-jacmet@sunsite.dk>
Message-ID: <1242321927-10185-2-git-send-email-jacmet@sunsite.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Sven Neumann <s.neumann@raumfeld.com>

Closes #295.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/gamin/gamin.mk |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/gamin/gamin.mk b/package/gamin/gamin.mk
index f0a2a1f..180d89e 100644
--- a/package/gamin/gamin.mk
+++ b/package/gamin/gamin.mk
@@ -12,6 +12,10 @@ GAMIN_INSTALL_TARGET = YES
 
 GAMIN_CONF_OPT = --program-prefix="" --disable-debug
 
+ifneq ($(BR2_PACKAGE_PYTHON),y)
+GAMIN_CONF_OPT += --without-python
+endif
+
 GAMIN_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
 
 GAMIN_CONF_ENV = have_abstract_sockets=no
-- 
1.6.2
