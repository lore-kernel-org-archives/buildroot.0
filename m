From: =?utf-8?B?RGFtaWVuIFRow6liYXVsdA==?= <damien.thebault@vitec.com>
Date: Fri, 7 Dec 2018 12:41:08 +0000
Subject: [Buildroot] [PATCH] dl-wrapper: Fix urlencode option never being
 sent to backend
Message-ID: <b97d7c67314b9312d4a79aa1a40ec4bd55ed61ff.camel@vitec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The urlencode parameter is lost in dl-wrapper, because we try to get it
from backend instead of backend_urlencode.

We must get the urlencode information from backend_urlencode.

Signed-off-by: Damien Th?bault <damien.thebault@vitec.com>
---
 support/download/dl-wrapper | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/download/dl-wrapper b/support/download/dl-wrapper
index bb70c98253..3315bd410e 100755
--- a/support/download/dl-wrapper
+++ b/support/download/dl-wrapper
@@ -93,7 +93,7 @@ main() {
         esac
         uri=${uri#*+}
 
-        urlencode=${backend#*|}
+        urlencode=${backend_urlencode#*|}
         # urlencode must be "urlencode"
         [ "${urlencode}" != "urlencode" ] && urlencode=""
 
-- 
2.19.1
