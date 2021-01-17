From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 17 Jan 2021 17:52:16 +0100
Subject: [Buildroot] [git commit branch/2020.11.x] package/wavpack: security
 bump to version 5.4.0
Message-ID: <20210117163659.F218B86DD1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=616e3a2cb14d714686e286ab9465a3f98bf46563
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.11.x

WavPack 5.4.0 contains a fix for CVE-2020-35738 wherein a specially
crafted WAV file could cause the WAVPACK command-line program to crash
with an out-of-bounds write (see issue #91).

Update hash of COPYING (update in year:
https://github.com/dbry/WavPack/commit/2ce3c069be548e82ea9c05741ace6583e549c6de)

https://github.com/dbry/WavPack/blob/5.4.0/NEWS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit c7390708f39c7616fb40d546cd3fd859598aaba3)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wavpack/wavpack.hash | 4 ++--
 package/wavpack/wavpack.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/wavpack/wavpack.hash b/package/wavpack/wavpack.hash
index eeef730321..abc9ab6905 100644
--- a/package/wavpack/wavpack.hash
+++ b/package/wavpack/wavpack.hash
@@ -1,3 +1,3 @@
 # locally computed hash
-sha256  b444379a0bee0330f137cb3e9a100e6a12a63a6d01987ba66b3729f85e282307  wavpack-5.3.0.tar.xz
-sha256  a0bbe245dfe263f73946b72306e8336818009ff1e52b119784c288f2785fc260  COPYING
+sha256  4bde6a6b2a86614a6bd2579e60dcc974e2c8f93608d2281110a717c1b3c28b79  wavpack-5.4.0.tar.xz
+sha256  f38defde000d62c4ff158f1445cb85a0c2f67cbc1d3cfa34ed882f439f6e3b43  COPYING
diff --git a/package/wavpack/wavpack.mk b/package/wavpack/wavpack.mk
index 6403f93ac9..d44982232d 100644
--- a/package/wavpack/wavpack.mk
+++ b/package/wavpack/wavpack.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WAVPACK_VERSION = 5.3.0
+WAVPACK_VERSION = 5.4.0
 WAVPACK_SITE = \
 	https://github.com/dbry/WavPack/releases/download/$(WAVPACK_VERSION)
 WAVPACK_SOURCE = wavpack-$(WAVPACK_VERSION).tar.xz
