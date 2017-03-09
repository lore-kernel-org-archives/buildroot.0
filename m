From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 9 Mar 2017 21:28:52 +0100
Subject: [Buildroot] [git commit] toolchain: remove no longer relevant
	comment
Message-ID: <20170309202939.4A087821DC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d9fee6b286798d27f45dd6ca6e4b5aabf0cc658d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The somewhat complicated sed expression has been removed in commit
06cd604ec6d34f25b436ab729543418042a87e1c ("toolchain/external: use
-dumpversion to check gcc version"), so let's remove the comment that
was explaining this sed expression.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/helpers.mk | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
index 6044b7e..2f73ebb 100644
--- a/toolchain/helpers.mk
+++ b/toolchain/helpers.mk
@@ -133,16 +133,6 @@ check_kernel_headers_version = \
 # $1: path to gcc
 # $2: expected gcc version
 #
-# Some details about the sed expression:
-# - 1!d
-#   - delete if not line 1
-#
-# - s/^[^)]+\) ([^[:space:]]+).*/\1/
-#   - eat all until the first ')' character followed by a space
-#   - match as many non-space chars as possible
-#   - eat all the remaining chars on the line
-#   - replace by the matched expression
-#
 check_gcc_version = \
 	expected_version="$(strip $2)" ; \
 	if [ -z "$${expected_version}" ]; then \
