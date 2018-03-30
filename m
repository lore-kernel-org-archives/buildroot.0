From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 30 Mar 2018 23:48:07 +0200
Subject: [Buildroot] [PATCH] utils/scanpypi: don't hardcode python2
Message-ID: <20180330214807.6135-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Commit 3a0c20c5309b (scanpypi: add support for Python3) adapted the script
to work with python 3.x, but the shebang still said python2 making it
unlikely to work on systems without python 2.x.

Change it to just 'python' instead.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 utils/scanpypi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/utils/scanpypi b/utils/scanpypi
index 505ba0a246..df8939b82e 100755
--- a/utils/scanpypi
+++ b/utils/scanpypi
@@ -1,4 +1,4 @@
-#!/usr/bin/env python2
+#!/usr/bin/env python
 """
 
 Utility for building Buildroot packages for existing PyPI packages
-- 
2.11.0
