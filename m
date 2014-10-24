From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 25 Oct 2014 01:42:49 +0200
Subject: [Buildroot] [git commit] check-hash: silence hash ok messages when
	make -s is used
Message-ID: <20141024234356.89A35B0BC7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b7c1c3ba6a7dc3831bea0e16de801049105abaf3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Similar to what we do for apply-patches.sh

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pkg-download.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/pkg-download.mk b/package/pkg-download.mk
index 0cf0b63..f3409bd 100644
--- a/package/pkg-download.mk
+++ b/package/pkg-download.mk
@@ -63,7 +63,7 @@ github = https://github.com/$(1)/$(2)/archive/$(3)
 # $(1): the path to the file with the hashes
 # $(2): the full path to the file to check
 define VERIFY_HASH
-	if ! support/download/check-hash $(1) $(2); then \
+	if ! support/download/check-hash $(1) $(2) $(if $(QUIET),>/dev/null); then \
 		rm -f $(2); \
 		exit 1; \
 	fi
