From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 3 Mar 2016 15:06:37 +0100
Subject: [Buildroot] [git commit] exim: security bump to version 4.86.2
Message-ID: <20160303140922.C74977FD93@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=42a499664d3afa7923c7377008f549cf9458cd58
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
CVE-2016-1531 - All installations having Exim set-uid root and using
'perl_startup' are vulnerable to a local privilege escalation. Any user
who can start an instance of Exim (and this is normally *any* user) can
gain root privileges. If you do not use 'perl_startup' you *should* be
safe.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/exim/exim.hash | 4 ++--
 package/exim/exim.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/exim/exim.hash b/package/exim/exim.hash
index 0c0d797..8f4338b 100644
--- a/package/exim/exim.hash
+++ b/package/exim/exim.hash
@@ -1,2 +1,2 @@
-# From https://lists.exim.org/lurker/message/20150726.143052.f70a32f0.en.html
-sha256	f1ccf2ce2ea51b7fbbf160e7e0e41d24ca401cf44a185128ad99ea04635fc456	exim-4.86.tar.bz2
+# Locally calculated after checking pgp signature
+sha256	7756deafd0583776e091f2efcba9b36203e668cf420d8876f314980803636eb3	exim-4.86.2.tar.bz2
diff --git a/package/exim/exim.mk b/package/exim/exim.mk
index 62267b7..6a6bb7c 100644
--- a/package/exim/exim.mk
+++ b/package/exim/exim.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EXIM_VERSION = 4.86
+EXIM_VERSION = 4.86.2
 EXIM_SOURCE = exim-$(EXIM_VERSION).tar.bz2
 EXIM_SITE = ftp://ftp.exim.org/pub/exim/exim4
 EXIM_LICENSE = GPLv2+
