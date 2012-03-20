From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 20 Mar 2012 09:20:26 +0100
Subject: [Buildroot] [git commit] uClibc: enable utmpx support in defconfigs
Message-ID: <20120320132248.0A4C595403@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ea33b9b83261bb886e0d71b792d1f1ebb5c50933
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It adds very little size overhead as the functions are just wrappers
around utmp, and E.G. systemd needs it.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/uClibc/uClibc-0.9.32.config   |    2 +-
 toolchain/uClibc/uClibc-0.9.33.config   |    2 +-
 toolchain/uClibc/uClibc-snapshot.config |    2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/toolchain/uClibc/uClibc-0.9.32.config b/toolchain/uClibc/uClibc-0.9.32.config
index e9f942d..7f21f1c 100644
--- a/toolchain/uClibc/uClibc-0.9.32.config
+++ b/toolchain/uClibc/uClibc-0.9.32.config
@@ -223,7 +223,7 @@ UCLIBC_HAS_FTW=y
 UCLIBC_HAS_FTS=y
 UCLIBC_HAS_GLOB=y
 UCLIBC_HAS_GNU_GLOB=y
-# UCLIBC_HAS_UTMPX is not set
+UCLIBC_HAS_UTMPX=y
 
 #
 # Library Installation Options
diff --git a/toolchain/uClibc/uClibc-0.9.33.config b/toolchain/uClibc/uClibc-0.9.33.config
index 2a6754c..7e4e750 100644
--- a/toolchain/uClibc/uClibc-0.9.33.config
+++ b/toolchain/uClibc/uClibc-0.9.33.config
@@ -233,7 +233,7 @@ UCLIBC_HAS_FTW=y
 # UCLIBC_HAS_FTS is not set
 UCLIBC_HAS_GLOB=y
 UCLIBC_HAS_GNU_GLOB=y
-# UCLIBC_HAS_UTMPX is not set
+UCLIBC_HAS_UTMPX=y
 
 #
 # Library Installation Options
diff --git a/toolchain/uClibc/uClibc-snapshot.config b/toolchain/uClibc/uClibc-snapshot.config
index 2a6754c..7e4e750 100644
--- a/toolchain/uClibc/uClibc-snapshot.config
+++ b/toolchain/uClibc/uClibc-snapshot.config
@@ -233,7 +233,7 @@ UCLIBC_HAS_FTW=y
 # UCLIBC_HAS_FTS is not set
 UCLIBC_HAS_GLOB=y
 UCLIBC_HAS_GNU_GLOB=y
-# UCLIBC_HAS_UTMPX is not set
+UCLIBC_HAS_UTMPX=y
 
 #
 # Library Installation Options
