From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 23 Jul 2020 22:31:21 +0200
Subject: [Buildroot] [git commit] package/pkg-generic.mk: use $(PKG)_NAME in
 step_pkg_size_after
Message-ID: <20200723202658.4253487E97@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=caffe135843cb9d7019e4601f9aea147b364b1d7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since we're already using $(PKG)_DIR in step_pkg_size_after, we can
also just use $(PKG)_NAME. This allows to make $(1) useless, which
means it can be dropped in a follow-up commit.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/pkg-generic.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index f9385177ac..4ea1084f91 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -76,7 +76,7 @@ define step_pkg_size_after
 	LC_ALL=C comm -13 \
 		$($(PKG)_DIR)/.files-list$(3).before \
 		$($(PKG)_DIR)/.files-list$(3).after \
-		| sed -r -e 's/^[^,]+/$(1)/' \
+		| sed -r -e 's/^[^,]+/$($(PKG)_NAME)/' \
 		> $($(PKG)_DIR)/.files-list$(3).txt
 	rm -f $($(PKG)_DIR)/.files-list$(3).before
 	rm -f $($(PKG)_DIR)/.files-list$(3).after
