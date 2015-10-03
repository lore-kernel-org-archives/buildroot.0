From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Sat,  3 Oct 2015 19:22:18 +0200
Subject: [Buildroot] [PATCH v4 3/3] download: get rid of trailing slash
	removal hack for FOO_SITE
In-Reply-To: <1443892938-17039-1-git-send-email-luca@lucaceresoli.net>
References: <1443892938-17039-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <1443892938-17039-4-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Not needed anymore since the URLs have been cleared, the manual states
they are illegal and a check has been introduced to notice future
mistakes.

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>

---
No changes in v4.

Changes v2 -> v3:
 - move after the commit on docs/manual, update commit message.

Changes v1 -> v2:
 - redo on current master.
---
 package/pkg-generic.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index de2fb07..3942a89 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -388,7 +388,7 @@ endif
 $(2)_ALL_DOWNLOADS = \
 	$$(foreach p,$$($(2)_SOURCE) $$($(2)_PATCH) $$($(2)_EXTRA_DOWNLOADS),\
 		$$(if $$(findstring ://,$$(p)),$$(p),\
-			$$($(2)_SITE:/=)/$$(p)))
+			$$($(2)_SITE)/$$(p)))
 
 ifndef $(2)_SITE
  ifdef $(3)_SITE
-- 
1.9.1
