From: Allan W. Nielsen <a@awn.dk>
Date: Tue, 10 May 2011 08:17:06 +0200
Subject: [Buildroot] [PATCH 3/3] Makefile.package.in: Fixing git download
	method
In-Reply-To: <1305008226-8906-1-git-send-email-a@awn.dk>
References: <1305008226-8906-1-git-send-email-a@awn.dk>
Message-ID: <1305008226-8906-4-git-send-email-a@awn.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Allan W. Nielsen <a@awn.dk>
---
 package/Makefile.package.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/Makefile.package.in b/package/Makefile.package.in
index 1e87256..6038a09 100644
--- a/package/Makefile.package.in
+++ b/package/Makefile.package.in
@@ -109,7 +109,7 @@ define DOWNLOAD_GIT
 	$(GIT) clone --bare $($(PKG)_SITE) $($(PKG)_BASE_NAME) && \
 	pushd $($(PKG)_BASE_NAME) > /dev/null && \
 	$(GIT) archive --format=tar --prefix=$($(PKG)_BASE_NAME)/ $($(PKG)_DL_VERSION) | \
-		gzip -c > $(DL_DIR)/$($(PKG)_SOURCE) && \
+		gzip -c > ../$($(PKG)_SOURCE) && \
 	popd > /dev/null && \
 	rm -rf $($(PKG)_DL_DIR) && \
 	popd > /dev/null)
-- 
1.7.3.4
