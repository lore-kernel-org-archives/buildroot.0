From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 1 May 2015 09:38:28 +0200
Subject: [Buildroot] [git commit] lighttpd: run as non-privileged user
	www-data
Message-ID: <20150501075947.0FBD881DD9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=357d0c92a28b1e9255bdba45b38c4b63f3d6ea61
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Previously the stock lighttpd configuration was patched to run as user root,
because we do not have a lighttpd user.
Patch it to use www-data instead, which is a user available in the default
skeleton, and is the same other webserver packages (like nginx) use.

Signed-off-by: Floris Bos <bos@je-eigen-domein.nl>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../lighttpd/0001-Fix-default-config-file.patch    |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

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
