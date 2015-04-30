From: Floris Bos <bos@je-eigen-domein.nl>
Date: Thu, 30 Apr 2015 18:12:16 +0200
Subject: [Buildroot] [PATCH] lighttpd: run as non-privileged user www-data
Message-ID: <1430410336-8292-1-git-send-email-bos@je-eigen-domein.nl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Previously the stock lighttpd configuration was patched to run as user root,
because we do not have a lighttpd user.
Patch it to use www-data instead, which is a user available in the default
skeleton, and is the same other webserver packages (like nginx) use.

Signed-off-by: Floris Bos <bos@je-eigen-domein.nl>
---
 package/lighttpd/0001-Fix-default-config-file.patch | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/lighttpd/0001-Fix-default-config-file.patch b/package/lighttpd/0001-Fix-default-config-file.patch
index 88d2c6f..bffc2a8 100644
--- a/package/lighttpd/0001-Fix-default-config-file.patch
+++ b/package/lighttpd/0001-Fix-default-config-file.patch
@@ -51,8 +51,8 @@ diff -Nurp a/doc/config/lighttpd.conf b/doc/config/lighttpd.conf
  ##
 -server.username  = "lighttpd"
 -server.groupname = "lighttpd"
-+# server.username  = "lighttpd"
-+# server.groupname = "lighttpd"
++server.username  = "www-data"
++server.groupname = "www-data"
  
  ## 
  ## enable core files.
-- 
2.1.4
