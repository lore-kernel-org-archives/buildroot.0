From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Fri,  5 Sep 2014 23:03:29 -0400
Subject: [Buildroot] [PATCH v2] jq: bump to version 1.4
Message-ID: <1409972610-3141-1-git-send-email-danomimanchego123@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bump to version 1.4.  Addtionally, released tarballs no longer
require flex or bison to build.

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>

---

From the README:

"If you're not using the latest git version but instead building a
released tarball (available on the website), then you won't need to
run `autoreconf` (and shouldn't), and you won't need flex or bison."

Tested on my Ubuntu 12.04 VM, after uninstalling flex, bison, libbison-dev.
The configure still checks for presence of the tools, but nothing
is hindered by their absence.

v1->v2
- fixed divider /--/---/

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
---
 package/jq/jq.mk | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/jq/jq.mk b/package/jq/jq.mk
index cc7c99e..6a9dfc8 100644
--- a/package/jq/jq.mk
+++ b/package/jq/jq.mk
@@ -4,9 +4,8 @@
 #
 ################################################################################
 
-JQ_VERSION = 1.3
+JQ_VERSION = 1.4
 JQ_SITE = http://stedolan.github.io/jq/download/source
-JQ_DEPENDENCIES = host-flex host-bison
 JQ_LICENSE = MIT (code), CC-BY-3.0 (documentation)
 JQ_LICENSE_FILES = COPYING
 
-- 
1.9.1
