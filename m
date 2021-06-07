From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 7 Jun 2021 23:34:57 +0200
Subject: [Buildroot] [git commit branch/2021.02.x] package/runc: security
 bump to version 1.0.0-rc95
Message-ID: <20210607211334.6CCAF8B876@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=10c2e6c588f2925be6c3a3c64019173d139fe48f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Fixes CVE-2021-30465: runc 1.0.0-rc94 and earlier are vulnerable to a symlink
exchange attack whereby an attacker can request a seemingly-innocuous container
configuration that actually results in the host filesystem being bind-mounted
into the container, allowing for a container escape.

Signed-off-by: Christian Stewart <christian@paral.in>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 96c23d1d0f5fbe3da903507afa39393be844b565)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/runc/runc.hash | 2 +-
 package/runc/runc.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/runc/runc.hash b/package/runc/runc.hash
index d792947d5f..598bd3067f 100644
--- a/package/runc/runc.hash
+++ b/package/runc/runc.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256	28378df983a3c586ed3ec8c76a774a9b10f36a0c323590a284b801cce95cc61f  runc-1.0.0-rc92.tar.gz
+sha256  02dac7f1a0dcfe55dd9820df787adedf030060870354915e7bba86f8487ce93c  runc-1.0.0-rc95.tar.gz
 sha256  552a739c3b25792263f731542238b92f6f8d07e9a488eae27e6c4690038a8243  LICENSE
diff --git a/package/runc/runc.mk b/package/runc/runc.mk
index 14689bbde1..62b9f09bf2 100644
--- a/package/runc/runc.mk
+++ b/package/runc/runc.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 RUNC_VERSION_MAJOR = 1.0.0
-RUNC_VERSION_MINOR = rc92
+RUNC_VERSION_MINOR = rc95
 RUNC_VERSION = $(RUNC_VERSION_MAJOR)-$(RUNC_VERSION_MINOR)
 RUNC_SITE = $(call github,opencontainers,runc,v$(RUNC_VERSION))
 RUNC_LICENSE = Apache-2.0
