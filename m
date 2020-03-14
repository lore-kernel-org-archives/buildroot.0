From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 14 Mar 2020 18:20:44 +0100
Subject: [Buildroot] [git commit branch/2019.02.x] package/zsh: security
 bump to version 5.8
Message-ID: <20200314170805.DCD4983882@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6134c234dab3955d1aa2ed684edfd647374e87ad
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

- Fix CVE-2019-20044: In Zsh before 5.8, attackers able to execute
  commands can regain privileges dropped by the --no-PRIVILEGED option.
  Zsh fails to overwrite the saved uid, so the original privileges can
  be restored by executing MODULE_PATH=/dir/with/module zmodload with a
  module that calls setuid().
- Update indentation of hash file (two spaces)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 141ec698123d0c9c9b793d39d947060f001aab55)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/zsh/zsh.hash | 8 ++++----
 package/zsh/zsh.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/zsh/zsh.hash b/package/zsh/zsh.hash
index 79c661d455..2df409c946 100644
--- a/package/zsh/zsh.hash
+++ b/package/zsh/zsh.hash
@@ -1,7 +1,7 @@
 # From http://www.zsh.org/pub/MD5SUM
-md5	374f9fdd121b5b90e07abfcad7df0627	zsh-5.7.1.tar.xz
+md5  e02a5428620b3dd268800c7843b3dd4d  zsh-5.8.tar.xz
 # Calculated based on the hash above and after checking signature
-# http://www.zsh.org/pub/zsh-5.7.1.tar.xz.asc
-sha256 7260292c2c1d483b2d50febfa5055176bd512b32a8833b116177bf5f01e77ee8 zsh-5.7.1.tar.xz
+# http://www.zsh.org/pub/zsh-5.8.tar.xz.asc
+sha256  dcc4b54cc5565670a65581760261c163d720991f0d06486da61f8d839b52de27  zsh-5.8.tar.xz
 # Locally calculated
-sha256	d06fdf3ef9b1ec69d6b9e170b0a9516fbad3523261ff1668bde3bfea6e0ef5f5  LICENCE
+sha256  d06fdf3ef9b1ec69d6b9e170b0a9516fbad3523261ff1668bde3bfea6e0ef5f5  LICENCE
diff --git a/package/zsh/zsh.mk b/package/zsh/zsh.mk
index b287e3051d..c3d9e52152 100644
--- a/package/zsh/zsh.mk
+++ b/package/zsh/zsh.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ZSH_VERSION = 5.7.1
+ZSH_VERSION = 5.8
 ZSH_SITE = http://www.zsh.org/pub
 ZSH_SOURCE = zsh-$(ZSH_VERSION).tar.xz
 ZSH_DEPENDENCIES = ncurses
