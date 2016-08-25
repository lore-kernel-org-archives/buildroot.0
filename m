From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 25 Aug 2016 23:53:41 +0200
Subject: [Buildroot] [PATCH] boa: boa.conf: run under the nogroup group
Message-ID: <1472162021-3722-1-git-send-email-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The default boa.conf we install specifies that boa should run under the
nobody group, but we don't have such a group in our default skeleton (and
boa doesn't add it), causing boa to fail to start:

[01/Jan/1970:00:00:10 +0000] No such group: nobody

Instead use the nogroup group, which is presumably what was meant.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/boa/boa.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/boa/boa.conf b/package/boa/boa.conf
index f51c237..e940296 100644
--- a/package/boa/boa.conf
+++ b/package/boa/boa.conf
@@ -46,7 +46,7 @@ Port 80
 # Group: The group name or GID the server should run as.
 
 User nobody
-Group nobody
+Group nogroup
 
 # ServerAdmin: The email address where server problems should be sent.
 # Note: this is not currently used, except as an environment variable
-- 
2.8.1
