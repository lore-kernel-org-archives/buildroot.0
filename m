From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Sun, 27 Sep 2015 11:39:23 +0200
Subject: [Buildroot] [PATCH v2 3/4] Download: remove trailing slash cleanup
	for SITE URLs
In-Reply-To: <1443346764-7433-1-git-send-email-luca@lucaceresoli.net>
References: <1443346764-7433-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <1443346764-7433-4-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Not needed anymore since the URLs have been cleared and a check has been
introduced to notice future mistakes.

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>

---

Changes v1 -> v2:
 - redo on current master.
---
 package/pkg-generic.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 5ec2f807b137..f7b628314960 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -390,7 +390,7 @@ endif
 $(2)_ALL_DOWNLOADS = \
 	$$(foreach p,$$($(2)_SOURCE) $$($(2)_PATCH) $$($(2)_EXTRA_DOWNLOADS),\
 		$$(if $$(findstring ://,$$(p)),$$(p),\
-			$$($(2)_SITE:/=)/$$(p)))
+			$$($(2)_SITE)/$$(p)))
 
 ifndef $(2)_SITE
  ifdef $(3)_SITE
-- 
1.9.1
