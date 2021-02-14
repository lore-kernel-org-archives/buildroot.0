From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 14 Feb 2021 17:52:45 +0100
Subject: [Buildroot] [git commit branch/2020.11.x] package/xterm: security
 bump to version 366
Message-ID: <20210214163443.CF1208167C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fd69a41be93cf1a7327f6552f2ea6988e5556257
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.11.x

Fixes the following security issue:

CVE-2021-27135: xterm through Patch #365 allows remote attackers to cause a
denial of service (segmentation fault) or possibly have unspecified other
impact via a crafted UTF-8 character sequence.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit fd6f7061ca6ef8a2d1bfc67451ee3535c3814f00)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/xterm/xterm.hash | 4 ++--
 package/xterm/xterm.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/xterm/xterm.hash b/package/xterm/xterm.hash
index 8e2d2c5309..588b7fca51 100644
--- a/package/xterm/xterm.hash
+++ b/package/xterm/xterm.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-sha256  d81a3639e26552b6765bdcf28be1ecdb8acabf907955708e830ad6397ea10b48  xterm-363.tgz
+sha256  858b2885963fe97e712739066aadc1baeba2b33a0016303a7fec7d38bc73bf6e  xterm-366.tgz
 # Locally calculated
-sha256  c655a5fa3dec936543e02f863b8c1343d08522a2821cb484df6c5f62afa7354d  COPYING
+sha256  dfb668cc977e24649500f3cc54de3e2b793928d210715a445ab1227930b07ba6  COPYING
diff --git a/package/xterm/xterm.mk b/package/xterm/xterm.mk
index 0984ef4dc8..f0c497e5e9 100644
--- a/package/xterm/xterm.mk
+++ b/package/xterm/xterm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XTERM_VERSION = 363
+XTERM_VERSION = 366
 XTERM_SOURCE = xterm-$(XTERM_VERSION).tgz
 XTERM_SITE = http://invisible-mirror.net/archives/xterm
 XTERM_DEPENDENCIES = ncurses xlib_libXaw host-pkgconf
