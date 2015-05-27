From: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
Date: Wed, 27 May 2015 17:17:05 -0500
Subject: [Buildroot] [PATCH v6 01/22] sqlite: Add host build support
In-Reply-To: <1432765046-1223-1-git-send-email-clayton.shotwell@rockwellcollins.com>
References: <1432765046-1223-1-git-send-email-clayton.shotwell@rockwellcollins.com>
Message-ID: <1432765046-1223-2-git-send-email-clayton.shotwell@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Host sqlite is required by the host build of the setools package which
is required for SELinux support.

Signed-off-by: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>

---
Changes v5 -> v6:
  - No changes

Changes v4 -> v5:
  - No changes
---
 package/sqlite/sqlite.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/sqlite/sqlite.mk b/package/sqlite/sqlite.mk
index b2283f0..4d74625 100644
--- a/package/sqlite/sqlite.mk
+++ b/package/sqlite/sqlite.mk
@@ -53,3 +53,4 @@ SQLITE_CONF_OPTS += --disable-readline
 endif
 
 $(eval $(autotools-package))
+$(eval $(host-autotools-package))
-- 
1.9.1
