From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Mon, 10 Jul 2017 01:21:18 +0200
Subject: [Buildroot] [PATCH 2/7] toolchain-wrapper: remove remaining
	references to HOST_DIR/usr
In-Reply-To: <20170709232123.30120-1-arnout@mind.be>
References: <20170709232123.30120-1-arnout@mind.be>
Message-ID: <20170709232123.30120-3-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Commit 14151d77af20ec50eeba6e30465debf87b35faaa that eliminated
$(HOST_DIR)/usr seriously missed the toolchain-wrapper - only a single
reference was updated, the other three were missed. Commit
015d68c84c9c6ad6f6d41f181d19d813f309088b removed one more. This commit
finally removes the two remaining ones.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 toolchain/toolchain-wrapper.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/toolchain/toolchain-wrapper.c b/toolchain/toolchain-wrapper.c
index a73e6d6f94..c048992656 100644
--- a/toolchain/toolchain-wrapper.c
+++ b/toolchain/toolchain-wrapper.c
@@ -208,14 +208,14 @@ int main(int argc, char **argv)
 #elif defined(BR_CROSS_PATH_ABS)
 	ret = snprintf(path, sizeof(path), BR_CROSS_PATH_ABS "/%s" BR_CROSS_PATH_SUFFIX, basename);
 #else
-	ret = snprintf(path, sizeof(path), "%s/usr/bin/%s" BR_CROSS_PATH_SUFFIX, absbasedir, basename);
+	ret = snprintf(path, sizeof(path), "%s/bin/%s" BR_CROSS_PATH_SUFFIX, absbasedir, basename);
 #endif
 	if (ret >= sizeof(path)) {
 		perror(__FILE__ ": overflow");
 		return 3;
 	}
 #ifdef BR_CCACHE
-	ret = snprintf(ccache_path, sizeof(ccache_path), "%s/usr/bin/ccache", absbasedir);
+	ret = snprintf(ccache_path, sizeof(ccache_path), "%s/bin/ccache", absbasedir);
 	if (ret >= sizeof(ccache_path)) {
 		perror(__FILE__ ": overflow");
 		return 3;
-- 
2.13.2
