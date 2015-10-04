From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 4 Oct 2015 15:46:40 +0100
Subject: [Buildroot] [git commit] download: get rid of trailing slash
	removal hack for FOO_SITE
Message-ID: <20151004144644.F199A81D3A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=bf82f70fb69ba5db0e584cd4c8c001763bb39bd4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Not needed anymore since the URLs have been cleared, the manual states
they are illegal and a check has been introduced to notice future
mistakes.

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pkg-generic.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

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
