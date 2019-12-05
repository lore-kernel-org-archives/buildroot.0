From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 5 Dec 2019 22:10:40 +0100
Subject: [Buildroot] [git commit branch/2019.02.x] package/prosody: bump to
 bugfix version 0.11.3
Message-ID: <20191205210557.CC31D880F4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f881dca8d92272a54200ca30e6f7edb8cb3f1164
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

This is a bugfix release for the stable 0.11 branch. It is recommended
for all users of 0.11.x to upgrade.

Important note for those upgrading: Previous releases did not
automatically expire messages from group chat (MUC) archives, so if
mod_muc_mam was loaded and enabled for a MUC, archives would grow
indefinitely. This is not what most deployments want, therefore
automatic expiry is now implemented and enabled with a default 7 day
retention. You can configure this with the muc_log_expires_after
configuration option, which can be set to "never" to restore the old
behaviour and preserve any existing logs older than 7 days.

For details see:
https://prosody.im/doc/release/0.11.3

Signed-off-by: Michael Vetter <jubalh@iodoru.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 3a508f8564622c5cdaad75ef6afb3f027d24beb6)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/prosody/prosody.hash | 8 ++++----
 package/prosody/prosody.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/prosody/prosody.hash b/package/prosody/prosody.hash
index f3f9aa4777..d7d1d06eda 100644
--- a/package/prosody/prosody.hash
+++ b/package/prosody/prosody.hash
@@ -1,8 +1,8 @@
 # Locally computed:
-md5    b4529e0cf8e0ee82a2f677e404c3df35  prosody-0.11.2.tar.gz
-sha1   0508cfc1c3c74a7eb8fdac2ed50435e190930f6a  prosody-0.11.2.tar.gz
-sha256 8911f6dc29b9e0c4edf9e61dc23fa22d77bc42c4caf28b809ab843b2f08e4831  prosody-0.11.2.tar.gz
-sha512 22e55a551a40c92f38a1ed1de5fdcad574d699d58c2e27f93c3d465b55487b8e923c2ba088daf93c7140cbafb0d429687e0b662c8bb1c1aba4b79ac1ea271cd1  prosody-0.11.2.tar.gz
+md5    2cf85cd8f7fc061916d97a169e850a0e  prosody-0.11.3.tar.gz
+sha1   87ec8039bf297ba9bc4da44b2ba42f4b035e73ca  prosody-0.11.3.tar.gz
+sha256 cfdabd6f42a9fc5db300221967c518c26bd4b6e62def721c1626894d6325bf87  prosody-0.11.3.tar.gz
+sha512 07239433c7c65184ca24d665c92b787ff9e4a5ee190ab90dede802ffd2cbd97855356d818858871e62284e9923f485b3468ab1baed5d3fb13aac0551a38967eb  prosody-0.11.3.tar.gz
 
 # Hash for license file:
 sha256 bbbdc1c5426e5944cf869fc0faeaf19d88a220cd2b39ea98b7b8e86b0e88a2ef  COPYING
diff --git a/package/prosody/prosody.mk b/package/prosody/prosody.mk
index c2111f6b83..05ea3d2e40 100644
--- a/package/prosody/prosody.mk
+++ b/package/prosody/prosody.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PROSODY_VERSION = 0.11.2
+PROSODY_VERSION = 0.11.3
 PROSODY_SITE = https://prosody.im/downloads/source
 PROSODY_LICENSE = MIT
 PROSODY_LICENSE_FILES = COPYING
