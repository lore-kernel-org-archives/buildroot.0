From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 8 Jun 2019 21:49:57 +0200
Subject: [Buildroot] [git commit] package/poppler: add missing end-of-line
 backslash
Message-ID: <20190608195230.39DF68E8C6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4f6b94d515c1538a3fb650d5e7cc6a406f308421
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit c6bef18dab5d "bump version to 0.77.0" converted the
POPPLER_CONF_OPTS variable to one entry per line, but a backslash was
forgotten at the end of one of the lines. Thus, the last bit of the
configuration options weren't applied.

Fortunately, all of those were alread at their default value, so not
much was lost.

It does fix a check-package warning though:
package/poppler/poppler.mk:17: unexpected indent with tabs

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/poppler/poppler.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/poppler/poppler.mk b/package/poppler/poppler.mk
index 37566504e9..ebb918de03 100644
--- a/package/poppler/poppler.mk
+++ b/package/poppler/poppler.mk
@@ -13,7 +13,7 @@ POPPLER_LICENSE_FILES = COPYING
 POPPLER_INSTALL_STAGING = YES
 
 POPPLER_CONF_OPTS = \
-	-DENABLE_UNSTABLE_API_ABI_HEADERS=ON
+	-DENABLE_UNSTABLE_API_ABI_HEADERS=ON \
 	-DBUILD_GTK_TESTS=OFF \
 	-DBUILD_QT5_TESTS=OFF \
 	-DBUILD_CPP_TESTS=OFF \
