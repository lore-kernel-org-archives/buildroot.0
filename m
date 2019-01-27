From: Francois Perrad <fperrad@gmail.com>
Date: Sun, 27 Jan 2019 14:24:24 +0100
Subject: [Buildroot] [PATCH] prosody: bump to version 0.11.2
Message-ID: <20190127132424.29917-1-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/prosody/0001-enable-syslog.patch | 2 +-
 package/prosody/0002-add-pidfile.patch   | 6 +++---
 package/prosody/prosody.hash             | 8 ++++----
 package/prosody/prosody.mk               | 2 +-
 4 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/package/prosody/0001-enable-syslog.patch b/package/prosody/0001-enable-syslog.patch
index 4bd0a15ae..16acc89c5 100644
--- a/package/prosody/0001-enable-syslog.patch
+++ b/package/prosody/0001-enable-syslog.patch
@@ -11,7 +11,7 @@ diff --git a/prosody.cfg.lua.dist b/prosody.cfg.lua.dist
 index a0fc6c9e..af3cc0e4 100644
 --- a/prosody.cfg.lua.dist
 +++ b/prosody.cfg.lua.dist
-@@ -163,7 +163,7 @@ archive_expires_after = "1w" -- Remove archived messages after 1 week
+@@ -155,7 +155,7 @@ archive_expires_after = "1w" -- Remove archived messages after 1 week
  log = {
  	info = "prosody.log"; -- Change 'info' to 'debug' for verbose logging
  	error = "prosody.err";
diff --git a/package/prosody/0002-add-pidfile.patch b/package/prosody/0002-add-pidfile.patch
index b6af8dd82..6221fd085 100644
--- a/package/prosody/0002-add-pidfile.patch
+++ b/package/prosody/0002-add-pidfile.patch
@@ -11,9 +11,9 @@ diff --git a/prosody.cfg.lua.dist b/prosody.cfg.lua.dist
 index af3cc0e4..675db12f 100644
 --- a/prosody.cfg.lua.dist
 +++ b/prosody.cfg.lua.dist
-@@ -181,6 +181,9 @@ log = {
- -- Location of directory to find certificates in (relative to main config file):
- certificates = "certs"
+@@ -176,6 +176,9 @@ log = {
+ -- HTTPS currently only supports a single certificate, specify it here:
+ --https_certificate = "certs/localhost.crt"
  
 +-- This must match the PIDFILE used in S50prosody
 +pidfile = "/var/run/prosody/prosody.pid"
diff --git a/package/prosody/prosody.hash b/package/prosody/prosody.hash
index 65bf5c934..f3f9aa477 100644
--- a/package/prosody/prosody.hash
+++ b/package/prosody/prosody.hash
@@ -1,8 +1,8 @@
 # Locally computed:
-md5    9157b6eaf05f7dfe004e38dbe950cafd  prosody-0.11.1.tar.gz
-sha1   dacce98fda317f5ba3c05842e2d97018d050b435  prosody-0.11.1.tar.gz
-sha256 91bec43f0798729e0a2b207613a745598ea3ca7dcb7fd85df44ccf04fa5c65aa  prosody-0.11.1.tar.gz
-sha512 6e25d2365d40582f57799bb08bf2673ba43270e8bcca5c5b785381380db55ec3ea6ab771fb9bd228bf265a564bb017dbfeae81713abd2de35a92704f8b8004ef  prosody-0.11.1.tar.gz
+md5    b4529e0cf8e0ee82a2f677e404c3df35  prosody-0.11.2.tar.gz
+sha1   0508cfc1c3c74a7eb8fdac2ed50435e190930f6a  prosody-0.11.2.tar.gz
+sha256 8911f6dc29b9e0c4edf9e61dc23fa22d77bc42c4caf28b809ab843b2f08e4831  prosody-0.11.2.tar.gz
+sha512 22e55a551a40c92f38a1ed1de5fdcad574d699d58c2e27f93c3d465b55487b8e923c2ba088daf93c7140cbafb0d429687e0b662c8bb1c1aba4b79ac1ea271cd1  prosody-0.11.2.tar.gz
 
 # Hash for license file:
 sha256 bbbdc1c5426e5944cf869fc0faeaf19d88a220cd2b39ea98b7b8e86b0e88a2ef  COPYING
diff --git a/package/prosody/prosody.mk b/package/prosody/prosody.mk
index 95c968679..c2111f6b8 100644
--- a/package/prosody/prosody.mk
+++ b/package/prosody/prosody.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PROSODY_VERSION = 0.11.1
+PROSODY_VERSION = 0.11.2
 PROSODY_SITE = https://prosody.im/downloads/source
 PROSODY_LICENSE = MIT
 PROSODY_LICENSE_FILES = COPYING
-- 
2.17.1
